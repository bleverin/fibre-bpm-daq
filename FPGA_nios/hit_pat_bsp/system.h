/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu' in SOPC Builder design 'q_sys'
 * SOPC Builder design path: D:/hit20v3/software/hit_pat/q_sys.sopcinfo
 *
 * Generated: Fri Oct 11 10:12:20 CEST 2024
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x18402820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1d
#define ALT_CPU_DCACHE_BYPASS_MASK 0x80000000
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x08000120
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_EXTRA_EXCEPTION_INFO
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 2048
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x1d
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x14000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x18402820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x1d
#define NIOS2_DCACHE_BYPASS_MASK 0x80000000
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x08000120
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_EXTRA_EXCEPTION_INFO
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 2048
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x1d
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x14000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_UART
#define __ALTERA_ETH_TSE
#define __ALTERA_GENERIC_QUAD_SPI_CONTROLLER
#define __ALTERA_MEM_IF_DDR3_EMIF
#define __ALTERA_MSGDMA
#define __ALTERA_NIOS2_GEN2
#define __ALTERA_ONCHIP_FLASH
#define __SENSOR_RECON
#define __UDP_GENERATOR


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "MAX 10"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/debug_uart"
#define ALT_STDERR_BASE 0x18403c20
#define ALT_STDERR_DEV debug_uart
#define ALT_STDERR_IS_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_uart"
#define ALT_STDIN "/dev/debug_uart"
#define ALT_STDIN_BASE 0x18403c20
#define ALT_STDIN_DEV debug_uart
#define ALT_STDIN_IS_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_uart"
#define ALT_STDOUT "/dev/debug_uart"
#define ALT_STDOUT_BASE 0x18403c20
#define ALT_STDOUT_DEV debug_uart
#define ALT_STDOUT_IS_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_uart"
#define ALT_SYSTEM_NAME "q_sys"


/*
 * altera_iniche configuration
 *
 */

#define INCLUDE_TCP
#define INICHE_DEFAULT_IF "NOT_USED"


/*
 * button_pio configuration
 *
 */

#define ALT_MODULE_CLASS_button_pio altera_avalon_pio
#define BUTTON_PIO_BASE 0x18403d40
#define BUTTON_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define BUTTON_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BUTTON_PIO_CAPTURE 0
#define BUTTON_PIO_DATA_WIDTH 9
#define BUTTON_PIO_DO_TEST_BENCH_WIRING 0
#define BUTTON_PIO_DRIVEN_SIM_VALUE 0
#define BUTTON_PIO_EDGE_TYPE "NONE"
#define BUTTON_PIO_FREQ 50000000
#define BUTTON_PIO_HAS_IN 1
#define BUTTON_PIO_HAS_OUT 0
#define BUTTON_PIO_HAS_TRI 0
#define BUTTON_PIO_IRQ -1
#define BUTTON_PIO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define BUTTON_PIO_IRQ_TYPE "NONE"
#define BUTTON_PIO_NAME "/dev/button_pio"
#define BUTTON_PIO_RESET_VALUE 0
#define BUTTON_PIO_SPAN 16
#define BUTTON_PIO_TYPE "altera_avalon_pio"


/*
 * calibration_ram configuration
 *
 */

#define ALT_MODULE_CLASS_calibration_ram altera_avalon_onchip_memory2
#define CALIBRATION_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define CALIBRATION_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define CALIBRATION_RAM_BASE 0x18403400
#define CALIBRATION_RAM_CONTENTS_INFO ""
#define CALIBRATION_RAM_DUAL_PORT 1
#define CALIBRATION_RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define CALIBRATION_RAM_INIT_CONTENTS_FILE "q_sys_calibration_ram"
#define CALIBRATION_RAM_INIT_MEM_CONTENT 0
#define CALIBRATION_RAM_INSTANCE_ID "NONE"
#define CALIBRATION_RAM_IRQ -1
#define CALIBRATION_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CALIBRATION_RAM_NAME "/dev/calibration_ram"
#define CALIBRATION_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define CALIBRATION_RAM_RAM_BLOCK_TYPE "AUTO"
#define CALIBRATION_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define CALIBRATION_RAM_SINGLE_CLOCK_OP 0
#define CALIBRATION_RAM_SIZE_MULTIPLE 1
#define CALIBRATION_RAM_SIZE_VALUE 640
#define CALIBRATION_RAM_SPAN 640
#define CALIBRATION_RAM_TYPE "altera_avalon_onchip_memory2"
#define CALIBRATION_RAM_WRITABLE 1


