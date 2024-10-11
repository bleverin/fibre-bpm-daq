//module calibration
//tested by calibration_tb

module calibration
(

	input wire clk,
	input wire rst, // connect to the data_in_startofpacket; to reset for everyframe
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence  320 channel
	input  wire [15:0] data_in_data,           //  st.data
	output wire        data_in_ready,          //         .ready
	input  wire        data_in_valid,          //         .valid
	input  wire 		 data_in_empty,          //         .empty
	input  wire        data_in_endofpacket,    //         .endofpacket
	input  wire        data_in_startofpacket,  //         .startofpacket
	
	//the interface with cali_ram (storing cali factor) Avalon-MM: read califac from this ram
	output wire [8:0] 	address,
	output wire 			clken,
	input  wire [15:0] 	cali_fac,
	input  wire				waitrequest,
//	output wire 			write,
//	output wire 			chipselect,
//	output wire				writedata,
//	output wire 			byteenable,	
	
	//the interface for provide the calibrated data in a ram // one clock latency
	input  wire [8:0]			data_caled_address,
	output wire [31:0]		data_caled,
	input  wire					data_caled_rd_enable, // to enable read
	
	output wire					data_in_last, //....
	
	//avalon ST(Streaming) source: 0 readlatency and 0 readallowence //160 * 32 bits data  
	// channel 0 [31:16] channel 1 [15:0]
	output  wire [31:0] to_udp_data,           //  st.data
	input   wire        to_udp_ready,          //         .ready
	output  wire        to_udp_valid,          //         .valid
	output  wire [1:0]  to_udp_empty,          //         .empty
	output  wire        to_udp_endofpacket,    //         .endofpacket
	output  wire        to_udp_startofpacket  //         .startofpacket	
);
	
	assign data_in_last = data_in_endofpacket;
	
	
	//for to_udp_data
	reg [31:0] first_data_buffer;
	wire data_out_ready;// partly mask to_udp_ready 
	
	
	
	assign clken = 1'b1;
	reg [31:0]	data_a;
	reg [8:0]  	address_buffer[2:0]; 
	wire 			wren_a;
	
	//address_buffer[0] for read cali_fac, 1 clock earler than channel_ctr => address_buffer[1]; and address_buffer[2] is for store multiply cali_fac
	assign address = address_buffer[0];
	
	wire [8:0]	address_b;
	assign	address_b = (data_caled_rd_enable)? data_caled_address: 9'd0;
	
	
	data_caled_ram	data_caled_ram0 (
		
		.clock ( clk ),
		
		.address_a (address_buffer[2]),
		.data_a (data_a),
		.wren_a (wren_a),
		.q_a ( ),

		.address_b ( address_b ),
		.data_b ( ),
		.wren_b (1'b0),
		.q_b ( data_caled)
		);
		
		
	reg[2:0] state;
	localparam STATE_IDLE = 3'd0; //waiting for startofpacket
	localparam STATE_WAIT_FIRST = 3'd1; //after startofpacket, wait the first data*cali_fac 
	localparam STATE_MIDDLE = 3'd2; //nice pipelined
	localparam STATE_OUTPUT_LAST = 3'd3; //write the last channel
	localparam STATE_END = 3'd4;
	
	//assign data_in_ready = (state == STATE_WAIT_FIRST || state == STATE_MIDDLE)? 1'b1:1'b0;
	assign data_in_ready = (state == STATE_WAIT_FIRST)? 1'b1: ((state == STATE_MIDDLE)? (~address_buffer[2][0] || to_udp_ready): 1'b0);
	assign wren_a = (state == STATE_MIDDLE || state == STATE_OUTPUT_LAST)? 1'b1: 1'b0;

	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
			state <= STATE_IDLE;
			address_buffer[0] <= 0;
			address_buffer[1] <= 0;
			address_buffer[2] <= 0;
			data_a <= 0;
		end
		else case(state)
		STATE_IDLE:
		begin
			address_buffer[0] <= 0;
			address_buffer[1] <= 0;
			address_buffer[2] <= 0;
			first_data_buffer <= 0;
			data_a <= 0;
			if (data_in_startofpacket & data_in_valid)
			begin
				state <= STATE_WAIT_FIRST;
				address_buffer[0] <= address_buffer[0] + 1'b1;
			end
		end
		STATE_WAIT_FIRST:
		begin
			if (data_in_valid & ~waitrequest)
			begin
				state <= STATE_MIDDLE; 
				data_a <= data_in_data*cali_fac;
				address_buffer[0] <= address_buffer[0] + 1'b1;
				address_buffer[1] <= address_buffer[0];
				address_buffer[2] <= address_buffer[1];
			end
		end
		STATE_MIDDLE:
		begin
			if (data_in_valid & ~waitrequest)
			begin
				if (~address_buffer[2][0] || to_udp_ready)
				begin
					data_a <= data_in_data*cali_fac;
					address_buffer[0] <= address_buffer[0] + 1'b1;
					address_buffer[1] <= address_buffer[0];
					address_buffer[2] <= address_buffer[1];
					if (data_in_endofpacket)
						state <= STATE_OUTPUT_LAST;
					if (~address_buffer[2][0])
						first_data_buffer <= data_a;
				end
			end
		end
		STATE_OUTPUT_LAST:
		begin
			if (to_udp_ready)
				state <= STATE_END;
		end
		STATE_END:
			state <= STATE_IDLE;
		default:
			state <= STATE_IDLE;
		endcase
	end
	
	
	//output the 160 32bit words to upd, first channel [31:16] , second channel [15:16]
	//output  wire [31:0] to_udp_data,           //  st.data
	assign to_udp_valid = (state == STATE_MIDDLE || state == STATE_OUTPUT_LAST)? address_buffer[2][0]: 1'b0;
	assign to_udp_empty = 2'b0;
	assign to_udp_startofpacket = (state == STATE_MIDDLE && address_buffer[2] == 9'd1)? 1'b1: 1'b0;
	assign to_udp_endofpacket = (state == STATE_OUTPUT_LAST)? 1'b1: 1'b0;
	assign to_udp_data = ((state == STATE_MIDDLE || state == STATE_OUTPUT_LAST) && address_buffer[2][0])? {first_data_buffer[15:0],data_a[15:0]}: 32'b0; 
	assign data_out_ready = ~address_buffer[2][0] || to_udp_ready;
	//output 15:0 as calibrated data, this should be change to if calibration factor 1 is 3 bit, then it should be leftshift 3 bit
	
	
	
	

endmodule
