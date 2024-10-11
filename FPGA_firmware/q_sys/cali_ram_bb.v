
module cali_ram (
	cali_ram_s2_address,
	cali_ram_s2_chipselect,
	cali_ram_s2_clken,
	cali_ram_s2_write,
	cali_ram_s2_readdata,
	cali_ram_s2_writedata,
	cali_ram_s2_byteenable,
	cali_ram_clk2_clk,
	cali_ram_reset2_reset,
	cali_ram_reset1_reset,
	cali_ram_s1_address,
	cali_ram_s1_clken,
	cali_ram_s1_chipselect,
	cali_ram_s1_write,
	cali_ram_s1_readdata,
	cali_ram_s1_writedata,
	cali_ram_s1_byteenable,
	cali_ram_clk1_clk);	

	input	[8:0]	cali_ram_s2_address;
	input		cali_ram_s2_chipselect;
	input		cali_ram_s2_clken;
	input		cali_ram_s2_write;
	output	[15:0]	cali_ram_s2_readdata;
	input	[15:0]	cali_ram_s2_writedata;
	input	[1:0]	cali_ram_s2_byteenable;
	input		cali_ram_clk2_clk;
	input		cali_ram_reset2_reset;
	input		cali_ram_reset1_reset;
	input	[8:0]	cali_ram_s1_address;
	input		cali_ram_s1_clken;
	input		cali_ram_s1_chipselect;
	input		cali_ram_s1_write;
	output	[15:0]	cali_ram_s1_readdata;
	input	[15:0]	cali_ram_s1_writedata;
	input	[1:0]	cali_ram_s1_byteenable;
	input		cali_ram_clk1_clk;
endmodule
