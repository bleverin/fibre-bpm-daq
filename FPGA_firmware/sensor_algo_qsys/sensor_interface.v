// sensor_interface.v



`timescale 1 ps / 1 ps
module sensor_interface (
		//Clock/reset
        input  wire        	clk_clk,                    //                     clk.clk
        input  wire        	rst_reset,                  //                     rst.reset
		//Avalon MM slave
        input  wire [1:0]  	csr_address,                //            avalon_slave.address
        input  wire        	csr_read,                   //                        .read
        output wire [31:0] 	csr_readdata,               //                        .readdata
        input  wire        	csr_write,                  //                        .write
        input  wire [31:0] 	csr_writedata,              //                        .writedata
        input  wire [3:0]  	csr_byteenable,             //                        .byteenable
		//Avalon ST transmitter
        output wire [31:0] 	data_out_data,          	// avalon_streaming_source.data
        output wire        	data_out_endofpacket,   	//                        .endofpacket
        output wire        	data_out_startofpacket, 	//                        .startofpacket
        input  wire        	data_out_ready,         	//                        .ready
        output wire        	data_out_valid,         	//                        .valid
        output wire [1:0]  	data_out_empty,         	//                        .empty
		//Sensor interface
        input  wire        	in_trg,                     //                  sensor.in_trg // This is the frame timer
        output wire        	out_adc_clk,                //                        .out_dac_clk
        output wire        	out_adc_cnv,                //                        .out_dac_cnv
        input  wire [4:0]  	in_adc_data,                //                        .in_dac_data
        output wire        	out_sensor_rst,             //                        .out_sensor_rst
        output wire        	out_sensor_clk,             //                        .out_sensor_clk
        output wire        	out_sensor_gain,            //                        .out_sensor_gain
			//Serial synchro interface
			input  wire	   		serial_rx,					//receive data
			output wire	   		serial_tx,					//send data
			input  wire [7:0]  	ext_input,					//SMA etc.
			//Debug information
			output wire [7:0] 	status_out,					//status bits - same as in reg0_read[15:8]
			
			output reg 				int_rst,						//the reset for each new run 
			output reg	[7:0]		cluster_threshold,		//from registers[3][7:0] 
			output reg	[7:0]		cluster_size,				//from registers[3][15:8]
			output reg  [7:0]		in_algo_threshold			//from registers[3][23:16]
    );
	

		//Very important globals
	reg[31:0] 	transmit_buffer[162:0];		//Data to send: 3 words header plus sensor data
	wire 		readout_ready;				//pulsing this signal causes copying data from frame buffer to transmit buffer and initiating transmission
	wire		start_transmission;			//pulsing this signal causes the Avalon ST link to start transmission
	reg[15:0]	local_sync_ctr;				//local synchronization counter, it increments by one at each frame
	wire[8:0]	global_sync_ctr;			//global synchronization counter, it's simply the received value from serial RX.
	wire		global_sync_error;			//RX error in the global synchronization counter

		//Common generate variables
	genvar i;	//for generate loops
	genvar j;
	integer xi;	//for normal loops
	integer xj;

	// *********************** CSR stuff ************************
	/*
		There are 4 32-bit R/W-able registers. They are used for setting up the module and checking its state
		Reg0 is a bit different: when read, bits 15-8 (the status byte) are taken directly from device internals, not from register contents.
		The bus can be accessed 32-, 16- or 8-bit-wise.

		Register definition
		//reg0
		#define SENSOR_REG_COMMAND		0	//8 bits
		#define SENSOR_REG_STATUS		1	//8 bits
		#define SENSOR_REG_SENSORCLK	2	//8 bits, 6 used	divider for producing sensor clock ('4' MHz)
		#define SESNOR_REG_ADCCNV		3	//8 bits, 6 used	time of conversion pulse in ADC clocks, should be > 500 ns
		//reg1		
		#define SENSOR_REG_DELAY		4	//16 bits, 12 used	reset signal delay in 50 MHz clocks
		#define SENSOR_REG_SHUTTER		6	//16 bits, 12 used	sensor reset ('shutter') time in sensor clocks
		//reg2		
		#define SENSOR_REG_SERSPEED		8	//8 bits 		synchro baudrate, 50 for 1 Mbps
		#define SENSOR_REG_HEADER_ANYDATA	9	//8 bits		any data transmitted with SMA state (8 bits SMA + 8 bits anydata)
		#define SENSOR_REG_HEADER_CMD		10	//16 bits 		command field of the command header transmitted in packet
		//reg3										//configure reg3  17.July.2024 Qin,L
		#define SENSOR_REG_CLUSTER_THRESHOLD	12 //8 bits	 the threshold for cluster locate, range 0~255
		#define SENSOR_REG_CLUSTER_SIZE			13 //8 bits  the size for clluster locate, range 0~255
		#define SENSOR_REG_IN_ALGO_THRESHOLD	14 //8 bits	 the threshold inside Linear Regression, range 0~255
		#define SENSOR_REG_RESERVED				15 //8 bits  not used 

		Command bitmasks
		#define SENSOR_CSR_EN_BITMASK		0x01	//enable operation
		#define SENSOR_CSR_GAIN_BITMASK		0x02	//gain selection
		#define SENSOR_CSR_ADCK_BITMASK 	0x04	//ADC clock divider on/off
		#define SENSOR_CSR_RESET_BITMASK	0x08	//Reset all logic  //registers[0][3]

		Status bitmasks
		#define SENSOR_STATUS_SEND		0x01	//Sending over Avalon-ST
		#define SENSOR_STATUS_TRG_WAITING	0x02	//The trigger came and is being delayed now
		#define SENSOR_STATUS_RESET_ACTIVE	0x04	//The RESET signal for the sensor is active now
		#define SENSOR_STATUS_ADC_ACTIVE	0x08	//The ADC is converting data (signal high over all 64 channels) or just finished and waits for reset high
		#define SESNOR_STATUS_ADC_FINISHED	0x10	//The ADC waits for reset high
		#define SESNOR_STATUS_TX_ACTIVE		0x20	//Sync port is sending
		#define SESNOR_STATUS_RX_ACTIVE		0x40	//Sync port is receiving

	*/

	reg 	[31:0] 	registers[3:0];		//main register space
	wire 	[31:0]	reg0_read;		//reg[0] is read indirectly to include status byt(bits 15-8)

		//read logic
	assign reg0_read[7:0] 	= registers[0][7:0];		// Readback of control bits
	assign reg0_read[31:16] = registers[0][31:16];		// Readback of payload size
	assign reg0_read[15] 	= 0;							// Unused bits of the status byte 
	assign csr_readdata 	= (csr_address==0) ? reg0_read : registers[csr_address];

		//write logic
	generate
	for (i = 0; i < 4; i = i+1)
	begin : write_registers	//Quartus wants labels for 'for' blocks
		for (j = 0; j < 4; j = j+1)
		begin : write_bytes
			always @(posedge clk_clk or posedge rst_reset)
			begin 
				if (rst_reset)
					registers[i][8*j+7:8*j] <= 8'd0;
				else
					if (csr_byteenable[j] && (csr_address == i) && (csr_write))
						registers[i][8*j+7:8*j] <= csr_writedata[8*j+7:8*j];
			end
		end
	end	
	endgenerate

	// *********************** Internal reset logic  ************************
	/*
		The internal reset signal derives from the reset input and reset bit (reg0.3).
		It drives all subcomponents but registers (which use simpy the reset input).
		This signal is registered to be sure that no glitches from register bank pass.
	*/

	//reg int_rst;

	always @(posedge clk_clk)
	begin
		int_rst <= rst_reset | registers[0][3];
	end

	// *********************** Avalon transmitter ************************
	/*
		The transmitter is used to transmit collected sensor data together with sync frame.
		It can be later packed into UDP by UDP generator and sent over Ethernet. Or whatever.
		The transmitter has 8-bit symbol, 4 symbols per beat. It's backpressurizable and includes packet signals.
		The Empty signal is dummy (always zero), as the data is always aligned to 32-bit size.
		The transmission starts when the 'start_transmission' signal gets pulsed
	*/

	assign data_out_empty = 2'b00;

	reg	[1:0]	data_out_state;		//State of the state machine
	localparam DATA_OUT_STATE_IDLE	= 0;	//waiting for high
	localparam DATA_OUT_STATE_SEND	= 1;	//sending data
	localparam DATA_OUT_STATE_LOCK	= 2;	//waiting for trigger low
	
	//localparam DATA_OUT_STATE_PEND 	= 3; //the pending when sending data

	localparam WORDS_TO_SEND = 163;	
	
		//registers to drive output pins of ST interfaces
//	reg		reg_valid;
//	reg	[31:0]	reg_data;
//	reg		reg_startofpacket;
//	reg		reg_endofpacket;

		//Helper stuff
	reg	[15:0]	tx_ctr;	//counter of sent data words

		//The state machine
	always @(posedge clk_clk or posedge int_rst)
	begin 
		if (int_rst)
		begin
			data_out_state <= DATA_OUT_STATE_IDLE;
			cluster_threshold <= registers[3][7:0];
			cluster_size <= registers[3][15:8];
			in_algo_threshold <= registers[3][23:16];
		end
		else
			case(data_out_state)
				DATA_OUT_STATE_IDLE:
				begin
					if (start_transmission)
					begin
						data_out_state <= DATA_OUT_STATE_SEND;
						tx_ctr <= 0;
						cluster_threshold <= registers[3][7:0];
						cluster_size <= registers[3][15:8];
						in_algo_threshold <= registers[3][23:16];
					end
				end
				DATA_OUT_STATE_SEND:
				begin
					if (data_out_ready)
					begin
						tx_ctr <= tx_ctr + 1'b1;
						if (tx_ctr == (WORDS_TO_SEND-1))
							data_out_state <= DATA_OUT_STATE_LOCK;
					end
				end
				DATA_OUT_STATE_LOCK:
				begin
					if (~start_transmission)
						data_out_state <= DATA_OUT_STATE_IDLE;
				end

				default:
					data_out_state <= DATA_OUT_STATE_IDLE;
			endcase
	end

	assign data_out_valid = (data_out_state == DATA_OUT_STATE_SEND)? 1'b1: 1'b0;
	assign data_out_data = (data_out_state == DATA_OUT_STATE_SEND)? transmit_buffer[tx_ctr]: 32'b0;
	assign data_out_startofpacket = (data_out_state == DATA_OUT_STATE_SEND && tx_ctr == 0) ? 1'b1: 1'b0;
	assign data_out_endofpacket = (data_out_state == DATA_OUT_STATE_SEND && tx_ctr == (WORDS_TO_SEND-1)) ? 1'b1: 1'b0;

	assign reg0_read[8] = ~(data_out_state == DATA_OUT_STATE_IDLE);		//to status register

	// *********************** Detector gain logic ************************
	/*
		The gain signal is simply derived from reg0.
	*/

	assign out_sensor_gain = registers[0][1];

	// *********************** Trigger delay logic ************************
	/*
		Individual trigger delay settings are needed to synchronize multiple boards.
		A 12-bit downcounter allows for delaying incoming trigger's rising edge by up to 4095 50MHz clock cycles, i.e. 81.9 us.
		Note: A further delay of one sensor clock will be added in the sensor clock generation logic.
	*/

	reg	[11:0]	trg_delay_ctr;
	wire		int_trg;
	reg	[1:0]	trg_state;
	localparam TRG_STATE_IDLE	= 0;	//waiting for external trigger
	localparam TRG_STATE_DELAY	= 1;	//downcounting
	localparam TRG_STATE_ACTIVE	= 2;	//internal trigger active 
	localparam TRG_STATE_LOCK	= 3;	//waiting for external trigger inactive 

	//localparam TRG_DURATION		= 4;	//duration of the trigger signal

	assign int_trg = (trg_state == TRG_STATE_ACTIVE) ? 1'b1 : 1'b0;

	always @(posedge clk_clk or posedge int_rst)
	begin 
		if (int_rst)
		begin
			trg_state <= TRG_STATE_LOCK;
		end
		else
		begin
			case(trg_state)
				TRG_STATE_IDLE:
				begin
					if (in_trg && registers[0][0])	//react on trigger only if enabled
					begin
						trg_delay_ctr <= registers[1][11:0];
						trg_state <= TRG_STATE_DELAY;
					end
				end
				TRG_STATE_DELAY:
				begin
					trg_delay_ctr <= trg_delay_ctr - 1'b1;
					if (trg_delay_ctr == 0)
					begin
						//trg_delay_ctr <= TRG_DURATION-1;
						trg_state <= TRG_STATE_ACTIVE;
					end
				end
				TRG_STATE_ACTIVE:
				begin
					//trg_delay_ctr <= trg_delay_ctr - 1;
					//if (trg_delay_ctr == 0)
					//begin
						trg_state <= TRG_STATE_LOCK;	//only one cycle of active int_trg
					//end
				end
				TRG_STATE_LOCK:
				begin
					if (~in_trg)
						trg_state <= TRG_STATE_IDLE;
				end
			endcase		
		end
	end

	assign reg0_read[9] = ~(trg_state == TRG_STATE_IDLE);	//to status register

	// *********************** Sensor clock logic  ************************
	/*
		The sensor needs a clock of max. 4 MHz, which is generated by this module. 
		The actual clock speed is configurable by a register with a formula: Fs = Fi/2/(div+1),
		where Fs is the sensor clock, Fi is input clock (50 MHz nom.) and div is a divider taken from the register.
		A 5-bit downcounter allows for frequencies from 0.39 MHz (div=63) to 12.5 MHz (div=1).
		The nominal setting is 6, giving 3.5714285 MHz.
		
		Important: The sensor clock is synchronized to the rising edge of the (delayed) trigger input, 
		so that there is a positive slope at exactly one sensor clock period after the trigger.
		This positive slope is then used to synchronize integration start signal (sensor reset or shutter). 
		The synchronization is done so that one of clock states (0 or 1) gets extended, but never shortened.

		Note: 4 MHz is also the top speed accepted by the ADC module.
	*/

	reg [5:0]	sensor_clk_ctr;
	reg [1:0]	sensor_clk_state;

	localparam SENSOR_CLK_STATE_LOW	= 2'd0;
	localparam SENSOR_CLK_STATE_HIGH = 2'd1;
	localparam SENSOR_CLK_STATE_LOWAIT = 2'd2;
	localparam SENSOR_CLK_STATE_HIWAIT = 2'd3;	

	assign out_sensor_clk = sensor_clk_state[0];

	always @(posedge clk_clk or posedge int_rst)
	begin 
		if (int_rst)
		begin
			sensor_clk_state <= SENSOR_CLK_STATE_LOW;
			sensor_clk_ctr <= registers[0][21:16];
		end
		else
		begin
			case(sensor_clk_state)
				SENSOR_CLK_STATE_LOW:
				begin
					sensor_clk_ctr <= sensor_clk_ctr-1'b1;
					if (int_trg)
					begin
						sensor_clk_ctr <= registers[0][21:16];
						sensor_clk_state <= SENSOR_CLK_STATE_LOWAIT;
					end
					else if (sensor_clk_ctr == 0)
					begin
						sensor_clk_ctr <= registers[0][21:16];
						sensor_clk_state <= SENSOR_CLK_STATE_HIGH;
					end
				end
				SENSOR_CLK_STATE_HIGH:
				begin
					sensor_clk_ctr <= sensor_clk_ctr-1'b1;
					if (int_trg)
					begin
						sensor_clk_ctr <= registers[0][21:16];
						sensor_clk_state <= SENSOR_CLK_STATE_HIWAIT;
					end
					else if (sensor_clk_ctr == 0)
					begin
						sensor_clk_ctr <= registers[0][21:16];
						sensor_clk_state <= SENSOR_CLK_STATE_LOW;
					end			
				end
				SENSOR_CLK_STATE_LOWAIT:
				begin
					sensor_clk_ctr <= sensor_clk_ctr-1'b1;
					if (sensor_clk_ctr == 0)
					begin
						sensor_clk_ctr <= registers[0][21:16];
						sensor_clk_state <= SENSOR_CLK_STATE_LOW;
					end				
				end
				SENSOR_CLK_STATE_HIWAIT:
				begin
					sensor_clk_ctr <= sensor_clk_ctr-1'b1;
					if (sensor_clk_ctr == 0)
					begin
						sensor_clk_ctr <= registers[0][21:16];
						sensor_clk_state <= SENSOR_CLK_STATE_LOW;
					end				
				end
			endcase
		end
	end

	// *********************** Sensor reset (shutter) logic ************************
	/*
		This block generates a 'reset' (shutter) signal for the sensor.
		It defines the integration time and is programmable by means of a register in sensor clock units.
		The leading (positive) slope of this signal is synchronized with the first positive slope of the sensor clock after the trigger. 
		An internal 12-bit downcounter allows for a max. integration time of ca 1.15 ms. It can be further extended by slowing down the sensor clock.
		It's user's responsibility to check if the integration period fits into the trigger period. If this requirement is not fulfilled, some triggers will be skipped.
		Sorry for this ugly code, but since it works...

		Important remark from sensor's specification: Rise of a RESET pulse must be set outside the video output period. 
		This must by guaranteed by user by means of proper timing. First video comes 18 cycles after negative slope of sensor reset and is 2 cycles long.
		Then 2 cycles pause (here we can come with the positive reset slope), then next video and so on, every 4 cycles.
		The minimum duration of reset low is 21 clocks, and 20 clocks for reset high.
		Our logic requires that new reset low comes only after all channels are read.
	*/

	reg [11:0]	sensor_rst_ctr;
	reg		sensor_rst_state;

	assign out_sensor_rst = sensor_rst_state;

	always @(posedge int_trg or posedge out_sensor_clk or posedge int_rst)
	begin 
		if (int_rst)
		begin
			sensor_rst_state <= 0;
			sensor_rst_ctr <= 0;
		end
		else if (int_trg)
		begin
			sensor_rst_ctr <= registers[1][27:16];
		end	
		else
		begin
			if (sensor_rst_ctr == 0)
			begin
				sensor_rst_state <= 0;
			end
			else 
			begin
				sensor_rst_ctr <= sensor_rst_ctr - 1'b1;
				sensor_rst_state <= 1'b1;
			end
		end
	end

	assign reg0_read[10] = sensor_rst_state;	//to status register

	// *********************** ADC trigger logic ************************
	/*
		This piece produces triggering signals for ADC framework and cares about counting ADC samples.
		It doesn't rely on incoming Trig signals, just generates them internally by counting clocks.

	*/

	reg [5:0] 	adc_current_channel;
	reg [2:0]	adc_trg_state;
	reg [4:0]	adc_trg_downctr;
	wire 		int_adc_trg;
	wire 		adc_trg_frame_ready;

	localparam ADC_TRG_STATE_IDLE 	= 0;	//nothing happens, RESET is high or initial state
	localparam ADC_TRG_STATE_WAIT 	= 1;	//waiting for the first video
	localparam ADC_TRG_STATE_VIDEO1 = 2;	//capturing video
	localparam ADC_TRG_STATE_VIDEO2 = 3;	//second cycle
	localparam ADC_TRG_STATE_VIDEO3 = 4;	//third cycle
	localparam ADC_TRG_STATE_VIDEO4 = 5;	//fourth cycle
	localparam ADC_TRG_STATE_FINISH = 6;	//finished readout, waiting for RESET high to enter idle
	localparam ADC_TRG_STATE_INIT 	= 7;	//used only for reset procedure

	localparam ADC_TRG_INITIALWAIT = 5'd17;	//initial wait for the first video
	localparam ADC_TRG_VIDEOPERIOD = 4;	//video output period

	always @(posedge out_sensor_clk or posedge int_rst)
	begin 		
		if (int_rst)
		begin
			adc_current_channel <= 63;
			adc_trg_downctr <= 0;
			adc_trg_state <= ADC_TRG_STATE_INIT;	//will go to IDLE when adc_trg_reset is high
		end
		else
			case(adc_trg_state)
				ADC_TRG_STATE_IDLE:
				begin
					if (~out_sensor_rst)
					begin
						adc_trg_downctr <= ADC_TRG_INITIALWAIT;
						adc_current_channel <= 63;
						adc_trg_state <= ADC_TRG_STATE_WAIT;
					end
				end
				ADC_TRG_STATE_WAIT:
				begin
					adc_trg_downctr <= adc_trg_downctr - 1'b1;
					if (adc_trg_downctr == 0)
					begin
						adc_trg_state <= ADC_TRG_STATE_VIDEO1;
					end
				end
				ADC_TRG_STATE_VIDEO1:
				begin
					adc_current_channel <= adc_current_channel + 1'b1;
					adc_trg_state = ADC_TRG_STATE_VIDEO2;			
				end
				ADC_TRG_STATE_VIDEO2:
				begin
					adc_trg_state = ADC_TRG_STATE_VIDEO3;			
				end
				ADC_TRG_STATE_VIDEO3:
				begin
					adc_trg_state = ADC_TRG_STATE_VIDEO4;			
				end
				ADC_TRG_STATE_VIDEO4:
				begin
					if (adc_current_channel == 63)
						adc_trg_state <= ADC_TRG_STATE_FINISH;
					else
						adc_trg_state = ADC_TRG_STATE_VIDEO1;			
				end	
				ADC_TRG_STATE_FINISH, ADC_TRG_STATE_INIT:
				begin
					if (out_sensor_rst)
						adc_trg_state <= ADC_TRG_STATE_IDLE;
				end		
			endcase
	end

	//Producing internal trigger for ADC framework (see below)
	assign int_adc_trg = (adc_trg_state == ADC_TRG_STATE_VIDEO1)  ? 1'b1 : 1'b0;

	assign adc_trg_frame_ready = (adc_trg_state == ADC_TRG_STATE_FINISH) ? 1'b1 : 1'b0;	//trigger data collection machine when the frame is ready

	assign reg0_read[11] = ~(adc_trg_state == ADC_TRG_STATE_IDLE);		//to status register
	assign reg0_read[12] = (adc_trg_state == ADC_TRG_STATE_FINISH);		//to status register

	// *********************** ADC logic ************************
	/*
		SPI interface for ADCs. Triggers conversion and reads out the data on each incoming int_adc_trg.
		The ADC framework and SPI runs with full clock frequency or with half of it, depending on register setting.
		The ADC works in the 'CS Mode, 3-Wire Without Busy Indicator Serial Interface'.
		The CNV signal length is defined by register and expressed in ADC clocks. 
		It's user's responsibility to ensure that the CNV pulse is longer than 500 ns (required by ADC spec).
		The ADC clock can be selected to be either full or half system clock.
	*/

		//Clock divider and selection
	reg		adc_halfclock;
	wire		int_adc_clk;
	always @(posedge clk_clk or posedge int_rst)
	begin 		
		if (int_rst)
			adc_halfclock <= 0;
		else
			adc_halfclock <= ~adc_halfclock;
	end
	assign int_adc_clk = registers[0][2] ? adc_halfclock : clk_clk;

		//The main state machine
	reg [2:0]	adc_state;
	reg [5:0]	adc_downctr;

	localparam ADC_STATE_IDLE 	= 0;		//waiting for conversion
	localparam ADC_STATE_CNV 	= 1;		//conversion on-going
	localparam ADC_STATE_STARTREAD	= 2;	//prepare to read, conversion finished
	localparam ADC_STATE_READ 	= 3;		//reading data
	localparam ADC_STATE_FINISH	= 4;		//copy data to global buffer
	localparam ADC_STATE_FINISHED	= 5;	//wait until trigger low, then go to idle
	
	always @(posedge int_adc_clk or posedge int_rst)
	begin 		
		if (int_rst)
		begin
			adc_downctr <= 0;
			adc_state <= ADC_STATE_IDLE;	
		end
		else
		begin
			case(adc_state)
				ADC_STATE_IDLE:
				begin
					adc_downctr <= registers[0][29:24];
					if (int_adc_trg)
						adc_state <= ADC_STATE_CNV;
				end
				ADC_STATE_CNV:
				begin
					adc_downctr <= adc_downctr - 1'b1;
					if (adc_downctr == 0)
						adc_state <= ADC_STATE_STARTREAD;
				end
				ADC_STATE_STARTREAD:
				begin
					adc_downctr <= 15;
					adc_state <= ADC_STATE_READ;
				end
				ADC_STATE_READ:
				begin
					adc_downctr <= adc_downctr - 1'b1;
					if (adc_downctr == 0)
						adc_state <= ADC_STATE_FINISH;
				end
				ADC_STATE_FINISH:
				begin
					adc_state <= ADC_STATE_FINISHED;
				end
				ADC_STATE_FINISHED:
				begin
					if (!int_adc_trg)
						adc_state <= ADC_STATE_IDLE;
				end
				default
				begin
					adc_state <= ADC_STATE_IDLE;
				end
			endcase
		end
	end

		//Reading data - this happens on the negative slope of clock!
	reg [15:0] adc_buffer[4:0];		//A shift register for SPI acquisition
	reg [15:0] frame_buffer[319:0];		//The 'big buffer' for whole frame

	always @(negedge int_adc_clk or posedge int_rst)
	begin 		
		if (int_rst)
		begin
			for (xi = 0; xi < 5; xi = xi+1)
				adc_buffer[xi] <= 0;
		end		
		else
		begin
			case(adc_state)
				ADC_STATE_STARTREAD:
				begin
					for (xi = 0; xi < 5; xi = xi+1)
						adc_buffer[xi] <= 0;
				end
				ADC_STATE_READ:
				begin
					for (xi = 0; xi < 5; xi = xi+1)
					begin
						adc_buffer[xi][15:1] <= adc_buffer[xi][14:0];
						adc_buffer[xi][0] <= in_adc_data[xi];
					end
				end
				ADC_STATE_FINISH:
				begin
					for (xi = 0; xi < 5; xi = xi+1)
						frame_buffer[64*xi + adc_current_channel] <= adc_buffer[xi];
				end
			endcase
		end
	end


	assign out_adc_cnv = (adc_state == ADC_STATE_CNV) ? 1'b1 : 1'b0;
	assign out_adc_clk = (adc_state == ADC_STATE_READ) ? int_adc_clk : 1'b1;


	// *********************** Putting data together and letting transmit it ************************
	/*
		The data is sent together with a 3-word header (6 16-bit numbers),
		which is compatible with v.1 head structures:
			typedef struct
			{
				unsigned short marker;	//must be 0x5555
				unsigned short command;
				unsigned short length;
			} command_header;
			typedef struct
			{
				//unsigned short channel_id;
				unsigned short local_ctr;
				unsigned short global_ctr;
				unsigned short sma_state;
			} sync_frame;

	*/
	
	reg [2:0]	merger_state;

	localparam MERGER_STATE_IDLE 	= 0;		//waiting for ADC
	localparam MERGER_STATE_COLLECT	= 1;		//collect frame information
	localparam MERGER_STATE_SEND	= 2;		//run Avalon sender
	localparam MERGER_STATE_FINISH	= 3;		//roll to idle
	
	always @(posedge clk_clk or posedge int_rst)
	begin 		
		if (int_rst)
		begin
			merger_state <= ADC_STATE_IDLE;	
			for (xi= 0; xi < 163; xi = xi+1)
				transmit_buffer[xi] <= 0;
		end
		else
		begin
			case(merger_state)
				MERGER_STATE_IDLE:
				begin
					if (adc_trg_frame_ready)
						merger_state <= MERGER_STATE_COLLECT;
				end
				MERGER_STATE_COLLECT:
				begin
					transmit_buffer[0][31:16] 	<= 16'h5555;		//command_header.marker = 0x5555
					transmit_buffer[0][15:0] 	<= registers[2][31:16];	//command_header.command = reg2.31-16
					transmit_buffer[1][31:16]	<= 16'd323;	//16'd652;		//command_header.length = 320 samples + 6 sync bytes = 323 * 16bit //16'h143
					transmit_buffer[1][15:0]	<= local_sync_ctr[15:0];	//sync_frame.local_ctr
					transmit_buffer[2][24:16]	<= global_sync_ctr;	//sync_frame.global_ctr
					transmit_buffer[2][25]		<= global_sync_error;	
					transmit_buffer[2][31:26]	<= 0;
					transmit_buffer[2][7:0]		<= ext_input;		//sync_frame.sma_state[7:0] = ext_input
					transmit_buffer[2][15:8]	<= registers[2][15:8];	//sync_frame.sma_state[15:8] = reg2.15-8	
					for (xi = 0; xi < 160; xi = xi+1)
					begin
						//transmit_buffer[xi+3][15:0] <= frame_buffer[2*xi][15:0];	//ADC data
						//transmit_buffer[xi+3][31:16] <= frame_buffer[2*xi+1][15:0];
						transmit_buffer[xi+3][31:16] <= frame_buffer[2*xi][15:0];	//ADC data	//CHANGED 26.11.2019
						transmit_buffer[xi+3][15:0] <= frame_buffer[2*xi+1][15:0];
					end
					merger_state <= MERGER_STATE_SEND;

				end
				MERGER_STATE_SEND:
				begin
					merger_state <= MERGER_STATE_FINISH;
				end
				MERGER_STATE_FINISH:
				begin
					if (~adc_trg_frame_ready)
						merger_state <= MERGER_STATE_IDLE;
				end
			endcase
		end
	end

		//Generate Avalon trigger signal
	assign start_transmission = (merger_state == MERGER_STATE_SEND) ? 1'b1 : 1'b0;

	// *********************** Synchro counter update ************************
	/*
		Just increment sunchronization counter at every trigger.
		The counter is reset by int_reset.
	*/

	always @(posedge clk_clk or posedge int_rst)
	begin 		
		if (int_rst)
		begin
			local_sync_ctr <= 0;
		end
		else
		begin
			if (int_trg)
				local_sync_ctr <= local_sync_ctr + 1'b1;
		end
	end



	// *********************** Synchronization serial ports ************************
	/*
		There is one TX and one RX module.
		The TX is getting triggered by int_trg (same as for the main readout framework).
		It sends 9 LSBs of the local synchro counter with programmed baudrate.
		The default baudrate is 1 Mbps, which needs a setting of 50 for fclk=50MHz.
		The RX puts freshly received data into global_sync_ctr. It does not need any triggering.
	*/

	wire tx_idle;
	wire rx_idle;
	assign reg0_read[13] = ~tx_idle;
	assign reg0_read[14] = ~rx_idle;
	
	serial_tx synchro_tx (
		.clk		(clk_clk),                	//  full-speed clock
		.rst		(int_rst),              	//  reset
		.data		(local_sync_ctr[8:0]),  	//  data to send
		.clk_divisor	(registers[2][7:0]),    //  defines baudrate
		.trigger	(start_transmission),       //  pulse to start transmission - just AFTER collecting data from sensors
		.tx			(serial_tx),         		//  tx serial connection
		.idle		(tx_idle)					//	1 if sender in idle state
	);	

	serial_rx synchro_rx(
		.clk		(clk_clk),                	//  full-speed clock
		.rst		(int_rst),              	//  reset
		.clk_divisor	(registers[2][7:0]),    //  defines baudrate
		.rx			(serial_rx),         		//  rx serial connection
		.newdata	(),							//	pulses for new data received
		.data		(global_sync_ctr),      	//  data received
		.error		(global_sync_error),		//	bad start or stop bit
		.idle		(rx_idle)					//	1 if receiver in idle state
	);

	// *********************** Status output ************************
	/*
		The status of the module (== reg0_read[15:8]) is available at the output status bus.
		It can be then routed to a scope or whatever for debugging
	*/	
	
	assign status_out[7:0] = reg0_read[15:8];	
	
	
endmodule
