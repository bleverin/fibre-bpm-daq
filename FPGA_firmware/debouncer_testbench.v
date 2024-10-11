//This is a testbench from the UDP generator


`timescale 1 ns / 1 ns
module debouncer_testbench();


//Signals

	reg         clk;               
	reg         rst;                
	reg  	    in;          
	wire        out; 

initial
begin
	clk 		= 0;
	rst 		= 1;
	in			= 0;

	#50 
	rst 		= 0;

	#20
	in 	= 1;
	#20
	in 	= 0;

	#200
	in 	= 1;
	#200
	in 	= 0;

	#100
	in 	= 1;
	#100
	in 	= 0;

	#20
	in 	= 1;
	#200
	in 	= 0;

	#20
	in 	= 1;
	#20
	in 	= 0;

	#20
	in 	= 1;
	#20
	in 	= 0;

	#20
	in 	= 1;
	#20
	in 	= 0;

	#20
	in 	= 1;
	#20
	in 	= 0;

	#1000
	in 	= 1;
	#500
	in 	= 0;	
	
	#20000
	$stop;

end

always #5 clk = ~clk;


debouncer #(
	.LENGTH	(25)
) the_debouncer(
	.clk	(clk),                	
	.rst	(rst),              	
	.in		(in),            	
	.out	(out)        
	);	





endmodule