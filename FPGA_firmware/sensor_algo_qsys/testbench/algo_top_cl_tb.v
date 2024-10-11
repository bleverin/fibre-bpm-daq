//algo_top_cl testbench

//testbench for algo_top

`timescale 1 ns / 1 ns
module algo_top_cl_tb();

	localparam CLK_PERIOD = 20; 

	reg clk;
	reg rst;
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	reg [31:0] data_in_data;
	wire 		  data_in_ready;
	wire		  data_in_valid;
	reg [1:0]  data_in_empty;
	reg		  data_in_startofpacket;
	wire		  data_in_endofpacket;
	
	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence
	wire [15:0] data_out_data;          // data_out.data
	wire        data_out_empty;         //         .empty
	wire        data_out_endofpacket;   //         .endofpacket
	wire        data_out_startofpacket; //         .startofpacket
	reg         data_out_ready;         //         .ready
	wire        data_out_valid;          //         .valid

	reg [1:0] state;
	localparam STATE_IDLE = 2'd0;
	localparam STATE_SEND = 2'd1;
	localparam STATE_LOC = 2'd3;
	
	reg [7:0]	tx_ctr; //counter for how many data has been sent
	localparam WORDS_TO_SEND = 163;
	
	//for cluster
	reg[15:0] CL_THRESHOLD;
	reg[15:0] CL_SIZE;
	
	algo_top_cl algo_top_cl_dut(
	
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(data_in_data),
		.data_in_ready		(data_in_ready),
		.data_in_valid		(data_in_valid),
		.data_in_empty		(data_in_empty),
		.data_in_startofpacket		(data_in_startofpacket),
		.data_in_endofpacket			(data_in_endofpacket),
		
		.data_out_data		(data_out_data),
		.data_out_empty	(data_out_empty),
		.data_out_endofpacket		(data_out_endofpacket),
		.data_out_startofpacket		(data_out_startofpacket),
		//.data_out_ready	(data_out_ready),
		.data_out_valid	(data_out_valid),
		
		.CL_THRESHOLD		(CL_THRESHOLD),
		.CL_SIZE				(CL_SIZE)
		
	);
	
	initial begin
	
	CL_SIZE = 5;
	CL_THRESHOLD = 2; 
	
	clk = 1'b1;
	rst = 1'b1;
	
	data_in_data = 600000;
	data_in_empty = 2'b0;
	data_in_startofpacket = 1'b0;
	//data_in_endofpacket = 1'b0;
	
	data_out_ready = 1'b0;
	
	state = STATE_IDLE;
	
	
	#(CLK_PERIOD*2);
	rst = 1'b0;
	
	//the next sink is ready..
	#(CLK_PERIOD*20);
	data_out_ready = 1'b1;
	
	#1; //make sure startofpacket and endofpacket start after clk rising edge
	
	repeat(8) begin
		/******one packet*******/
		//start packet
		data_in_data = 600000;
		#(CLK_PERIOD*2);
		data_in_startofpacket = 1'b1;
		//end packet
//		#(CLK_PERIOD*163*4);
//		data_in_endofpacket = 1'b1;
		#(CLK_PERIOD*5000);
		
	end
	
		repeat(8) begin
		/******one packet*******/
		//start packet
		data_in_data = 7000000;
		#(CLK_PERIOD*2);
		data_in_startofpacket = 1'b1;
		//end packet
//		#(CLK_PERIOD*163*4);
//		data_in_endofpacket = 1'b1;
		#(CLK_PERIOD*5000);
	end
	
	
	#(CLK_PERIOD*200); $stop;
	
	end
	
	
	//clk
	always #(CLK_PERIOD/2) clk = ~ clk;
	
	assign data_in_valid = (state == STATE_SEND || data_in_startofpacket || data_in_endofpacket)? 1'b1 : 1'b0;
	assign data_in_endofpacket = (state == STATE_SEND && tx_ctr == WORDS_TO_SEND -1)? 1'b1: 1'b0;
	always @(posedge clk) begin
		case(state)
		STATE_IDLE:
		begin
			tx_ctr <= 8'd0;
			if (data_in_startofpacket)
			begin
				state <= STATE_SEND;
			end
		end
		STATE_SEND:
		begin
			if (data_in_ready)
			begin
				data_in_startofpacket <= 1'b0;
				tx_ctr <= tx_ctr + 1'b1;
				if (tx_ctr == WORDS_TO_SEND-1) begin
					state <= STATE_LOC;
					//data_in_data <= 600000;
				end else begin
					data_in_data <= data_in_data + 1;
				end
			end
		end
		STATE_LOC:
		begin
			state <= STATE_IDLE;
			tx_ctr <= 8'd0;
		end
		endcase
	end
	
endmodule	