//a module bridge the avalon streaming interfaces with data length from 16 bit to 32bit
//short to long
//First fill [31:16] and then fill [15:0]
//ST short to ST long

//the number of ST short data_in_data has to be even 
//tested by sts2stl_tb.v
module sts2stl(

	//clock and reset
	input wire clk,
	input wire rst,
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	input  wire [15:0] data_in_data,           //  st.data
	output wire        data_in_ready,          //         .ready
	input  wire        data_in_valid,          //         .valid
	input  wire 		 data_in_empty,          //         .empty
	input  wire        data_in_endofpacket,    //         .endofpacket
	input  wire        data_in_startofpacket,  //         .startofpacket
	
	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence
	output  wire [31:0] data_out_data,           //  st.data
	input   wire        data_out_ready,          //         .ready
	output  wire        data_out_valid,          //         .valid
	output  wire [1:0]  data_out_empty,          //         .empty
	output  wire        data_out_endofpacket,    //         .endofpacket
	output  wire        data_out_startofpacket  //         .startofpacket	
);

	reg[2:0] state;
	localparam STATE_IDLE = 3'd0; //waiting for startofpacket
	localparam STATE10 = 3'd1; // collecting [31:16]
	localparam STATE20 = 3'd3; // collecting [15:0]
	localparam STATE1 = 3'd7; 
	localparam STATE2 = 3'd6;
	localparam STATE_LOCK = 3'd5; //Finishing streaming
	
	reg[15:0] data_buffer; //buffer for the first and then fill [31:16]
	
	assign data_in_ready = ((state == STATE20 || state == STATE2) && data_out_ready)? 1'b1:(state == STATE1 || state == STATE10)? 1'b1: 1'b0;
	
	assign data_out_data = (state == STATE2 || state == STATE20)? {data_buffer, data_in_data}: 32'b0;
	assign data_out_valid = (state == STATE2 || state == STATE20)? data_in_valid: 1'b0;
	assign data_out_empty = 2'b0;
	assign data_out_startofpacket = (state == STATE20)? 1'b1: 1'b0;
	assign data_out_endofpacket = (state == STATE2)? data_in_endofpacket: 1'b0;
	
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
			state <= STATE_IDLE;
		else case(state)
		STATE_IDLE:
		begin
			if (data_in_startofpacket)
				state <= STATE10;
		end
		STATE10:
		begin
			if (data_in_valid)
			begin
				state <= STATE20;
				data_buffer <= data_in_data; 
			end
		end
		STATE20:
		begin
			if (data_in_valid && data_out_ready)
			begin
				if (data_in_endofpacket)
					state <= STATE_LOCK;
				else
					state <= STATE1;
			end
		end
		STATE1:
		begin
			if (data_in_valid)
			begin
				state <= STATE2;
				data_buffer <= data_in_data; 
			end
		end
		STATE2:
		begin
			if (data_in_valid && data_out_ready)
			begin
				if (data_in_endofpacket)
					state <= STATE_LOCK;
				else
					state <= STATE1;
			end
		end
		STATE_LOCK:
			state <= STATE_IDLE;
		default:
			state <= STATE_IDLE;
		endcase
	end
	
	

	


endmodule
	