/*
 * ddr3_ram configuration
 *
 */

#define ALT_MODULE_CLASS_ddr3_ram altera_mem_if_ddr3_emif
#define DDR3_RAM_BASE 0x8000000
#define DDR3_RAM_IRQ -1
#define DDR3_RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DDR3_RAM_NAME "/dev/ddr3_ram"
#define DDR3_RAM_SPAN 134217728
#define DDR3_RAM_TYPE "altera_mem_if_ddr3_emif"


/*
 * debug_uart configuration
 *
 */

#define ALT_MODULE_CLASS_debug_uart altera_avalon_uart
#define DEBUG_UART_BASE 0x18403c20
#define DEBUG_UART_BAUD 115200
#define DEBUG_UART_DATA_BITS 8
#define DEBUG_UART_FIXED_BAUD 1
#define DEBUG_UART_FREQ 50000000
#define DEBUG_UART_IRQ 4
#define DEBUG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define DEBUG_UART_NAME "/dev/debug_uart"
#define DEBUG_UART_PARITY 'N'
#define DEBUG_UART_SIM_CHAR_STREAM ""
#define DEBUG_UART_SIM_TRUE_BAUD 0
#define DEBUG_UART_SPAN 32
#define DEBUG_UART_STOP_BITS 1
#define DEBUG_UART_SYNC_REG_DEPTH 2
#define DEBUG_UART_TYPE "altera_avalon_uart"
#define DEBUG_UART_USE_CTS_RTS 0
#define DEBUG_UART_USE_EOP_REGISTER 0


/*
 * descriptor_memory configuration
 *
 */

#define ALT_MODULE_CLASS_descriptor_memory altera_avalon_onchip_memory2
#define DESCRIPTOR_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define DESCRIPTOR_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define DESCRIPTOR_MEMORY_BASE 0x18400000
#define DESCRIPTOR_MEMORY_CONTENTS_INFO ""
#define DESCRIPTOR_MEMORY_DUAL_PORT 0
#define DESCRIPTOR_MEMORY_GUI_RAM_BLOCK_TYPE "AUTO"
#define DESCRIPTOR_MEMORY_INIT_CONTENTS_FILE "q_sys_descriptor_memory"
#define DESCRIPTOR_MEMORY_INIT_MEM_CONTENT 0
#define DESCRIPTOR_MEMORY_INSTANCE_ID "NONE"
#define DESCRIPTOR_MEMORY_IRQ -1
#define DESCRIPTOR_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DESCRIPTOR_MEMORY_NAME "/dev/descriptor_memory"
#define DESCRIPTOR_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define DESCRIPTOR_MEMORY_RAM_BLOCK_TYPE "AUTO"
#define DESCRIPTOR_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define DESCRIPTOR_MEMORY_SINGLE_CLOCK_OP 0
#define DESCRIPTOR_MEMORY_SIZE_MULTIPLE 1
#define DESCRIPTOR_MEMORY_SIZE_VALUE 8192
#define DESCRIPTOR_MEMORY_SPAN 8192
#define DESCRIPTOR_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define DESCRIPTOR_MEMORY_WRITABLE 1


/*
 * eth_tse configuration
 *
 */

#define ALT_MODULE_CLASS_eth_tse altera_eth_tse
#define ETH_TSE_BASE 0x18403000
#define ETH_TSE_ENABLE_MACLITE 0
#define ETH_TSE_FIFO_WIDTH 32
#define ETH_TSE_IRQ -1
#define ETH_TSE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ETH_TSE_IS_MULTICHANNEL_MAC 0
#define ETH_TSE_MACLITE_GIGE 0
#define ETH_TSE_MDIO_SHARED 0
#define ETH_TSE_NAME "/dev/eth_tse"
#define ETH_TSE_NUMBER_OF_CHANNEL 1
#define ETH_TSE_NUMBER_OF_MAC_MDIO_SHARED 1
#define ETH_TSE_PCS 0
#define ETH_TSE_PCS_ID 0
#define ETH_TSE_PCS_SGMII 1
#define ETH_TSE_RECEIVE_FIFO_DEPTH 2048
#define ETH_TSE_REGISTER_SHARED 0
#define ETH_TSE_RGMII 1
#define ETH_TSE_SPAN 1024
#define ETH_TSE_TRANSMIT_FIFO_DEPTH 2048
#define ETH_TSE_TYPE "altera_eth_tse"
#define ETH_TSE_USE_MDIO 1


