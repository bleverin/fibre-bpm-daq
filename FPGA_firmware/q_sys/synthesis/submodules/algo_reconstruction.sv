/*
This is for get data from sensor(avalon_streaming source)
And at the same time, 
frame counter counts the frameID
bkg_sub do the bkg calibration and sub bkg depends on the frameID
and cluster_locate start to locate the position of cluster when the bkg_sub_on is 1
at the mean time 
the data after bkg_sub is stored in ram4sig, as well as the first three words(I put it at address 500 to 502)



*/


`timescale 100 ps / 100 ps
module algo_reconstruction (
			//Clock/reset
			input  wire        	clk_clk,                    //                     clk.clk
			input  wire        	rst_reset,                  //                     connect to int_reset from sensor_interface, to reset frameID to 0;
			//avalon ST sink
			input  logic unsigned[31:0] data_in_data,           //  data_in.data
			output wire        data_in_ready,          //         .ready
			input  wire        data_in_valid,          //         .valid
			input  wire [1:0]  data_in_empty,          //         .empty
			input  wire        data_in_endofpacket,    //         .endofpacket
			input  wire        data_in_startofpacket,  //         .startofpacket
			//avalon ST source
			output wire [31:0] data_out_data,          // data_out.data
			output wire [1:0]  data_out_empty,         //         .empty
			output wire        data_out_endofpacket,   //         .endofpacket
			output wire        data_out_startofpacket, //         .startofpacket
			input  wire        data_out_ready,         //         .ready  the UDP is ready
			output wire        data_out_valid,          //         .valid

			output wire[26:0]	 frameID, // for assign signal in tb simulation
			output wire bkg_sub_on,
			output wire rst_frame,
				 
			//data for sig after bkg subtraction
			input wire			   sig_rdclk,						//the read port for sig_ram
			input wire[8:0]		sig_rdaddress,             //0~319 for data. 500~502 for the 3 words head
			output wire[31:0]		sig_out,
			output reg 			sig_ram_last,

			//the output of cluster_locate
			output wire[8:0]		sig_ch_left,
			output wire[8:0]		sig_ch_right,
			output wire				has_cluster,
			output wire				no_cluster
		
			
	);


		//set a frameID counter
		//frameID + 1 at the rising edge of data_in_startofpacket
		//wire[26:0] frameID;
		frame_counter framectr(
			.clk_clk(clk_clk),
			.rst_reset(rst_reset),
			.sig(data_in_startofpacket),
			.frame_Num(frameID)
		);
		

	
	// *********************** ST interface ***********************

	reg	[4:0]	state;		//State of the state machine
	localparam STATE_IDLE	= 5'd0;	//waiting for SOP
	localparam STATE_WORD0	= 5'd1;	//sending first word : 			
	localparam STATE_WORD1	= 5'd2;	//sending second word: 				
	localparam STATE_WORD2	= 5'd3;	//sending third word :				
	localparam STATE_DATA_PRO	= 5'd4;	//blocking data do calculation
	localparam STATE_DATA_NEXT  = 5'd7;  //sending data
	localparam STATE_LOC	= 5'd5;	//calculatebb
	
	
		//Helper stuff
	reg	[15:0]	tx_ctr;	//counter of sent data words
	localparam WORDS_TO_SEND = 163;

	//the number of clocks for STATE_DATA_PRO
	reg [5:0] delay_ctr;
	localparam DELAY_CLOCKS = 3; 
	
	// for sum
	reg[31:0] sum_all;
	
	//the bkg-ram
	wire[15:0] bkg_signal0;
	wire[15:0] bkg_signal1;
	wire[31:0] bkg_input_data;
	
	//signal after subtract background
	//got the background signal at the third clock in STATE_DATA_PRO
	//and subtract it to 16 bit by giving up the LSM, i.e. divide 2. 
	reg [16:0] signal0_17bit;
	reg [16:0] signal1_17bit;
	wire[15:0] signal0;
	wire[15:0] signal1;
	
	assign signal0 = bkg_sub_on?signal0_17bit[16:1]:signal0_17bit[15:0];
	assign signal1 = bkg_sub_on?signal1_17bit[16:1]:signal1_17bit[15:0];
	
	bkg_ram bkg_but0(
		.clk_clk(clk_clk),
		.rst_reset(rst_reset),
		.frameID(frameID[26:0]),
		.address(tx_ctr[8:0]), 
		.data_in_data(bkg_input_data[31:16]),
		.bkg_signal(bkg_signal0),
		.bkg_sub_status(bkg_sub_on)
	); 
	
	bkg_ram bkg_but1(
		.clk_clk(clk_clk),
		.rst_reset(rst_reset),
		.frameID(frameID[26:0]),
		.address(tx_ctr[8:0]), 
		.data_in_data(bkg_input_data[15:0]),
		.bkg_signal(bkg_signal1)
	); 
	
	assign bkg_input_data = (state==STATE_DATA_NEXT)?~data_in_data:15'b0;
	
	
		//The state machine
	always @(posedge clk_clk or posedge rst_reset)
	begin 
		if (rst_reset)
		begin
			state <= STATE_IDLE;
		end
		else
			case(state)
				STATE_IDLE:
				begin
					if (data_in_startofpacket)
					begin
						state <= STATE_WORD0;
						tx_ctr <= 0;
					end
				end
				STATE_WORD0:
				begin
				if (data_out_ready)
					begin
					state <= STATE_WORD1;
					tx_ctr <= tx_ctr+ 1'b1;
					end
				end
				STATE_WORD1:
				begin
				if (data_out_ready)
					begin
					state <= STATE_WORD2;
					tx_ctr <= tx_ctr +1'b1;
					end
				end
				STATE_WORD2:
				begin
				if (data_out_ready)
					begin
					state <= STATE_DATA_PRO;
					tx_ctr <= tx_ctr +1'b1;
					delay_ctr <= DELAY_CLOCKS -1;
					end
				end
				STATE_DATA_PRO:
				begin
					delay_ctr <= delay_ctr -1;
					if (delay_ctr == 0)
					begin
						state <= STATE_DATA_NEXT;
						delay_ctr <= DELAY_CLOCKS - 1;
						signal0_17bit <= {1'b0,~data_in_data[31:16]}-{1'b0,bkg_signal0};
					   signal1_17bit <= {1'b0,~data_in_data[15:0]}-{1'b0,bkg_signal1};
					end
				end
				STATE_DATA_NEXT:
				begin
					if (data_out_ready)
					begin
						tx_ctr <= tx_ctr+1'b1;
						if (tx_ctr == WORDS_TO_SEND -1)	//last word, size matches
							state <= STATE_LOC;
						else
							state <= STATE_DATA_PRO;	
					end
				end
				STATE_LOC:
				begin
					state <= STATE_IDLE;
				end
				default:
				begin
					state <= STATE_IDLE;
				end
			endcase
	end

		
		
	assign data_in_ready = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state == STATE_DATA_NEXT)&&data_out_ready; 
	assign data_out_valid = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state == STATE_DATA_NEXT) ? 1 : 0; 
	//assign data_out_data = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state == STATE_DATA_NEXT)? data_in_data: 0;
	assign data_out_data = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2)? data_in_data:
									(state == STATE_DATA_NEXT)? {~signal0,~signal1}: 0;
	assign data_out_startofpacket = data_in_startofpacket;	
	assign data_out_endofpacket = (state == STATE_DATA_NEXT & tx_ctr == WORDS_TO_SEND-1) ? 1 : 0;	
	assign data_out_empty = 0;
	
	//the signal indicate the signal after bkg sub is ready or not
	wire sub_bkg_signal_ready;
	assign sub_bkg_signal_ready = (delay_ctr == 0)? 1 :0;
	//the rst signal for every frame
	//wire rst_frame;
	assign rst_frame = data_in_startofpacket || rst_reset;
	
	//the cluster_locating part
	//it is built by the fact that regardless data_out_ready signal, the STATE_DATA_PRO will go to STATE_DATA_NEXT
	//so the signal after bkg sub will continue at least two clocks
	reg[8:0] cl_address;
	wire[15:0] cl_data_in_data;
	wire cl_data_in_valid;
//	reg[8:0] ch_left;
//	reg[8:0] ch_right;
//	wire[8:0] sig_ch_left;
//	wire[8:0] sig_ch_right;
//	wire has_cluster;
//	wire no_cluster;
	
	cluster_locate cl_but(
		.clk_clk(clk_clk),
		.rst_reset(rst_frame),
		.address(cl_address), 
		.data_in_data(cl_data_in_data),
		.data_in_valid(cl_data_in_valid),
		.sig_ch_left(sig_ch_left),
		.sig_ch_right(sig_ch_right),
		.has_cluster(has_cluster),
		.no_cluster(no_cluster)
	); 

		
	reg[2:0] state_clu;
	localparam STATE_CLU_IDLE = 0;
	localparam STATE_CLU_FIRST = 1;
	localparam STATE_CLU_SECOND = 3;
	
	assign cl_data_in_data = (state_clu == STATE_CLU_FIRST)? signal0:
										(state_clu == STATE_CLU_SECOND)? signal1: 0;
	assign cl_data_in_valid = (bkg_sub_on & (state_clu == STATE_CLU_FIRST || state_clu == STATE_CLU_SECOND))? 1'b1: 1'b0;
	
	always @ (posedge clk_clk or posedge rst_frame)
	begin
		if (rst_frame)
		begin
			state_clu <= STATE_CLU_IDLE;
			cl_address <= 9'b0;
		end
		else case(state_clu)
		STATE_CLU_IDLE:
		begin
			if (sub_bkg_signal_ready)
				state_clu <= STATE_CLU_FIRST;
		end
		STATE_CLU_FIRST:
		begin
			state_clu <= STATE_CLU_SECOND;
			cl_address <= cl_address + 1'b1;
		end
		STATE_CLU_SECOND:
		begin
			state_clu <= STATE_CLU_IDLE;
			cl_address <= cl_address + 1'b1;
		end
		default:
			state_clu <= STATE_CLU_IDLE;
		endcase
	end
	
	
	//when bkg_sub is not on, store the original data
	//store the signal after bkg_sub in ram
	//the first there words are at address 500~502
	wire sig_ram_wren;
	wire[31:0] sig_ram_data;
	wire[8:0] sig_wraddress;
	
	
	ram4sig sig_ram (
	.data(sig_ram_data),
	.rdaddress(sig_rdaddress),
	.rdclock(sig_rdclk),
	.wraddress(sig_wraddress),
	.wrclock(clk_clk),
	.wren(sig_ram_wren),
	.q(sig_out)
	);
	
	assign sig_ram_wren = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state_clu == STATE_CLU_FIRST || state_clu == STATE_CLU_SECOND)? 1: 0;
	assign sig_wraddress = (state == STATE_WORD0)? 9'd500:
								  (state == STATE_WORD1)? 9'd501:
								  (state == STATE_WORD2)? 9'd502: cl_address;
	assign sig_ram_data = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2)? data_in_data: {16'b0,cl_data_in_data};
	assign sig_ram_last = (state == STATE_LOC)? 1'b1: 1'b0;
	
			
endmodule
