
/*
The ram provides the background signal.
when frameID is 1, reset ram content to 0
frameID is 2~1+TOTAL_FRAME, sum the signal store in the ram
when rameID is TOTAL_FRAME+2, output the background signal
The TOTAL_FRAME has to be the power of 2, and it belongs to [2,65536]
In general, TOTAL_FRAME = 8192
*/

module bkg_ram #(parameter TOTAL_FRAME = 4)
(

	input wire clk_clk,
	input wire rst_reset,
	
	input wire[26:0] frameID,
	input wire [7:0] address, 
	input  wire [15:0] data_in_data,
	output wire [15:0] bkg_signal,
	output wire bkg_sub_status
	); 

	
	wire wren_sig;
	wire[31:0] q_sig;
	wire[31:0] data_sig;
	reg[7:0] wraddress_sig[3]; //delay address 3 clocks
	reg[31:0] reg_sum;
	reg[15:0] reg_data_in[2]; //delay data_in_data 2 clocks

//	localparam TOTAL_FRAME = 8192; //2^13= 8192
//	localparam SHIFG_BIT = 13; 
	
	//for fast simulation
	//localparam TOTAL_FRAME = 4; //2^2= 4
	localparam SHIFT_BIT = $clog2(TOTAL_FRAME); 
	
	ram4bkg ram4bkg_inst (
    .data(data_sig),
    .rdaddress(address),
    .clock(clk_clk),
    .wraddress(wraddress_sig[0]),
    .wren(wren_sig),
    .q(q_sig)
  );

  
  reg[1:0] states;
  localparam STATE_IDLE = 0;
  localparam STATE_RAM_RST = 1;
  localparam STATE_BKG_ADD = 3;
  localparam STATE_BKG_OUT = 2;
  
  assign bkg_sub_status = (states==STATE_BKG_OUT)? 1'b1:1'b0;
  
  always @(posedge clk_clk or posedge rst_reset)
  begin
   if (rst_reset)
		states <= STATE_IDLE;
	else if (frameID <=27'd1)
		states <= STATE_RAM_RST;
	else if (frameID >TOTAL_FRAME+1)
		states <= STATE_BKG_OUT;
	else 
		states <= STATE_BKG_ADD;
	end
		
	assign bkg_signal = (states==STATE_BKG_OUT)?q_sig[SHIFT_BIT+15:SHIFT_BIT]:16'b0;
   assign wren_sig = (states==STATE_RAM_RST || states==STATE_BKG_ADD)? 1'b1: 1'b0;
	assign data_sig = (states==STATE_BKG_ADD)? reg_sum: 0;
	
	
	always @(posedge clk_clk or posedge rst_reset)
	begin
		if (rst_reset)
		begin
			reg_sum <= 0;
			reg_data_in[1] <= 0;
			wraddress_sig[0] <= 0;
			wraddress_sig[1] <= 0;
			wraddress_sig[2] <= 0;
		end
		else 
			case(states)
				STATE_IDLE:
				begin
					reg_sum <= 0;
					reg_data_in[1] <= 0;
				end
				STATE_BKG_ADD:
				begin
					reg_data_in[1] <= data_in_data;
					reg_data_in[0] <= reg_data_in[1];
					reg_sum <= q_sig + reg_data_in[0];
					wraddress_sig[2] <= address;
					wraddress_sig[1] <= wraddress_sig[2];
					wraddress_sig[0] <= wraddress_sig[1];
				end
				STATE_RAM_RST:
					wraddress_sig[0] <= address;
			endcase
	end
	
	
endmodule
