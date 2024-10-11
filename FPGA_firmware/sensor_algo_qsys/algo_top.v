// module algo_top

//bkg + stl2sts tested by algo_top_tb.v
module algo_top(
	
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
	
	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence // ?? word only with data
	output  wire [15:0] data_out_data,           //  st.data
	input   wire        data_out_ready,          //         .ready
	output  wire        data_out_valid,          //         .valid
	output  wire [1:0]  data_out_empty,          //         .empty
	output  wire        data_out_endofpacket,    //         .endofpacket
	output  wire        data_out_startofpacket  //         .startofpacket	
	
);
	
	
	wire [31:0] wire_data0;
	wire 			wire_ready0;
	wire			wire_valid0;
	wire	[2:0] wire_empty0;
	wire			wire_endofpacket0;
	wire			wire_startofpacket0;
	
	bkg_subtraction #(.BKG_FRAME(4)) bkg_subtraction0(
	
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(data_in_data),
		.data_in_ready		(data_in_ready),
		.data_in_valid		(data_in_valid),
		.data_in_empty		(data_in_empty),
		.data_in_startofpacket		(data_in_startofpacket),
		.data_in_endofpacket			(data_in_endofpacket),
		
		.data_out_data		(wire_data0),
		.data_out_empty	(wire_empty0),
		.data_out_endofpacket		(wire_endofpacket0),
		.data_out_startofpacket		(wire_startofpacket0),
		.data_out_ready	(wire_ready0),
		.data_out_valid	(wire_valid0)
		
	);
	

		
	stl2sts stl2sts0(
	
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(wire_data0),
		.data_in_ready		(wire_ready0),
		.data_in_valid		(wire_valid0),
		.data_in_empty		(wire_empty0),
		.data_in_startofpacket		(wire_startofpacket0),
		.data_in_endofpacket			(wire_endofpacket0),
		
		.data_out_data		(data_out_data),
		.data_out_empty	(data_out_empty),
		.data_out_endofpacket		(data_out_endofpacket),
		.data_out_startofpacket		(data_out_startofpacket),
		.data_out_ready	(data_out_ready),
		.data_out_valid	(data_out_valid)
		
	);
	
	
	
endmodule
	
	
	
	
	
	
	
	
	