module  m10_rgmii (
        //Clock and Reset
        input  wire        clk_50_max10,
        input  wire        fpga_resetn,
		  

        //LED PB DIPSW
        output wire [4:0]  user_led,
        input  wire [3:0]  user_pb,
        input  wire [4:0]  user_dipsw,

        //Dual Ethernet
        output wire        enet_mdc,
        inout  wire        enet_mdio,	
        output wire        enet_resetn,	
        input  wire        enet_rx_clk,
        input  wire        enet_tx_clk,
        output wire        enet_gtx_clk,
        input  wire [3:0]  enet_rx_d,
        output wire [3:0]  enet_tx_d,
        output wire        enet_tx_en,
        input  wire        enet_rx_dv,
        input  wire        enet_led_link100,
 
		  input  wire        ddr3_ram_pll_ref_clk_clk,                    //                ddr3_ram_pll_ref_clk.clk
	
        output wire [13:0] mem_a,
        output wire [2:0]  mem_ba,
        inout  wire [0:0]  mem_ck,
        inout  wire [0:0]  mem_ck_n,
        output wire [0:0]  mem_cke,
        output wire [0:0]  mem_cs_n,
        output wire [0:0]  mem_dm,
        output wire [0:0]  mem_ras_n,
        output wire [0:0]  mem_cas_n,
        output wire [0:0]  mem_we_n,
        output wire        mem_reset_n,
        inout  wire [7:0]  mem_dq,
        inout  wire [0:0]  mem_dqs,
        inout  wire [0:0]  mem_dqs_n,
        output wire [0:0]  mem_odt,

        //QSPI
        output          qspi_clk,
        inout  [3:0]    qspi_io,
        output          qspi_csn,
			
		//Sensors
		output wire [1:0] sensor_reset,
		output wire [1:0] sensor_clk,
		input  wire [4:0] sensor_trig,
		output wire [1:0] adc_cnv,
		output wire [1:0] adc_sck,
		input  wire [4:0] adc_sdo,
		output wire	  sensor_gainp,
		output wire	  sensor_gainn,
		
		//Synchro
		input  wire [3:0] link_rx,
		output wire [3:0] link_tx,
		output wire [3:0] link_dir,
			
			  
		  //PMOD
		input wire  [7:0] pmoda,	//used for 8-fold SMA input;)
		output wire [7:0] pmodb,
			  
	  //USB UART
	  output wire		  debug_txd,
	  input wire		  debug_rxd		  
		  
        );

//*********************************** Signals *************************************
	
//Heart-beat counter
reg   [25:0]  heart_beat_cnt;

//DDR3 interface assignments
wire          local_init_done;
wire          local_cal_success;
wire          local_cal_fail;

//Ethernet interface assignments
wire          phy_resetn;
wire          system_resetn;

wire          mdio_oen_from_the_tse_mac;
wire          mdio_out_from_the_tse_mac;
wire          eth_mode_from_the_tse_mac;
wire          ena_10_from_the_tse_mac;
wire          enet_tx_125;
wire          enet_tx_25;
wire          enet_tx_2p5;
wire          locked_from_the_enet_pll;
wire          tx_clk_to_the_tse_mac;
wire          tx_clk_to_the_tse_mac_g;

wire          enet_tx_125_shift;
wire          enet_tx_25_shift;
wire          enet_tx_2p5_shift;
wire          enet_tx_250_shift; // signaltap sample clock
wire          locked_from_the_shift_pll;
wire          tx_clk_to_the_tse_mac_shift;
wire          tx_clk_to_the_tse_mac_shift_g;

//User interface ;)
wire [8:0]	user_input;
wire [7:0]	int_output;

//Sensor interface
wire        int_sensor_in_trg;                               
wire        int_sensor_out_adc_clk;
wire        int_sensor_out_adc_cnv;
wire [4:0]  int_sensor_in_adc_data;
wire        int_sensor_out_sensor_rst;
wire        int_sensor_out_sensor_clk;
wire        int_sensor_out_sensor_gain;
wire [7:0]  int_sensor_status;


//Trigger stuff
wire	    int_frame_timer;
reg	    sym_frame_timer;

//*********************************** Sensor connections *************************************

