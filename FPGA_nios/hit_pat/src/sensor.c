/*
 * sensor.c
 *
 *  Created on: Aug 19, 2019
 *      Author: mdziewiecki
 */

#include <stdio.h>
#include "includes.h"
#include <system.h>
#include <io.h>
#include <altera_msgdma.h>

/* Nichestack definitions */
#include "ipport.h"
#include "libport.h"
#include "osport.h"

#include "utils.h"
#include "dev_commands.h"
#include "sensor.h"


void sensor_command_bit(alt_u32 base, alt_u8 bitmask, alt_u8 state)
{
	alt_u8 tmp = IORD_8DIRECT(base, SENSOR_REG_COMMAND);
	if (state)
		tmp |= bitmask;
	else
		tmp &= ~bitmask;
	IOWR_8DIRECT(base, SENSOR_REG_COMMAND, tmp);
}


void sensor_preconfigure(alt_u32 base)
{
	printf(" *** Preconfiguring sensor module... \n");

	sensor_command(base, 0);				//disable
	sensor_set_sensorclk(base, 6);			//sensor clock - 3.57 MHz
	sensor_set_adccnv(base, 31);			//conversion delay - default
	sensor_set_delay(base, 1);				//trigger delay - default
	sensor_set_shutter(base, 100);			//integration time - dummy default
	sensor_set_serspeed(base, 50);			//synchro serial port - 1 Mbps
	sensor_set_header_anydata(base, 0x00);	//should be 0
	sensor_set_header_cmd(base, COMMAND_DATA_TRANSFER);	//command header, must be this one
	sensor_command(base, 1);			//enable, gain low, SCLK full

	sensor_set_cluster_threshold(base, 10); //default cluster threshold 10
	sensor_set_cluster_size(base, 4);		//default cluster size  4
	sensor_set_in_algo_threshold(base, 4);  //default algo threshold  4

}
