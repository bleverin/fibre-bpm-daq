/*
 * control.c
 *
 *  Created on: Aug 14, 2017
 *      Author: mdziewiecki
 */


#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* MicroC/OS-II definitions */
#include "includes.h"

#include <system.h>
#include <io.h>

/* Nichestack definitions */
#include "ipport.h"
#include "tcpport.h"
#include "libport.h"
#include "osport.h"

#include "socket_server.h"
#include "control.h"
#include "sensor.h"
#include "udpgen.h"
#include "utils.h"

// ****************************

extern   NET   nets[MAXNETS];    /* pointers to the static network structs */

// ****************************

void control_delay()
{
	TK_SLEEP(1);
}


// ****************************

	//simple reply
void control_pong(command_header* header)
{
	command_header tmp;
	tmp = *header;
	swap_bytes((char*)(void*)(&tmp), sizeof(tmp));
	ethernet_write(0, sizeof(command_header), (unsigned char*)(header));
}

void control_process_snapshot()
{
	command_header header = {.marker = 0x5555, .command = COMMAND_SLOWCTRL_SNAPSHOT,
							 .length = 0};	//SLOWCTRL_ADC_CHANNEL_COUNT * sizeof(SLOWCTRL_ADC_DATA_TYPE) / sizeof(unsigned short)};
	swap_bytes((char*)(void*)(&header), sizeof(header));
	ethernet_write(0, sizeof(command_header), (unsigned char*)(&header));
	//ethernet_write(0, SLOWCTRL_ADC_CHANNEL_COUNT*sizeof(SLOWCTRL_ADC_DATA_TYPE), (unsigned char*)slowctrl_adc_buffer);
}

	//helper for the one below
int check_arp(struct arptabent * arp_entry, ip_addr ip)
{
	if (arp_entry->t_pro_addr != ip)
		return 0;	//bad IP

	for (int i = 0; i < 6; i++)
		if (arp_entry->t_phy_addr[i] != 0)
			return 1;	//non-zero MAC

	return 0;
}

void control_process_config_peer(unsigned short* data)
{
	ip_addr ip = 0;
	ip_addr srcip = 0;
	int i;
	command_header header = {.marker = 0x5555, .command = COMMAND_DAQ_CONFIG_PEER, .length = 0};

	for (i = 0; i < 4; i++)
		ip = (ip << 8) | (unsigned char)(data[3-i] & 0x00FF);

	//daq_configure_peer_addr(ip, data[4]);

	printf("Querying ARP for %d.%d.%d.%d ...\n",data[0],data[1],data[2],data[3]);

	struct arptabent * arp_entry = find_oldest_arp(ip);

	int pingseq = 0;
	while (!check_arp(arp_entry, ip))	//big loop for pinging 10 times
	{
		printf("ARP entry could not be found, pinging!\n");
			//ping the peer to ARP it.
		icmpEcho(ip, NULL, 8, pingseq++);

		for (int i = 0; (i < 5) && (!check_arp(arp_entry, ip)); i++)	//small loop for waiting 5 times after each ping
		{
			TK_SLEEP(10);
			arp_entry = find_oldest_arp(ip);
		}

		if (pingseq > 10)
		{
			printf("Could not resolve MAC! The result below is random!\n");
			break;
		}
	}

	printf("Peer MAC is %02x %02x %02x %02x %02x %02x\n",
			arp_entry->t_phy_addr[0], arp_entry->t_phy_addr[1], arp_entry->t_phy_addr[2],
			arp_entry->t_phy_addr[3], arp_entry->t_phy_addr[4], arp_entry->t_phy_addr[5]);

	srcip = nets[0]->n_ipaddr;
	swap_quad((unsigned char*)(void*)(&srcip), 4);	//UDP generator needs such a format
	swap_quad((unsigned char*)(void*)(&ip), 4);

	//set up udpgen with correct values
	udpgen_set_size(UDP_GENERATOR_BASE, 167);	//sensor_interface.v:39
	udpgen_set_srcip(UDP_GENERATOR_BASE, srcip);
	udpgen_set_dstip(UDP_GENERATOR_BASE, ip);
	udpgen_set_srcport(UDP_GENERATOR_BASE, DATA_PORT);
	udpgen_set_dstport(UDP_GENERATOR_BASE, data[4]);
	udpgen_set_dstmac_a(UDP_GENERATOR_BASE, arp_entry->t_phy_addr);

	swap_bytes((unsigned char*)(void*)(&header), sizeof(header));
	ethernet_write(0, sizeof(command_header), (unsigned char*)(&header));
}



