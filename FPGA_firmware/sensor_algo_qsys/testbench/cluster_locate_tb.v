//module cluster_locate testbench

//algo_top_cl testbench

//testbench for algo_top

`timescale 1 ns / 1 ns
module cluster_locate_tb();

	localparam CLK_PERIOD = 20; 

	reg clk;
	reg rst;
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	reg [15:0] data_in_data;
	wire 		  data_in_ready;
	wire		  data_in_valid;
	reg        data_in_empty;
	reg		  data_in_startofpacket;
	wire		  data_in_endofpacket;
	
	//for cluster
	reg[15:0] CL_THRESHOLD;
	reg[15:0] CL_SIZE;
	
	wire[8:0] sig_ch_left;
	wire[8:0] sig_ch_right;
	wire 		 has_cluster;
	wire		 no_cluster;
	
	
	
	reg [1:0] state;
	localparam STATE_IDLE = 2'd0;
	localparam STATE_SEND = 2'd1;
	localparam STATE_LOC = 2'd3;
	
	reg [8:0]	tx_ctr; //counter for how many data has been sent
	localparam WORDS_TO_SEND = 320;
	

	
	cluster_locate cluster_locate_dut(
	
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(data_in_data),
		.data_in_ready		(data_in_ready),
		.data_in_valid		(data_in_valid),
		.data_in_empty		(data_in_empty),
		.data_in_startofpacket		(data_in_startofpacket),
		.data_in_endofpacket			(data_in_endofpacket),
		
		.THRESHOLD			(CL_THRESHOLD),
		.SIZE					(CL_SIZE),
		
		.sig_ch_left		(sig_ch_left),
		.sig_ch_right		(sig_ch_right),
		.has_cluster		(has_cluster),
		.no_cluster			(no_cluster)
		
	);
	
	localparam HEIGHT = 2000;
	reg[31:0] WIDTH;
	localparam POS = 100;
	

	initial begin
	
	CL_SIZE = 5;
	CL_THRESHOLD = 200; 
	
	clk = 1'b1;
	rst = 1'b1;
	
	
	data_in_empty = 2'b0;
	data_in_startofpacket = 1'b0;
	//data_in_endofpacket = 1'b0;

	
	state = STATE_IDLE;
	
	
	#(CLK_PERIOD*2);
	rst = 1'b0;

	
	#1; //make sure startofpacket and endofpacket start after clk rising edge
	
	repeat(4) begin
		WIDTH = 20;
		/******one packet*******/
		//start packet
		#(CLK_PERIOD*2);
		data_in_startofpacket = 1'b1;

		#(CLK_PERIOD*5000);
		
	end
	
	repeat(4) begin
		WIDTH = 3;
		/******one packet*******/
		//start packet
		#(CLK_PERIOD*2);
		data_in_startofpacket = 1'b1;

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
				if (tx_ctr < 60)
						data_in_data<=0;
					else if (tx_ctr < 60+WIDTH-1)
						data_in_data <= HEIGHT/WIDTH + data_in_data;
					else if (tx_ctr < 60+2*WIDTH-1)
						data_in_data <= data_in_data-HEIGHT/WIDTH;
					else if (tx_ctr < 60+3*WIDTH-1)
						data_in_data <= HEIGHT/WIDTH + data_in_data;
					else if (tx_ctr < 60+4*WIDTH-1)
						data_in_data <= data_in_data-HEIGHT/WIDTH;
					else if (tx_ctr < 60+5*WIDTH-1)
						data_in_data <= HEIGHT/WIDTH + data_in_data;
					else if (tx_ctr < 60+6*WIDTH-1)
						data_in_data <= data_in_data-HEIGHT/WIDTH;
					else
						data_in_data <= 0;		
				if (tx_ctr == WORDS_TO_SEND-1) begin
					state <= STATE_LOC;
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