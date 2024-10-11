/*
 * utils.c
 *
 *  Created on: Jul 31, 2019
 *      Author: mdziewiecki
 */


#include <stdio.h>
#include "includes.h"
#include <system.h>
#include <io.h>

/* Nichestack definitions */
#include "ipport.h"
#include "libport.h"
#include "osport.h"

#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "utils.h"

#include "sensor.h"

alt_u16 delays[2];
alt_u8 mastermode;

//******************************************************

//Swap odd/even bytes in a bunch of data to align endianness of shorts
void swap_bytes(unsigned char* array, int size_bytes)
{
	for (int i = 0; i < size_bytes; i+= 2)
	{
		unsigned char tmp = array[i];
		array[i] = array[i+1];
		array[i+1] = tmp;
	}
}
//The same, but four-byte-wise
void swap_quad(unsigned char* array, int size_bytes)
{
	unsigned char buf[4];

	for (int i = 0; i < size_bytes; i+= 4)
	{
		memcpy(buf, array+i, 4);
		for (int j = 0; j < 4; j++)
			array[i+j] = buf[3-j];
	}
}

	//trigger FPGA reload
void reload_fpga()
{
	printf("$$$$ RECONFIGURING FPGA!!! $$$$\n");
	//TK_SLEEP(100);	//let it print the message before dying
	//IOWR(DUAL_BOOT_BASE, 0, 0x1);
	printf("*** DISABLED! ***\n");
}

void masterslave(alt_u8 master)
{
	if (master)
		IOWR_ALTERA_AVALON_PIO_SET_BITS(OUTPUT_PIO_BASE, 0x80);
	else
		IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(OUTPUT_PIO_BASE, 0x80);
	mastermode = master;
	set_delay(mastermode, delays[mastermode]);	//update sensor delay setting
}

void master_clock_period(alt_u32 period)
{
		//set period
	IOWR_ALTERA_AVALON_TIMER_PERIODL(FRAME_TIMER_BASE, (alt_u16)(period & 0xFFFF));
	IOWR_ALTERA_AVALON_TIMER_PERIODH(FRAME_TIMER_BASE, (alt_u16)((period>>16) & 0xFFFF));
		//start timer in continuous mode
	//IOWR_ALTERA_AVALON_TIMER_CONTROL(FRAME_TIMER_BASE,
	//									ALTERA_AVALON_TIMER_CONTROL_CONT_MSK);
}

void master_clock_enable(alt_u8 en)
{
	alt_u16 tmp = 0;	// = IORD_ALTERA_AVALON_TIMER_CONTROL(FRAME_TIMER_BASE);

	if (en)
		tmp |= ALTERA_AVALON_TIMER_CONTROL_START_MSK | ALTERA_AVALON_TIMER_CONTROL_CONT_MSK;
	else
		tmp |= ALTERA_AVALON_TIMER_CONTROL_STOP_MSK;

	IOWR_ALTERA_AVALON_TIMER_CONTROL(FRAME_TIMER_BASE,tmp);
}

void led_set(alt_u8 led_nr)
{
	if (led_nr > 4)
		return;
	IOWR_ALTERA_AVALON_PIO_SET_BITS(OUTPUT_PIO_BASE, 1<<led_nr);
}

void led_clear(alt_u8 led_nr)
{
	if (led_nr > 4)
		return;
	IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(OUTPUT_PIO_BASE, 1<<led_nr);
}

void led_toggle(alt_u8 led_nr)
{
	if (led_nr > 4)
		return;
	alt_u32 tmp = IORD_ALTERA_AVALON_PIO_DATA(OUTPUT_PIO_BASE);
	tmp ^= (1<<led_nr);
	IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PIO_BASE, 1<<led_nr);
}

void led4_blink_enable(alt_u8 en)
{
	if (en)
		IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(OUTPUT_PIO_BASE, 1<<5);
	else
		IOWR_ALTERA_AVALON_PIO_SET_BITS(OUTPUT_PIO_BASE, 1<<5);
}

void set_delay(alt_u8 master, alt_u16 value)
{
	delays[master] = value;
	if (master == mastermode)
		sensor_set_delay(SENSOR_INTERFACE_BASE, value);	//update sensor setting only if right mode
}