assign sensor_reset[0] 	= int_sensor_out_sensor_rst;
assign sensor_reset[1] 	= int_sensor_out_sensor_rst;
assign sensor_clk[0]	= ~int_sensor_out_sensor_clk;
assign sensor_clk[1]	= ~int_sensor_out_sensor_clk;
assign sensor_gainp	= int_sensor_out_sensor_gain;
assign sensor_gainn	= ~int_sensor_out_sensor_gain;
assign adc_cnv[0]	= int_sensor_out_adc_cnv;
assign adc_cnv[1]	= int_sensor_out_adc_cnv;
assign adc_sck[0]	= ~int_sensor_out_adc_clk;
assign adc_sck[1]	= ~int_sensor_out_adc_clk;
assign int_sensor_in_adc_data = adc_sdo;	//all of them are not-inverted :)


//*********************************** Frame trigger & synchro routing (master/slave) *************************************

//Synchro pulse is LINK3 (inverted)
//Global counter transmission is LINK2 (inverted)

wire trig_mode;
assign trig_mode = int_output[7];
wire int_synchro_rx;
wire int_synchro_tx;
wire int_trig_debouncer_in;
wire int_ser_debouncer_in;

	//Pulse flip-flop
always @(posedge int_frame_timer or negedge fpga_resetn)
begin
	if (!fpga_resetn)
		sym_frame_timer <= 0; 
	else if (trig_mode == 0)
		sym_frame_timer <= 0;
	else
		sym_frame_timer <= ~sym_frame_timer;
end
	//Trigger Assignments
assign link_dir[3]		= trig_mode;		//set link direction according to M/S setting (LED PIO 7)
assign link_tx[3]		= ~sym_frame_timer;	//connect internal frame trigger to TX
assign int_trig_debouncer_in 	= trig_mode ? sym_frame_timer : link_rx[3];	//connect either internal or external frame trigger

	//Debouncer for trigger signals - limit trigger bandwidth to 2.5 MHz
debouncer #(
	.LENGTH	(10)
) trig_debouncer (
	.rst	(!system_resetn),
	.clk	(clk_50_max10),
	.in	(int_trig_debouncer_in),
	.out	(int_sensor_in_trg)
);

	//Serial assignments
assign link_dir[2]		= trig_mode;
assign int_ser_debouncer_in   	= trig_mode ? int_synchro_tx : link_rx[2];
assign link_tx[2] 		= ~int_synchro_tx;

	//Debouncer for serial RX - limit bandwidth to 2.5 MHz
debouncer #(
	.LENGTH	(10)
) ser_debouncer (
	.rst	(!system_resetn),
	.clk	(clk_50_max10),
	.in	(int_ser_debouncer_in),
	.out	(int_synchro_rx)
);
	
	
//*********************************** Various logic *************************************

assign system_resetn = fpga_resetn & local_init_done;

	//PMOD debug lines
assign pmodb[0] 	= int_trig_debouncer_in;
assign pmodb[1] 	= int_sensor_in_trg;
assign pmodb[7:2] 	= int_sensor_status[5:0];

	//Buttons/switches
assign user_input[3:0] = user_pb[3:0];
assign user_input[8:4] = user_dipsw[4:0];

//LED forwarding
assign user_led[3:0] = ~int_output[3:0];
	//disable user_led[4] blink with int_output[5]; force user_led[4] with int_output[4]
assign user_led[4] = ~int_output[4] & (heart_beat_cnt[25] | int_output[5]);	
	//int_output[6] is used for PHY hard reset
	//int_output[7] is used for master/slave frame trigger routing

	
//Heart beat by 50MHz clock
always @(posedge clk_50_max10 or negedge fpga_resetn)
  if (!fpga_resetn)
      heart_beat_cnt <= 26'h0; //0x3FFFFFF
  else
      heart_beat_cnt <= heart_beat_cnt + 1'b1;


		
//*********************************** Ethernet *************************************	
	
	//PHY power-on reset control
parameter MSB = 20; // PHY interface: need minimum 10ms delay for POR
reg [MSB:0] epcount;