/*
 * ext_flash_avl_csr configuration
 *
 */

#define ALT_MODULE_CLASS_ext_flash_avl_csr altera_generic_quad_spi_controller
#define EXT_FLASH_AVL_CSR_BASE 0x18403d20
#define EXT_FLASH_AVL_CSR_FLASH_TYPE "Micron512"
#define EXT_FLASH_AVL_CSR_IRQ 5
#define EXT_FLASH_AVL_CSR_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EXT_FLASH_AVL_CSR_IS_EPCS 0
#define EXT_FLASH_AVL_CSR_NAME "/dev/ext_flash_avl_csr"
#define EXT_FLASH_AVL_CSR_NUMBER_OF_SECTORS 1024
#define EXT_FLASH_AVL_CSR_PAGE_SIZE 256
#define EXT_FLASH_AVL_CSR_SECTOR_SIZE 65536
#define EXT_FLASH_AVL_CSR_SPAN 32
#define EXT_FLASH_AVL_CSR_SUBSECTOR_SIZE 4096
#define EXT_FLASH_AVL_CSR_TYPE "altera_generic_quad_spi_controller"


/*
 * ext_flash_avl_mem configuration
 *
 */

#define ALT_MODULE_CLASS_ext_flash_avl_mem altera_generic_quad_spi_controller
#define EXT_FLASH_AVL_MEM_BASE 0x14000000
#define EXT_FLASH_AVL_MEM_FLASH_TYPE "Micron512"
#define EXT_FLASH_AVL_MEM_IRQ -1
#define EXT_FLASH_AVL_MEM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define EXT_FLASH_AVL_MEM_IS_EPCS 0
#define EXT_FLASH_AVL_MEM_NAME "/dev/ext_flash_avl_mem"
#define EXT_FLASH_AVL_MEM_NUMBER_OF_SECTORS 1024
#define EXT_FLASH_AVL_MEM_PAGE_SIZE 256
#define EXT_FLASH_AVL_MEM_SECTOR_SIZE 65536
#define EXT_FLASH_AVL_MEM_SPAN 67108864
#define EXT_FLASH_AVL_MEM_SUBSECTOR_SIZE 4096
#define EXT_FLASH_AVL_MEM_TYPE "altera_generic_quad_spi_controller"


/*
 * frame_timer configuration
 *
 */

#define ALT_MODULE_CLASS_frame_timer altera_avalon_timer
#define FRAME_TIMER_ALWAYS_RUN 0
#define FRAME_TIMER_BASE 0x18403c00
#define FRAME_TIMER_COUNTER_SIZE 32
#define FRAME_TIMER_FIXED_PERIOD 0
#define FRAME_TIMER_FREQ 50000000
#define FRAME_TIMER_IRQ -1
#define FRAME_TIMER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FRAME_TIMER_LOAD_VALUE 4999
#define FRAME_TIMER_MULT 2.0E-8
#define FRAME_TIMER_NAME "/dev/frame_timer"
#define FRAME_TIMER_PERIOD 5000
#define FRAME_TIMER_PERIOD_UNITS "clocks"
#define FRAME_TIMER_RESET_OUTPUT 0
#define FRAME_TIMER_SNAPSHOT 0
#define FRAME_TIMER_SPAN 32
#define FRAME_TIMER_TICKS_PER_SEC 10000
#define FRAME_TIMER_TIMEOUT_PULSE_OUTPUT 1
#define FRAME_TIMER_TYPE "altera_avalon_timer"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 16
#define ALT_SYS_CLK SYS_CLK_TIMER
#define ALT_TIMESTAMP_CLK none


/*
 * msgdma_rx_csr configuration
 *
 */

