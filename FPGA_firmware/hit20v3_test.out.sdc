## Generated SDC file "hit20v3_test.out.sdc"

## Copyright (C) 2019  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

## DATE    "Wed Aug 16 13:45:52 2023"

##
## DEVICE  "10M50DAF484C6GES"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 41.667 -waveform { 0.000 20.833 } [get_ports { altera_reserved_tck }]
create_clock -name {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc} -period 181.818 -waveform { 0.000 90.909 } [get_pins {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}]
create_clock -name {clk_50_max10} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk_50_max10}]
create_clock -name {enet_rx_clk} -period 8.000 -waveform { 0.000 4.000 } [get_ports {enet_rx_clk}]
create_clock -name {virtual_phy_clk} -period 8.000 -waveform { 0.000 4.000 } 
create_clock -name {mem_dqs[0]_IN} -period 3.333 -waveform { 0.000 1.667 } [get_ports {mem_dqs[0]}] -add
create_clock -name {q_sys:q_sys_inst|algo_reconstruction:algo_reconstruction_0|data_in_state.DATA_IN_STATE_FINISH} -period 20.000 -waveform { 0.000 10.000 } 


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 6 -master_clock {clk_50_max10} [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 6 -phase 270/1 -master_clock {clk_50_max10} [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 6 -master_clock {clk_50_max10} [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 6 -phase 270/1 -master_clock {clk_50_max10} [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] 
create_generated_clock -name {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 3 -master_clock {clk_50_max10} [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] 
create_generated_clock -name {q_sys_inst|enet_pll|sd1|pll7|clk[0]} -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|inclk[0]}] -duty_cycle 50/1 -multiply_by 5 -divide_by 2 -master_clock {clk_50_max10} [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] 
create_generated_clock -name {q_sys_inst|enet_pll|sd1|pll7|clk[1]} -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|inclk[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 2 -master_clock {clk_50_max10} [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] 
create_generated_clock -name {q_sys_inst|enet_pll|sd1|pll7|clk[2]} -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|inclk[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 20 -master_clock {clk_50_max10} [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] 
create_generated_clock -name {q_sys_inst|enet_pll|sd1|pll7|clk[3]} -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|inclk[0]}] -duty_cycle 50/1 -multiply_by 5 -divide_by 2 -phase -135/1 -master_clock {clk_50_max10} [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] 
create_generated_clock -name {q_sys_inst|enet_pll|sd1|pll7|clk[4]} -source [get_pins {q_sys_inst|enet_pll|sd1|pll7|inclk[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 2 -phase -90/1 -master_clock {clk_50_max10} [get_pins {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] 
create_generated_clock -name {tx_clk_125} -source [get_pins { q_sys_inst|enet_pll|sd1|pll7|clk[3] }] -master_clock {q_sys_inst|enet_pll|sd1|pll7|clk[3]} [get_pins {tx_clk_to_the_tse_mac|combout}] -add
create_generated_clock -name {tx_clk_25} -source [get_pins { q_sys_inst|enet_pll|sd1|pll7|clk[4] }] -master_clock {q_sys_inst|enet_pll|sd1|pll7|clk[4]} [get_pins {tx_clk_to_the_tse_mac|combout}] -add
create_generated_clock -name {tx_clk_2p5} -source [get_pins { q_sys_inst|enet_pll|sd1|pll7|clk[2] }] -master_clock {q_sys_inst|enet_pll|sd1|pll7|clk[2]} [get_pins {tx_clk_to_the_tse_mac|combout}] -add
create_generated_clock -name {enet_gtx_clk_125} -source [get_pins {tx_clk_to_the_tse_mac|combout}] -master_clock {tx_clk_125} [get_ports {enet_gtx_clk}] -add
create_generated_clock -name {enet_gtx_clk_25} -source [get_pins {tx_clk_to_the_tse_mac|combout}] -master_clock {tx_clk_25} [get_ports {enet_gtx_clk}] -add
create_generated_clock -name {enet_gtx_clk_2p5} -source [get_pins {tx_clk_to_the_tse_mac|combout}] -master_clock {tx_clk_2p5} [get_ports {enet_gtx_clk}] -add
create_generated_clock -name {mem_ck[0]} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -master_clock {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]} [get_ports {mem_ck[0]}] 
create_generated_clock -name {mem_ck_n[0]} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -master_clock {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]} -invert [get_ports {mem_ck_n[0]}] 
create_generated_clock -name {q_sys_inst|ddr3_ram_resync_x2_capture_0} -source [get_pins {q_sys_inst|ddr3_ram|p0|umemphy|dq_ddio[0].ubidir_dq_dqs|dq_ddio_io|clock_divider*_hr_clock.io_clkdiv|clk}] -divide_by 2 -master_clock {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]} [get_pins {q_sys_inst|ddr3_ram|p0|umemphy|dq_ddio[0].ubidir_dq_dqs|dq_ddio_io|clock_divider*_hr_clock.io_clkdiv|clkout}] 
create_generated_clock -name {mem_dqs[0]_OUT} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -master_clock {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]} [get_ports {mem_dqs[0]}] -add
create_generated_clock -name {mem_dqs_n[0]_OUT} -source [get_pins {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -master_clock {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]} -invert [get_ports {mem_dqs_n[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {mem_dqs_n[0]_OUT}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs_n[0]_OUT}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs_n[0]_OUT}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs_n[0]_OUT}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_OUT}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_OUT}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_OUT}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_OUT}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_OUT}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_OUT}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_OUT}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_OUT}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_dqs[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_dqs[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_ck_n[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_ck_n[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_ck[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_ck[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_gtx_clk_2p5}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_gtx_clk_2p5}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_gtx_clk_25}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_gtx_clk_25}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_gtx_clk_125}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_gtx_clk_125}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {tx_clk_2p5}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {tx_clk_2p5}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {virtual_phy_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {virtual_phy_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {clk_50_max10}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {clk_50_max10}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_rx_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_rx_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {tx_clk_125}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {tx_clk_125}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {tx_clk_25}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {tx_clk_25}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_dqs[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_dqs[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_ck_n[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_ck_n[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {mem_ck[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {mem_ck[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_gtx_clk_2p5}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_gtx_clk_2p5}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_gtx_clk_25}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_gtx_clk_25}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_gtx_clk_125}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_gtx_clk_125}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {tx_clk_2p5}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {tx_clk_2p5}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {virtual_phy_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {virtual_phy_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {clk_50_max10}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {clk_50_max10}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {enet_rx_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {enet_rx_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {tx_clk_125}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {tx_clk_125}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {tx_clk_25}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {tx_clk_25}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_dqs[0]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck_n[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck_n[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck_n[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck_n[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck_n[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {mem_ck_n[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {mem_ck_n[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck_n[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck_n[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck_n[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck_n[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {mem_ck_n[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {mem_ck[0]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_2p5}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_25}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_gtx_clk_125}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[0]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_dqs_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_dqs[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_ck_n[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {mem_ck[0]}]  0.025  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_gtx_clk_2p5}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_gtx_clk_2p5}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {tx_clk_2p5}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {tx_clk_2p5}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {enet_gtx_clk_2p5}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {enet_gtx_clk_2p5}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -rise_to [get_clocks {tx_clk_2p5}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_2p5}] -fall_to [get_clocks {tx_clk_2p5}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {clk_50_max10}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {clk_50_max10}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -rise_to [get_clocks {clk_50_max10}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}] -fall_to [get_clocks {clk_50_max10}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -rise_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {virtual_phy_clk}] -fall_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {clk_50_max10}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {clk_50_max10}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[4]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[3]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[2]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {clk_50_max10}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {clk_50_max10}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -rise_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {clk_50_max10}] -fall_to [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {clk_50_max10}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {clk_50_max10}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {clk_50_max10}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {clk_50_max10}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram_resync_x2_capture_0}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|enet_pll|sd1|pll7|clk[1]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {clk_50_max10}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {clk_50_max10}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {clk_50_max10}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {clk_50_max10}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[4]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -rise_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {enet_rx_clk}] -fall_to [get_clocks {enet_rx_clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_gtx_clk_125}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_gtx_clk_125}] -hold 0.140  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_gtx_clk_125}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_gtx_clk_125}] -hold 0.140  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {tx_clk_125}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {tx_clk_125}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_gtx_clk_125}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {enet_gtx_clk_125}] -hold 0.140  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_gtx_clk_125}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {enet_gtx_clk_125}] -hold 0.140  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -rise_to [get_clocks {tx_clk_125}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_125}] -fall_to [get_clocks {tx_clk_125}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_gtx_clk_25}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_gtx_clk_25}] -hold 0.140  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_gtx_clk_25}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_gtx_clk_25}] -hold 0.140  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {tx_clk_25}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {tx_clk_25}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_gtx_clk_25}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {enet_gtx_clk_25}] -hold 0.140  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_gtx_clk_25}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {enet_gtx_clk_25}] -hold 0.140  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -rise_to [get_clocks {tx_clk_25}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {tx_clk_25}] -fall_to [get_clocks {tx_clk_25}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[1]}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {clk_50_max10}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {clk_50_max10}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {clk_50_max10}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {clk_50_max10}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {clk_50_max10}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -rise_to [get_clocks {clk_50_max10}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {clk_50_max10}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {q_sys_inst|onchip_flash|altera_onchip_flash_block|ufm_block|osc}] -fall_to [get_clocks {clk_50_max10}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock_fall -clock [get_clocks {altera_reserved_tck}]  5.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {altera_reserved_tck}]  5.000 [get_ports {altera_reserved_tms}]
set_input_delay -add_delay  -clock [get_clocks {clk_50_max10}]  2.000 [get_ports {enet_mdio}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[0]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[0]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[0]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[0]}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[1]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[1]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[1]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[1]}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[2]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[2]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[2]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[2]}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[3]}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[3]}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_d[3]}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_d[3]}]
set_input_delay -add_delay -max -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -min -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -max -clock_fall -clock [get_clocks {virtual_phy_clk}]  1.600 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -min -clock_fall -clock [get_clocks {virtual_phy_clk}]  -0.800 [get_ports {enet_rx_dv}]
set_input_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  10.000 [get_ports {qspi_io[0]}]
set_input_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  10.000 [get_ports {qspi_io[1]}]
set_input_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  10.000 [get_ports {qspi_io[2]}]
set_input_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  10.000 [get_ports {qspi_io[3]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  5.000 [get_ports {altera_reserved_tdo}]
set_output_delay -add_delay  -clock [get_clocks {clk_50_max10}]  2.000 [get_ports {enet_mdc}]
set_output_delay -add_delay  -clock [get_clocks {clk_50_max10}]  2.000 [get_ports {enet_mdio}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[0]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[1]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[2]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_d[3]}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  1.000 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_2p5}]  -0.800 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  1.000 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_25}]  -0.800 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  1.000 [get_ports {enet_tx_en}]
set_output_delay -add_delay -min -clock_fall -clock [get_clocks {enet_gtx_clk_125}]  -0.800 [get_ports {enet_tx_en}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[1]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[1]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[2]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[2]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[3]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[3]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[4]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[4]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[5]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[5]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[6]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[6]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[7]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[7]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[8]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[8]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[9]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[9]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[10]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[10]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[11]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[11]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[12]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[12]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_a[13]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_a[13]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_ba[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_ba[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_ba[1]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_ba[1]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_ba[2]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_ba[2]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_cas_n[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_cas_n[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_cke[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_cke[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_cs_n[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_cs_n[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dm[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dm[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dm[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dm[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[1]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[1]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[1]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[1]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[2]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[2]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[2]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[2]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[3]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[3]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[3]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[3]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[4]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[4]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[4]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[4]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[5]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[5]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[5]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[5]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[6]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[6]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[6]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[6]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs_n[0]_OUT}]  0.368 [get_ports {mem_dq[7]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs_n[0]_OUT}]  -0.406 [get_ports {mem_dq[7]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_dqs[0]_OUT}]  0.368 [get_ports {mem_dq[7]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_dqs[0]_OUT}]  -0.406 [get_ports {mem_dq[7]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  1.510 [get_ports {mem_dqs[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  1.756 [get_ports {mem_dqs[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_odt[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_odt[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_ras_n[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_ras_n[0]}]
set_output_delay -add_delay -max -clock [get_clocks {mem_ck[0]}]  0.561 [get_ports {mem_we_n[0]}]
set_output_delay -add_delay -min -clock [get_clocks {mem_ck[0]}]  -0.585 [get_ports {mem_we_n[0]}]
set_output_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  11.000 [get_ports {qspi_clk}]
set_output_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  11.000 [get_ports {qspi_csn}]
set_output_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  11.000 [get_ports {qspi_io[0]}]
set_output_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  11.000 [get_ports {qspi_io[1]}]
set_output_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  11.000 [get_ports {qspi_io[2]}]
set_output_delay -add_delay -rise -min -clock [get_clocks {clk_50_max10}]  11.000 [get_ports {qspi_io[3]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_125}] -group [get_clocks {tx_clk_25}] -group [get_clocks {tx_clk_2p5}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_125}] -group [get_clocks {enet_gtx_clk_25 enet_gtx_clk_2p5}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_25}] -group [get_clocks {enet_gtx_clk_125 enet_gtx_clk_2p5}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_2p5}] -group [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25}] 
set_clock_groups -exclusive -group [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}] -group [get_clocks {enet_rx_clk}] -group [get_clocks {clk_50_max10}] 
set_clock_groups -logically_exclusive -group [get_clocks {clk_50_max10 q_sys:q_sys_inst|algo_reconstruction:algo_reconstruction_0|data_in_state.DATA_IN_STATE_FINISH}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -setup -rise_from  [get_clocks {virtual_phy_clk}]  -fall_to  [get_clocks {enet_rx_clk}]
set_false_path -setup -fall_from  [get_clocks {virtual_phy_clk}]  -rise_to  [get_clocks {enet_rx_clk}]
set_false_path -hold -rise_from  [get_clocks {virtual_phy_clk}]  -rise_to  [get_clocks {enet_rx_clk}]
set_false_path -hold -fall_from  [get_clocks {virtual_phy_clk}]  -fall_to  [get_clocks {enet_rx_clk}]
set_false_path -setup -rise_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -fall_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path -setup -fall_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -rise_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path -hold -rise_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -rise_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path -hold -fall_from  [get_clocks {tx_clk_125 tx_clk_25 tx_clk_2p5}]  -fall_to  [get_clocks {enet_gtx_clk_125 enet_gtx_clk_25 enet_gtx_clk_2p5}]
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -to [get_keepers {*phasedone_state*}]
set_false_path -to [get_keepers {*internal_phasestep*}]
set_false_path -to [get_ports {enet_gtx_clk}]
set_false_path -from [get_ports {fpga_resetn}] 
set_false_path -from [get_ports {user_dipsw[*]}] 
set_false_path -from [get_ports {user_pb[*]}] 
set_false_path -to [get_ports {user_led[*]}]
set_false_path -to [get_ports {enet_resetn}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -to [get_registers {*|flash_busy_reg}]
set_false_path -to [get_registers {*|flash_busy_clear_reg}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|command_config[9]}] -to [get_registers {*|altera_tse_mac_tx:U_TX|*}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|mac_0[*]}] -to [get_registers {*|altera_tse_mac_tx:U_TX|*}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|mac_1[*]}] -to [get_registers {*|altera_tse_mac_tx:U_TX|*}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|mac_0[*]}] -to [get_registers {*|altera_tse_mac_rx:U_RX|*}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|mac_1[*]}] -to [get_registers {*|altera_tse_mac_rx:U_RX|*}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|frm_length[*]}] -to [get_registers {*|altera_tse_mac_rx:U_RX|*}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|mac_0[*]}] -to [get_registers {*|altera_tse_magic_detection:U_MAGIC|*}]
set_false_path -from [get_registers {*|altera_tse_register_map:U_REG|mac_1[*]}] -to [get_registers {*|altera_tse_magic_detection:U_MAGIC|*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|altera_tse_reset_synchronizer:*|altera_tse_reset_synchronizer_chain*|clrn}]
set_false_path -fall_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -to [get_ports {{mem_dqs[0]}}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[0]}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[1]}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[2]}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[3]}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[4]}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[5]}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[6]}]
set_false_path -from [get_registers {*dq_ddio_io*oe_path_enhanced_ddr.fr_oe_data_ddio~DFF*}] -to [get_ports {mem_dq[7]}]
set_false_path -rise_from [get_clocks {q_sys_inst|ddr3_ram|pll0|upll_memphy|auto_generated|pll1|clk[0]}] -to [get_ports {{mem_a[0]} {mem_a[10]} {mem_a[11]} {mem_a[12]} {mem_a[13]} {mem_a[1]} {mem_a[2]} {mem_a[3]} {mem_a[4]} {mem_a[5]} {mem_a[6]} {mem_a[7]} {mem_a[8]} {mem_a[9]} {mem_ba[0]} {mem_ba[1]} {mem_ba[2]} {mem_cs_n[0]} {mem_we_n[0]} {mem_ras_n[0]} {mem_cas_n[0]} {mem_cke[0]} {mem_odt[0]}}]
set_false_path -from [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_nios2_oci_break:the_q_sys_cpu_cpu_nios2_oci_break|break_readreg*}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_tck:the_q_sys_cpu_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_nios2_oci_debug:the_q_sys_cpu_cpu_nios2_oci_debug|*resetlatch}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_tck:the_q_sys_cpu_cpu_debug_slave_tck|*sr[33]}]
set_false_path -from [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_nios2_oci_debug:the_q_sys_cpu_cpu_nios2_oci_debug|monitor_ready}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_tck:the_q_sys_cpu_cpu_debug_slave_tck|*sr[0]}]
set_false_path -from [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_nios2_oci_debug:the_q_sys_cpu_cpu_nios2_oci_debug|monitor_error}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_tck:the_q_sys_cpu_cpu_debug_slave_tck|*sr[34]}]
set_false_path -from [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_nios2_ocimem:the_q_sys_cpu_cpu_nios2_ocimem|*MonDReg*}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_tck:the_q_sys_cpu_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_tck:the_q_sys_cpu_cpu_debug_slave_tck|*sr*}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_sysclk:the_q_sys_cpu_cpu_debug_slave_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_debug_slave_wrapper:the_q_sys_cpu_cpu_debug_slave_wrapper|q_sys_cpu_cpu_debug_slave_sysclk:the_q_sys_cpu_cpu_debug_slave_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*q_sys_cpu_cpu:*|q_sys_cpu_cpu_nios2_oci:the_q_sys_cpu_cpu_nios2_oci|q_sys_cpu_cpu_nios2_oci_debug:the_q_sys_cpu_cpu_nios2_oci_debug|monitor_go}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*}] -to [get_registers *] 5
set_multicycle_path -setup -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] -to [get_registers *] 5
set_multicycle_path -setup -end -from [get_registers *] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] 5
set_multicycle_path -hold -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_altsyncram_dpm_fifo:U_RTSM|altsyncram*}] -to [get_registers *] 5
set_multicycle_path -hold -end -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] -to [get_registers *] 5
set_multicycle_path -hold -end -from [get_registers *] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_retransmit_cntl:U_RETR|*}] 5


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] 100.000
set_max_delay -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers *] -to [get_registers {*altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|out_data_buffer[*]}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_13:TX_STATUS|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_13:TX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_2|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_34:RX_STATUS|wr_g_ptr_reg[*]}] -to [get_registers {*altera_tse_a_fifo_34:RX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_loopback_ff:U_LBFF|altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_RD_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_loopback_ff:U_LBFF|altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 100.000
set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|dout_reg_sft*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000
set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|eop_sft*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000
set_max_delay -from [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|sop_reg*}] -to [get_registers {*|altera_tse_top_w_fifo:U_MAC|altera_tse_top_1geth:U_GETH|altera_tse_mac_tx:U_TX|*}] 7.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] -100.000
set_min_delay -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers *] -to [get_registers {*altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|out_data_buffer[*]}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_LATE_COL|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|in_data_toggle}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|out_data_toggle_flopped}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_EXCESS_COL|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_13:TX_STATUS|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_13:TX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_2|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_34:RX_STATUS|wr_g_ptr_reg[*]}] -to [get_registers {*altera_tse_a_fifo_34:RX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_loopback_ff:U_LBFF|altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_RD_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000
set_min_delay -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_loopback_ff:U_LBFF|altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] -100.000


#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Net Delay
#**************************************************************

set_net_delay -max 2.000 -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}]
set_net_delay -max 2.000 -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*|q}] -to [get_registers {*altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_clock_crosser:*|in_data_toggle|q}] -to [get_registers {*altera_tse_clock_crosser:*|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_clock_crosser:*|out_data_toggle_flopped|q}] -to [get_registers {*altera_tse_clock_crosser:*|altera_eth_tse_std_synchronizer:out_to_in_synchronizer|altera_std_synchronizer_nocut:*|din_s1}]
set_net_delay -max 4.000 -from [get_pins -compatibility_mode {*altera_tse_clock_crosser:*|in_data_buffer[*]|q}] -to [get_registers {*altera_tse_clock_crosser:*|out_data_buffer[*]}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_13:TX_STATUS|altera_tse_gray_cnt:U_WRT|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_13:TX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_2|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_34:RX_STATUS|wr_g_ptr_reg[*]|q}] -to [get_registers {*altera_tse_a_fifo_34:RX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_RD|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_RD_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]
set_net_delay -max 6.000 -from [get_pins -compatibility_mode {*altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_WRT|g_out[*]|q}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}]


