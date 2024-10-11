// UDP generator
/*
Takes an input stream and generates a valid UDP/IPv4 packet, then outputs it as a stream which can be directly connected to TSE.

Remarks:
- Both input and output are Avalon ST ports, 8-bit symbol, 4 symbols per beat
- Start/end of packet signals are REQUIRED.
- Empty signals are discarded. An incoming packet should have a length of 4N. If not, it will be padded with what's on the bus.
- Backpressure is supported and actively used during transfer. Data source must be backpressurizable.
- The transfer is performed on the fly, without buffering. Input gets backpressed for the time of sending headers.
- Size of payload must be known in advance and programmed over Avalon MM interface. 
- Longer packets will be cut. Shorter packets will be padded with zeros.
- UDP checksum is not calculated (the price of realtime approach) and filled with zeros. IP header checksum is calculated.
- The Programming interface is an Avalon MM. It's 32-bit wide and allows byte, halfword and word operations. Block transfers are not supported.
- Source MAC is not programmable; it must be filled by TSE. 
- Two leading zero bytes are added on front of the packet for 32-bit alignment. TSE settings must comply wit this.
- If transfer is disabled (see control bits), the input will be backpressed all the time.
- Maximum transfer size is about 64K, but limitations of the Ethernet must be taken into account.
- The IPv4 header has the 'Don't fragment' flag set.

Register map: (byte offsets are given)
UDPGEN_REG_CSR		0	//16 bits 	8 bits control(LSB) + 8 bits status(MSB)
UDPGEN_REG_SIZE		2	//16 bits	payload size in words
UDPGEN_REG_SRCIP	4	//32 bits	source IP, last octet first
UDPGEN_REG_DSTIP	8	//32 bits	destination IP. last octet first
UDPGEN_REG_DSTPORT	12	//16 bits	destination port
UDPGEN_REG_SRCPORT	14	//16 bits	source port
UDPGEN_REG_DSTMAC	16	//2*32 bits	destination MAC, last octet first
UDPGEN_REG_RES1		24	//32 bits	reserved
UDPGEN_REG_RES2		28 	//32 bits	reserved

Control bits:
0: transfer enable
1-7: unused

Status bits:
0-3: state of the machine
7-4: unused

*/


