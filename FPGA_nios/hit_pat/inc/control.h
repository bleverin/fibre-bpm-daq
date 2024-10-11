/*
 * control.h
 *
 *  Created on: Aug 14, 2017
 *      Author: mdziewiecki
 */

#ifndef CONTROL_H_
#define CONTROL_H_

//**************************

#include "dev_commands.h"

//**************************

#define CONTROL_TASK_PRIORITY		10
#define CONTROL_STACK_SIZE			(6144+8192)

#define CONTROL_MAX_DATA_LENGTH		16		//maximum command data length in WORDS (16-bit)
#define CONTROL_TIMEOUT				1000	//timeout to get command data in unknown time units

#define CONTROL_PORT				4000
#define DATA_PORT					4001

#define CONTROL_SWAP_BYTES 			1		//playing around endianness in PC communication

typedef struct
{
	unsigned short marker;	//must be 0x5555
	unsigned short command;
	unsigned short length;
} command_header;

	//Initialize control task
void control_init();


#endif /* CONTROL_H_ */
