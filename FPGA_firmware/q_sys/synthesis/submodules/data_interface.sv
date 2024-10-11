/*
This data_interface get the data from the sensor, and provide the data after background subtraction and cluster locating signal to next step

The BKG_FRAME has to be the power of 2, and it belongs to [2,65536]
CLU_THRESHOLD and CLU_SIZE are for cluster_locate; CLU_SIZE belongs to [0,319]

*/


`timescale 100 ps / 100 ps
module data_interface #(parameter BKG_FRAME = 4, CLU_THRESHOLD = 54, CLU_SIZE = 4)
(
			//Clock/reset
			input  wire        	clk_clk,                    //                     clk.clk
			input  wire        	rst_reset,                  //                     connect to int_reset from sensor_interface, to reset frameID to 0;
			//avalon ST sink
			input  logic unsigned[31:0] data_in_data,           //  data_in.data
			output wire        data_in_ready,          //         .ready
			input  wire        data_in_valid,          //         .valid
			input  wire [1:0]  data_in_empty,          //         .empty
			input  wire        data_in_endofpacket,    //         .endofpacket
			input  wire        data_in_startofpacket,  //         .startofpacket
			//avalon ST source
			output wire [31:0] data_out_data,          // data_out.data
			output wire [1:0]  data_out_empty,         //         .empty
			output wire        data_out_endofpacket,   //         .endofpacket
			output wire        data_out_startofpacket, //         .startofpacket
			input  wire        data_out_ready,         //         .ready  the UDP is ready
			output wire        data_out_valid,          //         .valid

			output wire[26:0]	 frameID, // for assign signal in tb simulation
			output wire bkg_sub_on,
			output wire rst_frame, // this is for after data_interface
				 
			//data for sig after bkg subtraction
			input wire			   sig_rdclk,						//the read port for sig_ram
			input wire[8:0]		sig_rdaddress,             //0~319 for data. 500~502 for the 3 words head
			output wire[31:0]		sig_out,
			output reg 			sig_ram_last,

			//the output of cluster_locate
			output wire[8:0]		sig_ch_left,
			output wire[8:0]		sig_ch_right,
			output wire				has_cluster,
			output wire				no_cluster
		
			
	);
	/*******the reset logic********************************/
		//the rst signal for every frame
	wire rst_frame_after_sensor_interface;
	assign rst_frame_after_sensor_interface = data_in_startofpacket || rst_reset;
	
	assign rst_frame = data_in_endofpacket || rst_reset;
	
	

		/*
		This is a frame counter; 
		frameID +1 at the rising edge of data_in_startofpacket
		wire[26:0] frameID;
		if frame increase at 10kHz, the 27-bit frameID can count 3.72 hour frame
		*/
		frame_counter framectr(
			.clk_clk(clk_clk),
			.rst_reset(rst_reset),
			.sig(data_in_startofpacket),
			.frame_Num(frameID)
		);
		

	
	// *********************** ST interface ***********************

	reg	[4:0]	state;		//State of the state machine
	localparam STATE_IDLE	= 5'd0;	//waiting for SOP
	localparam STATE_WORD0	= 5'd1;	//sending first word : 			
	localparam STATE_WORD1	= 5'd2;	//sending second word: 				
	localparam STATE_WORD2	= 5'd3;	//sending third word :				
	localparam STATE_DATA_PRO	= 5'd4;	//blocking data do the calculation
	localparam STATE_DATA_NEXT  = 5'd7;  //sending data
	localparam STATE_LOC	= 5'd5;	//calculatebb
	
	
		//Helper stuff
	reg	[7:0]	tx_ctr;	//counter of sent data words range: 0~255
	localparam WORDS_TO_SEND = 163;

	//the number of clocks for STATE_DATA_PRO
	reg [5:0] delay_ctr;
	localparam DELAY_CLOCKS = 6'd3; 
	
	
	/************** bkg RAM ****************************/
	/*
	for prepare the bkg signal by two RAM;
	one for data_in_data[31:16]; the other for data_in_data[15:0]
	the signal after bkg subtraction is 16 bit signed; the LSM bit is dropped out; (it's not important with current noise level)
	*/
	wire[15:0] bkg_signal0;
	wire[15:0] bkg_signal1;
	wire[31:0] bkg_input_data;
	
	//signal after subtract background
	//got the background signal at the third clock in STATE_DATA_PRO
	//and subtract it to 16 bit by giving up the LSM, i.e. divide 2. 
	reg [16:0] signal0_17bit;
	reg [16:0] signal1_17bit;
	wire[15:0] signal0;
	wire[15:0] signal1;
	
	assign signal0 = bkg_sub_on?signal0_17bit[16:1]:signal0_17bit[15:0];
	assign signal1 = bkg_sub_on?signal1_17bit[16:1]:signal1_17bit[15:0];
	
	bkg_ram #(.TOTAL_FRAME(BKG_FRAME)) bkg_but0(
		.clk_clk(clk_clk),
		.rst_reset(rst_reset),
		.frameID(frameID[26:0]),
		.address(tx_ctr), 
		.data_in_data(bkg_input_data[31:16]),
		.bkg_signal(bkg_signal0),
		.bkg_sub_status(bkg_sub_on)
	); 
	
	bkg_ram #(.TOTAL_FRAME(BKG_FRAME)) bkg_but1(
		.clk_clk(clk_clk),
		.rst_reset(rst_reset),
		.frameID(frameID[26:0]),
		.address(tx_ctr), 
		.data_in_data(bkg_input_data[15:0]),
		.bkg_signal(bkg_signal1)
	); 
	
	assign bkg_input_data = (state==STATE_DATA_NEXT)?~data_in_data:15'b0;
	
	
		//The state machine
	always @(posedge clk_clk or posedge rst_reset)
	begin 
		if (rst_reset)
		begin
			state <= STATE_IDLE;
		end
		else
			case(state)
				STATE_IDLE:
				begin
					if (data_in_startofpacket)
					begin
						state <= STATE_WORD0;
						tx_ctr <= 0;
					end
				end
				STATE_WORD0:
				begin
				if (data_out_ready)
					begin
					state <= STATE_WORD1;
					tx_ctr <= tx_ctr+ 1'b1;
					end
				end
				STATE_WORD1:
				begin
				if (data_out_ready)
					begin
					state <= STATE_WORD2;
					tx_ctr <= tx_ctr +1'b1;
					end
				end
				STATE_WORD2:
				begin
				if (data_out_ready)
					begin
					state <= STATE_DATA_PRO;
					tx_ctr <= tx_ctr +1'b1;
					delay_ctr <= DELAY_CLOCKS -1'b1;
					end
				end
				STATE_DATA_PRO:
				begin
					delay_ctr <= delay_ctr -1'b1;
					if (delay_ctr == 0)
					begin
						state <= STATE_DATA_NEXT;
						delay_ctr <= DELAY_CLOCKS - 1'b1;
						signal0_17bit <= {1'b0,~data_in_data[31:16]}-{1'b0,bkg_signal0};
					   signal1_17bit <= {1'b0,~data_in_data[15:0]}-{1'b0,bkg_signal1};
					end
				end
				STATE_DATA_NEXT:
				begin
					if (data_out_ready)
					begin
						tx_ctr <= tx_ctr+1'b1;
						if (tx_ctr == WORDS_TO_SEND -1)	//last word, size matches
							state <= STATE_LOC;
						else
							state <= STATE_DATA_PRO;	
					end
				end
				STATE_LOC:
				begin
					state <= STATE_IDLE;
				end
				default:
				begin
					state <= STATE_IDLE;
				end
			endcase
	end

		
		
	assign data_in_ready = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state == STATE_DATA_NEXT)&&data_out_ready; 
	assign data_out_valid = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state == STATE_DATA_NEXT) ? 1'b1 : 1'b0; 
	//the output data is be reversed....so during transfer without signal it's FFFFF, the software HIT-DAQ will reverse it again
	assign data_out_data = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2)? data_in_data:
									(state == STATE_DATA_NEXT)? {~signal0,~signal1}: 0;
	assign data_out_startofpacket = data_in_startofpacket;	
	assign data_out_endofpacket = (state == STATE_DATA_NEXT & tx_ctr == WORDS_TO_SEND-1) ? 1'b1 : 1'b0;	
	assign data_out_empty = 0;
	
	
	
	
	/*********************Prepare the data to cluster_locate******************************************/
	/*
	it is built by the fact that regardless data_out_ready signal, the STATE_DATA_PRO will go to STATE_DATA_NEXT
	so the signal after bkg sub will continue at least two clocks
	*/
	
	//the signal indicate the signal after bkg sub is ready or not; it's ready on next clock
	wire sub_bkg_signal_ready;
	assign sub_bkg_signal_ready = (state == STATE_DATA_PRO && delay_ctr == 0)? 1'b1 :1'b0;

	
	reg[8:0] cl_address;
	wire[15:0] cl_data_in_data;
	wire cl_data_in_valid;
	
	cluster_locate #(.THRESHOLD(CLU_THRESHOLD), .SIZE(CLU_SIZE)) cl_but(
		.clk_clk(clk_clk),
		.rst_reset(rst_frame_after_sensor_interface),
		.address(cl_address), 
		.last_data(sig_ram_last),
		.data_in_data(cl_data_in_data),
		.data_in_valid(cl_data_in_valid),
		.sig_ch_left(sig_ch_left),
		.sig_ch_right(sig_ch_right),
		.has_cluster(has_cluster),
		.no_cluster(no_cluster)
	); 

	reg[2:0] state_clu;
	localparam STATE_CLU_IDLE = 3'b1;
	localparam STATE_CLU_FIRST = 3'b10;
	localparam STATE_CLU_SECOND = 3'b100;
	
	assign cl_data_in_data = (state_clu == STATE_CLU_FIRST)? signal0:
										(state_clu == STATE_CLU_SECOND)? signal1: 16'b0;
	assign cl_data_in_valid = (bkg_sub_on && (state_clu == STATE_CLU_FIRST || state_clu == STATE_CLU_SECOND))? 1'b1: 1'b0;
	
	always @ (posedge clk_clk or posedge rst_frame_after_sensor_interface)
	begin
		if (rst_frame_after_sensor_interface)
		begin
			state_clu <= STATE_CLU_IDLE;
			cl_address <= 9'b0;
		end
		else case(state_clu)
		STATE_CLU_IDLE:
		begin
			if (sub_bkg_signal_ready)
				state_clu <= STATE_CLU_FIRST;
		end
		STATE_CLU_FIRST:
		begin
			state_clu <= STATE_CLU_SECOND;
			cl_address <= cl_address + 1'b1;
		end
		STATE_CLU_SECOND:
		begin
			state_clu <= STATE_CLU_IDLE;
			cl_address <= cl_address + 1'b1;
		end
		default:
			state_clu <= STATE_CLU_IDLE;
		endcase
	end
	
	
	/*********************ram for data after background subtraction**************************/
	
	/*when bkg_sub is not on, store the original data
	store the signal after bkg_sub in ram
	output the sig_ram_last signal
	*/
	
	wire sig_ram_wren;
	wire[31:0] sig_ram_data;
	wire[8:0] sig_wraddress;
	
	
	ram4sig sig_ram (
	.data(sig_ram_data),
	.rdaddress(sig_rdaddress),
	.rdclock(clk_clk),
	.wraddress(sig_wraddress),
	.wrclock(clk_clk),
	.wren(sig_ram_wren),
	.q(sig_out)
	);
	
	assign sig_ram_wren = (state_clu == STATE_CLU_FIRST || state_clu == STATE_CLU_SECOND)? 1'b1: 1'b0;
	assign sig_wraddress = cl_address;
	assign sig_ram_data = {16'b0,cl_data_in_data};
	assign sig_ram_last = (state == STATE_LOC)? 1'b1: 1'b0;
	
			
endmodule
