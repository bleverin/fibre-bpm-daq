/******************************************************************************
* Copyright (c) 2006 Altera Corporation, San Jose, California, USA.           *
* All rights reserved. All use of this software and documentation is          *
* subject to the License Agreement located at the end of this file below.     *
*******************************************************************************
* Date - October 24, 2006                                                     *
* Module - simple_socket_server.c                                             *
*                                                                             *
******************************************************************************/
 
/******************************************************************************
 * Simple Socket Server (SSS) example. 
 * 
 * This example demonstrates the use of MicroC/OS-II running on NIOS II.       
 * In addition it is to serve as a good starting point for designs using       
 * MicroC/OS-II and Altera NicheStack TCP/IP Stack - NIOS II Edition.                                          
 *                                                                             
 * -Known Issues                                                             
 *     None.   
 *      
 * Please refer to the Altera NicheStack Tutorial documentation for details on this 
 * software example, as well as details on how to configure the NicheStack TCP/IP 
 * networking stack and MicroC/OS-II Real-Time Operating System.  
 */
 
#include <stdio.h>
#include <string.h>
#include <ctype.h> 

/* MicroC/OS-II definitions */
#include "includes.h"

/* Simple Socket Server definitions */
#include "socket_server.h"
//#include "alt_error_handler.h"

/* Nichestack definitions */
#include "ipport.h"
#include "tcpport.h"
#include "libport.h"
#include "osport.h"


static OS_EVENT *mutex;

static SSConn connections[NR_CHANNELS];

TK_OBJECT(to_sslistenertask);
TK_ENTRY(SSListenerTask);

struct inet_taskinfo sslistenertask =
{
      &to_sslistenertask,
      "socket server listener",
      SSListenerTask,
	  SS_LISTENER_TASK_PRIORITY,
	  SS_LISTENER_STACK_SIZE,
};

// ********************************************************



void ss_reset_connection(SSConn* conn)	//called e.g. after closing a socket
{
  conn->fd_conn = -1;
  conn->state = LISTENING;
  return;
}

void ss_initialize_connection(SSConn* conn)	//called only at initialization
{
  conn->fd_conn = -1;
  conn->fd_listen = -1;
  conn->listenport = -1;
  conn->state = FREE;
  return;
}

void ss_handle_accept(SSConn* conn)
{
	int                 socket;
	int					len;
	struct sockaddr_in  incoming_addr;

	INT8U err;
	OSMutexPend(mutex, 0, &err);

	len = sizeof(incoming_addr);

	  //Close old connection if needed
	if ((conn)->fd_conn != -1)
	{
		printf("[ss_handle_accept] closing old connection\n");
		close(conn->fd_conn);
		ss_reset_connection(conn);
	}

	if((socket=accept(conn->fd_listen,(struct sockaddr*)&incoming_addr,&len))<0)
	{
		//alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,
		//					 "[ss_handle_accept] accept failed");
	}
	else
	{
		(conn)->fd_conn = socket;
		(conn)->state = CONNECTED;
		printf("[ss_handle_accept] accepted connection request from %s\n",
		   inet_ntoa(incoming_addr.sin_addr));
	}
  
	OSMutexPost(mutex);
	return;
}

/*
 * Listener Task()
 */
void SSListenerTask(void* param)
{

  int max_socket = 0;
  BSD_TIMEVAL_T timeout;

  INT8U err;
  OSMutexPend(mutex, 0, &err);	//wrap initialization in a mutex - just in case...

  timeout.tv_sec = 0;
  timeout.tv_usec = 100000;

  fd_set readfds;	//set of descriptors
  
  for (int ch = 0; ch < NR_CHANNELS; ch++)
	  if ((connections[ch].fd_listen = socket(AF_INET, SOCK_STREAM, 0)) < 0)
	  {
		  //printf("Errot initializing socket #%d!\n", ch);
		  //alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_task] Socket creation failed");
	  }

  	  //Binding etc. is done by ethernet_listen()

  OSMutexPost(mutex);

  	  //Now run in loop to handle incoming requests on all listening ports
  while(1)
  {
		FD_ZERO(&readfds);

		for (int ch = 0; ch < NR_CHANNELS; ch++)
			if (connections[ch].listenport >= 0)
			{
				FD_SET(connections[ch].fd_listen, &readfds);
				if (connections[ch].fd_listen >= max_socket)
					max_socket = connections[ch].fd_listen+1;
			}

		if (max_socket == 0)
			TK_SLEEP(10);	//just sleep a bit if nothing to do
		else
		{
			select(max_socket, &readfds, NULL, NULL, &timeout);	//we must timeout from time to time to find newly set-up channels

			for (int ch = 0; ch < NR_CHANNELS; ch++)
				if (FD_ISSET(connections[ch].fd_listen, &readfds))
					ss_handle_accept(&(connections[ch]));
		}
  } /* while(1) */

  //never come here
}


