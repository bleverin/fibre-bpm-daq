//background subtraction module

//tested with bkg_subtraction_tb.v
module bkg_subtraction #(parameter BKG_FRAME = 4)(
	
	//clock and reset
	input wire clk,
	input wire rst, // connect to rst_run
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence  // 163 word = 3 header + 160 data
	input  wire [31:0] data_in_data,           //  st.data
	output wire        data_in_ready,          //         .ready
	input  wire        data_in_valid,          //         .valid
	input  wire [1:0]  data_in_empty,          //         .empty
	input  wire        data_in_endofpacket,    //         .endofpacket
	input  wire        data_in_startofpacket,  //         .startofpacket
	
	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence //160 word only with data
	output  wire [31:0] data_out_data,           //  st.data
	input   wire        data_out_ready,          //         .ready
	output  wire        data_out_valid,          //         .valid
	output  wire [1:0]  data_out_empty,          //         .empty
	output  wire        data_out_endofpacket,    //         .endofpacket
	output  wire        data_out_startofpacket  //         .startofpacket	
	
	//output rst_frame // I have to think about this rst_frame when is a good timing! or do I need it?  26.June. 2024
);
	
	wire bkg_sub_on;
	wire rst_frame = data_in_startofpacket; 
	
	/************************* Frame Counter***********************************/
	/*
	This is a frame counter; 
	frameID +1 at the rising edge of data_in_startofpacket
	if frame increase at 10kHz, the 27-bit frameID can count 3.72 hour frame
	*/
	reg [26:0] frameID;
	reg data_in_startofpacket_last;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
		begin
			data_in_startofpacket_last <= 1'b0;
			frameID<= 27'b0;
		end
		else 
		begin
			data_in_startofpacket_last <= data_in_startofpacket;
			if (~data_in_startofpacket_last && data_in_startofpacket)
				frameID<= frameID + 1'b1; 
		end
	end
	
	
	// *********************** ST interface ***********************

	reg	[4:0]	state;		//State of the state machine
	localparam STATE_IDLE	= 5'd0;	//waiting for SOP
	localparam STATE_WORD0	= 5'd1;	//sending first word : 			
	localparam STATE_WORD1	= 5'd2;	//sending second word: 				
	localparam STATE_WORD2	= 5'd3;	//sending third word :				
	localparam STATE_DATA_PRO	= 5'd4;	//blocking data get bkg_signal; and do the subtraction
	localparam STATE_DATA_NEXT  = 5'd7;  //sending data
	localparam STATE_LOC	= 5'd5;	//calculatebb
	
	
	//Helper stuff
	reg	[7:0]	tx_ctr;	//counter of sent data words range: 0~255
	localparam WORDS_TO_SEND = 163;

	//the number of clocks for STATE_DATA_PRO
	reg [5:0] delay_ctr;
	localparam DELAY_CLOCKS = 6'd2; 
	
	/************** bkg RAM ****************************/
	/*
	for prepare the bkg signal by two RAM;
	one for data_in_data[31:16]; the other for data_in_data[15:0]
	the signal after bkg subtraction is 16 bit signed; the LSM bit is dropped out; (it's not important with current noise level)
	*/

	wire[15:0] bkgH;
	wire[15:0] bkgL;

	wire[31:0] bkg_input_data;
	wire		  bkg_input_valid;
	assign	  bkg_input_valid = (state == STATE_DATA_NEXT && data_out_ready);
	//assign	  bkg_input_valid = 1'b1;
	
	//signal after subtract background
	//got the background signal at the third clock in STATE_DATA_PRO
	//and subtract it to 16 bit by giving up the LSM, i.e. divide 2. 
	reg [16:0] signal0_17bit;
	reg [16:0] signal1_17bit;
	wire[15:0] signal0;
	wire[15:0] signal1;
	
	assign signal0 = bkg_sub_on?signal0_17bit[16:1]:signal0_17bit[15:0];
	assign signal1 = bkg_sub_on?signal1_17bit[16:1]:signal1_17bit[15:0];
	
	bkg_ram #(.TOTAL_FRAME(BKG_FRAME)) bkg_ram0(
		.clk_clk(clk),
		.rst_reset(rst),
		.frameID(frameID[26:0]),
		.address(tx_ctr), 
		.data_in_data(bkg_input_data),
		.data_in_valid(bkg_input_valid),
		.bkg_signal({bkgH,bkgL}),
		.bkg_sub_status(bkg_sub_on)
	); 
	
	assign bkg_input_data = (state==STATE_DATA_NEXT)?data_in_data:15'b0;
	
	wire data_out_ready_for3header = 1'b1; 
		//The state machine
	always @(posedge clk or posedge rst)
	begin 
		if (rst)
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
				if (data_in_valid && data_out_ready_for3header)
					begin
					state <= STATE_WORD1;
					tx_ctr <= tx_ctr+ 1'b1;
					end
				end
				STATE_WORD1:
				begin
				if (data_in_valid && data_out_ready_for3header)
					begin
					state <= STATE_WORD2;
					tx_ctr <= tx_ctr +1'b1;
					end
				end
				STATE_WORD2:
				begin
				if (data_in_valid && data_out_ready_for3header)
					begin
					state <= STATE_DATA_PRO;
					tx_ctr <= tx_ctr +1'b1;
					delay_ctr <= DELAY_CLOCKS -1'b1;
					end
				end
				STATE_DATA_PRO:
				begin
					if (data_in_valid)
					begin
						delay_ctr <= delay_ctr -1'b1;
						if (delay_ctr == 0)
						begin
							state <= STATE_DATA_NEXT;
							delay_ctr <= DELAY_CLOCKS - 1'b1;
							signal0_17bit <= {1'b0, data_in_data[31:16]}-{1'b0,bkgH};
							signal1_17bit <= {1'b0, data_in_data[15:0]}-{1'b0,bkgL};
						end
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

		
	//output 163 words
	//assign data_in_ready = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state == STATE_DATA_NEXT)&&data_out_ready; 
	//assign data_out_valid = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2 || state == STATE_DATA_NEXT) ? 1'b1 : 1'b0; 
	//the output data is be reversed....so during transfer without signal it's FFFFF, the software HIT-DAQ will reverse it again
	//assign data_out_data = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2)? data_in_data:
	//								(state == STATE_DATA_NEXT)? {signal0,signal1}: 0;
	//assign data_out_startofpacket = data_in_startofpacket;	
	//assign data_out_endofpacket = (state == STATE_DATA_NEXT & tx_ctr == WORDS_TO_SEND-1) ? 1'b1 : 1'b0;	
	//assign data_out_empty = 0;
	
	//output 160 words
	assign data_in_ready = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2) || (state == STATE_DATA_NEXT && data_out_ready); 
	assign data_out_valid = (state == STATE_DATA_NEXT) ? 1'b1 : 1'b0; 
	assign data_out_data = (state == STATE_DATA_NEXT)? {signal0,signal1}: 0;
	assign data_out_startofpacket = (state == STATE_DATA_NEXT && tx_ctr == 8'd3)? 1'b1: 1'b0;
	assign data_out_endofpacket = (state == STATE_DATA_NEXT & tx_ctr == WORDS_TO_SEND-1) ? 1'b1 : 1'b0;
   assign data_out_empty = 0;	




endmodule
