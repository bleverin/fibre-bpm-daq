//a module bridge the avalon streaming interfaces with data length from 32 bit to 16 bit
//long to short
//32 bits to 16 bits [31:16] streaming out first and then [15:0]
//ST long to ST short



//tested by stl2sts_tb.v
module stl2sts(

	//clock and reset
	input wire clk,
	input wire rst,
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	input  wire [31:0] data_in_data,           //  st.data
	output wire        data_in_ready,          //         .ready
	input  wire        data_in_valid,          //         .valid
	input  wire [1:0]  data_in_empty,          //         .empty
	input  wire        data_in_endofpacket,    //         .endofpacket
	input  wire        data_in_startofpacket,  //         .startofpacket
	
	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence
	output  wire [15:0] data_out_data,           //  st.data
	input   wire        data_out_ready,          //         .ready
	output  wire        data_out_valid,          //         .valid
	output  wire        data_out_empty,          //         .empty
	output  wire        data_out_endofpacket,    //         .endofpacket
	output  wire        data_out_startofpacket  //         .startofpacket	
);

	reg[1:0] state;
	localparam STATE_IDLE = 2'd0; //waiting for startofpacket
	localparam STATE1 = 2'd1; //streaming [31:16]
	localparam STATE2 = 2'd3; //streaming [15:0]
	localparam STATE_LOCK = 2'd2; //Finishing streaming
	
	assign data_in_ready = (state == STATE2 && data_out_ready)? 1'b1:1'b0;
	
	assign data_out_data = (state == STATE1)? data_in_data[31:16]:(state== STATE2)? data_in_data[15:0]: 16'b0;
	assign data_out_valid = (state == STATE1 || state == STATE2)?data_in_valid:1'b0;
	assign data_out_empty = 1'b0;
	assign data_out_startofpacket = (state == STATE1)? data_in_startofpacket: 1'b0;
	assign data_out_endofpacket = (state == STATE2)? data_in_endofpacket: 1'b0;
	
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
			state <= STATE_IDLE;
		else case(state)
		STATE_IDLE:
		begin
			if (data_in_startofpacket)
				state <= STATE1;
		end
		STATE1:
		begin
			if (data_in_valid && data_out_ready)
				state <= STATE2;
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
	
