/*
 * udpgen.c
 *
 *  Created on: Aug 7, 2019
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

#include "udpgen.h"

//*******************************************************************


void udpgen_command_bit(alt_u32 base, alt_u8 bitmask, alt_u8 state)
{
	alt_u8 tmp = IORD_8DIRECT(base, UDPGEN_REG_CSR);
	if (state)
		tmp |= bitmask;
	else
		tmp &= ~bitmask;
	IOWR_8DIRECT(base, UDPGEN_REG_CSR, tmp);
}

void udpgen_test(alt_u32 base)
{
	printf (" *** Setting up UDP generator... \n");

	unsigned char dstmac[] = {0x18, 0xd6, 0xc7, 0x05, 0xaa, 0x63};
	unsigned char srcip[] = {10,0,7,17};
	unsigned char dstip[] = {10,0,7,1};

	udpgen_command(UDP_GENERATOR_BASE, 0x01);
	udpgen_set_size(UDP_GENERATOR_BASE, 16);
	udpgen_set_srcip_a(UDP_GENERATOR_BASE, srcip);
	udpgen_set_dstip_a(UDP_GENERATOR_BASE, dstip);
	udpgen_set_srcport(UDP_GENERATOR_BASE, 4096);
	udpgen_set_dstport(UDP_GENERATOR_BASE, 4097);
	udpgen_set_dstmac_a(UDP_GENERATOR_BASE, dstmac);
}
