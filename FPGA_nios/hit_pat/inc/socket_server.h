/******************************************************************************
* Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
*******************************************************************************                                                                             *
* Date - October 24, 2006                                                     *
* Module - simple_socket_server.h                                             *
* EXTENSIVELY REWRITTEN by M.D. 2019                                                                            *                                                                             *
******************************************************************************/

/*
	SO THIS IS HOW IT WORKS:

	User can use up to NR_CHANNELS sockets.
	First, ethernet_init() must be called from any task.
	It will start a special 'listener' thread which is responsible for serving connection requests.
	Then:
	For each 'channel' (a placeholder for one socket), user may call ethernet_listen() to start listening on a specified port.
	After that, ethernet_read() and ethernet_write() can be used. These functions are non-blocking and return 0 if no client is connected.
	User can explicitly close connection to a client by calling ethernet_close();
	If another connection request comes when a client is already connected, the old client will be disconnected in favor of the new one.
	It means, that only one client can be connected to one channel at a given time.
	This weird behaviour is implemented to enable easy killing 'hanging' connections.
	Channel re-configuration (i.e. repeated calls of ethernet_listen() for the same channel) is not allowed.
	VERY IMPORTANT:
	All the above functions (excluding ethernet_init()) must be called from a socket-compatible thread (created with TK_NEWTASK).
	All ethernet_* calls are served directly in user's task. Ethernet_init() can be called from any thread after hardware configuration.
 */

 /* Validate supported Software components specified on system library properties page.
  */
#ifndef __SOCKET_SERVER_H__
#define __SOCKET_SERVER_H__

#if !defined (ALT_INICHE)
  #error The Simple Socket Server example requires the 
  #error NicheStack TCP/IP Stack Software Component. Please see the Nichestack
  #error Tutorial for details on Nichestack TCP/IP Stack - Nios II Edition,
  #error including notes on migrating applications from lwIP to NicheStack.
#endif

#ifndef __ucosii__
  #error This Simple Socket Server example requires 
  #error the MicroC/OS-II Intellectual Property Software Component.
#endif

#if defined (ALT_LWIP)
  #error The Simple Socket Server example requires the 
  #error NicheStack TCP/IP Stack Software Component, and no longer works
  #error with the lwIP networking stack.  Please see the Altera Nichstack
  #error Tutorial for details on Nichestack TCP/IP Stack - Nios II Edition,
  #error including notes on migrating applications from lwIP to NicheStack.
#endif




/*
 *  Task Priorities:
 *  MicroC/OS-II only allows one task (thread) per priority number.   
 */
#define SS_LISTENER_TASK_PRIORITY  	9	//Also, another priority just below this one will be reserved for mutex
#define SS_LISTENER_STACK_SIZE		(6144+8192)

#define NR_CHANNELS 1	//number of listening sockets - as in Wiznet
						//Each socket listens on its own port and is able to open one "talking" connection at a time
						//If a new connection request comes, the old one gets preempted. This allows us killing dead connections.


/*
 * If DHCP will not be used, select valid static _BASE_ IP addresses here:
 *  The contents of DIPSW[3:0] will be added to the last byte of the IP.
 *  DIPSW[4] is used to enable/disable DHCP.
 */
#define IPADDR0   10
#define IPADDR1   0
#define IPADDR2   7
#define IPADDR3   16

#define GWADDR0   10
#define GWADDR1   0
#define GWADDR2   7
#define GWADDR3   1

#define MSKADDR0  255
#define MSKADDR1  255
#define MSKADDR2  255
#define MSKADDR3  0


/* 
 * Here we structure to manage sss communication for a single connection
 */
typedef struct SS_SOCKET
{
  enum { FREE, LISTENING, CONNECTED} state;
  int 		fd_listen;
  int       fd_conn;
  int 		listenport;
} SSConn;

// *** User's interface ***

int ethernet_init();
/*REMARK: All the below functions can be used ONLY:
	1: After ethernet_init();
	2: From a task created by TK_NEWTASK. */
int ethernet_listen(int channel, int port);						//Remark: Once we listen on a port, we can not change it
int ethernet_write(int channel, int size, unsigned char* data);
int ethernet_read(int channel, int size, unsigned char* data);	//Non-blocking. Returns the number of characters read.
int ethernet_close(int channel);

#endif /* __SOCKET_SERVER_H__ */

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/