#define ALT_MODULE_CLASS_msgdma_rx_csr altera_msgdma
#define MSGDMA_RX_CSR_BASE 0x18403ce0
#define MSGDMA_RX_CSR_BURST_ENABLE 0
#define MSGDMA_RX_CSR_BURST_WRAPPING_SUPPORT 0
#define MSGDMA_RX_CSR_CHANNEL_ENABLE 0
#define MSGDMA_RX_CSR_CHANNEL_ENABLE_DERIVED 0
#define MSGDMA_RX_CSR_CHANNEL_WIDTH 8
#define MSGDMA_RX_CSR_DATA_FIFO_DEPTH 32
#define MSGDMA_RX_CSR_DATA_WIDTH 32
#define MSGDMA_RX_CSR_DESCRIPTOR_FIFO_DEPTH 8
#define MSGDMA_RX_CSR_DMA_MODE 2
#define MSGDMA_RX_CSR_ENHANCED_FEATURES 0
#define MSGDMA_RX_CSR_ERROR_ENABLE 1
#define MSGDMA_RX_CSR_ERROR_ENABLE_DERIVED 1
#define MSGDMA_RX_CSR_ERROR_WIDTH 6
#define MSGDMA_RX_CSR_IRQ -1
#define MSGDMA_RX_CSR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MSGDMA_RX_CSR_MAX_BURST_COUNT 2
#define MSGDMA_RX_CSR_MAX_BYTE 2048
#define MSGDMA_RX_CSR_MAX_STRIDE 1
#define MSGDMA_RX_CSR_NAME "/dev/msgdma_rx_csr"
#define MSGDMA_RX_CSR_PACKET_ENABLE 1
#define MSGDMA_RX_CSR_PACKET_ENABLE_DERIVED 1
#define MSGDMA_RX_CSR_PREFETCHER_ENABLE 1
#define MSGDMA_RX_CSR_PROGRAMMABLE_BURST_ENABLE 0
#define MSGDMA_RX_CSR_RESPONSE_PORT 2
#define MSGDMA_RX_CSR_SPAN 32
#define MSGDMA_RX_CSR_STRIDE_ENABLE 0
#define MSGDMA_RX_CSR_STRIDE_ENABLE_DERIVED 0
#define MSGDMA_RX_CSR_TRANSFER_TYPE "Aligned Accesses"
#define MSGDMA_RX_CSR_TYPE "altera_msgdma"


/*
 * msgdma_rx_prefetcher_csr configuration
 *
 */

#define ALT_MODULE_CLASS_msgdma_rx_prefetcher_csr altera_msgdma
#define MSGDMA_RX_PREFETCHER_CSR_BASE 0x18403c80
#define MSGDMA_RX_PREFETCHER_CSR_BURST_ENABLE 0
#define MSGDMA_RX_PREFETCHER_CSR_BURST_WRAPPING_SUPPORT 0
#define MSGDMA_RX_PREFETCHER_CSR_CHANNEL_ENABLE 0
#define MSGDMA_RX_PREFETCHER_CSR_CHANNEL_ENABLE_DERIVED 0
#define MSGDMA_RX_PREFETCHER_CSR_CHANNEL_WIDTH 8
#define MSGDMA_RX_PREFETCHER_CSR_DATA_FIFO_DEPTH 32
#define MSGDMA_RX_PREFETCHER_CSR_DATA_WIDTH 32
#define MSGDMA_RX_PREFETCHER_CSR_DESCRIPTOR_FIFO_DEPTH 8
#define MSGDMA_RX_PREFETCHER_CSR_DMA_MODE 2
#define MSGDMA_RX_PREFETCHER_CSR_ENHANCED_FEATURES 0
#define MSGDMA_RX_PREFETCHER_CSR_ERROR_ENABLE 1
#define MSGDMA_RX_PREFETCHER_CSR_ERROR_ENABLE_DERIVED 1
#define MSGDMA_RX_PREFETCHER_CSR_ERROR_WIDTH 6
#define MSGDMA_RX_PREFETCHER_CSR_IRQ 3
#define MSGDMA_RX_PREFETCHER_CSR_IRQ_INTERRUPT_CONTROLLER_ID 0
#define MSGDMA_RX_PREFETCHER_CSR_MAX_BURST_COUNT 2
#define MSGDMA_RX_PREFETCHER_CSR_MAX_BYTE 2048
#define MSGDMA_RX_PREFETCHER_CSR_MAX_STRIDE 1
#define MSGDMA_RX_PREFETCHER_CSR_NAME "/dev/msgdma_rx_prefetcher_csr"
#define MSGDMA_RX_PREFETCHER_CSR_PACKET_ENABLE 1
#define MSGDMA_RX_PREFETCHER_CSR_PACKET_ENABLE_DERIVED 1
#define MSGDMA_RX_PREFETCHER_CSR_PREFETCHER_ENABLE 1
#define MSGDMA_RX_PREFETCHER_CSR_PROGRAMMABLE_BURST_ENABLE 0
#define MSGDMA_RX_PREFETCHER_CSR_RESPONSE_PORT 2
#define MSGDMA_RX_PREFETCHER_CSR_SPAN 32
#define MSGDMA_RX_PREFETCHER_CSR_STRIDE_ENABLE 0
#define MSGDMA_RX_PREFETCHER_CSR_STRIDE_ENABLE_DERIVED 0
#define MSGDMA_RX_PREFETCHER_CSR_TRANSFER_TYPE "Aligned Accesses"
#define MSGDMA_RX_PREFETCHER_CSR_TYPE "altera_msgdma"


