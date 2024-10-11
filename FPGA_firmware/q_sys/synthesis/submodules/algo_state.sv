// algo_state
/*
Takes an input stream and calculate some value

Remarks:
- The transfer is performed on the fly, without buffering. Input gets backpressed when needed
*/


`timescale 100 ps / 100 ps
module algo_reconstruction (
		//Clock/reset
      input  wire        	clk_clk,                    //                     clk.clk
      input  wire        	rst_reset,                  //                     rst.reset
		
		//avalon ST sink
		input  wire [31:0] data_in_data,           //  data_in.data
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
		input  wire        data_out_ready,         //         .ready
		output wire        data_out_valid          //         .valid
	);


	
	
	// *********************** ST interface ***********************

	reg	[4:0]	state;		//State of the state machine
	localparam STATE_IDLE	= 0;	//waiting for SOP
	localparam STATE_WORD0	= 1;	//sending first word : 			
	localparam STATE_WORD1	= 2;	//sending second word: 				
	localparam STATE_WORD2	= 3;	//sending third word :				
	localparam STATE_DATA	= 4;	//sending data
	localparam STATE_CALC	= 5;	//calculate
	localparam STATE_RESULT	= 6;	//send result//LAST_WORDS

	reg		reg_ready;	//registers to drive output pins of ST interfaces
	reg		reg_valid;
	reg	[31:0]	reg_data;
	reg		reg_startofpacket;
	reg		reg_endofpacket;
	reg		reg_empty;

		//Helper stuff
	reg	[15:0]	tx_ctr;	//counter of sent data words
	localparam WORDS_TO_SEND = 163;

	// for sum
	reg[31:0] sum_all;
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
				STATE_WORD0, STATE_WORD1,STATE_WORD2:
				begin
					if (data_out_ready & data_in_valid)
					begin
						state <= state + 1;
						tx_ctr <= tx_ctr +1;
					end
				end
				STATE_DATA:
				begin
					if (data_out_ready && data_in_valid)
					begin
						tx_ctr <= tx_ctr+1;
						if (tx_ctr == WORDS_TO_SEND -2)	//last word, size matches
							state <= STATE_CALC;
					end
				end
				STATE_CALC:
				begin
					sum_all <= 32'h1199;
					state <= STATE_RESULT;
				end
				STATE_RESULT:
				begin
					if (data_out_ready)
					begin
						tx_ctr <= tx_ctr+1;
						state <= STATE_IDLE;
					end
				end
				default:
				begin
					state <= STATE_IDLE;
				end
			endcase
	end

		//Driving bus signals
	always_comb
	begin
		if (rst_reset)
		begin
			reg_ready = 0;
			reg_valid = 0;
			reg_data = 0;
			reg_startofpacket = 0;
			reg_endofpacket = 0;
			reg_empty = 0;
		end
		else
			case(state)
				STATE_IDLE:
				begin
					reg_ready 		= 0;
					reg_valid 		= 0;
					reg_data 		= 0;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_WORD0:
				begin
					reg_ready 		= data_out_ready;
					reg_valid 		= 1;
					reg_data = data_in_data;
					reg_startofpacket 	= 1;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_WORD1,STATE_WORD2:
				begin
					reg_ready 		= 1;
					reg_valid 		= 1;
					reg_data 		= data_in_data;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_DATA:
				begin
					reg_ready 		= 1;
					reg_valid 		= 1;
					reg_data 		= data_in_data;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_CALC:
				begin
					reg_ready 		= 1;
					reg_valid 		= 0;
					reg_data 		= 0;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_RESULT:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data			= sum_all;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 1;
					reg_empty 		= 0;
				end

				default:
				begin
					reg_ready = 0;
					reg_valid = 0;
					reg_data = 0;
					reg_startofpacket = 0;
					reg_endofpacket = 0;
					reg_empty = 0;
				end
			endcase
	end

	
	assign data_in_ready = reg_ready;
	assign data_out_valid = reg_valid;
	assign data_out_data = reg_data;
	assign data_out_startofpacket = reg_startofpacket;
	assign data_out_endofpacket = reg_endofpacket;
	assign data_out_empty = reg_empty;

endmodule
