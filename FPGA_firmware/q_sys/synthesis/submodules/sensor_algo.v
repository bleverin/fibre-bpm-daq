//module sensor_algo
//combine sensor_interface bkg_subtraction, cluster_locate, and calibration, and rms


module sensor_algo(

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
	input  wire        	in_trg,                     //                  sensor.in_trg // This is the frame timer
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
	output wire [7:0] 	status_out,					//status bits - same as in reg0_read[15:8]
	
	
	//the interface with cali_ram (storing cali factor) Avalon-MM: read califac from this ram; output is not registered
	output wire [8:0] 	address,
	output wire 			clken,
	input  wire [15:0] 	cali_fac,
	input	 wire				waitrequest
	
);
	

	wire [31:0] data_out_data1;   // Output data
	wire data_out_endofpacket1;    // Output end-of-packet signal
	wire data_out_startofpacket1;  // Output start-of-packet signal
	wire data_out_ready1;         // Output ready signal
	wire data_out_valid1;         // Output valid signal
	wire [1:0] data_out_empty1;   // Output empty signal

	wire int_rst;
	wire [7:0] cluster_threshold;
	wire [7:0] cluster_size;
	wire [7:0] in_algo_threshold;

	  

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
		
		.int_rst          (int_rst),
		.cluster_threshold		(cluster_threshold),
		.cluster_size				(cluster_size),
		.in_algo_threshold		(in_algo_threshold)
		
	);
	
	
	algo_top_cl_cali_rms recon(
	
		.clk		(clk_clk),
		.rst		(int_rst),
		
		.data_in_data		(data_out_data1),
		.data_in_ready		(data_out_ready1),
		.data_in_valid		(data_out_valid1),
		.data_in_empty		(data_out_empty1),
		.data_in_startofpacket		(data_out_startofpacket1),
		.data_in_endofpacket			(data_out_endofpacket1),
		
				
		.CL_THRESHOLD		(cluster_threshold),
		.CL_SIZE				(cluster_size),
		.IN_ALGO_THRESHOLD	(in_algo_threshold),
		
		.address		(address),
		.clken		(clken),
		.cali_fac	(cali_fac),
		.waitrequest(waitrequest),
		
		.to_udp_data (data_out_data),           
		.to_udp_ready(data_out_ready),          
		.to_udp_valid (data_out_valid),          
		.to_udp_empty (data_out_empty),          
		.to_udp_endofpacket (data_out_endofpacket),    
		.to_udp_startofpacket (data_out_startofpacket)		
	);




	
endmodule
	
	
	
	
	