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
	input wire enable,
	
	input wire[26:0] frameID,
	
	input wire [7:0] address, 
	input  wire [31:0] data_in_data,
	input wire 		data_in_valid,
	output wire [31:0] bkg_signal,
	output wire bkg_sub_status
	); 
	
	wire wren;
	reg[7:0] wraddress_buffer; //delay address 3 clocks
	//reg[31:0] reg_data_in; //delay data_in_data 1 clocks

	
	wire[31:0] q_sig1; //output from ram
	wire[31:0] data_sig1; //write in the ram
	reg[31:0] reg_sum1;
	
	wire[31:0] q_sig2;
	wire[31:0] data_sig2;
	reg[31:0] reg_sum2;

	//	localparam TOTAL_FRAME = 8192; //2^13= 8192
	//	localparam SHIFG_BIT = 13; 
	
	//for fast simulation
	//localparam TOTAL_FRAME = 4; //2^2= 4
	localparam SHIFT_BIT = $clog2(TOTAL_FRAME); 
	
	ram4bkg ram4bkg1 (
    .data(data_sig1),
    .rdaddress(address),
    .clock(clk_clk),
    .wraddress(wraddress_buffer),
    .wren(wren),
    .q(q_sig1)
  );
  
  ram4bkg ram4bkg2 (
    .data(data_sig2),
    .rdaddress(address),
    .clock(clk_clk),
    .wraddress(wraddress_buffer),
    .wren(wren),
    .q(q_sig2)
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
		
	assign bkg_signal[31:16] = (states==STATE_BKG_OUT)?q_sig1[SHIFT_BIT+15:SHIFT_BIT]:16'b0;
	assign bkg_signal[15:0] = (states==STATE_BKG_OUT)?q_sig2[SHIFT_BIT+15:SHIFT_BIT]:16'b0;

   assign wren = (states==STATE_RAM_RST || states==STATE_BKG_ADD)? 1'b1: 1'b0;
	assign data_sig1 = (states==STATE_BKG_ADD)? reg_sum1: 0;
	assign data_sig2 = (states==STATE_BKG_ADD)? reg_sum2: 0;
	
	
	
	always @(posedge clk_clk or posedge rst_reset)
	begin
		if (rst_reset)
		begin
			reg_sum1 <= 0;
			//reg_data_in[1] <= 0;
			wraddress_buffer <= 0;
			reg_sum2 <= 0;

		end
		else 
			case(states)
				STATE_IDLE:
				begin
					reg_sum1 <= 0;
					//reg_data_in[1] <= 0;
					reg_sum2 <= 0;

				end
				STATE_BKG_ADD:
				begin
					if (data_in_valid)
					begin
						//reg_data_in <= data_in_data;
						reg_sum1 <= q_sig1 + data_in_data[31:16];
						reg_sum2 <= q_sig2 + data_in_data[15:0];
						wraddress_buffer <= address;
					end
				end
				STATE_RAM_RST:
					wraddress_buffer[0] <= address;
			endcase
	end
	
	
endmodule
