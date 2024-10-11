// the interface between sensor_interface and UDP packet 
// avalon_streaming sink and source 
// words to send/receive is 163



`timescale 1 ps / 1 ps

module algo_reconstruction (
		//Clock/reset
        input  wire        	clk_clk,                    //                     clk.clk
        input  wire        	rst_reset,                  //                     rst.reset
		  
		//Avalon ST receiver
		input  wire [31:0] data_in_data,           //  data_in.data
		output wire        data_in_ready,          //         .ready
		input  wire        data_in_valid,          //         .valid
		input  wire [1:0]  data_in_empty,          //         .empty
		input  wire        data_in_endofpacket,    //         .endofpacket
		input  wire        data_in_startofpacket,  //         .startofpacket
	
		//Avalon ST transmitter
        output wire [31:0] 	data_out_data,          	// avalon_streaming_source.data
        output wire        	data_out_endofpacket,   	//                        .endofpacket
        output wire        	data_out_startofpacket, 	//                        .startofpacket
        input  wire        	data_out_ready,         	//                        .ready
        output wire        	data_out_valid,         	//                        .valid
        output wire [1:0]  	data_out_empty       	//                        .empty
		
		
    );

	 
	 
	 
	 
	// *********************** Internal reset logic  ************************
	/*
		The internal reset signal derives from the reset input).
		It drives all subcomponents but registers (which use simpy the reset input).
		This signal is registered to be sure that no glitches from register bank pass.
	*/

	reg int_rst;

	always @(posedge clk_clk)
	begin
		int_rst <= rst_reset;
	end

	
	 //Very important globals
	reg[31:0] 	rx_buffer[162:0];		//Data to receive: 3 words header plus sensor data
	
	wire		start_transmission;			//pulsing this signal causes the Avalon ST link to start transmission
	reg[31:0] transmit_buffer[162:0]; //DATA to transmit
	
	 //********************** Avalon receiver ************************
	 reg [1:0] data_in_state;
	 localparam DATA_IN_STATE_IDLE = 0; //waiting for high
	 localparam DATA_IN_STATE_RECEIVE = 1; //receiving data
	 localparam DATA_IN_STATE_FINISH = 3; // finish receiveing to run algorithm 
	 localparam DATA_IN_STATE_LOCK = 2; //roll to IDLE
	 
	 localparam WORDS_TO_RECEIVE = 163; 
	 localparam WORDS_TO_SEND = 163;	
	 
	 integer i;	//for generate loops
	 
	 //registers to drive input pins of ST interfaces
	 
	 reg reg_in_ready;
		
		//Helper stuff
	reg[15:0]  rx_ctr; //counter of receive data worDS_TO_RECEIVE

	// The state machine
	always @(posedge clk_clk or posedge int_rst)
	begin 
		if(int_rst)
		begin
			data_in_state <= DATA_IN_STATE_IDLE;

		end
		else
			case(data_in_state)
				DATA_IN_STATE_IDLE:
				begin
					if (data_in_valid)
					begin
						data_in_state <= DATA_IN_STATE_RECEIVE;
						rx_ctr <= 0;
					end
				end
				DATA_IN_STATE_RECEIVE:
				begin
					if (data_in_valid & data_in_ready)
					begin						
							rx_ctr <= rx_ctr+1;					
					end
					
					if (rx_ctr == (WORDS_TO_RECEIVE-1))
					begin
						data_in_state <= DATA_IN_STATE_FINISH;
					end				
				end
				DATA_IN_STATE_FINISH:
				begin
					data_in_state <= DATA_IN_STATE_LOCK;
					rx_ctr <= 0;
				end
				DATA_IN_STATE_LOCK:
				begin
					if (~data_in_valid)
						data_in_state <= DATA_IN_STATE_IDLE;
				end
				
				default:
					data_in_state <= DATA_IN_STATE_IDLE;
			endcase
	end
	
	//Combinational Part
	
	always @ (*)
	begin
		if (int_rst)
		begin
			reg_in_ready <= 0;
		end
		else
			case(data_in_state)
				DATA_IN_STATE_IDLE, DATA_IN_STATE_LOCK:
				begin
					reg_in_ready <= 0;
				end
				DATA_IN_STATE_RECEIVE:
				begin					
					if (data_in_startofpacket)
						reg_in_ready <= 1;
					if (data_in_ready)   
						rx_buffer[rx_ctr] <= data_in_data[31:0];
				end				
				DATA_IN_STATE_FINISH:
				begin	
					reg_in_ready <= 0;
					for (i = 0; i < (WORDS_TO_SEND); i = i+1)
					begin
						transmit_buffer[i] <= rx_buffer[i];
					end
				end
				default:
				begin
					reg_in_ready <= 0;
				end
			endcase
	end
	
	assign data_in_ready = reg_in_ready;

			
		//Generate Avalon trigger signal
	assign start_transmission = (data_in_state == DATA_IN_STATE_FINISH) ? 1 : 0;
	

	
	 
	 
	 

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

	
	
		//registers to drive output pins of ST interfaces
	reg		reg_valid;
	reg	[31:0]	reg_data;
	reg		reg_startofpacket;
	reg		reg_endofpacket;

		//Helper stuff
	reg	[15:0]	tx_ctr;	//counter of sent data words

		//The state machine
	always @(posedge clk_clk or posedge int_rst)
	begin 
		if (int_rst)
			data_out_state <= DATA_OUT_STATE_IDLE;
		else
			case(data_out_state)
				DATA_OUT_STATE_IDLE:
				begin
					if (start_transmission)
					begin
						data_out_state <= DATA_OUT_STATE_SEND;
						tx_ctr <= 0;
					end
				end
				DATA_OUT_STATE_SEND:
				begin
					if (data_out_ready)
						tx_ctr <= tx_ctr + 1;
					if (tx_ctr == (WORDS_TO_SEND-1))
						data_out_state <= DATA_OUT_STATE_LOCK;
				end
				DATA_OUT_STATE_LOCK:
				begin
					tx_ctr <= 0;
					if (~start_transmission)
						data_out_state <= DATA_OUT_STATE_IDLE;
				end

				default:
					data_out_state <= DATA_OUT_STATE_IDLE;
			endcase
	end

		//Driving bus signals
	always @( *)
	begin
		if (int_rst)
		begin
			reg_valid = 0;
			reg_data = 0;
			reg_startofpacket = 0;
			reg_endofpacket = 0;
		end
		else
			case(data_out_state)
				DATA_OUT_STATE_IDLE, DATA_OUT_STATE_LOCK:
				begin
					reg_valid = 0;
					reg_data = 0;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
				end
				DATA_OUT_STATE_SEND:
				begin
					reg_valid 		= 1;
					reg_data[31:0] 		= transmit_buffer[tx_ctr];
					if (tx_ctr == 0)
						reg_startofpacket 	= 1;
					else
						reg_startofpacket 	= 0;
					if (tx_ctr == (WORDS_TO_SEND-1))
					begin
						reg_endofpacket 	= 1;
					end
					else
						reg_endofpacket 	= 0;
				end
				
				default:
				begin
					reg_valid 		= 0;
					reg_data 		= 0;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
				end
			endcase
	end

	assign data_out_valid = reg_valid;
	assign data_out_data = reg_data;
	assign data_out_startofpacket = reg_startofpacket;
	assign data_out_endofpacket = reg_endofpacket;

	
endmodule
