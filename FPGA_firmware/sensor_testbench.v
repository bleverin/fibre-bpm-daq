//This is a testbench from the UDP generator


`timescale 1 ns / 1 ns
module sensor_testbench();


//Signals

	reg         clk_clk;                //      clk.clk
	reg         rst_reset;              //      rst.reset
	reg  [2:0]  csr_address;            //      csr.address
	reg         csr_write;              //         .write
	reg  [31:0] csr_writedata;          //         .writedata
	reg  [3:0]  csr_byteenable;         //         .byteenable
	reg         csr_read;               //         .read
	wire [31:0] csr_readdata;           //         .readdata
	wire [31:0] data_out_data;          // data_out.data
	wire [1:0]  data_out_empty;         //         .empty
	wire        data_out_endofpacket;   //         .endofpacket
	wire        data_out_startofpacket; //         .startofpacket
	reg         data_out_ready;         //         .ready
	wire        data_out_valid;          //         .valid

        reg	    in_trg;                                //                  sensor.in_trg
        wire        out_dac_clk;                           //                        .out_dac_clk
        wire        out_dac_cnv;                           //                        .out_dac_cnv
        reg [4:0]   in_adc_data;                           //                        .in_dac_data
        wire        out_sensor_rst;                        //                        .out_sensor_rst
        wire        out_sensor_clk;                        //                        .out_sensor_clk
        wire        out_sensor_gain;                        //                        .out_sensor_gain

	wire	    serial;
	reg [7:0]  ext;	



initial
begin
	clk_clk 			= 0;
	rst_reset 			= 1;
	csr_address 			= 3'd0;
	csr_write 			= 0;
	csr_writedata			= 32'd0;
	csr_byteenable 			= 4'b1111;
	csr_read 			= 0;
	data_out_ready			= 1;	

	in_trg 				= 0;
	in_adc_data			= 5'b0;

	ext = 0;

	#50 
	rst_reset = 0;

		//write 0xAAAA0032 to register 2
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd2;
	csr_writedata = 32'hAAAA0032;
	#20
	csr_write = 0;

		//write 0x00040004 to register 1
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd1;
	csr_writedata = 32'h00040004;
	#20
	csr_write = 0;

		//write 0x00060001 to register 0
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd0;
	csr_writedata = 32'h00060001;
	#20
	csr_write = 0;





	#500000
	$stop;

end

always #10 clk_clk = ~clk_clk;
always #20 in_adc_data = in_adc_data + 1;	//dummy hay to ADCs

always #50010 in_trg = ~in_trg;


	
	


sensor_interface the_sensor_interface (
		.clk_clk			(clk_clk),                //      clk.clk
		.rst_reset			(rst_reset),              //      rst.reset
		.csr_address			(csr_address),            //      csr.address
		.csr_write			(csr_write),              //         .write
		.csr_writedata			(csr_writedata),          //         .writedata
		.csr_byteenable			(csr_byteenable),         //         .byteenable
		.csr_read			(csr_read),               //         .read
		.csr_readdata			(csr_readdata),           //         .readdata
		.data_out_data			(data_out_data),          // data_out.data
		.data_out_empty			(data_out_empty),         //         .empty
		.data_out_endofpacket		(data_out_endofpacket),   //         .endofpacket
		.data_out_startofpacket		(data_out_startofpacket),//         .startofpacket
		.data_out_ready			(data_out_ready),         //         .ready
		.data_out_valid			(data_out_valid),          //         .valid
        	.in_trg 			(in_trg),                                //                  sensor.in_trg
        	.out_adc_clk 			(out_adc_clk),                           //                        .out_dac_clk
        	.out_adc_cnv 			(out_adc_cnv),                           //                        .out_dac_cnv
        	.in_adc_data 			(in_adc_data),                           //                        .in_dac_data
        	.out_sensor_rst 		(out_sensor_rst),                        //                        .out_sensor_rst
        	.out_sensor_clk 		(out_sensor_clk),                        //                        .out_sensor_clk
        	.out_sensor_gain 		(out_sensor_gain),                        //                        .out_sensor_gain
		.serial_rx			(serial),		//receive data
		.serial_tx			(serial),		//send data
		.ext_input			(ext)			//SMA etc.
	);
	
	
endmodule