#**************************************************************
# Set Max Skew
#**************************************************************

set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_convert_addr_tx_clock_crosser|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_tx_counter_cntl:U_TXCNT|altera_tse_clock_crosser:host_data_tx_clock_crosser|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_data_clock_cross|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_rx_counter_cntl:U_RXCNT|altera_tse_clock_crosser:host_convert_addr_clock_cross|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_6|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_7|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_8|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_10|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_11|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|in_data_toggle q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|in_data_buffer[*]}] -to [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|altera_eth_tse_std_synchronizer:in_to_out_synchronizer|altera_std_synchronizer_nocut:*|din_s1 q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_mac_control:U_MAC_CONTROL|altera_tse_register_map:U_REG|altera_tse_clock_crosser:U_SYNC_12|out_data_buffer[*]}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_opt_1246:TX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:TX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_1|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_opt_1246:RX_DATA|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_opt_1246:RX_DATA|altera_eth_tse_std_synchronizer_bundle:U_SYNC_3|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_tx_min_ff:U_TXFF|altera_tse_a_fifo_13:TX_STATUS|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_13:TX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_2|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_top_w_fifo:U_MAC|altera_tse_rx_min_ff:U_RXFF|altera_tse_a_fifo_34:RX_STATUS|wr_g_ptr_reg[*]}] -to [get_registers {*altera_tse_a_fifo_34:RX_STATUS|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_loopback_ff:U_LBFF|altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_RD_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_registers {q_sys:q_sys_inst|q_sys_eth_tse:eth_tse|altera_eth_tse_mac:i_tse_mac|altera_tse_top_w_fifo_10_100_1000:U_MAC_TOP|altera_tse_loopback_ff:U_LBFF|altera_tse_a_fifo_24:U_LBFF|altera_tse_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*altera_tse_a_fifo_24:U_LBFF|altera_eth_tse_std_synchronizer_bundle:U_SYNC_WR_G_PTR|altera_eth_tse_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1*}] 7.500 
set_max_skew -from [get_ports {mem_dq[0]}] -to * 0.100 
set_max_skew -from [get_ports {mem_dq[1]}] -to * 0.100 
set_max_skew -from [get_ports {mem_dq[2]}] -to * 0.100 
set_max_skew -from [get_ports {mem_dq[3]}] -to * 0.100 
set_max_skew -from [get_ports {mem_dq[4]}] -to * 0.100 
set_max_skew -from [get_ports {mem_dq[5]}] -to * 0.100 
set_max_skew -from [get_ports {mem_dq[6]}] -to * 0.100 
set_max_skew -from [get_ports {mem_dq[7]}] -to * 0.100 
set_max_skew -from * -to [get_ports {mem_dqs[0]}] 0.100 
set_max_skew -from * -to [get_ports {mem_dqs_n[0]}] 0.100 
set_max_skew -from * -to [get_ports {mem_ck[0]}] 0.100 
set_max_skew -from * -to [get_ports {mem_ck_n[0]}] 0.100 
set_max_skew -from * -to [get_ports {mem_reset_n}] 0.100 
