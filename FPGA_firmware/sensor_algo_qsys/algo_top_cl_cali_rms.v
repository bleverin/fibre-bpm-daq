//module algo_top_cl_cali_rms
//combine bkg_subtraction, cluster_locate, and calibration, and rms

//tested with algo_top_cl_cali_rms_tb.v
module algo_top_cl_cali_rms(
	
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
	

	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence // 3 + 160 + 4 = 167 words * 32bit 
	output  wire [31:0] to_udp_data,           //  st.data
	input   wire        to_udp_ready,          //         .ready
	output  wire        to_udp_valid,          //         .valid
	output  wire [1:0]  to_udp_empty,          //         .empty
	output  wire        to_udp_endofpacket,    //         .endofpacket
	output  wire        to_udp_startofpacket , //         .startofpacket	
	

	//Avalon MM slave
	input  wire [1:0]  	csr_address,                //            avalon_slave.address
	input  wire        	csr_read,                   //                        .read
	output wire [31:0] 	csr_readdata,               //                        .readdata
	input  wire        	csr_write,                  //                        .write
	input  wire [31:0] 	csr_writedata,              //                        .writedata
	input  wire [3:0]  	csr_byteenable,             //                        .byteenable

	//for cluster => will be in register map
	input wire [7:0] 		CL_THRESHOLD,
	input wire [7:0] 		CL_SIZE,
	input wire [7:0]		IN_ALGO_THRESHOLD,
	
	//the interface with cali_ram (storing cali factor) Avalon-MM: read califac from this ram; output is not registered
	output wire [8:0] 	address,
	output wire 			clken,
	input  wire [15:0] 	cali_fac,
	input  wire				waitrequest
	
);
	//avalon source for header 
	wire [31:0] header_data;
	wire			header_ready;
	wire [1:0]	header_empty;
	wire			header_endofpacket;
	wire			header_startofpacket;
	wire			header_valid;
	
	//avalon source for channel data
	wire [31:0] channel_data;
	wire			channel_ready;
	wire [1:0]	channel_empty;
	wire			channel_endofpacket;
	wire			channel_startofpacket;
	wire			channel_valid;
	
	//avalon source for result
	wire [31:0] recon_data;
	wire			recon_ready;
	wire [1:0]	recon_empty;
	wire			recon_endofpacket;
	wire			recon_startofpacket;
	wire			recon_valid;
	
	/******************** merge three data source together *****************************************/
	reg [1:0] avalon_sender_state;
	localparam STATE_IDLE = 2'd0;
	localparam STATE_HEADER = 2'd1;
	localparam STATE_CHANNEL = 2'd3;
	localparam STATE_RECON = 2'd2;
	
	
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
			avalon_sender_state <= STATE_IDLE;
		end
		else case(avalon_sender_state)
		STATE_IDLE:
		begin
			if (header_startofpacket)
				avalon_sender_state <= STATE_HEADER;
		end
		STATE_HEADER:
		begin
			if (channel_startofpacket)
				avalon_sender_state <= STATE_CHANNEL;
		end
		STATE_CHANNEL:
		begin
			if (recon_startofpacket)
				avalon_sender_state <= STATE_RECON;
		end
		STATE_RECON:
		begin
			if (recon_endofpacket && to_udp_ready)
				avalon_sender_state <= STATE_IDLE;
		end
		default:
			avalon_sender_state <= STATE_IDLE;
		endcase
	end
	
	
	assign to_udp_data = (avalon_sender_state == STATE_HEADER)? header_data: (avalon_sender_state == STATE_CHANNEL)? channel_data: (avalon_sender_state == STATE_RECON)? recon_data: 32'd0;
	assign header_ready = (avalon_sender_state == STATE_HEADER)? to_udp_ready: 1'b0;
	assign channel_ready = (avalon_sender_state == STATE_CHANNEL)? to_udp_ready: 1'b0;
	assign recon_ready = (avalon_sender_state == STATE_RECON)? to_udp_ready: 1'b0;
	
	assign to_udp_empty = 2'b0;
	assign to_udp_startofpacket = (avalon_sender_state == STATE_HEADER)? header_startofpacket: 1'b0;
	assign to_udp_endofpacket = (avalon_sender_state == STATE_RECON)? recon_endofpacket: 1'b0;
	assign to_udp_valid = (avalon_sender_state == STATE_HEADER)? header_valid: (avalon_sender_state == STATE_CHANNEL)? channel_valid: (avalon_sender_state == STATE_RECON)? recon_valid: 1'b0;
	
		
	
	
	
	
	
	
	
	
	
	wire [31:0] wire_data0;
	wire 			wire_ready0;
	wire			wire_valid0;
	wire	[1:0] wire_empty0;
	wire			wire_endofpacket0;
	wire			wire_startofpacket0;
	wire			bkg_sub_on;
	
	bkg_subtraction_pipe #(.BKG_FRAME(8192)) bkg_subtraction0( //4 for simulation, 8192 for real firmware setup
	
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
		.data_out_valid	(wire_valid0),
		.bkg_sub_on			(bkg_sub_on),
		
		
		//3 header
		.to_udp_data (header_data),           
		.to_udp_ready(header_ready),          
		.to_udp_valid (header_valid),          
		.to_udp_empty (header_empty),          
		.to_udp_endofpacket (header_endofpacket),    
		.to_udp_startofpacket (header_startofpacket)
		
		
		
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
	
	wire cl_last_channel;
	cluster_locate cluster_locate0(
		
		.clk		(clk),
		.rst		(rst),
		
		.data_in_data		(wire_data2),
		.data_in_ready		(wire_ready2),
		.data_in_valid		(wire_valid2),
		.data_in_empty		(wire_empty2),
		.data_in_startofpacket		(wire_startofpacket2),
		.data_in_endofpacket			(wire_endofpacket2),
		
		.THRESHOLD			({8'b0,CL_THRESHOLD}),
		.SIZE					({1'b0,CL_SIZE}),
		
		.sig_ch_left		(sig_ch_left),
		.sig_ch_right		(sig_ch_right),
		.has_cluster		(has_cluster),
		.no_cluster			(no_cluster),
	
		.data_in_last		(cl_last_channel)
	
	); 
	
	
	wire[8:0]		data_caled_address;
	wire [15:0]		data_caled;
	wire				data_caled_rd_enable;

	//when bkg_sub_on is off, it equals to 8192.... the scaled 1 for calibration factor
	wire [15:0] cali_fac_masked = bkg_sub_on? cali_fac:16'd8192;
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
	.cali_fac	(cali_fac_masked),
	.waitrequest(waitrequest),
	
	.data_caled_address(data_caled_address),
	.data_caled(data_caled),
	.data_caled_rd_enable(data_caled_rd_enable),

	.to_udp_data (channel_data),           
	.to_udp_ready(channel_ready),          
	.to_udp_valid (channel_valid),          
	.to_udp_empty (channel_empty),          
	.to_udp_endofpacket (channel_endofpacket),    
	.to_udp_startofpacket (channel_startofpacket)

	);

	
	rms rms0(


		.clk(clk),
		.rst(rst),

		.bkg_sub_on			(bkg_sub_on),
		.sig_ram_last		(cl_last_channel),

		.sig_rdaddress(data_caled_address),            
		.sig(data_caled),
		.sig_rd_eable(data_caled_rd_enable),

		.sig_ch_left		(sig_ch_left),
		.sig_ch_right		(sig_ch_right),
		.has_cluster		(has_cluster),
		.no_cluster			(no_cluster),

		.to_udp_data (recon_data),           
		.to_udp_ready(recon_ready),          
		.to_udp_valid (recon_valid),          
		.to_udp_empty (recon_empty),          
		.to_udp_endofpacket (recon_endofpacket),    
		.to_udp_startofpacket (recon_startofpacket)


	);

	
endmodule
	
	
	
	
	