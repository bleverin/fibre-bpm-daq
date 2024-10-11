// q_sys_ddr3_ram_s0.v

// This file was auto-generated from qsys_sequencer_110_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 19.1 670

`timescale 1 ps / 1 ps
module q_sys_ddr3_ram_s0 (
		input  wire        avl_clk,                     //          avl_clk.clk
		input  wire        avl_reset_n,                 //    sequencer_rst.reset
		output wire        pd_reset_n,                  //   phase_detector.pd_reset_n
		output wire        pd_ack,                      //                 .pd_ack
		input  wire        pd_up,                       //                 .pd_up
		input  wire        pd_down,                     //                 .pd_down
		output wire [2:0]  phasecounterselect,          //     pll_reconfig.phasecounterselect
		output wire        phasestep,                   //                 .phasestep
		output wire        phaseupdown,                 //                 .phaseupdown
		output wire        scanclk,                     //                 .scanclk
		input  wire        phasedone,                   //                 .phasedone
		input  wire        phy_clk,                     //              phy.phy_clk
		input  wire        phy_reset_n,                 //                 .phy_reset_n
		output wire [4:0]  phy_read_latency_counter,    //                 .phy_read_latency_counter
		output wire [5:0]  phy_afi_wlat,                //                 .phy_afi_wlat
		output wire [5:0]  phy_afi_rlat,                //                 .phy_afi_rlat
		output wire [0:0]  phy_read_increment_vfifo_fr, //                 .phy_read_increment_vfifo_fr
		output wire [0:0]  phy_read_increment_vfifo_hr, //                 .phy_read_increment_vfifo_hr
		output wire [0:0]  phy_read_increment_vfifo_qr, //                 .phy_read_increment_vfifo_qr
		output wire        phy_reset_mem_stable,        //                 .phy_reset_mem_stable
		output wire        phy_cal_success,             //                 .phy_cal_success
		output wire        phy_cal_fail,                //                 .phy_cal_fail
		output wire [31:0] phy_cal_debug_info,          //                 .phy_cal_debug_info
		output wire [0:0]  phy_read_fifo_reset,         //                 .phy_read_fifo_reset
		output wire [0:0]  phy_vfifo_rd_en_override,    //                 .phy_vfifo_rd_en_override
		input  wire [31:0] phy_read_fifo_q,             //                 .phy_read_fifo_q
		output wire [1:0]  phy_write_fr_cycle_shifts,   //                 .phy_write_fr_cycle_shifts
		output wire        phy_mux_sel,                 //          mux_sel.mux_sel
		input  wire [7:0]  calib_skip_steps,            //            calib.calib_skip_steps
		input  wire        afi_clk,                     //          afi_clk.clk
		input  wire        afi_reset_n,                 //        afi_reset.reset_n
		output wire [27:0] afi_addr,                    //              afi.afi_addr
		output wire [5:0]  afi_ba,                      //                 .afi_ba
		output wire [1:0]  afi_cs_n,                    //                 .afi_cs_n
		output wire [1:0]  afi_cke,                     //                 .afi_cke
		output wire [1:0]  afi_odt,                     //                 .afi_odt
		output wire [1:0]  afi_ras_n,                   //                 .afi_ras_n
		output wire [1:0]  afi_cas_n,                   //                 .afi_cas_n
		output wire [1:0]  afi_we_n,                    //                 .afi_we_n
		output wire [1:0]  afi_dqs_burst,               //                 .afi_dqs_burst
		output wire [1:0]  afi_rst_n,                   //                 .afi_rst_n
		output wire [31:0] afi_wdata,                   //                 .afi_wdata
		output wire [1:0]  afi_wdata_valid,             //                 .afi_wdata_valid
		output wire [3:0]  afi_dm,                      //                 .afi_dm
		output wire [1:0]  afi_rdata_en,                //                 .afi_rdata_en
		output wire [1:0]  afi_rdata_en_full,           //                 .afi_rdata_en_full
		input  wire [31:0] afi_rdata,                   //                 .afi_rdata
		input  wire [1:0]  afi_rdata_valid,             //                 .afi_rdata_valid
		input  wire        afi_init_req,                // afi_init_cal_req.afi_init_req
		input  wire        afi_cal_req                  //                 .afi_cal_req
	);

	wire         sequencer_rst_reset_out_reset;                            // sequencer_rst:reset_out -> [cpu_inst:reset_n, mm_interconnect_0:cpu_inst_reset_n_reset_bridge_in_reset_reset, mm_interconnect_0:sequencer_phy_mgr_inst_avl_reset_reset_bridge_in_reset_reset, sequencer_phy_mgr_inst:avl_reset_n, sequencer_pll_mgr_inst:avl_reset_n, sequencer_rw_mgr_inst:avl_reset_n]
	wire  [31:0] cpu_inst_data_master_readdata;                            // mm_interconnect_0:cpu_inst_data_master_readdata -> cpu_inst:readdata
	wire         cpu_inst_data_master_waitrequest;                         // mm_interconnect_0:cpu_inst_data_master_waitrequest -> cpu_inst:waitrequest
	wire  [19:0] cpu_inst_data_master_address;                             // cpu_inst:address -> mm_interconnect_0:cpu_inst_data_master_address
	wire         cpu_inst_data_master_read;                                // cpu_inst:read -> mm_interconnect_0:cpu_inst_data_master_read
	wire         cpu_inst_data_master_write;                               // cpu_inst:write -> mm_interconnect_0:cpu_inst_data_master_write
	wire  [31:0] cpu_inst_data_master_writedata;                           // cpu_inst:writedata -> mm_interconnect_0:cpu_inst_data_master_writedata
	wire  [31:0] mm_interconnect_0_sequencer_phy_mgr_inst_avl_readdata;    // sequencer_phy_mgr_inst:avl_readdata -> mm_interconnect_0:sequencer_phy_mgr_inst_avl_readdata
	wire         mm_interconnect_0_sequencer_phy_mgr_inst_avl_waitrequest; // sequencer_phy_mgr_inst:avl_waitrequest -> mm_interconnect_0:sequencer_phy_mgr_inst_avl_waitrequest
	wire  [12:0] mm_interconnect_0_sequencer_phy_mgr_inst_avl_address;     // mm_interconnect_0:sequencer_phy_mgr_inst_avl_address -> sequencer_phy_mgr_inst:avl_address
	wire         mm_interconnect_0_sequencer_phy_mgr_inst_avl_read;        // mm_interconnect_0:sequencer_phy_mgr_inst_avl_read -> sequencer_phy_mgr_inst:avl_read
	wire         mm_interconnect_0_sequencer_phy_mgr_inst_avl_write;       // mm_interconnect_0:sequencer_phy_mgr_inst_avl_write -> sequencer_phy_mgr_inst:avl_write
	wire  [31:0] mm_interconnect_0_sequencer_phy_mgr_inst_avl_writedata;   // mm_interconnect_0:sequencer_phy_mgr_inst_avl_writedata -> sequencer_phy_mgr_inst:avl_writedata
	wire  [31:0] mm_interconnect_0_sequencer_rw_mgr_inst_avl_readdata;     // sequencer_rw_mgr_inst:avl_readdata -> mm_interconnect_0:sequencer_rw_mgr_inst_avl_readdata
	wire         mm_interconnect_0_sequencer_rw_mgr_inst_avl_waitrequest;  // sequencer_rw_mgr_inst:avl_waitrequest -> mm_interconnect_0:sequencer_rw_mgr_inst_avl_waitrequest
	wire  [12:0] mm_interconnect_0_sequencer_rw_mgr_inst_avl_address;      // mm_interconnect_0:sequencer_rw_mgr_inst_avl_address -> sequencer_rw_mgr_inst:avl_address
	wire         mm_interconnect_0_sequencer_rw_mgr_inst_avl_read;         // mm_interconnect_0:sequencer_rw_mgr_inst_avl_read -> sequencer_rw_mgr_inst:avl_read
	wire         mm_interconnect_0_sequencer_rw_mgr_inst_avl_write;        // mm_interconnect_0:sequencer_rw_mgr_inst_avl_write -> sequencer_rw_mgr_inst:avl_write
	wire  [31:0] mm_interconnect_0_sequencer_rw_mgr_inst_avl_writedata;    // mm_interconnect_0:sequencer_rw_mgr_inst_avl_writedata -> sequencer_rw_mgr_inst:avl_writedata
	wire  [31:0] mm_interconnect_0_sequencer_pll_mgr_inst_avl_readdata;    // sequencer_pll_mgr_inst:avl_readdata -> mm_interconnect_0:sequencer_pll_mgr_inst_avl_readdata
	wire         mm_interconnect_0_sequencer_pll_mgr_inst_avl_waitrequest; // sequencer_pll_mgr_inst:avl_waitrequest -> mm_interconnect_0:sequencer_pll_mgr_inst_avl_waitrequest
	wire  [12:0] mm_interconnect_0_sequencer_pll_mgr_inst_avl_address;     // mm_interconnect_0:sequencer_pll_mgr_inst_avl_address -> sequencer_pll_mgr_inst:avl_address
	wire         mm_interconnect_0_sequencer_pll_mgr_inst_avl_read;        // mm_interconnect_0:sequencer_pll_mgr_inst_avl_read -> sequencer_pll_mgr_inst:avl_read
	wire         mm_interconnect_0_sequencer_pll_mgr_inst_avl_write;       // mm_interconnect_0:sequencer_pll_mgr_inst_avl_write -> sequencer_pll_mgr_inst:avl_write
	wire  [31:0] mm_interconnect_0_sequencer_pll_mgr_inst_avl_writedata;   // mm_interconnect_0:sequencer_pll_mgr_inst_avl_writedata -> sequencer_pll_mgr_inst:avl_writedata

	altera_mem_if_sequencer_rst #(
		.DEPTH            (10),
		.CLKEN_LAGS_RESET (0)
	) sequencer_rst (
		.clk       (avl_clk),                       //       clk.clk
		.rst       (avl_reset_n),                   //       rst.reset
		.reset_out (sequencer_rst_reset_out_reset), // reset_out.reset
		.clken_out ()                               // clken_out.clken
	);

	sequencer_m10 #(
		.AVL_DATA_WIDTH       (32),
		.AVL_ADDR_WIDTH       (20),
		.READ_VALID_FIFO_SIZE (16),
		.HPS_PROTOCOL         ("DDR3"),
		.PHY_MGR_BASE         (294912),
		.RW_MGR_BASE          (327680),
		.PLL_MGR_BASE         (360448),
		.MEM_DQ_WIDTH         (8)
	) cpu_inst (
		.clk         (avl_clk),                          //            clk.clk
		.reset_n     (~sequencer_rst_reset_out_reset),   //        reset_n.reset_n
		.address     (cpu_inst_data_master_address),     //    data_master.address
		.write       (cpu_inst_data_master_write),       //               .write
		.writedata   (cpu_inst_data_master_writedata),   //               .writedata
		.read        (cpu_inst_data_master_read),        //               .read
		.readdata    (cpu_inst_data_master_readdata),    //               .readdata
		.waitrequest (cpu_inst_data_master_waitrequest), //               .waitrequest
		.pd_reset_n  (pd_reset_n),                       // phase_detector.pd_reset_n
		.pd_ack      (pd_ack),                           //               .pd_ack
		.pd_up       (pd_up),                            //               .pd_up
		.pd_down     (pd_down)                           //               .pd_down
	);

	sequencer_pll_mgr #(
		.AVL_DATA_WIDTH (32),
		.AVL_ADDR_WIDTH (13)
	) sequencer_pll_mgr_inst (
		.avl_clk            (avl_clk),                                                  //          avl_clk.clk
		.avl_reset_n        (~sequencer_rst_reset_out_reset),                           //        avl_reset.reset_n
		.avl_address        (mm_interconnect_0_sequencer_pll_mgr_inst_avl_address),     //              avl.address
		.avl_write          (mm_interconnect_0_sequencer_pll_mgr_inst_avl_write),       //                 .write
		.avl_writedata      (mm_interconnect_0_sequencer_pll_mgr_inst_avl_writedata),   //                 .writedata
		.avl_read           (mm_interconnect_0_sequencer_pll_mgr_inst_avl_read),        //                 .read
		.avl_readdata       (mm_interconnect_0_sequencer_pll_mgr_inst_avl_readdata),    //                 .readdata
		.avl_waitrequest    (mm_interconnect_0_sequencer_pll_mgr_inst_avl_waitrequest), //                 .waitrequest
		.phasecounterselect (phasecounterselect),                                       //     pll_reconfig.phasecounterselect
		.phasestep          (phasestep),                                                //                 .phasestep
		.phaseupdown        (phaseupdown),                                              //                 .phaseupdown
		.scanclk            (scanclk),                                                  //                 .scanclk
		.phasedone          (phasedone),                                                //                 .phasedone
		.afi_init_req       (afi_init_req),                                             // afi_init_cal_req.afi_init_req
		.afi_cal_req        (afi_cal_req)                                               //                 .afi_cal_req
	);

	sequencer_phy_mgr #(
		.AVL_DATA_WIDTH                    (32),
		.AVL_ADDR_WIDTH                    (13),
		.MAX_LATENCY_COUNT_WIDTH           (5),
		.MEM_IF_READ_DQS_WIDTH             (1),
		.MEM_IF_WRITE_DQS_WIDTH            (1),
		.AFI_DQ_WIDTH                      (32),
		.AFI_DEBUG_INFO_WIDTH              (32),
		.AFI_MAX_WRITE_LATENCY_COUNT_WIDTH (6),
		.AFI_MAX_READ_LATENCY_COUNT_WIDTH  (6),
		.CALIB_VFIFO_OFFSET                (12),
		.CALIB_LFIFO_OFFSET                (4),
		.CALIB_REG_WIDTH                   (8),
		.READ_VALID_FIFO_SIZE              (16),
		.MEM_T_WL                          (5),
		.MEM_T_RL                          (5),
		.CTL_REGDIMM_ENABLED               (0),
		.NUM_WRITE_FR_CYCLE_SHIFTS         (1),
		.VFIFO_CONTROL_WIDTH_PER_DQS       (1),
		.DEVICE_FAMILY                     ("MAX10")
	) sequencer_phy_mgr_inst (
		.avl_clk                     (avl_clk),                                                  //   avl_clk.clk
		.avl_reset_n                 (~sequencer_rst_reset_out_reset),                           // avl_reset.reset_n
		.avl_address                 (mm_interconnect_0_sequencer_phy_mgr_inst_avl_address),     //       avl.address
		.avl_write                   (mm_interconnect_0_sequencer_phy_mgr_inst_avl_write),       //          .write
		.avl_writedata               (mm_interconnect_0_sequencer_phy_mgr_inst_avl_writedata),   //          .writedata
		.avl_read                    (mm_interconnect_0_sequencer_phy_mgr_inst_avl_read),        //          .read
		.avl_readdata                (mm_interconnect_0_sequencer_phy_mgr_inst_avl_readdata),    //          .readdata
		.avl_waitrequest             (mm_interconnect_0_sequencer_phy_mgr_inst_avl_waitrequest), //          .waitrequest
		.phy_clk                     (phy_clk),                                                  //       phy.phy_clk
		.phy_reset_n                 (phy_reset_n),                                              //          .phy_reset_n
		.phy_read_latency_counter    (phy_read_latency_counter),                                 //          .phy_read_latency_counter
		.phy_afi_wlat                (phy_afi_wlat),                                             //          .phy_afi_wlat
		.phy_afi_rlat                (phy_afi_rlat),                                             //          .phy_afi_rlat
		.phy_read_increment_vfifo_fr (phy_read_increment_vfifo_fr),                              //          .phy_read_increment_vfifo_fr
		.phy_read_increment_vfifo_hr (phy_read_increment_vfifo_hr),                              //          .phy_read_increment_vfifo_hr
		.phy_read_increment_vfifo_qr (phy_read_increment_vfifo_qr),                              //          .phy_read_increment_vfifo_qr
		.phy_reset_mem_stable        (phy_reset_mem_stable),                                     //          .phy_reset_mem_stable
		.phy_cal_success             (phy_cal_success),                                          //          .phy_cal_success
		.phy_cal_fail                (phy_cal_fail),                                             //          .phy_cal_fail
		.phy_cal_debug_info          (phy_cal_debug_info),                                       //          .phy_cal_debug_info
		.phy_read_fifo_reset         (phy_read_fifo_reset),                                      //          .phy_read_fifo_reset
		.phy_vfifo_rd_en_override    (phy_vfifo_rd_en_override),                                 //          .phy_vfifo_rd_en_override
		.phy_read_fifo_q             (phy_read_fifo_q),                                          //          .phy_read_fifo_q
		.phy_write_fr_cycle_shifts   (phy_write_fr_cycle_shifts),                                //          .phy_write_fr_cycle_shifts
		.calib_skip_steps            (calib_skip_steps),                                         //     calib.calib_skip_steps
		.phy_mux_sel                 (phy_mux_sel)                                               //   mux_sel.mux_sel
	);

	rw_manager_ddr3 #(
		.RATE                                 ("Half"),
		.AVL_DATA_WIDTH                       (32),
		.AVL_ADDR_WIDTH                       (13),
		.MEM_ADDRESS_WIDTH                    (14),
		.MEM_CONTROL_WIDTH                    (1),
		.MEM_DQ_WIDTH                         (8),
		.MEM_DM_WIDTH                         (1),
		.MEM_NUMBER_OF_RANKS                  (1),
		.MEM_CLK_EN_WIDTH                     (1),
		.MEM_BANK_WIDTH                       (3),
		.MEM_ODT_WIDTH                        (1),
		.MEM_CHIP_SELECT_WIDTH                (1),
		.MEM_READ_DQS_WIDTH                   (1),
		.MEM_WRITE_DQS_WIDTH                  (1),
		.AFI_RATIO                            (2),
		.AC_BUS_WIDTH                         (27),
		.HCX_COMPAT_MODE                      (0),
		.DEVICE_FAMILY                        ("MAX10"),
		.AC_ROM_INIT_FILE_NAME                ("q_sys_ddr3_ram_s0_AC_ROM.hex"),
		.INST_ROM_INIT_FILE_NAME              ("q_sys_ddr3_ram_s0_inst_ROM.hex"),
		.DEBUG_WRITE_TO_READ_RATIO_2_EXPONENT (0),
		.DEBUG_WRITE_TO_READ_RATIO            (1),
		.MAX_DI_BUFFER_WORDS_LOG_2            (2),
		.AP_MODE_EN                           (2'b00),
		.AVL_CLK_PS                           (6667),
		.AFI_CLK_PS                           (6667),
		.ENABLE_NON_DES_CAL                   (0),
		.TREFI                                (35100),
		.REFRESH_INTERVAL                     (15000),
		.TRFC                                 (350)
	) sequencer_rw_mgr_inst (
		.avl_clk           (avl_clk),                                                 //   avl_clk.clk
		.avl_reset_n       (~sequencer_rst_reset_out_reset),                          // avl_reset.reset_n
		.avl_address       (mm_interconnect_0_sequencer_rw_mgr_inst_avl_address),     //       avl.address
		.avl_write         (mm_interconnect_0_sequencer_rw_mgr_inst_avl_write),       //          .write
		.avl_writedata     (mm_interconnect_0_sequencer_rw_mgr_inst_avl_writedata),   //          .writedata
		.avl_read          (mm_interconnect_0_sequencer_rw_mgr_inst_avl_read),        //          .read
		.avl_readdata      (mm_interconnect_0_sequencer_rw_mgr_inst_avl_readdata),    //          .readdata
		.avl_waitrequest   (mm_interconnect_0_sequencer_rw_mgr_inst_avl_waitrequest), //          .waitrequest
		.afi_clk           (afi_clk),                                                 //   afi_clk.clk
		.afi_reset_n       (afi_reset_n),                                             // afi_reset.reset_n
		.afi_addr          (afi_addr),                                                //       afi.afi_addr
		.afi_ba            (afi_ba),                                                  //          .afi_ba
		.afi_cs_n          (afi_cs_n),                                                //          .afi_cs_n
		.afi_cke           (afi_cke),                                                 //          .afi_cke
		.afi_odt           (afi_odt),                                                 //          .afi_odt
		.afi_ras_n         (afi_ras_n),                                               //          .afi_ras_n
		.afi_cas_n         (afi_cas_n),                                               //          .afi_cas_n
		.afi_we_n          (afi_we_n),                                                //          .afi_we_n
		.afi_dqs_burst     (afi_dqs_burst),                                           //          .afi_dqs_burst
		.afi_rst_n         (afi_rst_n),                                               //          .afi_rst_n
		.afi_wdata         (afi_wdata),                                               //          .afi_wdata
		.afi_wdata_valid   (afi_wdata_valid),                                         //          .afi_wdata_valid
		.afi_dm            (afi_dm),                                                  //          .afi_dm
		.afi_rdata_en      (afi_rdata_en),                                            //          .afi_rdata_en
		.afi_rdata_en_full (afi_rdata_en_full),                                       //          .afi_rdata_en_full
		.afi_rdata         (afi_rdata),                                               //          .afi_rdata
		.afi_rdata_valid   (afi_rdata_valid),                                         //          .afi_rdata_valid
		.csr_clk           (),                                                        //       csr.csr_clk
		.csr_ena           (),                                                        //          .csr_ena
		.csr_dout_phy      (),                                                        //          .csr_dout_phy
		.csr_dout          (),                                                        //          .csr_dout
		.afi_rrank         (),                                                        // (terminated)
		.afi_wrank         ()                                                         // (terminated)
	);

	q_sys_ddr3_ram_s0_mm_interconnect_0 mm_interconnect_0 (
		.avl_clk_out_clk_clk                                          (avl_clk),                                                  //                                        avl_clk_out_clk.clk
		.cpu_inst_reset_n_reset_bridge_in_reset_reset                 (sequencer_rst_reset_out_reset),                            //                 cpu_inst_reset_n_reset_bridge_in_reset.reset
		.sequencer_phy_mgr_inst_avl_reset_reset_bridge_in_reset_reset (sequencer_rst_reset_out_reset),                            // sequencer_phy_mgr_inst_avl_reset_reset_bridge_in_reset.reset
		.cpu_inst_data_master_address                                 (cpu_inst_data_master_address),                             //                                   cpu_inst_data_master.address
		.cpu_inst_data_master_waitrequest                             (cpu_inst_data_master_waitrequest),                         //                                                       .waitrequest
		.cpu_inst_data_master_read                                    (cpu_inst_data_master_read),                                //                                                       .read
		.cpu_inst_data_master_readdata                                (cpu_inst_data_master_readdata),                            //                                                       .readdata
		.cpu_inst_data_master_write                                   (cpu_inst_data_master_write),                               //                                                       .write
		.cpu_inst_data_master_writedata                               (cpu_inst_data_master_writedata),                           //                                                       .writedata
		.sequencer_phy_mgr_inst_avl_address                           (mm_interconnect_0_sequencer_phy_mgr_inst_avl_address),     //                             sequencer_phy_mgr_inst_avl.address
		.sequencer_phy_mgr_inst_avl_write                             (mm_interconnect_0_sequencer_phy_mgr_inst_avl_write),       //                                                       .write
		.sequencer_phy_mgr_inst_avl_read                              (mm_interconnect_0_sequencer_phy_mgr_inst_avl_read),        //                                                       .read
		.sequencer_phy_mgr_inst_avl_readdata                          (mm_interconnect_0_sequencer_phy_mgr_inst_avl_readdata),    //                                                       .readdata
		.sequencer_phy_mgr_inst_avl_writedata                         (mm_interconnect_0_sequencer_phy_mgr_inst_avl_writedata),   //                                                       .writedata
		.sequencer_phy_mgr_inst_avl_waitrequest                       (mm_interconnect_0_sequencer_phy_mgr_inst_avl_waitrequest), //                                                       .waitrequest
		.sequencer_pll_mgr_inst_avl_address                           (mm_interconnect_0_sequencer_pll_mgr_inst_avl_address),     //                             sequencer_pll_mgr_inst_avl.address
		.sequencer_pll_mgr_inst_avl_write                             (mm_interconnect_0_sequencer_pll_mgr_inst_avl_write),       //                                                       .write
		.sequencer_pll_mgr_inst_avl_read                              (mm_interconnect_0_sequencer_pll_mgr_inst_avl_read),        //                                                       .read
		.sequencer_pll_mgr_inst_avl_readdata                          (mm_interconnect_0_sequencer_pll_mgr_inst_avl_readdata),    //                                                       .readdata
		.sequencer_pll_mgr_inst_avl_writedata                         (mm_interconnect_0_sequencer_pll_mgr_inst_avl_writedata),   //                                                       .writedata
		.sequencer_pll_mgr_inst_avl_waitrequest                       (mm_interconnect_0_sequencer_pll_mgr_inst_avl_waitrequest), //                                                       .waitrequest
		.sequencer_rw_mgr_inst_avl_address                            (mm_interconnect_0_sequencer_rw_mgr_inst_avl_address),      //                              sequencer_rw_mgr_inst_avl.address
		.sequencer_rw_mgr_inst_avl_write                              (mm_interconnect_0_sequencer_rw_mgr_inst_avl_write),        //                                                       .write
		.sequencer_rw_mgr_inst_avl_read                               (mm_interconnect_0_sequencer_rw_mgr_inst_avl_read),         //                                                       .read
		.sequencer_rw_mgr_inst_avl_readdata                           (mm_interconnect_0_sequencer_rw_mgr_inst_avl_readdata),     //                                                       .readdata
		.sequencer_rw_mgr_inst_avl_writedata                          (mm_interconnect_0_sequencer_rw_mgr_inst_avl_writedata),    //                                                       .writedata
		.sequencer_rw_mgr_inst_avl_waitrequest                        (mm_interconnect_0_sequencer_rw_mgr_inst_avl_waitrequest)   //                                                       .waitrequest
	);

endmodule