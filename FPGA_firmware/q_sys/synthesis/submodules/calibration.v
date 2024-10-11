//module calibration has two functions: calibration and merge 16-bit stream to 32-bit stream and then output
//calibration output 16-bit data_caled
//a better design is a design seperate these two functions
//tested by calibration_tb 25.07.2024

module calibration
(

	input wire clk,
	input wire rst, // connect to the data_in_startofpacket; to reset for everyframe
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence  320 channel
	input  wire signed[15:0] data_in_data,           //  st.data
	output wire        data_in_ready,          //         .ready
	input  wire        data_in_valid,          //         .valid
	input  wire 		 data_in_empty,          //         .empty
	input  wire        data_in_endofpacket,    //         .endofpacket
	input  wire        data_in_startofpacket,  //         .startofpacket
	
	//the interface with cali_ram (storing cali factor) Avalon-MM: read califac from this ram
	output wire [8:0] 	address,
	output wire 			clken, //read
	input  wire [15:0] 	cali_fac,
	input  wire				waitrequest,
	
	//the interface for provide the calibrated data in a ram // one clock latency
	input  wire [8:0]			data_caled_address,
	output wire [15:0]		data_caled,
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
	
	localparam SHIFT_BIT = 13; //2^13 = 8192, the calibration factor 1 is represented by 8192 
	
	//for to_udp_data
	reg [15:0] first_data_buffer;
	
	//for read calibration ram
	reg [8:0]  	read_cali_address;
	reg signed[16:0]   cali_fac_buffer;
	wire read;
	assign clken = read;
	assign address = read_cali_address;
	
	//for write and read the calibrated data
	reg signed[31:0]	data_caled_data_32bit;
	wire 			data_caled_wren_a;
	reg [8:0]	data_caled_address_a;
	wire [8:0]	address_b;
	assign		address_b = (data_caled_rd_enable)? data_caled_address: 9'd0;
	wire[15:0]	data_caled_data_a;
	assign data_caled_data_a = {data_caled_data_32bit[31],data_caled_data_32bit[14+SHIFT_BIT:SHIFT_BIT]};
	
	
	data_caled_ram	data_caled_ram0 (
		
		.clock ( clk ),
		
		.address_a (data_caled_address_a),
		.data_a (data_caled_data_a),
		.wren_a (data_caled_wren_a),
		.q_a ( ),

		.address_b ( address_b ),
		.data_b ( ),
		.wren_b (1'b0),
		.q_b ( data_caled)
		);
		
	//the state machine for read calibration factor from ram
	reg[3:0] state;
	localparam STATE_IDLE = 4'd0; //waiting for startofpacket
	localparam STATE_CAL0 = 4'd1; //get califactor for channel0
	localparam STATE_INPUT0 = 4'd2; // stream in data for channel0;
	localparam STATE_CAL1 = 4'd3; // get califactor for channel1
	localparam STATE_INPUT1 = 4'd4; // stream in data for channel1;
	localparam STATE_CAL2 = 4'd5; //get califactor for channel1; output the first 32-bit udp data [channel0, channel1]
	localparam STATE_INPUT_EVEN = 4'd6; // stream in data for channel 2,4,6.....
	localparam STATE_CAL_ODD = 4'd7; 
	localparam STATE_INPUT_ODD = 4'd8;
	localparam STATE_CAL_EVEN = 4'd9;
	localparam STATE_OUTPUT_LAST = 4'd10; //outout the last 32-bit udp data 
	

	assign data_in_ready = (state == STATE_INPUT0 || state == STATE_INPUT1 || state == STATE_INPUT_EVEN || state == STATE_INPUT_ODD)?1'b1:1'b0;
	assign data_caled_wren_a = (state == STATE_CAL1 || state == STATE_CAL2 || state == STATE_CAL_EVEN || state == STATE_CAL_ODD || state == STATE_OUTPUT_LAST)?1'b1:1'b0;
	assign read = (state == STATE_CAL0 ||state == STATE_CAL1 || state == STATE_CAL2 || state == STATE_CAL_EVEN || state == STATE_CAL_ODD)?1'b1:1'b0;
	
	
	
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
			state <= STATE_IDLE;
			data_caled_address_a <= 0;
			read_cali_address <= 0; 
		end
		else case(state)
		STATE_IDLE:
		begin
			data_caled_address_a <= 0;
			read_cali_address <= 0; 
			if (data_in_startofpacket)
			begin
				state <= STATE_CAL0;
			end
		end
		STATE_CAL0:
		begin
			if (~waitrequest) begin
				cali_fac_buffer <= {1'b0,cali_fac};
				state <= STATE_INPUT0;
			end
		end
		STATE_INPUT0:
		begin
			if (data_in_valid) 
			begin
				first_data_buffer <= 16'd0;
				data_caled_data_32bit <= data_in_data*cali_fac_buffer;
				//data_caled_data_32bit <= cali_fac_buffer;// test! cali 
				read_cali_address <= read_cali_address + 1'b1;
				state <= STATE_CAL1;
			end
		end
		STATE_CAL1:
		begin
			if (~waitrequest) begin
				cali_fac_buffer <= {1'b0,cali_fac};
				state <= STATE_INPUT1;
			end
		end
		STATE_INPUT1:
		begin
			if (data_in_valid) 
			begin
				first_data_buffer <= data_caled_data_a;
				data_caled_data_32bit <= data_in_data*cali_fac_buffer;
				//data_caled_data_32bit <= cali_fac_buffer;// test! cali 
				read_cali_address <= read_cali_address + 1'b1;
				data_caled_address_a <= data_caled_address_a + 1'b1;
				state <= STATE_CAL2;
			end
		end
		STATE_CAL2:
		begin
			if (~waitrequest & to_udp_ready) begin
				cali_fac_buffer <= {1'b0,cali_fac};
				state <= STATE_INPUT_EVEN;
			end
		end
		STATE_INPUT_EVEN:
		begin
			if (data_in_valid) 
			begin
				data_caled_data_32bit <= data_in_data*cali_fac_buffer;
				//data_caled_data_32bit <= cali_fac_buffer;// test! cali 
				first_data_buffer <= 16'd0;
				read_cali_address <= read_cali_address + 1'b1;
				data_caled_address_a <= data_caled_address_a + 1'b1;
				if (data_in_endofpacket)
					state <= STATE_OUTPUT_LAST;
				else
					state <= STATE_CAL_ODD;
			end
		end
		STATE_CAL_ODD:
		begin
			if (~waitrequest) begin
				cali_fac_buffer <= {1'b0,cali_fac};
				state <= STATE_INPUT_ODD;
			end
		end
		STATE_INPUT_ODD:
		begin
			if (data_in_valid) 
			begin
				first_data_buffer <= data_caled_data_a;
				data_caled_data_32bit <= data_in_data*cali_fac_buffer;
				//data_caled_data_32bit <= cali_fac_buffer;// test! cali 
				read_cali_address <= read_cali_address + 1'b1;
				data_caled_address_a <= data_caled_address_a + 1'b1;
				if (data_in_endofpacket)
					state <= STATE_OUTPUT_LAST;
				else
					state <= STATE_CAL_EVEN;
			end
		end
		STATE_CAL_EVEN:
		begin
			if (~waitrequest & to_udp_ready) begin
				cali_fac_buffer <= {1'b0,cali_fac};
				state <= STATE_INPUT_EVEN;
			end
		end
		STATE_OUTPUT_LAST: 
		begin
			if (to_udp_ready)
				state <= STATE_IDLE;
		end
		default:
			state <= STATE_IDLE;
		endcase
	end
	
	
	//output the 160 32bit words to upd, first channel [31:16] , second channel [15:16]
	//output  wire [31:0] to_udp_data,           //  st.data
	assign to_udp_valid = (((state == STATE_CAL2 || state == STATE_CAL_EVEN) && (~waitrequest))|| state == STATE_OUTPUT_LAST)? 1'b1: 1'b0;
	assign to_udp_empty = 2'b0;
	assign to_udp_startofpacket = (state == STATE_CAL2 && (~waitrequest))? 1'b1:1'b0;
	assign to_udp_endofpacket = (state == STATE_OUTPUT_LAST)? 1'b1: 1'b0;
	//reverse the polarity for output => no for simulation
	assign to_udp_data = (((state == STATE_CAL2 || state == STATE_CAL_EVEN) && (~waitrequest))|| state == STATE_OUTPUT_LAST) ? {~first_data_buffer,~data_caled_data_a}: 32'b0; 
	
	
	
	

endmodule
