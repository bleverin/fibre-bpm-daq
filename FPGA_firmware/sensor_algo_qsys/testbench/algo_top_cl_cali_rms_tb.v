//module algo_top_cl_cali_tb


`timescale 1 ns / 1 ns

module algo_top_cl_cali_rms_tb();

	localparam CLK_PERIOD = 20; 

	reg clk;
	reg rst;
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	reg [31:0] data_in_data;
	wire[31:0] data_in_data_n;
	assign data_in_data_n = ~data_in_data;
	wire 		  data_in_ready;
	wire		  data_in_valid;
	reg [1:0]  data_in_empty;
	reg		  data_in_startofpacket;
	wire		  data_in_endofpacket;
	

	reg [1:0] state;
	localparam STATE_IDLE = 2'd0;
	localparam STATE_SEND = 2'd1;
	localparam STATE_LOC = 2'd3;
	
	reg [7:0]	tx_ctr; //counter for how many data has been sent
	localparam WORDS_TO_SEND = 163;
	
	
	//for cluster
	reg[15:0] CL_THRESHOLD;
	reg[15:0] CL_SIZE;
	
	
	//the interface with cali_ram (storing cali factor) Avalon-MM: read califac from this ram
	wire [8:0] 		address;
	reg [15:0] 	cali_fac;
	wire 				clken;
	
		// 
	reg waitrequest;
	always @(posedge clk) begin
	if (clken)
		waitrequest<=1'b0;
	else 
		waitrequest <= 1'b1;
	end
	
	
	algo_top_cl_cali_rms algo_top_cl_cali_rms_dut(
	
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(data_in_data_n),
		.data_in_ready		(data_in_ready),
		.data_in_valid		(data_in_valid),
		.data_in_empty		(data_in_empty),
		.data_in_startofpacket		(data_in_startofpacket),
		.data_in_endofpacket			(data_in_endofpacket),
		
				
		.CL_THRESHOLD		(CL_THRESHOLD),
		.CL_SIZE				(CL_SIZE),
		.address		(address),
		.clken		(clken),
		.cali_fac	(cali_fac),
		.waitrequest (waitrequest),
		
		.to_udp_data (to_udp_data),           
		.to_udp_ready(1'b1),          
		.to_udp_valid (to_udp_valid),          
		.to_udp_empty (to_udp_empty),          
		.to_udp_endofpacket (to_udp_endofpacket),    
		.to_udp_startofpacket (to_udp_startofpacket)		
	);
	
	initial begin
	
	CL_SIZE = 5;
	CL_THRESHOLD = 2; 
	
	clk = 1'b1;
	rst = 1'b1;
	cali_fac = 16'd10003;
	
	data_in_data = 0;
	data_in_empty = 2'b0;
	data_in_startofpacket = 1'b0;
	//data_in_endofpacket = 1'b0;
	

	
	state = STATE_IDLE;
	
	
	#(CLK_PERIOD*2);
	rst = 1'b0;
	
	//the next sink is ready..
	#(CLK_PERIOD*20);

	
	#1; //make sure startofpacket and endofpacket start after clk rising edge
	
	repeat(8) begin
		/******one packet*******/
		//start packet
		data_in_data = 'hF0;
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
		data_in_data = 'h600F7; //output data should be 9,9,9,9,9, SumY=2880; SumXY=1843200; MeanXleftshift=2560
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