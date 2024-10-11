//This is a testbench from the UDP generator


`timescale 1 ns / 1 ns
module udp_testbench();


//Signals

	reg         clk_clk;                //      clk.clk
	reg         rst_reset;              //      rst.reset
	reg  [2:0]  csr_address;            //      csr.address
	reg         csr_write;              //         .write
	reg  [31:0] csr_writedata;          //         .writedata
	reg  [3:0]  csr_byteenable;         //         .byteenable
	reg         csr_read;               //         .read
	wire [31:0] csr_readdata;           //         .readdata
	reg  [31:0] data_in_data;           //  data_in.data
	wire        data_in_ready;          //         .ready
	reg         data_in_valid;          //         .valid
	reg  [1:0]  data_in_empty;          //         .empty
	reg         data_in_endofpacket;    //         .endofpacket
	reg         data_in_startofpacket;  //         .startofpacket
	wire [31:0] data_out_data;          // data_out.data
	wire [1:0]  data_out_empty;         //         .empty
	wire        data_out_endofpacket;   //         .endofpacket
	wire        data_out_startofpacket; //         .startofpacket
	reg         data_out_ready;         //         .ready
	wire        data_out_valid;          //         .valid


initial
begin
	clk_clk 			= 0;
	rst_reset 			= 1;
	csr_address 			= 3'd0;
	csr_write 			= 0;
	csr_writedata			= 32'd0;
	csr_byteenable 			= 4'b1111;
	csr_read 			= 0;
	data_in_data			= 32'd0;
	data_in_valid			= 0;
	data_in_empty			= 2'd0;
	data_in_endofpacket  		= 0;
	data_in_startofpacket 		= 0;
	data_out_ready			= 0;	

	#50 
	rst_reset = 0;
		//write 0x00F00001 to register 0 - size=240 + enable
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd0;
	csr_writedata = 32'h00100001;
	#20
	csr_write = 0;
	csr_byteenable = 4'b0000;
	csr_address = 3'd0;
	csr_writedata = 32'h00000000;

		//write 0x0A000711 to register 1 - SRC IP = 10.0.7.17
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd1;
	csr_writedata = 32'h0A000711;
	#20
	csr_write = 0;
	csr_byteenable = 4'b0000;
	csr_address = 3'd0;
	csr_writedata = 32'h00000000;

	//write 0x0A000701 to register 2 - DST IP = 10.0.7.1
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd2;
	csr_writedata = 32'h0A000701;
	#20
	csr_write = 0;
	csr_byteenable = 4'b0000;
	csr_address = 3'd0;
	csr_writedata = 32'h00000000;

	//write 0x01000100 to register 3 - SRC port = 4096, DST port = 4096
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd3;
	csr_writedata = 32'h01000100;
	#20
	csr_write = 0;
	csr_byteenable = 4'b0000;
	csr_address = 3'd0;
	csr_writedata = 32'h00000000;

	//write 0xc705aa63 to register 4 - DST MAC lower bytes = 70 05 aa 63
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd4;
	csr_writedata = 32'hc705aa63;
	#20
	csr_write = 0;
	csr_byteenable = 4'b0000;
	csr_address = 3'd0;
	csr_writedata = 32'h00000000;

	//write 0x000018d6 to register 5 - DST MAC higher bytes = 18 d6
	#20
	csr_write = 1;
	csr_byteenable = 4'b1111;
	csr_address = 3'd5;
	csr_writedata = 32'h000018d6;
	#20
	csr_write = 0;
	csr_byteenable = 4'b0000;
	csr_address = 3'd0;
	csr_writedata = 32'h00000000;

	//Start transmission
	#102
	data_in_valid = 1;
	data_in_startofpacket = 1;
	data_in_data = 32'h12345678;

	//backpressure - ready signal from receiver
	#40
	data_out_ready = 1;
	#20
	data_in_startofpacket = 0;

	//finish sending data
	#480
	data_in_endofpacket = 1;
	#20
	data_in_endofpacket = 0;
	data_in_valid = 0;


	#1500
	$stop;

end

always #10 clk_clk = ~clk_clk;


	
	

// UDP generator


udp_generator the_udp_generator (
		.clk_clk					(clk_clk),                //      clk.clk
		.rst_reset				(rst_reset),              //      rst.reset
		.csr_address				(csr_address),            //      csr.address
		.csr_write				(csr_write),              //         .write
		.csr_writedata			(csr_writedata),          //         .writedata
		.csr_byteenable			(csr_byteenable),         //         .byteenable
		.csr_read					(csr_read),               //         .read
		.csr_readdata			(csr_readdata),           //         .readdata
		.data_in_data			(data_in_data),           //  data_in.data
		.data_in_ready			(data_in_ready),          //         .ready
		.data_in_valid			(data_in_valid),          //         .valid
		.data_in_empty			(data_in_empty),          //         .empty
		.data_in_endofpacket	(data_in_endofpacket),    //         .endofpacket
		.data_in_startofpacket(data_in_startofpacket),  //         .startofpacket
		.data_out_data			(data_out_data),          // data_out.data
		.data_out_empty			(data_out_empty),         //         .empty
		.data_out_endofpacket	(data_out_endofpacket),   //         .endofpacket
		.data_out_startofpacket(data_out_startofpacket),//         .startofpacket
		.data_out_ready			(data_out_ready),         //         .ready
		.data_out_valid			(data_out_valid)          //         .valid
	);
	
	
endmodule