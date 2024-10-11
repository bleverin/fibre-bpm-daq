//the module for rms
/*
if there is cluster:
go through the data three times:
first time, calc Xmean;
second time calc Sigma;

if there is no cluster:
directly send it. 

*/

//

//tested with algo_top_cl_cali_rms_tb.v 

module rms(
	
	input  wire        	clk,                    //                     clk.clk
	input  wire        	rst,         			// the reset should connect to the int_rst from sensor

	//data for sig after bkg subtraction
	input wire 			  bkg_sub_on, 					//indicate that bkg_sub is on 
	input wire          sig_ram_last,				//the last channel is being wroten when sig_ram_last=1'b1
	
	output wire[8:0]		sig_rdaddress,             //0~319 for data. 500~502 for the 3 words head
	input wire [15:0]		sig,
	output wire 			sig_rd_eable, 					//eable read, get sig  next clock

	//the output of cluster_locate
	input wire[8:0]		sig_ch_left,	         //after sig_ram_last, if has_cluster, catch the sig_ch_left and right signal, and calc
	input wire[8:0]		sig_ch_right,
	input wire				has_cluster,
	input wire				no_cluster,					// this is not used

	//the result
	output wire 			overflow,

	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence //4 * 32 bits data  
	output  wire [31:0] to_udp_data,           //  st.data
	input   wire        to_udp_ready,          //         .ready
	output  wire        to_udp_valid,          //         .valid
	output  wire [1:0]  to_udp_empty,          //         .empty
	output  wire        to_udp_endofpacket,    //         .endofpacket
	output  wire        to_udp_startofpacket  //         .startofpacket	
	
	);
	
	
	
	
	/* reg results has 32*4 bits
	WORDS 163 [31:16]MeanXleftshift [15:0] Sigma0;
			164 [31:16]MaxY; [15:0] STATUS;
			165 for debug;
			166 for debug;
		for status register:
		STATUS_BKG_SUB_ON  0x0001
		STATUS_HAS_CLUSTER 0x0002
		STATUS_NO_CLUSTER  0x0004	
		*/

	
	reg[31:0] results[4];
	
	localparam WORDS_TO_SEND = 4;	 //results[4]
	localparam SHIFT_BITS = 2;


	reg[3:0] state;
	localparam STATE_IDLE = 0; //when sig_ram_last, move to STATE_JUDGE
	localparam STATE_JUDGE = 1; 
	/*reset registers; If has_cluster to STATE_CAL1 => WAIT_4_CLK => DIV1 => CAL2 => WAIT_6CLK => DIV2 => SQRT => LOCK => SEND=>,
	if not to =>SEND*/
	localparam STATE_SEND = 2; // give a start_transmission signal and start the other statemachine for sending
	localparam STATE_CAL1 = 4;
	localparam STATE_WAIT_4CLK = 5;
	localparam STATE_DIV1 = 6;
	localparam STATE_CAL2 = 7; 
	localparam STATE_WAIT_6CLK = 8;
	localparam STATE_DIV2 = 9;
	localparam STATE_SQRT = 10;
	localparam STATE_LOCK = 11; //lock the MaxY, Sigma0, and MeanXleftshift  
	

	
	// channel_ctr is address from sig_ram
	// arrayID depends on the channel_ctr one clock ago
	reg[8:0] channel_ctr;
	localparam CH_NUM = 320; //channel number, 5 array, 320 channel
	reg[8:0] ch_right;
	reg[8:0] ch_left;
	reg signed[3:0] arrayID;
	
	assign sig_rdaddress = channel_ctr;
	assign sig_rd_eable = (state == STATE_CAL1 || state == STATE_CAL2)? 1'b1: 1'b0;
	
	// registers for CAL1
	reg signed[13:0] X[2]; 
	reg signed[15:0] Y[3]; //only Y[0] for cal1 //Y[2], Y[1], Y[0] for cal2, pipe 
	reg signed[15:0] MaxY;
	reg signed[31:0] SumY;
	reg signed[31:0] XY;
	reg signed[34:0] SumXY;
	wire signed[36:0] SumXYleftshift;
	reg signed[13:0] MeanXleftshift;
	
	assign SumXYleftshift = SumXY << SHIFT_BITS;
	
	
	//the registers for CAL2
	reg signed[31:0] SumYm1; //SumY - 1
	reg signed[14:0] DiffxMeanX;
	reg signed[28:0] DiffxMeanX2;
	reg signed[43:0] DiffxMeanX2Yi;
	reg signed[43:0] SumDiffxMeanX2Yi;
	reg unsigned[25:0] Sigma2;
	reg unsigned[12:0] Sigma0;
	
	
	
	
	//the wait_ctr for different steps in each states
	reg unsigned[8:0] wait_ctr;
	
	wire div_clken;
	wire[29:0] denom;
	wire[39:0] numer;
	wire[31:0] quotient;
	assign div_clken = (state == STATE_DIV1 || state == STATE_DIV2)? 1'b1: 1'b0;
	assign denom = (state == STATE_DIV1)? SumY[29:0]: 
						(state == STATE_DIV2)? (SumYm1[29:0]): 30'b1;
	assign numer = (state == STATE_DIV1)? (SumXYleftshift[35:0]) :
						(state == STATE_DIV2)? SumDiffxMeanX2Yi[39:0]: 0;
	localparam DIV_LATENCY = 26;
	//division with 26 clocks latency
	div	div1 (
	.clken ( div_clken ),
	.clock ( clk),
	.denom ( denom ),
	.numer ( numer ),
	.quotient ( quotient )
	);
	
	wire sqrt_clken;
	wire[25:0] radical_sig;
	wire[12:0] q_sqrt;
	assign sqrt_clken = (state == STATE_SQRT)? 1'b1: 1'b0;
	assign radical_sig = (state == STATE_SQRT)? Sigma2: 26'b0;
	localparam SQRT_LATENCY = 13;
	//sqrt with 13 clocks latency
	sqrt	sqrt_inst (
	.clk ( clk),
	.ena ( sqrt_clken ),
	.radical ( radical_sig ),
	.q ( q_sqrt )
	);
	

	// 12 July 2024 I should change arrayID to wires
	//the sequential logic for arrayID
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
			arrayID <= 4'd0;
		else if (channel_ctr>=9'h0 && channel_ctr<9'h40)
			arrayID <= 4'd0;
		else if (channel_ctr<9'h80)
			arrayID <= 4'd1;
		else if (channel_ctr<9'hC0)
			arrayID <= 4'd2;
		else if (channel_ctr<9'h100)
			arrayID <= 4'd3;
		else if (channel_ctr<9'h140)
			arrayID <= 4'd4;
		else
			arrayID <= 4'd0;
	end
	
	
	always @ (posedge clk or posedge rst) 
	begin
		if (rst)
		begin
			state <= STATE_IDLE;
		end
		else case(state)
		STATE_IDLE:
		begin
			X[0] <= 0; //For cal1
			X[1] <= 0;
			Y[0] <= 0;
			MaxY <= 0;
			XY <= 0; 
			SumXY <= 0;
			SumY <= 0;
			SumDiffxMeanX2Yi <= 0;
			wait_ctr <= 0;
			MeanXleftshift <= 0;
			Y[1] <= 0; //For cal2
			Y[2] <= 0;
			SumYm1 <= 0;
			DiffxMeanX <= 0;
			DiffxMeanX2 <= 0;
			DiffxMeanX2Yi <= 0;
			SumDiffxMeanX2Yi <= 0; 
			Sigma2 <= 0;
			Sigma0 <= 0;
			results[0] <= 0; //Collect Results
			results[1] <= 0;
			results[2] <= 0;
			results[3] <= 0;
			ch_right <= 0;
			ch_left <= 0;
			if (sig_ram_last) begin
				state <= STATE_JUDGE;
			end
		end
		STATE_JUDGE:
		begin
			if (~sig_ram_last) begin
				if (bkg_sub_on && has_cluster)	
						state <= STATE_CAL1; 
				else
					state <= STATE_SEND;			
				results[1][0] <= bkg_sub_on;
				results[1][1] <= has_cluster;
				results[1][2] <= no_cluster;
				results[2][31:16] <= {7'b0,sig_ch_left};
				results[2][15:0] <= {7'b0,sig_ch_right};
				ch_right <= sig_ch_right;
				ch_left <= sig_ch_left;
				channel_ctr <= sig_ch_left;
			end
		end
		STATE_CAL1:
		begin
			wait_ctr <= wait_ctr + 1'b1;
			channel_ctr <= channel_ctr + 1'b1;
			X[1][12:0]<= channel_ctr << 2; //here, the position is quantized in 1 per 0.2mm
			if (wait_ctr >= 1) begin
				X[0] <= X[1] + arrayID;
				Y[0] <= sig;
			end
			if (wait_ctr>=2) begin
				XY <= X[0]*Y[0];
				SumY <= SumY + Y[0];
				if (MaxY<Y[0])
				MaxY <= Y[0];
			end
			if (wait_ctr>=3) begin
				SumXY <= SumXY + XY;
			end			
			if (channel_ctr ==ch_right) begin
				state <= STATE_WAIT_4CLK;
				channel_ctr <= ch_left;
				wait_ctr <= 0;
			end
		end
		STATE_WAIT_4CLK:
		begin
			wait_ctr <= wait_ctr + 1'b1;
			if (wait_ctr < 1) begin
				X[0] <= X[1] + arrayID;
				Y[0] <= sig;
			end
			if (wait_ctr < 2) begin
				XY <= X[0]*Y[0];
				SumY <= SumY + Y[0];
				if (MaxY<Y[0])
				MaxY <= Y[0];
			end
			if (wait_ctr < 3) begin
				SumXY <= SumXY + XY;
			end
			if (wait_ctr == 3) begin
				state <= STATE_DIV1;
				SumYm1 <= SumY - 1'b1;
				wait_ctr <= 0;
			end
		end
		STATE_DIV1:
		begin
			wait_ctr <= wait_ctr + 1'b1;
			if (wait_ctr == DIV_LATENCY)
			begin
				MeanXleftshift <= {1'b0,quotient[12:0]};
				wait_ctr <= 0;
				state <= STATE_CAL2;
			end
		end
		STATE_CAL2:
		begin
			channel_ctr <= channel_ctr + 1'b1;
			X[1][12:0] <= channel_ctr << 2; //here, the position is quantized in 1 per 0.2mm
			wait_ctr <= wait_ctr + 1'b1;	
			if (wait_ctr >= 1) begin
				X[0] <= (X[1] + arrayID) << SHIFT_BITS; // here the position is quantized in 1 per 0.05 mm when SHIFT_BITS = 2
				Y[2] <= sig;
			end
			if (wait_ctr >= 2) begin
				Y[1] <= Y[2];
				DiffxMeanX <= X[0] - MeanXleftshift;
			end
			if (wait_ctr >= 3) begin
				Y[0] <= Y[1];
				DiffxMeanX2 <= DiffxMeanX * DiffxMeanX;
			end
			if (wait_ctr >= 4) begin
				DiffxMeanX2Yi <= DiffxMeanX2*Y[0];
			end
			if (wait_ctr >= 5) begin
				SumDiffxMeanX2Yi <= SumDiffxMeanX2Yi + DiffxMeanX2Yi;
			end
			if (channel_ctr ==ch_right) begin
				state <= STATE_WAIT_6CLK;
				wait_ctr <= 0;
				channel_ctr <= ch_left;
			end
		end
		STATE_WAIT_6CLK:
		begin
			wait_ctr <= wait_ctr + 1'b1;
			if (wait_ctr < 1) begin
				X[0] <= (X[1] + arrayID) << SHIFT_BITS; // here the position is quantized in 1 per 0.05 mm when SHIFT_BITS = 2
				Y[2] <= sig;
			end
			if (wait_ctr < 2) begin
				Y[1] <= Y[2];
				DiffxMeanX <= X[0] - MeanXleftshift;
			end
			if (wait_ctr < 3) begin
				Y[0] <= Y[1];
				DiffxMeanX2 <= DiffxMeanX * DiffxMeanX;
			end
			if (wait_ctr < 4) begin
				DiffxMeanX2Yi <= DiffxMeanX2*Y[0];
			end
			if (wait_ctr < 5) begin
				SumDiffxMeanX2Yi <= SumDiffxMeanX2Yi + DiffxMeanX2Yi;
			end
			if (wait_ctr == 5) begin
				wait_ctr <= 0;
				state <= STATE_DIV2;
			end
		end
		STATE_DIV2:
		begin
			wait_ctr <= wait_ctr + 1'b1;
			if (wait_ctr == DIV_LATENCY)
			begin
				Sigma2 <= quotient[25:0];
				wait_ctr <= 0;
				state <= STATE_SQRT;
			end
		end
		STATE_SQRT:
		begin
			wait_ctr <= wait_ctr + 1'b1;
			if (wait_ctr == SQRT_LATENCY)
			begin
				state <= STATE_LOCK;
				wait_ctr <= 0;
				Sigma0 <= q_sqrt;
			end
		end
		STATE_LOCK:
		begin
			results[0][31:16] <= MeanXleftshift;
			results[0][15:0] <= Sigma0;
			results[1][31:16] <= MaxY;
			state <=  STATE_SEND;
		end
		STATE_SEND:
		begin
			if (to_udp_ready)
			begin
				wait_ctr <= wait_ctr + 1'b1;
				if (wait_ctr == WORDS_TO_SEND-1)
					state <= STATE_IDLE;
			end
		end
		default:
			state <= STATE_IDLE;
		endcase
	end
	
	assign to_udp_data = (state == STATE_SEND)? results[wait_ctr]:32'b0;
	assign to_udp_empty = 2'b0;
	assign to_udp_startofpacket = (state == STATE_SEND && wait_ctr == 9'b0)? 1'b1: 1'b0;
	assign to_udp_valid = (state == STATE_SEND)? 1'b1: 1'b0;
	assign to_udp_endofpacket = (state == STATE_SEND && wait_ctr == (WORDS_TO_SEND-1))? 1'b1: 1'b0;
	
	
	
	endmodule