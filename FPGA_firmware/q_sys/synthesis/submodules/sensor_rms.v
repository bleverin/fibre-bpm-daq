//module top
//the output datapacket is 166 words; 0~2 is header; 3~162 is data's inverse signed; and last 4 words are not inversed

module sensor_rms (
		//Clock/reset
        input  wire        	clk_clk,                    //                     clk.clk
        input  wire        	rst_reset,                  //                     rst.reset
		//Avalon MM slave
        input  wire [1:0]  	csr_address,                //            avalon_slave.address
        input  wire        	csr_read,                   //                        .read
        output wire [31:0] 	csr_readdata,               //                        .readdata
        input  wire        	csr_write,                  //                        .write
        input  wire [31:0] 	csr_writedata,              //                        .writedata
        input  wire [3:0]  	csr_byteenable,             //                        .byteenable
		//Avalon ST transmitter
        output wire [31:0] 	data_out_data,          	// avalon_streaming_source.data
        output wire        	data_out_endofpacket,   	//                        .endofpacket
        output wire        	data_out_startofpacket, 	//                        .startofpacket
        input  wire        	data_out_ready,         	//                        .ready
        output wire        	data_out_valid,         	//                        .valid
        output wire [1:0]  	data_out_empty,         	//                        .empty
		//Sensor interface
        input  wire        	in_trg,                     //                  sensor.in_trg
        output wire        	out_adc_clk,                //                        .out_dac_clk
        output wire        	out_adc_cnv,                //                        .out_dac_cnv
        input  wire [4:0]  	in_adc_data,                //                        .in_dac_data
        output wire        	out_sensor_rst,             //                        .out_sensor_rst
        output wire        	out_sensor_clk,             //                        .out_sensor_clk
        output wire        	out_sensor_gain,            //                        .out_sensor_gain
		//Serial synchro interface
		input  wire	   		serial_rx,					//receive data
		output wire	   		serial_tx,					//send data
		input  wire [7:0]  	ext_input,					//SMA etc.
		//Debug information
		output wire [7:0] 	status_out					//status bits - same as in reg0_read[15:8]
		//output wire[26:0] frameID
    );

	 
	 
 
		wire [31:0] data_out_data1;   // Output data
		wire data_out_endofpacket1;    // Output end-of-packet signal
		wire data_out_startofpacket1;  // Output start-of-packet signal
		wire data_out_ready1;         // Output ready signal
		wire data_out_valid1;         // Output valid signal
		wire [1:0] data_out_empty1;   // Output empty signal


		wire [31:0] data_out_data_algo;   // Output data
		wire data_out_endofpacket_algo;    // Output end-of-packet signal
		wire data_out_startofpacket_algo;  // Output start-of-packet signal
		wire data_out_ready_algo;         // Output ready signal
		wire data_out_valid_algo;         // Output valid signal
		wire [1:0] data_out_empty_algo;   // Output empty signal

		wire int_rst;

		wire sig_ram_last;

		wire bkg_sub_on;
		wire rst_frame;
		 
		//data for sig after bkg subtraction
		wire			   sig_rdclk;						//the read port for sig_ram
		wire[8:0]		sig_rdaddress;             //0~319 for data. 500~502 for the 3 words head
		wire[31:0]		sig_out;

		//the output of cluster_locate
		wire[8:0]		sig_ch_left;
		wire[8:0]		sig_ch_right;
		wire				has_cluster;
		wire				no_cluster;
			

	  sensor_interface the_sensor_interface (
			.clk_clk			(clk_clk),                //      clk.clk
			.rst_reset			(rst_reset),              //      rst.reset
			.csr_address			(csr_address),            //      csr.address
			.csr_write			(csr_write),              //         .write
			.csr_writedata			(csr_writedata),          //         .writedata
			.csr_byteenable			(csr_byteenable),         //         .byteenable
			.csr_read			(csr_read),               //         .read
			.csr_readdata			(csr_readdata),           //         .readdata
			.data_out_data			(data_out_data1),          // data_out.data
			.data_out_empty			(data_out_empty1),         //         .empty
			.data_out_endofpacket		(data_out_endofpacket1),   //         .endofpacket
			.data_out_startofpacket		(data_out_startofpacket1),//         .startofpacket
			.data_out_ready			(data_out_ready1),         //         .ready
			.data_out_valid			(data_out_valid1),          //         .valid
			.in_trg 			(in_trg),                                //                  sensor.in_trg
			.out_adc_clk 			(out_adc_clk),                           //                        .out_dac_clk
			.out_adc_cnv 			(out_adc_cnv),                           //                        .out_dac_cnv
			.in_adc_data 			(in_adc_data),                           //                        .in_dac_data
			.out_sensor_rst 		(out_sensor_rst),                        //                        .out_sensor_rst
			.out_sensor_clk 		(out_sensor_clk),                        //                        .out_sensor_clk
			.out_sensor_gain 		(out_sensor_gain),                        //                        .out_sensor_gain
			.serial_rx			(serial_rx),		//receive data
			.serial_tx			(serial_tx),		//send data
			.ext_input			(ext_input),			//SMA etc.
			.int_rst          (int_rst)
	);
	
	
	
  data_interface #(.BKG_FRAME(8192), .CLU_THRESHOLD(14), .CLU_SIZE(4)) data_interface_dut (
			.clk_clk(clk_clk),                              // Clock input
			.rst_reset(int_rst),                          // Reset input
			
			
			.data_in_data(data_out_data1),                     // Input data
			.data_in_ready(data_out_ready1),                   // Input ready signal
			.data_in_valid(data_out_valid1),                   // Input valid signal
			.data_in_empty(data_out_empty1),                   // Input empty signal
			.data_in_endofpacket(data_out_endofpacket1),       // Input end-of-packet signal
			.data_in_startofpacket(data_out_startofpacket1),   // Input start-of-packet signal
			
			.data_out_data(data_out_data_algo),                   // Output data
			.data_out_endofpacket(data_out_endofpacket_algo),     // Output end-of-packet signal
			.data_out_startofpacket(data_out_startofpacket_algo), // Output start-of-packet signal
			.data_out_ready(data_out_ready_algo),                 // Output ready signal
			.data_out_valid(data_out_valid_algo),                 // Output valid signal
			.data_out_empty(data_out_empty_algo),                  // Output empty signal
			.bkg_sub_on(bkg_sub_on), 
			.rst_frame(rst_frame),
				 
																//data for sig after bkg subtraction
			.sig_rdclk(sig_rdclk),						//the read port for sig_ram
			.sig_rdaddress(sig_rdaddress),             //0~319 for data. 500~502 for the 3 words head
			.sig_out(sig_out),
			.sig_ram_last(sig_ram_last),
			.sig_ch_left(sig_ch_left),			
			.sig_ch_right(sig_ch_right),
			.has_cluster(has_cluster),
			.no_cluster(no_cluster)
			
			
  );
  
	
	rms rms_but(
	
			.clk_clk(clk_clk),                    //                     clk.clk
			.rst_reset(rst_frame),         			// the reset should connect to the rst_frame

			//data for sig after bkg subtraction
			.bkg_sub_on(bkg_sub_on), 					//indicate that bkg_sub is on 
			.sig_rdclk(sig_rdclk),						//the read port for sig_ram
			.sig_rdaddress(sig_rdaddress),             //0~319 for data. 500~502 for the 3 words head
			.sig(sig_out),
			.sig_ram_last(sig_ram_last),


			 .data_in_data(data_out_data_algo),                     // Input data
			.data_in_ready(data_out_ready_algo),                   // Input ready signal
			.data_in_valid(data_out_valid_algo),                   // Input valid signal
			.data_in_empty(data_out_empty_algo),                   // Input empty signal
			.data_in_endofpacket(data_out_endofpacket_algo),       // Input end-of-packet signal
			.data_in_startofpacket(data_out_startofpacket_algo),   // Input start-of-packet signal




			//the output of cluster_locate
			.sig_ch_left(sig_ch_left),
			.sig_ch_right(sig_ch_right),
			.has_cluster(has_cluster),
			.no_cluster(no_cluster),


			.data_out_data(data_out_data),                   // Output data
			.data_out_endofpacket(data_out_endofpacket),     // Output end-of-packet signal
			.data_out_startofpacket(data_out_startofpacket), // Output start-of-packet signal
			.data_out_ready(data_out_ready),                 // Output ready signal
			.data_out_valid(data_out_valid),                 // Output valid signal
			.data_out_empty(data_out_empty)                 // Output empty signal

	);

	endmodule