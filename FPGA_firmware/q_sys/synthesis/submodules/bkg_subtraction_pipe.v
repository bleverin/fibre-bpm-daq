//background subtraction module

//tested with algo_top_cl_cali_tb.v with bkg_subtraction_pipe
//tested with bkg_subtraction_pipe_tb

//okay... it is not really pipe.... has to read a ram after use the previous output of this ram 

module bkg_subtraction_pipe #(parameter BKG_FRAME = 4)(
	
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
	output  wire        data_out_startofpacket,  //         .startofpacket	
	
	output wire				bkg_sub_on,
	
	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence //3 headers 
	output  wire [31:0] to_udp_data,           //  st.data
	input   wire        to_udp_ready,          //         .ready
	output  wire        to_udp_valid,          //         .valid
	output  wire [1:0]  to_udp_empty,          //         .empty
	output  wire        to_udp_endofpacket,    //         .endofpacket
	output  wire        to_udp_startofpacket  //         .startofpacket	
	
	//output rst_frame // I have to think about this rst_frame when is a good timing! or do I need it?  26.June. 2024
);
	localparam SHIFT_BIT = $clog2(BKG_FRAME); 
	
	wire rst_frame = data_in_startofpacket; 
	
	wire data_out_ready_for3header = to_udp_ready;
	
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
	
	//**********************bkg_subtraction or not *****************
	
  reg[1:0] state_bkg;
  localparam STATE_BKG_IDLE = 0;
  localparam STATE_RAM_RST = 1;
  localparam STATE_BKG_ADD = 3;
  localparam STATE_BKG_OUT = 2;
  
  assign bkg_sub_on = (state_bkg == STATE_BKG_OUT)? 1'b1:1'b0;
  
  always @(posedge clk or posedge rst)
  begin
   if (rst)
		state_bkg <= STATE_BKG_IDLE;
	else if (frameID <=27'd1)
		state_bkg <= STATE_RAM_RST;
	else if (frameID >BKG_FRAME+1)
		state_bkg <= STATE_BKG_OUT;
	else 
		state_bkg <= STATE_BKG_ADD;
	end
	
	
	
	/************** bkg RAM ****************************/
	/*
	for prepare the bkg signal by two RAM;
	one for data_in_data[31:16]; the other for data_in_data[15:0]
	the signal after bkg subtraction is 16 bit signed; the LSM bit is dropped out; (it's not important with current noise level)
	*/
	
	reg[8:0] rdaddress; //for read ram
	reg[8:0] wraddress;
	wire		wren;
	
	//data_in_data + ram0_q
	reg[31:0] ram0_data;
	reg[31:0] ram1_data;
	
	wire[31:0] ram0_q;
	wire[31:0] ram1_q;
	
	
	
	ram4bkg ram4bkg0 (
    .data(ram0_data), //32 bits
    .rdaddress(rdaddress),
    .clock(clk),
    .wraddress(wraddress),
    .wren(wren),
    .q(ram0_q) //32 bits
  );
  
  ram4bkg ram4bkg1 (
    .data(ram1_data), //32 bits
    .rdaddress(rdaddress),
    .clock(clk),
    .wraddress(wraddress),
    .wren(wren),
    .q(ram1_q) //32 bits
  );
	
	wire[15:0] bkg0;
	wire[15:0] bkg1;
	
	assign bkg0 = bkg_sub_on?ram0_q[SHIFT_BIT+15:SHIFT_BIT]:16'b0;
	assign bkg1 = bkg_sub_on?ram1_q[SHIFT_BIT+15:SHIFT_BIT]:16'b0;
	

	
	//data_in_data - bkg0
	reg[16:0] data0_sub;
	reg[16:0] data1_sub;
	
	//data_in_data
	wire[15:0] data0_in_data;
	wire[15:0] data1_in_data;
	
	//reverse the polarity of ADC signal for calculation => no for simulation
	assign data0_in_data = ~data_in_data[31:16];
	assign data1_in_data = ~data_in_data[15:0];
	
	
	// *********************** ST interface ***********************

	reg	[3:0]	state;		//State of the state machine
	localparam STATE_IDLE	= 4'd0;	//waiting for SOP
	localparam STATE_WORD0	= 4'd1;	//sending first word : 			
	localparam STATE_WORD1	= 4'd2;	//sending second word: 				
	localparam STATE_WORD2	= 4'd3;	//sending third word :
	localparam STATE_RDRAM0 = 4'd4; //wait to read the first channel of ram
	localparam STATE_INPUT0 = 4'd5; //data_in_ready do sub and sum
	localparam STATE_RDRAM1 = 4'd6; //data_in_data is ready to output, data_out_startofpacket is high; read next ram
	localparam STATE_INPUT = 4'd7; //data_in_ready do sub and sum for next
	localparam STATE_RDRAM = 4'd8;
	localparam STATE_OUTPUT_LAST = 4'd9; //output last, data_out_endofpacket is high
	localparam STATE_LOC	= 4'd10;	//

	
	wire state_bkg_valid;
	wire state_data_valid;
	// Check if state_bkg is either STATE_RAM_RST or STATE_BKG_ADD for write
	assign state_bkg_valid = (state_bkg == STATE_RAM_RST) || (state_bkg == STATE_BKG_ADD);
	// Check if state is STATE_DATA and both data_in_valid and data_out_ready are true
	assign state_data_valid = (state == STATE_RDRAM1 || state == STATE_RDRAM || state == STATE_OUTPUT_LAST);

	// Final wren assignment combining the conditions
	assign wren = (state_bkg_valid && state_data_valid)? 1'b1 : 1'b0;

	
	
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
					rdaddress <= 0;
					wraddress <= 0; 
					if (data_in_startofpacket)
					begin
						state <= STATE_WORD0;
					end
				end
				STATE_WORD0:
				begin
					if (data_in_valid && data_out_ready_for3header)
					begin
						state <= STATE_WORD1;
					end
				end
				STATE_WORD1:
				begin
					if (data_in_valid && data_out_ready_for3header)
					begin
						state <= STATE_WORD2;
					end
				end
				STATE_WORD2:
				begin
					if (data_in_valid && data_out_ready_for3header)
					begin
						state <= STATE_RDRAM0;
						rdaddress <= 0;
					end
				end
				STATE_RDRAM0:
				begin
					state <= STATE_INPUT0;
				end
				STATE_INPUT0:
				begin
					if (data_in_valid)
					begin
						state <= STATE_RDRAM1;
						rdaddress <= rdaddress + 1'b1;
						data0_sub <= data0_in_data - bkg0;
						data1_sub <= data1_in_data - bkg1;
						if (state_bkg == STATE_BKG_ADD)
						begin
							ram0_data <= data0_in_data + ram0_q;
							ram1_data <= data1_in_data + ram1_q;
						end else
						begin
							ram0_data <= 0;
							ram1_data <= 0;
						end
					end
				end
				STATE_RDRAM1:
				begin
				if (data_out_ready)
					state <= STATE_INPUT;
				end
				STATE_INPUT:
				begin
					if (data_in_valid)
					begin
						if (data_in_endofpacket)
							state <= STATE_OUTPUT_LAST;
						else
							state <= STATE_RDRAM;
						rdaddress <= rdaddress + 1'b1;
						wraddress <= wraddress + 1'b1;
						data0_sub <= data0_in_data - bkg0;
						data1_sub <= data1_in_data - bkg1;
						if (state_bkg == STATE_BKG_ADD)
						begin
							ram0_data <= data0_in_data + ram0_q;
							ram1_data <= data1_in_data + ram1_q;
						end else
						begin
							ram0_data <= 0;
							ram1_data <= 0;
						end
					end
				end
				STATE_RDRAM:
				begin
					if (data_out_ready)
						state <= STATE_INPUT;
				end
				STATE_OUTPUT_LAST:
				begin
					if (data_out_ready)
						state <= STATE_LOC;
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

		

	//output 160 words
	assign data_in_ready = ((state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2) && data_out_ready_for3header) || (state == STATE_INPUT) ||(state == STATE_INPUT0); 
	assign data_out_valid = (state == STATE_RDRAM1 || state == STATE_RDRAM || state == STATE_OUTPUT_LAST) ? 1'b1 : 1'b0; 
	assign data_out_data = (state == STATE_RDRAM1 || state == STATE_RDRAM || state == STATE_OUTPUT_LAST)? (bkg_sub_on? {data0_sub[16:1],data1_sub[16:1]}: {data0_sub[15:0],data1_sub[15:0]}):0;
	assign data_out_startofpacket = (state == STATE_RDRAM1)? 1'b1: 1'b0;
	assign data_out_endofpacket = (state == STATE_OUTPUT_LAST) ? 1'b1 : 1'b0;
   assign data_out_empty = 0;	

	//output the 3 header to upd
	assign to_udp_data = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2)? data_in_data:0;
	assign to_udp_valid = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2)? data_in_valid: 1'b0;
	assign to_udp_empty = (state == STATE_WORD0 || state == STATE_WORD1 || state == STATE_WORD2)? data_in_empty: 2'b0;
	assign to_udp_startofpacket = data_in_startofpacket;
	assign to_udp_endofpacket = (state == STATE_WORD2)?data_in_valid: 1'b0;

endmodule