/*
 * msgdma_tx_csr configuration
 *
 */

#define ALT_MODULE_CLASS_msgdma_tx_csr altera_msgdma
#define MSGDMA_TX_CSR_BASE 0x18403d00
#define MSGDMA_TX_CSR_BURST_ENABLE 0
#define MSGDMA_TX_CSR_BURST_WRAPPING_SUPPORT 0
#define MSGDMA_TX_CSR_CHANNEL_ENABLE 0
#define MSGDMA_TX_CSR_CHANNEL_ENABLE_DERIVED 0
#define MSGDMA_TX_CSR_CHANNEL_WIDTH 8
#define MSGDMA_TX_CSR_DATA_FIFO_DEPTH 32
#define MSGDMA_TX_CSR_DATA_WIDTH 32
#define MSGDMA_TX_CSR_DESCRIPTOR_FIFO_DEPTH 8
#define MSGDMA_TX_CSR_DMA_MODE 1
#define MSGDMA_TX_CSR_ENHANCED_FEATURES 0
#define MSGDMA_TX_CSR_ERROR_ENABLE 1
#define MSGDMA_TX_CSR_ERROR_ENABLE_DERIVED 1
#define MSGDMA_TX_CSR_ERROR_WIDTH 1
#define MSGDMA_TX_CSR_IRQ -1
#define MSGDMA_TX_CSR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MSGDMA_TX_CSR_MAX_BURST_COUNT 2
#define MSGDMA_TX_CSR_MAX_BYTE 2048
#define MSGDMA_TX_CSR_MAX_STRIDE 1
#define MSGDMA_TX_CSR_NAME "/dev/msgdma_tx_csr"
#define MSGDMA_TX_CSR_PACKET_ENABLE 1
#define MSGDMA_TX_CSR_PACKET_ENABLE_DERIVED 1
#define MSGDMA_TX_CSR_PREFETCHER_ENABLE 1
#define MSGDMA_TX_CSR_PROGRAMMABLE_BURST_ENABLE 0
#define MSGDMA_TX_CSR_RESPONSE_PORT 2
#define MSGDMA_TX_CSR_SPAN 32
#define MSGDMA_TX_CSR_STRIDE_ENABLE 0
#define MSGDMA_TX_CSR_STRIDE_ENABLE_DERIVED 0
#define MSGDMA_TX_CSR_TRANSFER_TYPE "Aligned Accesses"
#define MSGDMA_TX_CSR_TYPE "altera_msgdma"


/*
 * msgdma_tx_prefetcher_csr configuration
 *
 */

