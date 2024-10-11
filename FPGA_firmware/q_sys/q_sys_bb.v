
module q_sys (
	altpll_shift_c0_clk,
	altpll_shift_locked_conduit_export,
	button_pio_external_connection_export,
	clock_bridge_0_in_clk_clk,
	ddr3_ram_pll_ref_clk_clk,
	debug_uart_external_connection_rxd,
	debug_uart_external_connection_txd,
	enet_pll_c0_clk,
	enet_pll_c1_clk,
	enet_pll_c2_clk,
	enet_pll_c3_clk,
	enet_pll_c4_clk,
	enet_pll_locked_conduit_export,
	eth_tse_mac_mdio_connection_mdc,
	eth_tse_mac_mdio_connection_mdio_in,
	eth_tse_mac_mdio_connection_mdio_out,
	eth_tse_mac_mdio_connection_mdio_oen,
	eth_tse_mac_rgmii_connection_rgmii_in,
	eth_tse_mac_rgmii_connection_rgmii_out,
	eth_tse_mac_rgmii_connection_rx_control,
	eth_tse_mac_rgmii_connection_tx_control,
	eth_tse_mac_status_connection_set_10,
	eth_tse_mac_status_connection_set_1000,
	eth_tse_mac_status_connection_eth_mode,
	eth_tse_mac_status_connection_ena_10,
	eth_tse_pcs_mac_rx_clock_connection_clk,
	eth_tse_pcs_mac_tx_clock_connection_clk,
	ext_flash_flash_dataout_conduit_dataout,
	ext_flash_flash_dclk_out_conduit_dclk_out,
	ext_flash_flash_ncs_conduit_ncs,
	frame_timer_export,
	led_pio_external_connection_export,
	mem_if_ddr3_emif_0_status_local_init_done,
	mem_if_ddr3_emif_0_status_local_cal_success,
	mem_if_ddr3_emif_0_status_local_cal_fail,
	mem_resetn_in_reset_reset_n,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_dm,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	reset_reset_n,
	sensor_in_adc_data,
	sensor_in_trg,
	sensor_out_adc_clk,
	sensor_out_adc_cnv,
	sensor_out_sensor_clk,
	sensor_out_sensor_gain,
	sensor_out_sensor_rst,
	sensor_status_status_out,
	sensor_synchro_ext_input,
	sensor_synchro_serial_rx,
	sensor_synchro_serial_tx,
	sys_clk_clk);	

	output		altpll_shift_c0_clk;
	output		altpll_shift_locked_conduit_export;
	input	[8:0]	button_pio_external_connection_export;
	input		clock_bridge_0_in_clk_clk;
	input		ddr3_ram_pll_ref_clk_clk;
	input		debug_uart_external_connection_rxd;
	output		debug_uart_external_connection_txd;
	output		enet_pll_c0_clk;
	output		enet_pll_c1_clk;
	output		enet_pll_c2_clk;
	output		enet_pll_c3_clk;
	output		enet_pll_c4_clk;
	output		enet_pll_locked_conduit_export;
	output		eth_tse_mac_mdio_connection_mdc;
	input		eth_tse_mac_mdio_connection_mdio_in;
	output		eth_tse_mac_mdio_connection_mdio_out;
	output		eth_tse_mac_mdio_connection_mdio_oen;
	input	[3:0]	eth_tse_mac_rgmii_connection_rgmii_in;
	output	[3:0]	eth_tse_mac_rgmii_connection_rgmii_out;
	input		eth_tse_mac_rgmii_connection_rx_control;
	output		eth_tse_mac_rgmii_connection_tx_control;
	input		eth_tse_mac_status_connection_set_10;
	input		eth_tse_mac_status_connection_set_1000;
	output		eth_tse_mac_status_connection_eth_mode;
	output		eth_tse_mac_status_connection_ena_10;
	input		eth_tse_pcs_mac_rx_clock_connection_clk;
	input		eth_tse_pcs_mac_tx_clock_connection_clk;
	inout	[3:0]	ext_flash_flash_dataout_conduit_dataout;
	output		ext_flash_flash_dclk_out_conduit_dclk_out;
	output	[0:0]	ext_flash_flash_ncs_conduit_ncs;
	output		frame_timer_export;
	output	[7:0]	led_pio_external_connection_export;
	output		mem_if_ddr3_emif_0_status_local_init_done;
	output		mem_if_ddr3_emif_0_status_local_cal_success;
	output		mem_if_ddr3_emif_0_status_local_cal_fail;
	input		mem_resetn_in_reset_reset_n;
	output	[13:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	inout	[0:0]	memory_mem_ck;
	inout	[0:0]	memory_mem_ck_n;
	output	[0:0]	memory_mem_cke;
	output	[0:0]	memory_mem_cs_n;
	output	[0:0]	memory_mem_dm;
	output	[0:0]	memory_mem_ras_n;
	output	[0:0]	memory_mem_cas_n;
	output	[0:0]	memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[7:0]	memory_mem_dq;
	inout	[0:0]	memory_mem_dqs;
	inout	[0:0]	memory_mem_dqs_n;
	output	[0:0]	memory_mem_odt;
	input		reset_reset_n;
	input	[4:0]	sensor_in_adc_data;
	input		sensor_in_trg;
	output		sensor_out_adc_clk;
	output		sensor_out_adc_cnv;
	output		sensor_out_sensor_clk;
	output		sensor_out_sensor_gain;
	output		sensor_out_sensor_rst;
	output	[7:0]	sensor_status_status_out;
	input	[7:0]	sensor_synchro_ext_input;
	input		sensor_synchro_serial_rx;
	output		sensor_synchro_serial_tx;
	input		sys_clk_clk;
endmodule