`timescale 100 ps / 100 ps
module udp_generator (
		input  wire        clk_clk,                //      clk.clk
		input  wire        rst_reset,              //      rst.reset
		input  wire [2:0]  csr_address,            //      csr.address
		input  wire        csr_write,              //         .write
		input  wire [31:0] csr_writedata,          //         .writedata
		input  wire [3:0]  csr_byteenable,         //         .byteenable
		input  wire        csr_read,               //         .read
		output wire [31:0] csr_readdata,           //         .readdata
		input  wire [31:0] data_in_data,           //  data_in.data
		output wire        data_in_ready,          //         .ready
		input  wire        data_in_valid,          //         .valid
		input  wire [1:0]  data_in_empty,          //         .empty
		input  wire        data_in_endofpacket,    //         .endofpacket
		input  wire        data_in_startofpacket,  //         .startofpacket
		output wire [31:0] data_out_data,          // data_out.data
		output wire [1:0]  data_out_empty,         //         .empty
		output wire        data_out_endofpacket,   //         .endofpacket
		output wire        data_out_startofpacket, //         .startofpacket
		input  wire        data_out_ready,         //         .ready
		output wire        data_out_valid          //         .valid
	);


	// *********************** CSR stuff ************************
	
	reg 	[31:0] 	registers[7:0];		//main register space
	wire 	[31:0]	reg0_read;		//reg[0] is read indirectly to include status byt(bits 15-8)

		//read logic
	assign reg0_read[7:0] 	= registers[0][7:0];		// Readback of control bits
	assign reg0_read[31:16] = registers[0][31:16];		// Readback of payload size
	assign reg0_read[15:12] = 0;				// Unused bits of the status byte
	assign csr_readdata 	= (csr_address==0) ? reg0_read : registers[csr_address];

		//write logic
	genvar i;
	genvar j;
	generate
	for (i = 0; i < 8; i = i+1)
	begin : write_registers	//Quartus wants labels for 'for' blocks
		for (j = 0; j < 4; j = j+1)
		begin : write_bytes
			always @(posedge clk_clk or posedge rst_reset)
			begin 
				if (rst_reset)
					registers[i][8*j+7:8*j] <= 8'd0;
				else
					if (csr_byteenable[j] && (csr_address == i) && (csr_write))
						registers[i][8*j+7:8*j] <= csr_writedata[8*j+7:8*j];
			end
		end
	end	
	endgenerate
	
	
	// *********************** ST interface ***********************

	reg	[4:0]	state;		//State of the state machine
	localparam STATE_IDLE	= 0;	//waiting for SOP
	localparam STATE_MAC1	= 1;	//sending first word of MAC header: 				00 00 dest_mac[5:4]
	localparam STATE_MAC2	= 2;	//sending second word of MAC header: 				dest_mac[3:0]
	localparam STATE_MAC3	= 3;	//sending zeroes as source MAC msbs:				00 00 00 00
	localparam STATE_MAC4	= 4;	//sending zeroes as source MAC lsbs & packet type:		00 00 08 00
	localparam STATE_IP1	= 5;	//sending IP ver & header size, DSF, total length		45 00 length[1:0]
	localparam STATE_IP2	= 6;	//sending IP id, flags (don't fragment), fragm. offset=0	ip_id[1:0] 40 00
	localparam STATE_IP3	= 7;	//sending TTL, protocol, header checksum			80 11 checksum[1:0]
	localparam STATE_IP4	= 8;	//sending source IP						src_ip[4:0]
	localparam STATE_IP5	= 9;	//sending destination IP					dst_ip[4:0]
	localparam STATE_UDP1	= 10;	//sending src & dest port					src_port[1:0] dst_port[1:0]
	localparam STATE_UDP2	= 11;	//sending UDP frame length and (unused) checksum		udp_length[1:0] 00 00
	localparam STATE_DATA	= 12;	//sending packet data but the last word
	localparam STATE_PAD	= 13;	//padding packet with zeros if incoming packet was too short
	localparam STATE_DUMP	= 14;	//dumping tail of incoming packet if it was too long
	localparam STATE_END	= 15;	//transfer finished, just wait one cycle

	reg		reg_ready;	//registers to drive output pins of ST interfaces
	reg		reg_valid;
	reg	[31:0]	reg_data;
	reg		reg_startofpacket;
	reg		reg_endofpacket;
	reg		reg_empty;

		//Helper stuff
	wire	[15:0]	udp_length;	
	wire	[15:0]	total_length;
	wire	[19:0]  int_checksum;
	wire 	[16:0]	int_checksum2;	
	wire	[15:0]	header_checksum;	
	reg	[15:0]	ip_id;	//unique identifier of a packet
	reg	[15:0]	tx_ctr;	//counter of sent data words

	assign reg0_read[11:8] = state;	//state forwarded to status register

	assign udp_length = 4*registers[0][31:16] + 16'd8;	
	assign total_length = 4*registers[0][31:16] + 16'd28;

	assign int_checksum = 20'h10511 + total_length + ip_id + registers[1][31:16] + registers[1][15:0] + registers[2][31:16] + registers[2][15:0];
	assign int_checksum2 = int_checksum[15:0] + int_checksum[19:16];
	assign header_checksum = ~(int_checksum2[15:0] + int_checksum2[16]);

		//The state machine
	always @(posedge clk_clk or posedge rst_reset)
	begin 
		if (rst_reset)
		begin
			state <= STATE_IDLE;
			ip_id<= 0;
		end
		else
			case(state)
				STATE_IDLE:
				begin
					if (data_in_startofpacket && registers[0][0])
					begin
						state <= STATE_MAC1;
						ip_id <= ip_id+1;
						tx_ctr <= 1;
					end
				end
				STATE_MAC1, STATE_MAC2, STATE_MAC3, STATE_MAC4, STATE_IP1, STATE_IP2, STATE_IP3, STATE_IP4, STATE_IP5, STATE_UDP1, STATE_UDP2:
				begin
					if (data_out_ready)
						state <= state + 1;
				end
				STATE_DATA:
				begin
					if (data_out_ready && data_in_valid)
					begin
						tx_ctr <= tx_ctr+1;
						if ((tx_ctr == registers[0][31:16]) && data_in_endofpacket)	//last word, size matches
							state <= STATE_END;
						else if (data_in_endofpacket)					//packet too short
							state <= STATE_PAD;
						else if (tx_ctr == registers[0][31:16])				//packet too long
							state <= STATE_DUMP;
					end
				end
				STATE_PAD:
				begin
					if (data_out_ready)
					begin
						tx_ctr <= tx_ctr+1;
						if (tx_ctr == registers[0][31:16])				
							state <= STATE_END;
					end	
				end
				STATE_DUMP:
				begin
					if (data_out_ready && data_in_valid)
					begin
						if (data_in_endofpacket)
							state <= STATE_END;
					end
				end

				default:
				begin
					state <= STATE_IDLE;
				end
			endcase
	end

		//Driving bus signals
	always @( * )
	begin
		if (rst_reset)
		begin
			reg_ready = 0;
			reg_valid = 0;
			reg_data = 0;
			reg_startofpacket = 0;
			reg_endofpacket = 0;
			reg_empty = 0;
		end
		else
			case(state)
				STATE_IDLE:
				begin
					reg_ready 		= 0;
					reg_valid 		= 0;
					reg_data 		= 0;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_MAC1:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data[31:16] 	= 0;
					reg_data[15:0] 		= registers[5][15:0];
					reg_startofpacket 	= 1;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_MAC2:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data 		= registers[4];
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_MAC3:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data 		= 32'h00000000;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_MAC4:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data 		= 32'h00000800;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_IP1:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data[31:16]		= 16'h4500;
					reg_data[15:0]		= total_length;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_IP2:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data[31:16]		= ip_id;
					reg_data[15:0]		= 16'h4000;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_IP3:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data[31:16]		= 16'h8011;
					reg_data[15:0]		= header_checksum;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_IP4:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data		= registers[1];
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_IP5:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data		= registers[2];
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_UDP1:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data		= registers[3];
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_UDP2:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data[31:16]		= udp_length;
					reg_data[15:0]		= 16'h0000;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_DATA:
				begin
					reg_ready 		= data_out_ready;
					reg_valid 		= data_in_valid;
					reg_data		= data_in_data;
					reg_startofpacket 	= 0;
					if (tx_ctr == registers[0][31:16])
						reg_endofpacket 	= 1;
					else
						reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_PAD:
				begin
					reg_ready 		= 0;
					reg_valid 		= 1;
					reg_data		= 32'h0;
					reg_startofpacket 	= 0;
					if (tx_ctr == registers[0][31:16])
						reg_endofpacket 	= 1;
					else
						reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				STATE_DUMP:
				begin
					reg_ready 		= 1;
					reg_valid 		= 0;
					reg_data		= 0;
					reg_startofpacket = 0;
					reg_endofpacket = 0;
					reg_empty 		= 0;
				end
				STATE_END:
				begin
					reg_ready 		= 0;
					reg_valid 		= 0;
					reg_data 		= 0;
					reg_startofpacket 	= 0;
					reg_endofpacket 	= 0;
					reg_empty 		= 0;
				end
				default:
				begin
					reg_ready = 0;
					reg_valid = 0;
					reg_data = 0;
					reg_startofpacket = 0;
					reg_endofpacket = 0;
					reg_empty = 0;
				end
			endcase
	end

	
	assign data_in_ready = reg_ready;
	assign data_out_valid = reg_valid;
	assign data_out_data = reg_data;
	assign data_out_startofpacket = reg_startofpacket;
	assign data_out_endofpacket = reg_endofpacket;
	assign data_out_empty = reg_empty;

endmodule