#define ALT_MODULE_CLASS_msgdma_tx_prefetcher_csr altera_msgdma
#define MSGDMA_TX_PREFETCHER_CSR_BASE 0x18403ca0
#define MSGDMA_TX_PREFETCHER_CSR_BURST_ENABLE 0
#define MSGDMA_TX_PREFETCHER_CSR_BURST_WRAPPING_SUPPORT 0
#define MSGDMA_TX_PREFETCHER_CSR_CHANNEL_ENABLE 0
#define MSGDMA_TX_PREFETCHER_CSR_CHANNEL_ENABLE_DERIVED 0
#define MSGDMA_TX_PREFETCHER_CSR_CHANNEL_WIDTH 8
#define MSGDMA_TX_PREFETCHER_CSR_DATA_FIFO_DEPTH 32
#define MSGDMA_TX_PREFETCHER_CSR_DATA_WIDTH 32
#define MSGDMA_TX_PREFETCHER_CSR_DESCRIPTOR_FIFO_DEPTH 8
#define MSGDMA_TX_PREFETCHER_CSR_DMA_MODE 1
#define MSGDMA_TX_PREFETCHER_CSR_ENHANCED_FEATURES 0
#define MSGDMA_TX_PREFETCHER_CSR_ERROR_ENABLE 1
#define MSGDMA_TX_PREFETCHER_CSR_ERROR_ENABLE_DERIVED 1
#define MSGDMA_TX_PREFETCHER_CSR_ERROR_WIDTH 1
#define MSGDMA_TX_PREFETCHER_CSR_IRQ 2
#define MSGDMA_TX_PREFETCHER_CSR_IRQ_INTERRUPT_CONTROLLER_ID 0
#define MSGDMA_TX_PREFETCHER_CSR_MAX_BURST_COUNT 2
#define MSGDMA_TX_PREFETCHER_CSR_MAX_BYTE 2048
#define MSGDMA_TX_PREFETCHER_CSR_MAX_STRIDE 1
#define MSGDMA_TX_PREFETCHER_CSR_NAME "/dev/msgdma_tx_prefetcher_csr"
#define MSGDMA_TX_PREFETCHER_CSR_PACKET_ENABLE 1
#define MSGDMA_TX_PREFETCHER_CSR_PACKET_ENABLE_DERIVED 1
#define MSGDMA_TX_PREFETCHER_CSR_PREFETCHER_ENABLE 1
#define MSGDMA_TX_PREFETCHER_CSR_PROGRAMMABLE_BURST_ENABLE 0
#define MSGDMA_TX_PREFETCHER_CSR_RESPONSE_PORT 2
#define MSGDMA_TX_PREFETCHER_CSR_SPAN 32
#define MSGDMA_TX_PREFETCHER_CSR_STRIDE_ENABLE 0
#define MSGDMA_TX_PREFETCHER_CSR_STRIDE_ENABLE_DERIVED 0
#define MSGDMA_TX_PREFETCHER_CSR_TRANSFER_TYPE "Aligned Accesses"
#define MSGDMA_TX_PREFETCHER_CSR_TYPE "altera_msgdma"


/*
 * onchip_flash_csr configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_flash_csr altera_onchip_flash
#define ONCHIP_FLASH_CSR_BASE 0x18403d60
#define ONCHIP_FLASH_CSR_BYTES_PER_PAGE 8192
#define ONCHIP_FLASH_CSR_IRQ -1
#define ONCHIP_FLASH_CSR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_FLASH_CSR_NAME "/dev/onchip_flash_csr"
#define ONCHIP_FLASH_CSR_READ_ONLY_MODE 0
#define ONCHIP_FLASH_CSR_SECTOR1_ENABLED 1
#define ONCHIP_FLASH_CSR_SECTOR1_END_ADDR 0x7fff
#define ONCHIP_FLASH_CSR_SECTOR1_START_ADDR 0
#define ONCHIP_FLASH_CSR_SECTOR2_ENABLED 1
#define ONCHIP_FLASH_CSR_SECTOR2_END_ADDR 0xffff
#define ONCHIP_FLASH_CSR_SECTOR2_START_ADDR 0x8000
#define ONCHIP_FLASH_CSR_SECTOR3_ENABLED 1
#define ONCHIP_FLASH_CSR_SECTOR3_END_ADDR 0x6ffff
#define ONCHIP_FLASH_CSR_SECTOR3_START_ADDR 0x10000
#define ONCHIP_FLASH_CSR_SECTOR4_ENABLED 1
#define ONCHIP_FLASH_CSR_SECTOR4_END_ADDR 0xb7fff
#define ONCHIP_FLASH_CSR_SECTOR4_START_ADDR 0x70000
#define ONCHIP_FLASH_CSR_SECTOR5_ENABLED 1
#define ONCHIP_FLASH_CSR_SECTOR5_END_ADDR 0x15ffff
#define ONCHIP_FLASH_CSR_SECTOR5_START_ADDR 0xb8000
#define ONCHIP_FLASH_CSR_SPAN 8
#define ONCHIP_FLASH_CSR_TYPE "altera_onchip_flash"


/*
 * onchip_flash_data configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_flash_data altera_onchip_flash
#define ONCHIP_FLASH_DATA_BASE 0x18200000
#define ONCHIP_FLASH_DATA_BYTES_PER_PAGE 8192
#define ONCHIP_FLASH_DATA_IRQ -1
#define ONCHIP_FLASH_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_FLASH_DATA_NAME "/dev/onchip_flash_data"
#define ONCHIP_FLASH_DATA_READ_ONLY_MODE 0
#define ONCHIP_FLASH_DATA_SECTOR1_ENABLED 1
#define ONCHIP_FLASH_DATA_SECTOR1_END_ADDR 0x7fff
#define ONCHIP_FLASH_DATA_SECTOR1_START_ADDR 0
#define ONCHIP_FLASH_DATA_SECTOR2_ENABLED 1
#define ONCHIP_FLASH_DATA_SECTOR2_END_ADDR 0xffff
#define ONCHIP_FLASH_DATA_SECTOR2_START_ADDR 0x8000
#define ONCHIP_FLASH_DATA_SECTOR3_ENABLED 1
#define ONCHIP_FLASH_DATA_SECTOR3_END_ADDR 0x6ffff
#define ONCHIP_FLASH_DATA_SECTOR3_START_ADDR 0x10000
#define ONCHIP_FLASH_DATA_SECTOR4_ENABLED 1
#define ONCHIP_FLASH_DATA_SECTOR4_END_ADDR 0xb7fff
#define ONCHIP_FLASH_DATA_SECTOR4_START_ADDR 0x70000
#define ONCHIP_FLASH_DATA_SECTOR5_ENABLED 1
#define ONCHIP_FLASH_DATA_SECTOR5_END_ADDR 0x15ffff
#define ONCHIP_FLASH_DATA_SECTOR5_START_ADDR 0xb8000
#define ONCHIP_FLASH_DATA_SPAN 1441792
#define ONCHIP_FLASH_DATA_TYPE "altera_onchip_flash"


/*
 * output_pio configuration
 *
 */