// ****************************

	//Receive command header. Return (without loosing data!) if number of received bytes is insufficient.
unsigned char control_get_header(command_header** result)
{
	static command_header header;
	static unsigned int bytes_received = 0;

	bytes_received += ethernet_read(0, sizeof(command_header)-bytes_received, (unsigned char*)(&header) + bytes_received);

	if (bytes_received < sizeof(command_header))
		return 0;

	swap_bytes((unsigned char*)(void*)(&header),sizeof(header));	//if the header is complete, swap bytes and return it
	*result = &header;
	bytes_received = 0;
	return 1;
}

	//Receive command data. Return (without loosing data!) if number of received bytes is insufficient.
	//Expected data length is given in words!
unsigned char control_get_data(unsigned short expected_length, unsigned short** data)
{
	static unsigned short packet_data[CONTROL_MAX_DATA_LENGTH];
	static unsigned int bytes_received = 0;

	bytes_received += ethernet_read(0, 2*expected_length - bytes_received, (unsigned char*)(&packet_data) + bytes_received);

		if (bytes_received < (2*expected_length))
			return 0;

		*data = packet_data;
		bytes_received = 0;
		return 1;
}

// ****************************

void control_step()
{
	command_header* header;
	unsigned short* data;
	unsigned int loop_ctr = 0;


	//get header - at this moment this is blocking!
	while (!control_get_header(&header))
	{
		control_delay();

		if (++loop_ctr > CONTROL_TIMEOUT)
		{
			return;
		}
	}

		//check start marker
	if (header->marker != 0x5555)
		return;


		//get packet data - at this moment this is blocking!
	while (!control_get_data(header->length, &data))
	{
		control_delay();

		if (++loop_ctr > CONTROL_TIMEOUT)
		{
			return;
		}
	}
		//swap data bytes
	swap_bytes((unsigned char*)(void*)data, header->length*2);

	switch(header->command)
	{
	case COMMAND_PING:
		printf("COMMAND_PING\n");
		control_pong(header);
		break;
	case COMMAND_DEBUG_LED_OFF:
		printf("COMMAND_DEBUG_LED_OFF\n");
		led_clear(0);
		control_pong(header);
		break;
	case COMMAND_DEBUG_LED_ON:
		printf("COMMAND_DEBUG_LED_ON\n");
		led_set(0);
		control_pong(header);
		break;

	case COMMAND_LEDS_DISABLE:
		printf("COMMAND_LEDS_DISABLE\n");
		led4_blink_enable(0);
		control_pong(header);
		break;
	case COMMAND_LEDS_ENABLE:
		printf("COMMAND_LEDS_ENABLE\n");
		led4_blink_enable(1);
		control_pong(header);
		break;

	case COMMAND_TRIGGER_DISABLE:
		printf("COMMAND_TRIGGER_DISABLE\n");
		master_clock_enable(0);
		control_pong(header);
		break;
	case COMMAND_TRIGGER_ENABLE:
		printf("COMMAND_TRIGGER_ENABLE\n");
		master_clock_enable(1);
		control_pong(header);
		break;
	case COMMAND_TRIGGER_SET_SLAVE:
		printf("COMMAND_TRIGGER_SET_SLAVE\n");
		masterslave(TRIGGER_SLAVE);
		control_pong(header);
		break;
	case COMMAND_TRIGGER_SET_MASTER:
		printf("COMMAND_TRIGGER_SET_MASTER\n");
		masterslave(TRIGGER_MASTER);
		control_pong(header);
		break;
	case COMMAND_TRIGGER_SET_PERIOD:
		printf("COMMAND_TRIGGER_SET_PERIOD: %d\n", data[0]);
		master_clock_period((alt_u32)data[0]);	//we set only 16 lsbs!
		header->length = 0;
		control_pong(header);
		break;
	case COMMAND_TRIGGER_SET_TINT:
		printf("COMMAND_TRIGGER_SET_TINT: %d\n", data[0]);
		sensor_set_shutter(SENSOR_INTERFACE_BASE, data[0]);
		header->length = 0;
		control_pong(header);
		break;
	case COMMAND_SET_GAIN:
		printf("COMMAND_SET_GAIN: %d\n", data[0]);
		sensor_set_gain(SENSOR_INTERFACE_BASE, data[0]);
		header->length = 0;
		control_pong(header);
		break;
	case COMMAND_TRIGGER_SET_MASTER_DELAY:
		printf("COMMAND_TRIGGER_SET_MASTER_DELAY: %d\n", data[0]);
		set_delay(TRIGGER_MASTER, data[0]);
		header->length = 0;
		control_pong(header);
		break;
	case COMMAND_TRIGGER_SET_SLAVE_DELAY:
		printf("COMMAND_TRIGGER_SET_SLAVE_DELAY: %d\n", data[0]);
		set_delay(TRIGGER_SLAVE, data[0]);
		header->length = 0;
		control_pong(header);
		break;

	case COMMAND_DAQ_DISABLE:
		printf("COMMAND_DAQ_DISABLE\n");
		sensor_set_enable(SENSOR_INTERFACE_BASE, 0);
		udpgen_command_bit(UDP_GENERATOR_BASE, UDPGEN_CSR_EN_BITMASK,0);
		control_pong(header);
		break;
	case COMMAND_DAQ_ENABLE:
		printf("COMMAND_DAQ_ENABLE\n");
		udpgen_command_bit(UDP_GENERATOR_BASE, UDPGEN_CSR_EN_BITMASK,1);
		sensor_set_enable(SENSOR_INTERFACE_BASE, 1);
		control_pong(header);
		break;
	case COMMAND_DAQ_RESET_COUNTERS:
		printf("COMMAND_DAQ_RESET_COUNTERS\n");
		sensor_reset(SENSOR_INTERFACE_BASE);
		control_pong(header);
		break;
	case COMMAND_DAQ_FLUSH_DATA:
		printf("COMMAND_DAQ_FLUSH_DATA\n");
			//nothing
		control_pong(header);
		break;
	case COMMAND_DAQ_CONFIG_PEER:
		printf("COMMAND_DAQ_CONFIG_PEER\n");
		control_process_config_peer(data);
		break;

	case COMMAND_SLOWCTRL_SNAPSHOT:
		printf("COMMAND_SLOWCTRL_SNAPSHOT\n");
		control_process_snapshot();
		break;

	case COMMAND_SET_CLUSTER_THRESHOLD:
		printf("COMMAND_SET_CLUSTER_THRESHOLD: %d\n", data[0]);
		sensor_set_cluster_threshold(SENSOR_INTERFACE_BASE,data[0]);
		header->length = 0;
		control_pong(header);
		break;

	case COMMAND_SET_CLUSTER_SIZE:
		printf("COMMAND_SET_CLUSTER_SIZE: %d\n", data[0]);
		sensor_set_cluster_size(SENSOR_INTERFACE_BASE,data[0]);
		header->length = 0;
		control_pong(header);
		break;

	case COMMAND_SET_CALIBRATION_FACTOR: //data[i] is 16 bit unsigned short; calibration factor is 16 bit
		if (header->length>=2){
		calibration_ram_set_factor(CALIBRATION_RAM_BASE,data[0],data[1]); //i is channelID
		printf("COMMAND_SET_CALIBRATION_FACTOR ChannelIP%d : %d\n", data[0],data[1]);
		}else{
			printf("COMMAND_SET_CALIBRATION_FACTOR length: %d\n", header->length);
		}
		header->length = 0;
		control_pong(header);
		break;


	default:
		break;
	}

}

// ******************** The task *****************

TK_OBJECT(to_controltask);
TK_ENTRY(ControlTask);

struct inet_taskinfo controltask =
{
      &to_controltask,
      "Control thread",
      ControlTask,
	  CONTROL_TASK_PRIORITY,
      CONTROL_STACK_SIZE,
};


void ControlTask(void* param)
{
	printf ("::: Control task started ::: \n");
	ethernet_listen(0, CONTROL_PORT);

	sensor_preconfigure(SENSOR_INTERFACE_BASE);

	//initial calibration factor here
	printf("Initiate Calibration Factor 1 to 320 from channel1 to channel320 \n");


	for (alt_u32 i = 0; i < 320; i++) {
		//pow(2,13)=8192. represent calibration factor 1; range[0.00012,8)
		//default calibration factor is 1.
		calibration_ram_set_factor(CALIBRATION_RAM_BASE,i,8192); //i is channelID
	 }

	while(1)
		control_step();
}

void control_init()
{
	TK_NEWTASK(&controltask);
}
