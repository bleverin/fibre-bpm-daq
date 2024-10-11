//module algo_top_cl_cali
//combine bkg_subtraction, cluster_locate, and calibration

//tested with algo_top_cl_cali_tb
module algo_top_cl_cali(
	
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
	
//	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence // ?? word only with data
//	output  wire [15:0] data_out_data,           //  st.data
//	//input   wire        data_out_ready,          //         .ready
//	output  wire        data_out_valid,          //         .valid
//	output  wire [1:0]  data_out_empty,          //         .empty
//	output  wire        data_out_endofpacket,    //         .endofpacket
//	output  wire        data_out_startofpacket,  //         .startofpacket	
//	
	//for cluster => will be in register map
	input wire [15:0] CL_THRESHOLD,
	input wire [15:0] CL_SIZE,
	
	//the interface with cali_ram (storing cali factor) Avalon-MM: read califac from this ram
	output wire [8:0] 	address,
	output wire 			clken,
	input  wire [15:0] 	cali_fac
	
);
	
	
	wire [31:0] wire_data0;
	wire 			wire_ready0;
	wire			wire_valid0;
	wire	[1:0] wire_empty0;
	wire			wire_endofpacket0;
	wire			wire_startofpacket0;
	
	bkg_subtraction_pipe #(.BKG_FRAME(4)) bkg_subtraction0(
	
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
	
	
	wire [15:0] wire_data1;
	wire 			wire_ready1;
	wire			wire_valid1;
	wire	      wire_empty1;
	wire			wire_endofpacket1;
	wire			wire_startofpacket1;
		
	stl2sts stl2sts0(
	
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(wire_data0),
		.data_in_ready		(wire_ready0),
		.data_in_valid		(wire_valid0),
		.data_in_empty		(wire_empty0),
		.data_in_startofpacket		(wire_startofpacket0),
		.data_in_endofpacket			(wire_endofpacket0),
		
		.data_out_data		(wire_data1),
		.data_out_empty	(wire_empty1),
		.data_out_endofpacket		(wire_endofpacket1),
		.data_out_startofpacket		(wire_startofpacket1),
		.data_out_ready	(wire_ready1),
		.data_out_valid	(wire_valid1)
		
	);
	
		//from st_splitter0 to cluster_locate
		wire [15:0] wire_data2;
		wire 			wire_ready2;
		wire			wire_valid2;
		wire	      wire_empty2;
		wire			wire_endofpacket2;
		wire			wire_startofpacket2;
		
		//from st_splitter0 to calibration
		wire [15:0] wire_data3;
		wire 			wire_ready3;
		wire			wire_valid3;
		wire	      wire_empty3;
		wire			wire_endofpacket3;
		wire			wire_startofpacket3;
	
	st_splitter16 st_splitter0 (
		.st_splitter16_clk_clk            (clk),            //   st_splitter16_clk.clk
		.st_splitter16_reset_reset        (rst),        // st_splitter16_reset.reset
		
		
		.st_splitter16_in_ready           (wire_ready1),           //    st_splitter16_in.ready
		.st_splitter16_in_valid           (wire_valid1),           //                    .valid
		.st_splitter16_in_startofpacket   (wire_startofpacket1),   //                    .startofpacket
		.st_splitter16_in_endofpacket     (wire_endofpacket1),     //                    .endofpacket
		.st_splitter16_in_empty           (wire_empty1),           //                    .empty
		.st_splitter16_in_data            (wire_data1),            //                    .data
		
		
		.st_splitter16_out0_ready         (wire_ready2),         //  st_splitter16_out0.ready
		.st_splitter16_out0_valid         (wire_valid2),         //                    .valid
		.st_splitter16_out0_startofpacket (wire_startofpacket2), //                    .startofpacket
		.st_splitter16_out0_endofpacket   (wire_endofpacket2),   //                    .endofpacket
		.st_splitter16_out0_empty         (wire_empty2),         //                    .empty
		.st_splitter16_out0_data          (wire_data2),          //                    .data
		
		
		.st_splitter16_out1_ready         (wire_ready3),         //  st_splitter16_out1.ready
		.st_splitter16_out1_valid         (wire_valid3),         //                    .valid
		.st_splitter16_out1_startofpacket (wire_startofpacket3), //                    .startofpacket
		.st_splitter16_out1_endofpacket   (wire_endofpacket3),   //                    .endofpacket
		.st_splitter16_out1_empty         (wire_empty3),         //                    .empty
		.st_splitter16_out1_data          (wire_data3)           //                    .data
	);


	wire[8:0] sig_ch_left;
	wire[8:0] sig_ch_right;
	wire has_cluster;
	wire no_cluster;
	
	cluster_locate cluster_locate0(
		
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(wire_data2),
		.data_in_ready		(wire_ready2),
		.data_in_valid		(wire_valid2),
		.data_in_empty		(wire_empty2),
		.data_in_startofpacket		(wire_startofpacket2),
		.data_in_endofpacket			(wire_endofpacket2),
		
		.THRESHOLD			(CL_THRESHOLD),
		.SIZE					(CL_SIZE),
		
		.sig_ch_left		(sig_ch_left),
		.sig_ch_right		(sig_ch_right),
		.has_cluster		(has_cluster),
		.no_cluster			(no_cluster)	
	
	); 
	
	
	wire[8:0]		data_caled_address;
	wire [31:0]		data_caled;

	
	
	calibration calibration0(
	
	.clk(clk),
	.rst(rst),
		
	.data_in_data		(wire_data3),
	.data_in_ready		(wire_ready3),
	.data_in_valid		(wire_valid3),
	.data_in_empty		(wire_empty3),
	.data_in_startofpacket		(wire_startofpacket3),
	.data_in_endofpacket			(wire_endofpacket3),
	
	.address		(address),
	.clken		(clken),
	.cali_fac	(cali_fac),
	
	.data_caled_address(data_caled_address),
	.data_caled(data_caled)
	);

	
	
endmodule
	
	
	
	
	
	
	
	
	