#define ALT_MODULE_CLASS_output_pio altera_avalon_pio
#define OUTPUT_PIO_BASE 0x18403c40
#define OUTPUT_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define OUTPUT_PIO_BIT_MODIFYING_OUTPUT_REGISTER 1
#define OUTPUT_PIO_CAPTURE 0
#define OUTPUT_PIO_DATA_WIDTH 8
#define OUTPUT_PIO_DO_TEST_BENCH_WIRING 0
#define OUTPUT_PIO_DRIVEN_SIM_VALUE 0
#define OUTPUT_PIO_EDGE_TYPE "NONE"
#define OUTPUT_PIO_FREQ 50000000
#define OUTPUT_PIO_HAS_IN 0
#define OUTPUT_PIO_HAS_OUT 1
#define OUTPUT_PIO_HAS_TRI 0
#define OUTPUT_PIO_IRQ -1
#define OUTPUT_PIO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OUTPUT_PIO_IRQ_TYPE "NONE"
#define OUTPUT_PIO_NAME "/dev/output_pio"
#define OUTPUT_PIO_RESET_VALUE 0
#define OUTPUT_PIO_SPAN 32
#define OUTPUT_PIO_TYPE "altera_avalon_pio"


/*
 * sensor_interface configuration
 *
 */

#define ALT_MODULE_CLASS_sensor_interface sensor_recon
#define SENSOR_INTERFACE_BASE 0x18403d50
#define SENSOR_INTERFACE_IRQ -1
#define SENSOR_INTERFACE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SENSOR_INTERFACE_NAME "/dev/sensor_interface"
#define SENSOR_INTERFACE_SPAN 16
#define SENSOR_INTERFACE_TYPE "sensor_recon"


/*
 * sys_clk_timer configuration
 *
 */

#define ALT_MODULE_CLASS_sys_clk_timer altera_avalon_timer
#define SYS_CLK_TIMER_ALWAYS_RUN 0
#define SYS_CLK_TIMER_BASE 0x18403c60
#define SYS_CLK_TIMER_COUNTER_SIZE 32
#define SYS_CLK_TIMER_FIXED_PERIOD 0
#define SYS_CLK_TIMER_FREQ 50000000
#define SYS_CLK_TIMER_IRQ 0
#define SYS_CLK_TIMER_IRQ_INTERRUPT_CONTROLLER_ID 0
#define SYS_CLK_TIMER_LOAD_VALUE 499999
#define SYS_CLK_TIMER_MULT 0.001
#define SYS_CLK_TIMER_NAME "/dev/sys_clk_timer"
#define SYS_CLK_TIMER_PERIOD 10
#define SYS_CLK_TIMER_PERIOD_UNITS "ms"
#define SYS_CLK_TIMER_RESET_OUTPUT 0
#define SYS_CLK_TIMER_SNAPSHOT 1
#define SYS_CLK_TIMER_SPAN 32
#define SYS_CLK_TIMER_TICKS_PER_SEC 100
#define SYS_CLK_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define SYS_CLK_TIMER_TYPE "altera_avalon_timer"


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x18403d68
#define SYSID_ID -87110914
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1728634208
#define SYSID_TYPE "altera_avalon_sysid_qsys"


