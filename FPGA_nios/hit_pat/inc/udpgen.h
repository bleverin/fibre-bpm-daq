/*
 * udpgen.h
 *
 *  Created on: Aug 7, 2019
 *      Author: mdziewiecki
 */

#ifndef UDPGEN_H_
#define UDPGEN_H_

//UDP_GENERATOR_0_BASE

	//byte offsets for registers
#define UDPGEN_REG_CSR		0	//16 bits 	8 bits command + 8 bits status
#define UDPGEN_REG_SIZE		2	//16 bits	payload size in words
#define UDPGEN_REG_SRCIP	4	//32 bits	source IP, last octet first
#define UDPGEN_REG_DSTIP	8	//32 bits	destination IP. last octet first
#define UDPGEN_REG_DSTPORT	12	//16 bits	destination port
#define UDPGEN_REG_SRCPORT	14	//16 bits	source port
#define UDPGEN_REG_DSTMAC	16	//2*32 bits	destination MAC, last octet first
#define UDPGEN_REG_RES1		24	//32 bits	reserved
#define UDPGEN_REG_RES2		28 	//32 bits	reserved

	//csr bitmasks
#define UDPGEN_CSR_EN_BITMASK	0x0001


	//Register access macros
void udpgen_command_bit(alt_u32 base, alt_u8 bitmask, alt_u8 state);
#define udpgen_command(base, val) 		IOWR_8DIRECT(base, UDPGEN_REG_CSR, val)
#define udpgen_set_size(base, val) 		IOWR_16DIRECT(base, UDPGEN_REG_SIZE, val)
#define udpgen_set_srcip(base, val) 	IOWR_32DIRECT(base, UDPGEN_REG_SRCIP, val)
#define udpgen_set_dstip(base, val) 	IOWR_32DIRECT(base, UDPGEN_REG_DSTIP, val)
#define udpgen_set_srcip_a(base, val) 	{ for(int i = 0; i < 4; i++) IOWR_8DIRECT(base, UDPGEN_REG_SRCIP+i, val[3-i]); }
#define udpgen_set_dstip_a(base, val) 	{ for(int i = 0; i < 4; i++) IOWR_8DIRECT(base, UDPGEN_REG_DSTIP+i, val[3-i]); }
#define udpgen_set_srcport(base, val) 	IOWR_16DIRECT(base, UDPGEN_REG_SRCPORT, val)
#define udpgen_set_dstport(base, val) 	IOWR_16DIRECT(base, UDPGEN_REG_DSTPORT, val)
#define udpgen_set_dstmac_a(base, val) 	{ for(int i = 0; i < 6; i++) IOWR_8DIRECT(base, UDPGEN_REG_DSTMAC+i, val[5-i]); }

#define udpgen_status(base)				IORD_16DIRECT(base, UDPGEN_REG_CSR)
#define udpgen_get_size(base, val) 		IORD_16DIRECT(base, UDPGEN_REG_SIZE)
#define udpgen_get_srcip(base, val) 	IORD_32DIRECT(base, UDPGEN_REG_SRCIP)
#define udpgen_get_dstip(base, val) 	IORD_32DIRECT(base, UDPGEN_REG_DSTIP)
#define udpgen_get_srcport(base, val) 	IORD_16DIRECT(base, UDPGEN_REG_SRCPORT)
#define udpgen_get_dstport(base, val) 	IORD_16DIRECT(base, UDPGEN_REG_DSTPORT)
#define udpgen_get_dstmac(base, val) 	{ for(int i = 0; i < 6; i++) val[i] = IORD_8DIRECT(base, UDPGEN_REG_DSTMAC+i); }


//******************************************************

void udpgen_test(alt_u32 base);


#endif /* UDPGEN_H_ */
