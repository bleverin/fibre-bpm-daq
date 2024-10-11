//a module bridge the avalon streaming interface and avalon memory map interface
//collect data from interface and write to RAM

//32 2; OR 16 1

//tested by st2mm_tb.v
module st2mm #(parameter BITSIZE = 32, EMPTY_SIZE = 2)(

	//clock and reset
	input wire clk,
	input wire rst,
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	input  wire [BITSIZE-1:0] data_in_data,           //  st.data
	output wire        data_in_ready,          //         .ready
	input  wire        data_in_valid,          //         .valid
	input  wire [EMPTY_SIZE-1:0]  data_in_empty,          //         .empty
	input  wire        data_in_endofpacket,    //         .endofpacket
	input  wire        data_in_startofpacket,  //         .startofpacket
	
	//avalon MM(Memory Mapped) source  writelatency 0; readlatency 1 but no read logic here
	output wire [8:0] mm_address,
	output wire       mm_chipselect, // only for write
	output wire 		mm_write,
	output wire [BITSIZE-1:0] mm_writedata,
	input wire mm_waitrequest_n //it equals to mm_ready..
	
	//output wire			mm_clken, //only for write write enable
	input wire	[BITSIZE-1:0]mm_readdate, //do not read
	
);

	reg[1:0] state;
	localparam STATE_IDLE = 2'd0; //waiting for startofpacket
	localparam STATE_WRITE = 2'd1; //write to mm
	localparam STATE_LOCK = 2'd3; //Finish writing
	
	reg[8:0] ctr; // count data and the address for MM
	localparam CTR_ZERO = 9'd0;
	assign mm_address = ctr;
	assign mm_writedata = data_in_data;
	assign mm_write = (state == STATE_WRITE)? 1'b1: 1'b0;
	
	assign mm_chipselect = (state == STATE_WRITE && data_in_valid)? 1'b1: 1'b0;
	//assign mm_clken = (state == STATE_WRITE && data_in_valid)? 1'b1: 1'b0;
	assign data_in_ready = (state == STATE_WRITE)? mm_waitrequest_n: 1'b0;
	
	
	always @ (posedge clk or posedge rst)
	begin 
		if (rst)
		begin
			state <= STATE_IDLE;
			ctr <= CTR_ZERO;
		end
		else case(state)
				STATE_IDLE:
				begin
					ctr <= CTR_ZERO;
					if (data_in_startofpacket)
						state <= STATE_WRITE;
				end
				STATE_WRITE:
				begin
					if (data_in_valid && mm_waitrequest_n)
					begin
						ctr <= ctr + 1'b1;
						if (data_in_endofpacket)
							state <= STATE_LOCK;
							ctr <= CTR_ZERO;
					end
				end
				STATE_LOCK:
				begin
					state <= STATE_IDLE;
					ctr <= CTR_ZERO;
				end
				default:
					state <= STATE_IDLE;
		endcase
	end
	
	

endmodule
	
