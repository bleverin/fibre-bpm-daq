//testbench for stl2sts: ST long 32-bit to ST short 16-bit

`timescale 1 ns / 1 ns
module st2mm_tb();

	localparam CLK_PERIOD = 20; 

	reg clk;
	reg rst;
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	reg [31:0] data_in_data;
	wire 		  data_in_ready;
	wire		  data_in_valid;
	reg [1:0]  data_in_empty;
	reg		  data_in_startofpacket;
	reg		  data_in_endofpacket;

	
	
	//avalon MM(Memory Mapped) source  writelatency 0; readlatency 1 but no read logic here
	wire [8:0] mm_address;
	wire       mm_chipselect; // only for write
	wire [31:0]	mm_readdate; //do not read
	wire 		mm_write;
	wire [31:0] mm_writedata;
	reg mm_waitrequest_n;
	
	
	reg [1:0] state;
	localparam STATE_IDLE = 2'd0;
	localparam STATE_SEND = 2'd1;
	localparam STATE_LOC = 2'd3;
	
	st2mm #(.BITSIZE(32), .EMPTY_SIZE(2)) st2mm_dut(
	
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(data_in_data),
		.data_in_ready		(data_in_ready),
		.data_in_valid		(data_in_valid),
		.data_in_empty		(data_in_empty),
		.data_in_startofpacket		(data_in_startofpacket),
		.data_in_endofpacket			(data_in_endofpacket),
		
		.mm_address		(mm_address),
		.mm_chipselect	(mm_chipselect),
		.mm_readdate	(mm_readdate),
		.mm_write		(mm_write),
		.mm_writedata	(mm_writedata),
		.mm_waitrequest_n				(mm_waitrequest_n)
		
	);
	
	initial begin
	
	clk = 1'b1;
	rst = 1'b1;
	
	data_in_data = 0;
	data_in_empty = 2'b0;
	data_in_startofpacket = 1'b0;
	data_in_endofpacket = 1'b0;
	
	mm_waitrequest_n = 1'b0;
	
	state = STATE_IDLE;
	
	
	#(CLK_PERIOD*2);
	rst = 1'b0;
	
	//the next sink is ready..
	#(CLK_PERIOD*20);
	mm_waitrequest_n = 1'b1;
	
	//start packet
	#(CLK_PERIOD*2+1);
	data_in_startofpacket = 1'b1;
	
	#(CLK_PERIOD*2);
	mm_waitrequest_n = 1'b0;
	
	#(CLK_PERIOD*2);
	mm_waitrequest_n = 1'b1;
	
	
	
	//end packet
	#(CLK_PERIOD*5);
	data_in_endofpacket = 1'b1;
	
	
	#(CLK_PERIOD*200); $stop;
	
	end
	
	
	//clk
	always #(CLK_PERIOD/2) clk = ~ clk;
	
	assign data_in_valid = (state == STATE_SEND || data_in_startofpacket || data_in_endofpacket)? 1'b1 : 1'b0;
	always @(posedge clk) begin
		case(state)
		STATE_IDLE:
		begin
			if (data_in_startofpacket && data_in_ready)
			begin
				state <= STATE_SEND;
				data_in_data <= data_in_data + 1;
				data_in_startofpacket <= 1'b0;
			end
		end
		STATE_SEND:
		begin
			if (data_in_ready)
			begin
				if (data_in_endofpacket) begin
					state <= STATE_LOC;
					data_in_data <= 0;
					data_in_endofpacket <= 1'b0;
				end else begin
					data_in_data <= data_in_data + 1;
				end
			end
		end
		STATE_LOC:
		begin
			state <= STATE_IDLE;
		end
		endcase
	end
	
endmodule	