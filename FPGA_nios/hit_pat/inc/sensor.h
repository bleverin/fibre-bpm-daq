/*
 * sensor.h
 *
 *  Created on: Aug 19, 2019
 *      Author: mdziewiecki
 */

#ifndef SENSOR_H_
#define SENSOR_H_

//SENSOR_INTERFACE_BASE	- this is the base address of the interface

		//byte offsets for registers
		#define SENSOR_REG_COMMAND				0		//8 bits
		#define SENSOR_REG_STATUS				1		//8 bits
		#define SENSOR_REG_SENSORCLK			2		//16 bits, 6 used	divider for producing sensor clock ('4' MHz)
		#define SESNOR_REG_ADCCNV				3		//8 bits,  6 used	time of conversion pulse in ADC clocks, should be > 500 ns
		#define SENSOR_REG_DELAY				4		//16 bits, 12 used	reset signal delay in 50 MHz clocks
		#define SENSOR_REG_SHUTTER				6		//16 bits, 12 used	sensor reset ('shutter') time in sensor clocks
		#define SENSOR_REG_SERSPEED				8		//8 bits 		synchro baudrate, 50 for 1 Mbps
		#define SENSOR_REG_HEADER_ANYDATA		9		//8 bits		any data transmitted with SMA state (8 bits SMA + 8 bits anydata)
		#define SENSOR_REG_HEADER_CMD			10		//16 bits 		command field of the command header transmitted in packet
		#define SENSOR_REG_CLUSTER_THRESHOLD	12 //8 bits	 the threshold for cluster locate, range 0~255
		#define SENSOR_REG_CLUSTER_SIZE			13 //8 bits  the size for clluster locate, range 0~255
		#define SENSOR_REG_IN_ALGO_THRESHOLD	14 //8 bits	 the threshold inside Linear Regression, range 0~255
		#define SENSOR_REG_RESERVED				15 //8 bits  not used

		//CSR bitmasks
		#define SENSOR_CSR_EN_BITMASK			0x01	//enable operation
		#define SENSOR_CSR_GAIN_BITMASK			0x02	//gain selection
		#define SENSOR_CSR_ADCK_BITMASK 		0x04	//ADC clock divider on/off
		#define SENSOR_CSR_RESET_BITMASK		0x08	//Reset all logic

		//Status bitmasks
		#define SENSOR_STATUS_SEND				0x01	//Sending over Avalon-ST
		#define SENSOR_STATUS_TRG_WAITING		0x02	//The trigger came and is being delayed now
		#define SENSOR_STATUS_RESET_ACTIVE		0x04	//The RESET signal for the sensor is active now
		#define SENSOR_STATUS_ADC_ACTIVE		0x08	//The ADC is converting data (signal high over all 64 channels) or just finished and waits for reset high
		#define SESNOR_STATUS_ADC_FINISHED		0x10	//The ADC waits for reset high
		#define SESNOR_STATUS_TX_ACTIVE			0x20	//Sync port is sending
		#define SESNOR_STATUS_RX_ACTIVE			0x40	//Sync port is receiving


	//Register access functions/macros
void sensor_command_bit(alt_u32 base, alt_u8 bitmask, alt_u8 state);
#define sensor_command(base, val) 				IOWR_8DIRECT(base, SENSOR_REG_COMMAND, val)
#define sensor_set_enable(base, val)			sensor_command_bit(base, SENSOR_CSR_EN_BITMASK, val);
#define sensor_set_gain(base, val)				sensor_command_bit(base, SENSOR_CSR_GAIN_BITMASK, val);
#define sensor_set_adck(base, val)				sensor_command_bit(base, SENSOR_CSR_ADCK_BITMASK, val);
#define sensor_reset(base)						{ sensor_command_bit(base,SENSOR_CSR_RESET_BITMASK,1); sensor_command_bit(base,SENSOR_CSR_RESET_BITMASK,0); }
#define sensor_set_sensorclk(base, val)			IOWR_8DIRECT(base, SENSOR_REG_SENSORCLK, val)
#define sensor_set_adccnv(base, val)			IOWR_8DIRECT(base, SESNOR_REG_ADCCNV, val)
#define sensor_set_delay(base, val)				IOWR_16DIRECT(base, SENSOR_REG_DELAY, val)
#define sensor_set_shutter(base, val)			IOWR_16DIRECT(base, SENSOR_REG_SHUTTER, val)
#define sensor_set_serspeed(base, val)			IOWR_8DIRECT(base, SENSOR_REG_SERSPEED, val)
#define sensor_set_header_anydata(base, val)	IOWR_8DIRECT(base, SENSOR_REG_HEADER_ANYDATA, val)
#define sensor_set_header_cmd(base, val)		IOWR_16DIRECT(base, SENSOR_REG_HEADER_CMD, val)
#define sensor_set_cluster_threshold(base, val)	IOWR_8DIRECT(base, SENSOR_REG_CLUSTER_THRESHOLD, val)
#define sensor_set_cluster_size(base, val)		IOWR_8DIRECT(base, SENSOR_REG_CLUSTER_SIZE, val)
#define sensor_set_in_algo_threshold(base, val)	IOWR_8DIRECT(base, SENSOR_REG_IN_ALGO_THRESHOLD, val)

//write calibration factor: CALIBRATION_RAM_BASE
#define calibration_ram_set_factor(base, channelID, val) IOWR_16DIRECT(base, channelID*2, val)

void sensor_preconfigure(alt_u32 base);

#endif /* SENSOR_H_ */
