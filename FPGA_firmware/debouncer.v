// Signal debouncer

`timescale 100 ps / 100 ps
module debouncer (
		input	wire		rst,		//reset
		input	wire       	clk,        //clock
		input 	wire		in,			//signal input
		output	wire   		out			//signal output
	);

	parameter LENGTH=8;
	
	integer i;

	reg	[LENGTH-1:0]	queue;		//State of the state machine
	reg 				reg_out;
	wire 				all_low;
	wire 				all_high;
	
		//Little helpers
	assign all_low = ~(|queue);
	assign all_high = &queue;
	
	
	always @(posedge clk or posedge rst)
	begin 
		if (rst)
		begin
			queue[LENGTH-1:0] <= 0;		
			reg_out <= 0;
		end
		else
		begin
			queue[LENGTH-2:0] <= queue[LENGTH-1:1];	
			queue[LENGTH-1] <= in;
			
				//change the output state only if all the queue has a correct state
			case (reg_out)
				0:
				begin
					if (all_high)
						reg_out <= 1;
				end
				1:
				begin
					if (all_low)
						reg_out <= 0;
				end
			endcase
		end
	end
	
		//Assign output
	assign out = reg_out;


endmodule