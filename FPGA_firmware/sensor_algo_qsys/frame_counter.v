//the frame counter
//count the frame number by the sensor_interface status_out[0] rising edge



module frame_counter(
	
	input wire clk_clk,
	input wire rst_reset, //this reset should connect to sensor_interface int_rst
	
	input wire sig,
	input wire [31:0] data_in, //for connect in qsys only
	input wire data_in_endofpacket, // for connect in qsys only
	
	output reg [26:0] frame_Num
);


	reg sig_last;
	
	always @(posedge clk_clk or posedge rst_reset)
	begin
		if (rst_reset)
		begin
			sig_last <= 1'b0;
			frame_Num <= 27'b0;
		end
		else 
		begin
			sig_last <= sig;
			if (~sig_last&&sig)
				frame_Num <= frame_Num + 1'b1; 
		end
	end
			
endmodule