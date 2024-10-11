/*
 * utils.h
 *
 *  Created on: Jul 31, 2019
 *      Author: mdziewiecki
 *  Various utils for various purposes
 *  Mainly wrappers on hardware
 */



#ifndef UTILS_H_
#define UTILS_H_

//Swap opdd/even bytes in a bunch of data to align endianness of shorts
void swap_bytes(unsigned char* array, int size_bytes);
void swap_quad(unsigned char* array, int size_bytes);

void reload_fpga();					//trigger FPGA reload

#define TRIGGER_MASTER	1
#define TRIGGER_SLAVE	0
void masterslave(alt_u8 master);			//set trigger system to master or slave operation
void master_clock_period(alt_u32 period);	//set period of the master frame timer
void master_clock_enable(alt_u8 en);		//enable/disable pulse generation

void led_set(alt_u8 led_nr);
void led_clear(alt_u8 led_nr);
void led_toggle(alt_u8 led_nr);
void led4_blink_enable(alt_u8 en);

void set_delay(alt_u8 master, alt_u16 value);

#endif /* UTILS_H_ */