always @(posedge clk_50_max10 or negedge fpga_resetn)
  if (!fpga_resetn)
      epcount <= MSB + 1'b0;
  else if (epcount[MSB] == 1'b0)
      epcount <= epcount + 1;
  else
      epcount <= epcount;

assign phy_resetn    = user_pb[0] & !(int_output[6] & epcount[MSB]) & !epcount[MSB-1];		//PHY hard reset by counter, user button or software
assign enet_resetn   = phy_resetn;

//MDIO output control
assign enet_mdio = ( !mdio_oen_from_the_tse_mac ) ? ( mdio_out_from_the_tse_mac ) : ( 1'bz );

assign enet_tx_2p5_shift = !enet_tx_2p5;

//RGMII clock solution
assign tx_clk_to_the_tse_mac = ( eth_mode_from_the_tse_mac ) ? ( enet_tx_125 ) :  // GbE Mode = 125MHz clock
                               ( ena_10_from_the_tse_mac ) ? ( enet_tx_2p5 ) :    // 10Mb Mode = 2.5MHz clock
                               ( enet_tx_25 );                                    // 100Mb Mode = 25MHz clock

assign tx_clk_to_the_tse_mac_shift = ( eth_mode_from_the_tse_mac ) ? ( enet_tx_125_shift ) :  // GbE Mode = 125MHz clock
                                     ( ena_10_from_the_tse_mac ) ? ( enet_tx_2p5_shift ) :    // 10Mb Mode = 2.5MHz clock
                                     ( enet_tx_25_shift);                                     // 100Mb Mode = 25MHz clock

clkctrl             clkctrl_inst0 (
                    .inclk        (tx_clk_to_the_tse_mac  ),
                    .outclk       (tx_clk_to_the_tse_mac_g)
                    );

clkctrl             clkctrl_inst1 (
                    .inclk        (tx_clk_to_the_tse_mac_shift  ),
                    .outclk       (tx_clk_to_the_tse_mac_shift_g)
                    );

enet_gtx_clk_ddio   enet_gtx_clk_ddio_inst (
                    .outclock              (tx_clk_to_the_tse_mac_shift_g), // tx_clk_to_the_tse_mac_g ),
                    .din                   (2'b10                        ),
                    .pad_out               (enet_gtx_clk                 ),
                    .aclr                  (!phy_resetn                  )
                    );

		    
//*********************************** Main QSYS *************************************
		    
q_sys               q_sys_inst (
                    .sys_clk_clk                                                   (clk_50_max10              ), //                             sys_clk.clk
                    .reset_reset_n                                                 (system_resetn             ), //                               reset.reset_n
                    .mem_resetn_in_reset_reset_n                                   (fpga_resetn               ), //                 mem_resetn_in_reset.reset_n
                    .altpll_shift_c0_clk                                           (enet_tx_250_shift         ), //                     altpll_shift_c0.clk
                    .altpll_shift_locked_conduit_export                            (locked_from_the_shift_pll ), //         altpll_shift_locked_conduit.export
                    .clock_bridge_0_in_clk_clk                                     (enet_tx_25                ), //               clock_bridge_0_in_clk.clk
                    .enet_pll_c0_clk                                               (enet_tx_125               ), //                         enet_pll_c0.clk
                    .enet_pll_c1_clk                                               (enet_tx_25                ), //                         enet_pll_c1.clk
                    .enet_pll_c2_clk                                               (enet_tx_2p5               ), //                         enet_pll_c2.clk
                    .enet_pll_c3_clk                                               (enet_tx_125_shift         ), //                         enet_pll_c3.clk
                    .enet_pll_c4_clk                                               (enet_tx_25_shift          ), //                         enet_pll_c4.clk
                    .enet_pll_locked_conduit_export                                (locked_from_the_enet_pll  ), //             enet_pll_locked_conduit.export
                    .eth_tse_mac_mdio_connection_mdc                               (enet_mdc                  ), //         eth_tse_mac_mdio_connection.mdc
                    .eth_tse_mac_mdio_connection_mdio_in                           (enet_mdio                 ), //                                    .mdio_in
                    .eth_tse_mac_mdio_connection_mdio_out                          (mdio_out_from_the_tse_mac ), //                                    .mdio_out
                    .eth_tse_mac_mdio_connection_mdio_oen                          (mdio_oen_from_the_tse_mac ), //                                    .mdio_oen
                    .eth_tse_mac_rgmii_connection_rgmii_in                         (enet_rx_d                 ), //        eth_tse_mac_rgmii_connection.rgmii_in
                    .eth_tse_mac_rgmii_connection_rgmii_out                        (enet_tx_d                 ), //                                    .rgmii_out
                    .eth_tse_mac_rgmii_connection_rx_control                       (enet_rx_dv                ), //                                    .rx_control
                    .eth_tse_mac_rgmii_connection_tx_control                       (enet_tx_en                ), //                                    .tx_control
                    .eth_tse_mac_status_connection_set_10                          (                          ), //       eth_tse_mac_status_connection.set_10
                    .eth_tse_mac_status_connection_set_1000                        (                          ), //                                    .set_1000
                    .eth_tse_mac_status_connection_eth_mode                        (eth_mode_from_the_tse_mac ), //                                    .eth_mode
                    .eth_tse_mac_status_connection_ena_10                          (ena_10_from_the_tse_mac   ), //                                    .ena_10
                    .eth_tse_pcs_mac_rx_clock_connection_clk                       (enet_rx_clk               ), // eth_tse_pcs_mac_rx_clock_connection.clk
                    .eth_tse_pcs_mac_tx_clock_connection_clk                       (tx_clk_to_the_tse_mac_g   ), // eth_tse_pcs_mac_tx_clock_connection.clk
                    .ext_flash_flash_dataout_conduit_dataout                       (qspi_io                   ), //             ext_flash_flash_dataout.conduit_dataout
                    .ext_flash_flash_dclk_out_conduit_dclk_out                     (qspi_clk                  ), //            ext_flash_flash_dclk_out.conduit_dclk_out
                    .ext_flash_flash_ncs_conduit_ncs                               (qspi_csn                  ), //                 ext_flash_flash_ncs.conduit_ncs
						  .ddr3_ram_pll_ref_clk_clk												  (ddr3_ram_pll_ref_clk_clk ),
                    .memory_mem_a                                                  (mem_a                     ), //                              memory.mem_a
                    .memory_mem_ba                                                 (mem_ba                    ), //                                    .mem_ba
                    .memory_mem_ck                                                 (mem_ck                    ), //                                    .mem_ck
                    .memory_mem_ck_n                                               (mem_ck_n                  ), //                                    .mem_ck_n
                    .memory_mem_cke                                                (mem_cke                   ), //                                    .mem_cke
                    .memory_mem_cs_n                                               (mem_cs_n                  ), //                                    .mem_cs_n
                    .memory_mem_dm                                                 (mem_dm                    ), //                                    .mem_dm
                    .memory_mem_ras_n                                              (mem_ras_n                 ), //                                    .mem_ras_n
                    .memory_mem_cas_n                                              (mem_cas_n                 ), //                                    .mem_cas_n
                    .memory_mem_we_n                                               (mem_we_n                  ), //                                    .mem_we_n
                    .memory_mem_reset_n                                            (mem_reset_n               ), //                                    .mem_reset_n
                    .memory_mem_dq                                                 (mem_dq                    ), //                                    .mem_dq
                    .memory_mem_dqs                                                (mem_dqs                   ), //                                    .mem_dqs
                    .memory_mem_dqs_n                                              (mem_dqs_n                 ), //                                    .mem_dqs_n
                    .memory_mem_odt                                                (mem_odt                   ), //                                    .mem_odt
                    .led_pio_external_connection_export                            (int_output[7:0]              ), //         led_pio_external_connection.export
                    .mem_if_ddr3_emif_0_status_local_init_done                     (local_init_done           ), //           mem_if_ddr3_emif_0_status.local_init_done
                    .mem_if_ddr3_emif_0_status_local_cal_success                   (local_cal_success         ), //                                    .local_cal_success
                    .mem_if_ddr3_emif_0_status_local_cal_fail                      (local_cal_fail            ), //                                    .local_cal_fail
                    .button_pio_external_connection_export			   (user_input	  	      ), //
		    .debug_uart_external_connection_rxd         		   (debug_rxd		      ), //      
		    .debug_uart_external_connection_txd         		   (debug_txd		      ), //
		    .sensor_in_trg 						   (int_sensor_in_trg	      ),                               
		    .sensor_out_adc_clk 					   (int_sensor_out_adc_clk    ),
		    .sensor_out_adc_cnv 					   (int_sensor_out_adc_cnv    ),
		    .sensor_in_adc_data 					   (int_sensor_in_adc_data    ),
		    .sensor_out_sensor_rst 					   (int_sensor_out_sensor_rst ),
		    .sensor_out_sensor_clk  					   (int_sensor_out_sensor_clk ),
		    .sensor_out_sensor_gain 					   (int_sensor_out_sensor_gain),
		    .frame_timer_export						   (int_frame_timer),
		    .sensor_synchro_serial_rx                    		   (int_synchro_rx),//                      sensor_synchro.serial_rx
		    .sensor_synchro_serial_tx                    		   (int_synchro_tx),//                                    .serial_tx
		    .sensor_synchro_ext_input				           (pmoda),
		    .sensor_status_status_out					   (int_sensor_status)
			);
						  
endmodule						  
