//module calibration testbench
//data_caled calculate: address's square 
`timescale 1 ns / 1 ns
module calibration_tb();
	
	localparam CLK_PERIOD = 20; 

	reg clk;
	reg rst;
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence
	reg [15:0] data_in_data;
	wire 		  data_in_ready;
	wire		  data_in_valid;
	reg 		  data_in_empty;
	reg		  data_in_startofpacket;
	reg		  data_in_endofpacket;
	
	reg 	to_udp_ready;
	
	//the interface with cali_ram (storing cali factor) Avalon-MM: read califac from this ram
	wire [8:0] 		address;
	wire [15:0] 	cali_fac;
	wire 				clken;	
	
	reg [8:0]		data_caled_address;
	wire [15:0]		data_caled;
	wire 				data_caled_rd_enable;

	reg [15:0]		data_a;
	wire 				wren_a;
	reg [8:0]		wr_address;
	reg 				start_wr;
	
	
	
	reg [2:0] state;
	localparam STATE_IDLE = 3'd0;
	localparam STATE_WR = 3'd1;
	localparam STATE_LOC0 = 3'd2;
	localparam STATE_SEND = 3'd3;
	localparam STATE_LOC1 = 3'd4;
	localparam STATE_RD = 3'd5;
	localparam STATE_LOC2 = 3'd6;
	
	assign data_caled_rd_enable = (state == STATE_RD)? 1'b1: 1'b0;
	
	
	// 
	reg waitrequest;
	always @(posedge clk) begin
	if (clken)
		waitrequest<=1'b0;
	else 
		waitrequest <= 1'b1;
	end
	


	//the ram for store the cali_fac in testbench
	ram_sim cal_fac_simulation_ram (
	.clock ( clk ),
	.address_a (wr_address),
	.data_a (data_a),
	.wren_a (wren_a),
	.rden_a (1'b0),
	.q_a (),
	
	.address_b ( address ),
	.data_b ( ),
	.rden_b (clken),
	.wren_b (1'b0),
	.q_b ( cali_fac)
	);
	
	calibration calibration_dut(
	
	.clk(clk),
	.rst(rst),
		
	.data_in_data		(data_in_data),
	.data_in_ready		(data_in_ready),
	.data_in_valid		(data_in_valid),
	.data_in_empty		(data_in_empty),
	.data_in_startofpacket		(data_in_startofpacket),
	.data_in_endofpacket			(data_in_endofpacket),
	
	.address		(address),
	.clken		(clken),
	.cali_fac	(cali_fac),
	.waitrequest(waitrequest),
	
	.data_caled_address(data_caled_address),
	.data_caled(data_caled),
	.data_caled_rd_enable(data_caled_rd_enable),
	
	.to_udp_ready(to_udp_ready)

	);
	
	
	initial begin
	
	clk = 1'b1;
	rst = 1'b1;
	
	data_in_data = 0;
	data_in_empty = 2'b0;
	data_in_startofpacket = 1'b0;
	data_in_endofpacket = 1'b0;
	start_wr = 1'b0;
	to_udp_ready = 1'b0;
	
	state = STATE_IDLE;
	
	
	#(CLK_PERIOD*2 + 1);
	rst = 1'b0;
	start_wr = 1'b1;
	
	#(CLK_PERIOD*2);
	start_wr = 1'b0;
	
	#(CLK_PERIOD*400);
	
	
	//start packet
	#(CLK_PERIOD*2+1);
	data_in_startofpacket = 1'b1;
	#(CLK_PERIOD*2);
	to_udp_ready = 1'b1;
	
	#(CLK_PERIOD*10);
	to_udp_ready = 1'b0;
	#(CLK_PERIOD*10);
	to_udp_ready = 1'b1;
	#(CLK_PERIOD*309);
	//end packet
	data_in_endofpacket = 1'b1;
	
	
	#(CLK_PERIOD*500); $stop;
	
	end
	
	
	//clk
	always #(CLK_PERIOD/2) clk = ~ clk;
	
	assign data_in_valid = (state == STATE_SEND || data_in_startofpacket || data_in_endofpacket)? 1'b1 : 1'b0;
	assign wren_a = (state == STATE_WR)? 1'b1: 1'b0;
	always @(posedge clk) begin
		case(state)
		STATE_IDLE:
		begin
			wr_address <= 0;
			data_a <= 0;
			data_caled_address <= 0;
			if (start_wr)
			begin
				state <= STATE_WR;
			end
		end
		STATE_WR:
		begin
			wr_address <= wr_address + 1;
			data_a <= data_a + 1; 
			if (wr_address == 319)
			begin
				state <= STATE_LOC0;
			end
		end
		STATE_LOC0:
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
					state <= STATE_LOC1;
					data_in_data <= 0;
					data_in_endofpacket <= 1'b0;
				end else begin
					data_in_data <= data_in_data + 1;
				end
			end
		end
		STATE_LOC1:
		begin
			state <= STATE_RD;
		end
		STATE_RD:
		begin
			data_caled_address <= data_caled_address + 1;
			if (data_caled_address == 319)
				state <= STATE_LOC2;
		end
		STATE_LOC2:
			state <= STATE_IDLE;
		endcase
	end
	



	
	
	
	
endmodule
