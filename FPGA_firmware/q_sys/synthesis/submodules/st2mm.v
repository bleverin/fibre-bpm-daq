//a module bridge the avalon streaming interface and avalon memory map interface
//collect data from interface and write to RAM

//32 2; OR 16 1
module st2mm #(parameter BITSIZE = 32, EMPTY_SIZE = 2)(

	//clock and reset
	input wire clk,
	input wire rst,
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	input  wire [BITSIZE-1:0] st_data,           //  st.data
	output wire        st_ready,          //         .ready
	input  wire        st_valid,          //         .valid
	input  wire [EMPTY_SIZE-1:0]  st_empty,          //         .empty
	input  wire        st_endofpacket,    //         .endofpacket
	input  wire        st_startofpacket,  //         .startofpacket
	
	//avalon MM(Memory Mapped) source  writelatency 0; readlatency 1 but no read logic here
	output wire [8:0] mm_address,
	output wire       mm_chipselect, // only for write
	//output wire			mm_clken, //only for write; write enable
	input wire	[BITSIZE-1:0]mm_readdate, //do not read
	output wire 		mm_write,
	output wire [BITSIZE-1:0] mm_writedata,
	input wire mm_waitrequest_n
	
);

	reg[1:0] state;
	localparam STATE_IDLE = 2'd0; //waiting for startofpacket
	localparam STATE_WRITE = 2'd1; //write to mm
	localparam STATE_LOCK = 2'd3; //Finish writing
	
	reg[8:0] ctr; // count data and the address for MM
	localparam CTR_ZERO = 9'd0;
	assign mm_address = ctr;
	assign mm_writedata = st_data;
	
	assign mm_chipselect = (state == STATE_WRITE && st_valid)? 1'b1: 1'b0;
	//assign mm_clken = (state == STATE_WRITE && st_valid)? 1'b1: 1'b0;
	assign st_ready = (state == STATE_WRITE)? 1'b1: 1'b0;
	
	
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
					if (st_startofpacket)
						state <= STATE_WRITE;
				end
				STATE_WRITE:
				begin
					if (st_valid && mm_waitrequest_n)
					begin
						ctr <= ctr + 1'b1;
						if (st_endofpacket)
							state <= STATE_LOCK;
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
	