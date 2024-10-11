
module st_splitter16 (
	st_splitter16_clk_clk,
	st_splitter16_reset_reset,
	st_splitter16_in_ready,
	st_splitter16_in_valid,
	st_splitter16_in_startofpacket,
	st_splitter16_in_endofpacket,
	st_splitter16_in_empty,
	st_splitter16_in_data,
	st_splitter16_out0_ready,
	st_splitter16_out0_valid,
	st_splitter16_out0_startofpacket,
	st_splitter16_out0_endofpacket,
	st_splitter16_out0_empty,
	st_splitter16_out0_data,
	st_splitter16_out1_ready,
	st_splitter16_out1_valid,
	st_splitter16_out1_startofpacket,
	st_splitter16_out1_endofpacket,
	st_splitter16_out1_empty,
	st_splitter16_out1_data);	

	input		st_splitter16_clk_clk;
	input		st_splitter16_reset_reset;
	output		st_splitter16_in_ready;
	input		st_splitter16_in_valid;
	input		st_splitter16_in_startofpacket;
	input		st_splitter16_in_endofpacket;
	input	[0:0]	st_splitter16_in_empty;
	input	[15:0]	st_splitter16_in_data;
	input		st_splitter16_out0_ready;
	output		st_splitter16_out0_valid;
	output		st_splitter16_out0_startofpacket;
	output		st_splitter16_out0_endofpacket;
	output	[0:0]	st_splitter16_out0_empty;
	output	[15:0]	st_splitter16_out0_data;
	input		st_splitter16_out1_ready;
	output		st_splitter16_out1_valid;
	output		st_splitter16_out1_startofpacket;
	output		st_splitter16_out1_endofpacket;
	output	[0:0]	st_splitter16_out1_empty;
	output	[15:0]	st_splitter16_out1_data;
endmodule