/*
 * ucosii configuration
 *
 */

#define OS_ARG_CHK_EN 0
#define OS_CPU_HOOKS_EN 1
#define OS_DEBUG_EN 0
#define OS_EVENT_NAME_SIZE 32
#define OS_FLAGS_NBITS 16
#define OS_FLAG_ACCEPT_EN 1
#define OS_FLAG_DEL_EN 1
#define OS_FLAG_EN 1
#define OS_FLAG_NAME_SIZE 32
#define OS_FLAG_QUERY_EN 1
#define OS_FLAG_WAIT_CLR_EN 1
#define OS_LOWEST_PRIO 20
#define OS_MAX_EVENTS 60
#define OS_MAX_FLAGS 20
#define OS_MAX_MEM_PART 60
#define OS_MAX_QS 20
#define OS_MAX_TASKS 5
#define OS_MBOX_ACCEPT_EN 1
#define OS_MBOX_DEL_EN 1
#define OS_MBOX_EN 1
#define OS_MBOX_POST_EN 1
#define OS_MBOX_POST_OPT_EN 1
#define OS_MBOX_QUERY_EN 1
#define OS_MEM_EN 1
#define OS_MEM_NAME_SIZE 32
#define OS_MEM_QUERY_EN 1
#define OS_MUTEX_ACCEPT_EN 1
#define OS_MUTEX_DEL_EN 1
#define OS_MUTEX_EN 1
#define OS_MUTEX_QUERY_EN 1
#define OS_Q_ACCEPT_EN 1
#define OS_Q_DEL_EN 1
#define OS_Q_EN 1
#define OS_Q_FLUSH_EN 1
#define OS_Q_POST_EN 1
#define OS_Q_POST_FRONT_EN 1
#define OS_Q_POST_OPT_EN 1
#define OS_Q_QUERY_EN 1
#define OS_SCHED_LOCK_EN 1
#define OS_SEM_ACCEPT_EN 1
#define OS_SEM_DEL_EN 1
#define OS_SEM_EN 1
#define OS_SEM_QUERY_EN 1
#define OS_SEM_SET_EN 1
#define OS_TASK_CHANGE_PRIO_EN 1
#define OS_TASK_CREATE_EN 1
#define OS_TASK_CREATE_EXT_EN 1
#define OS_TASK_DEL_EN 1
#define OS_TASK_IDLE_STK_SIZE 512
#define OS_TASK_NAME_SIZE 32
#define OS_TASK_PROFILE_EN 1
#define OS_TASK_QUERY_EN 1
#define OS_TASK_STAT_EN 0
#define OS_TASK_STAT_STK_CHK_EN 0
#define OS_TASK_STAT_STK_SIZE 512
#define OS_TASK_SUSPEND_EN 1
#define OS_TASK_SW_HOOK_EN 1
#define OS_TASK_TMR_PRIO 0
#define OS_TASK_TMR_STK_SIZE 512
#define OS_THREAD_SAFE_NEWLIB 1
#define OS_TICKS_PER_SEC SYS_CLK_TIMER_TICKS_PER_SEC
#define OS_TICK_STEP_EN 0
#define OS_TIME_DLY_HMSM_EN 1
#define OS_TIME_DLY_RESUME_EN 1
#define OS_TIME_GET_SET_EN 1
#define OS_TIME_TICK_HOOK_EN 1
#define OS_TMR_CFG_MAX 16
#define OS_TMR_CFG_NAME_SIZE 16
#define OS_TMR_CFG_TICKS_PER_SEC 10
#define OS_TMR_CFG_WHEEL_SIZE 2
#define OS_TMR_EN 0


/*
 * udp_generator configuration
 *
 */

#define ALT_MODULE_CLASS_udp_generator udp_generator
#define UDP_GENERATOR_BASE 0x18403cc0
#define UDP_GENERATOR_IRQ -1
#define UDP_GENERATOR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define UDP_GENERATOR_NAME "/dev/udp_generator"
#define UDP_GENERATOR_SPAN 32
#define UDP_GENERATOR_TYPE "udp_generator"

#endif /* __SYSTEM_H_ */