// ****************** User interface ********************

int ethernet_init()
{
	  INT8U err;
	  mutex = OSMutexCreate(SS_LISTENER_TASK_PRIORITY-1, &err);


	  for (int ch = 0; ch < NR_CHANNELS; ch++)
		  ss_initialize_connection(&(connections[ch]));

	  TK_NEWTASK(&sslistenertask);
	  return 0;
}

int ethernet_listen(int channel, int port)
{
	  struct sockaddr_in addr;

		INT8U err;
		OSMutexPend(mutex, 0, &err);

	  addr.sin_family = AF_INET;
	  addr.sin_port = htons(port);
	  addr.sin_addr.s_addr = INADDR_ANY;

	  if (bind(connections[channel].fd_listen,(struct sockaddr *)&addr,sizeof(addr)) < 0)
	  {
		  //alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_task] Bind failed");
		  OSMutexPost(mutex);
		  return -1;
	  }

	  if (listen(connections[channel].fd_listen,1) < 0)
	  {
		  //alt_NetworkErrorHandler(EXPANDED_DIAGNOSIS_CODE,"[sss_task] Listen failed");
		  OSMutexPost(mutex);
		  return -2;
	  }

	  ss_reset_connection(&(connections[channel]));
	  connections[channel].listenport = port;
	  printf("[sss_task] Simple Socket Server listening on port %d\n", port);

	  OSMutexPost(mutex);
	  return 0;
}

int ethernet_write(int channel, int size, unsigned char* data)
{
	int result;

	INT8U err;
	OSMutexPend(mutex, 0, &err);

	if (connections[channel].fd_conn == -1)	//socket is closed or channel unconfigured
	{
		OSMutexPost(mutex);
	    return 0;
	}

	result = (int)send(connections[channel].fd_conn, data, size, 0);
	if (result == -1)
	{
		printf("[ethernet_write] closing connection due to error\n");
		close(connections[channel].fd_conn);			//close connection on error
		ss_reset_connection(&(connections[channel]));
		result = 0;
	}

	OSMutexPost(mutex);
	return result;
}

int ethernet_read(int channel, int size, unsigned char* data)
{
	fd_set readfds;	//set of descriptors
	int max_socket;
	BSD_TIMEVAL_T timeout;
	int result;

	INT8U err;
	OSMutexPend(mutex, 0, &err);

	if (connections[channel].fd_conn == -1)	//socket is closed or channel unconfigured
	{
		OSMutexPost(mutex);
	    return 0;
	}

		//prepare call parameters
    FD_ZERO(&readfds);
    FD_SET(connections[channel].fd_conn, &readfds);
    max_socket = connections[channel].fd_conn+1;
    timeout.tv_sec = 0;
    timeout.tv_usec = 0;

    	//check for data
    if (select(max_socket, &readfds, NULL, NULL, &timeout))
    	if (FD_ISSET(connections[channel].fd_conn, &readfds))
    	{
    		result =  (int)recv(connections[channel].fd_conn, data, size, 0);
    		if (result == -1)
    		{
    			printf("[ethernet_read] closing connection due to error\n");
    			close(connections[channel].fd_conn);			//close connection on error
    			ss_reset_connection(&(connections[channel]));
    			result = 0;
    		}
    		OSMutexPost(mutex);
    		return result;
    	}

	OSMutexPost(mutex);
    return 0;
}

int ethernet_close(int channel)
{
	INT8U err;
	OSMutexPend(mutex, 0, &err);

	close(connections[channel].fd_conn);
	ss_reset_connection(&(connections[channel]));

	OSMutexPost(mutex);
	return 0;
}


/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2009 Altera Corporation, San Jose, California, USA.           *
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
