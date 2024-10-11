
module sensor_recon (
	sensor_recon_0_csr_address,
	sensor_recon_0_csr_read,
	sensor_recon_0_csr_readdata,
	sensor_recon_0_csr_write,
	sensor_recon_0_csr_writedata,
	sensor_recon_0_csr_byteenable,
	sensor_recon_0_data_out_endofpacket,
	sensor_recon_0_data_out_data,
	sensor_recon_0_data_out_empty,
	sensor_recon_0_data_out_ready,
	sensor_recon_0_data_out_startofpacket,
	sensor_recon_0_data_out_valid,
	sensor_recon_0_clk_clk,
	sensor_recon_0_rst_reset,
	sensor_recon_0_sensor_in_adc_data,
	sensor_recon_0_sensor_in_trg,
	sensor_recon_0_sensor_out_adc_clk,
	sensor_recon_0_sensor_out_adc_cnv,
	sensor_recon_0_sensor_out_sensor_clk,
	sensor_recon_0_sensor_out_sensor_gain,
	sensor_recon_0_sensor_out_sensor_rst,
	sensor_recon_0_status_out_status_out,
	sensor_recon_0_synchro_ext_input,
	sensor_recon_0_synchro_serial_rx,
	sensor_recon_0_synchro_serial_tx,
	sensor_recon_0_calibration_ram_interface_address,
	sensor_recon_0_calibration_ram_interface_read,
	sensor_recon_0_calibration_ram_interface_readdata,
	sensor_recon_0_calibration_ram_interface_waitrequest);	

	input	[1:0]	sensor_recon_0_csr_address;
	input		sensor_recon_0_csr_read;
	output	[31:0]	sensor_recon_0_csr_readdata;
	input		sensor_recon_0_csr_write;
	input	[31:0]	sensor_recon_0_csr_writedata;
	input	[3:0]	sensor_recon_0_csr_byteenable;
	output		sensor_recon_0_data_out_endofpacket;
	output	[31:0]	sensor_recon_0_data_out_data;
	output	[1:0]	sensor_recon_0_data_out_empty;
	input		sensor_recon_0_data_out_ready;
	output		sensor_recon_0_data_out_startofpacket;
	output		sensor_recon_0_data_out_valid;
	input		sensor_recon_0_clk_clk;
	input		sensor_recon_0_rst_reset;
	input	[4:0]	sensor_recon_0_sensor_in_adc_data;
	input		sensor_recon_0_sensor_in_trg;
	output		sensor_recon_0_sensor_out_adc_clk;
	output		sensor_recon_0_sensor_out_adc_cnv;
	output		sensor_recon_0_sensor_out_sensor_clk;
	output		sensor_recon_0_sensor_out_sensor_gain;
	output		sensor_recon_0_sensor_out_sensor_rst;
	output	[7:0]	sensor_recon_0_status_out_status_out;
	input	[7:0]	sensor_recon_0_synchro_ext_input;
	input		sensor_recon_0_synchro_serial_rx;
	output		sensor_recon_0_synchro_serial_tx;
	output	[8:0]	sensor_recon_0_calibration_ram_interface_address;
	output		sensor_recon_0_calibration_ram_interface_read;
	input	[15:0]	sensor_recon_0_calibration_ram_interface_readdata;
	input		sensor_recon_0_calibration_ram_interface_waitrequest;
endmodule
