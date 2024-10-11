/*
CLUSTER LOCATE:
if there is continuous [equal or more than SIZE]signals above THRESHOLD, there is cluster;
The STATE_FIRST_CLUSTER find the left position of the Cluster; sig_ch_left
if there is more than one cluster, the STATE_LAST_CLUSTER determine the right position of the Cluster; sig_ch_right
When the address is 319, it goes to output state:
the has_cluster, no_cluster, sig_ch_left and sig_ch_right keep for two clocks
*/

//the interface tested  by algo_top_cl_tb.v
//the detailed math precise tested by cluster_locate_tb.v

module cluster_locate // #(parameter THRESHOLD=54, SIZE=4)
(

	input wire clk,
	input wire rst, // connect to the data_in_startofpacket; to reset for everyframe
	
	//avalon ST(Streaming) sink: 0 readlatency and 0 readallowence  320 channel
	input logic signed [15:0] data_in_data,           //  st.data
	output wire        data_in_ready,          //         .ready
	input  wire        data_in_valid,          //         .valid
	input  wire 		 data_in_empty,          //         .empty
	input  wire        data_in_endofpacket,    //         .endofpacket
	input  wire        data_in_startofpacket,  //         .startofpacket

	input wire[15:0] THRESHOLD, //range 0~255
	input wire[8:0] SIZE,	//range 0~255
	
	output wire[8:0] sig_ch_left,
	output wire[8:0] sig_ch_right,
	output wire has_cluster,
	output wire no_cluster,
	
	output wire data_in_last //.... after this, there is has_cluster of no_cluster signal
);
	
	assign data_in_last = data_in_endofpacket;
	
	localparam CHANNEL_NUM = 320;
	reg signed[15:0] REG_THRESHOLD;
	reg unsigned[8:0] REG_SIZE;
	
	reg[2:0] states;
	localparam STATE_IDLE = 3'b000;
	localparam STATE_REC = 3'b001;
	localparam STATE_FIRST_CLUSTER = 3'b011;
	localparam STATE_LAST_CLUSTER = 3'b010;
	localparam STATE_HAS_CLUSTER = 3'b110;
	localparam STATE_NO_CLUSTER = 3'b111;
	localparam STATE_HAS_CLUSTER_KEEP = 3'b101;
	localparam STATE_NO_CLUSTER_KEEP = 3'b100;
	
	reg unsigned[8:0] size_ctr; //the same as the channel
	reg[8:0] ch_left;
	reg[8:0] ch_right;
	reg[8:0] address; 
	
	
	assign sig_ch_left = (states == STATE_HAS_CLUSTER || states == STATE_HAS_CLUSTER_KEEP)? ch_left: 9'd0;
	assign sig_ch_right = (states == STATE_HAS_CLUSTER || states == STATE_HAS_CLUSTER_KEEP)? ch_right: 9'd0;
	assign has_cluster = (states==STATE_HAS_CLUSTER || states == STATE_HAS_CLUSTER_KEEP)? 1'b1: 1'b0;
	assign no_cluster = (states==STATE_NO_CLUSTER || states == STATE_NO_CLUSTER_KEEP)? 1'b1 : 1'b0;
	
	assign data_in_ready = (states == STATE_REC || states == STATE_FIRST_CLUSTER || states == STATE_LAST_CLUSTER)? 1'b1: 1'b0;
	
	wire data_over_th;  /* synthesis keep */
	assign data_over_th = (data_in_data > REG_THRESHOLD)? 1'b1: 1'b0;
	
	
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
			ch_left <= 0;
			ch_right <= 0;
			address <= 0; 
			size_ctr <= 0;
			states <= STATE_IDLE;
			REG_THRESHOLD <= THRESHOLD;
			REG_SIZE <= SIZE; 
		end
		else
			case(states)
				STATE_IDLE:
				begin
					ch_left <= 0;
					ch_right <= 0;
					address <= 0; 
					size_ctr <= 0;
					REG_THRESHOLD <= THRESHOLD;
					REG_SIZE <= SIZE;
					if (data_in_startofpacket)
						states <= STATE_REC;
				end
				STATE_REC:
				begin
					if (data_in_valid)
					begin
						address <= address + 1'b1; 
						if (data_in_endofpacket) 
							states <= STATE_NO_CLUSTER;
						else if (data_over_th)
						begin
							size_ctr <= size_ctr + 1'b1;
							states <= STATE_FIRST_CLUSTER;
							ch_left <= address;
						end
					end	
				end
				STATE_FIRST_CLUSTER:
				begin
					if (data_in_valid) 
					begin
						address <= address + 1'b1; 
						if (data_in_endofpacket)
						begin
							if ((size_ctr + data_over_th) > REG_SIZE)
							begin
								states <= STATE_HAS_CLUSTER;
								ch_right <= address;
							end else
								states <= STATE_NO_CLUSTER;
						end
						else if (data_over_th)
							size_ctr <= size_ctr + 1'b1;
						else   
						begin
							size_ctr <= 0;
							if (size_ctr > REG_SIZE)
							begin
								states <= STATE_LAST_CLUSTER;
								ch_right <= address -1'b1;
							end else
							begin
								states <= STATE_REC;
								ch_left <= 0; 
							end
						end
					end
				end
				STATE_LAST_CLUSTER:
				begin	
					if (data_in_valid)
					begin
						address <= address + 1'b1; 
						if (data_in_endofpacket)
						begin
						states <= STATE_HAS_CLUSTER;
						if ((size_ctr + data_over_th) > REG_SIZE)
							ch_right <= address;
						end	
						else if (data_over_th)
							size_ctr<= size_ctr + 1'b1;
						else 
						begin
							if (size_ctr > REG_SIZE)
								ch_right <= address-1'b1;
							size_ctr <= 0;
						end
					end
				end
				STATE_HAS_CLUSTER:
				begin
					states <= STATE_HAS_CLUSTER_KEEP;
				end
				STATE_NO_CLUSTER:
				begin
					states <= STATE_NO_CLUSTER_KEEP;
				end
				STATE_HAS_CLUSTER_KEEP:
				begin
					states <= STATE_IDLE;
				end
				STATE_NO_CLUSTER_KEEP:
				begin
					states <= STATE_IDLE;
				end
				default:
					states <= STATE_IDLE;
			endcase		
	end

endmodule


