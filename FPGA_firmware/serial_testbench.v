//This is a testbench from the UDP generator


`timescale 1 ns / 1 ns
module serial_testbench();


//Signals

	reg         clk;               
	reg         rst;             
	reg  [8:0]  tx_data;              
	reg  [7:0]  clk_divisor;              
	reg  	    trigger;          
	wire        serdata; 
	wire        tx_idle;     
	wire 	    newdata;
	wire [8:0]  rx_data;
	wire        rx_error;
	wire	    rx_idle;

initial
begin
	clk 		= 0;
	rst 		= 1;
	tx_data		= 9'h155;
	clk_divisor	= 20;
	trigger		= 0;

	#50 
	rst 		= 0;

	#20
	trigger 	= 1;
	#20
	trigger 	= 0;

	#12000
	tx_data 	= 9'h05E;

	#20
	trigger 	= 1;
	#20
	trigger 	= 0;

	#20000
	$stop;

end

always #10 clk = ~clk;


serial_tx the_tx (
		.clk		(clk),                	//      full-speed clock
		.rst		(rst),              	//      reset
		.data		(tx_data),            	//      data to send
		.clk_divisor	(clk_divisor),         //      defines baudrate
		.trigger	(trigger),          	//      pulse to start transmission
		.tx		(serdata),         		//      tx serial connection
		.idle		(tx_idle)			//	1 if sender in idle state
	);	


serial_rx the_rx(
		.clk		(clk),                	//      full-speed clock
		.rst		(rst),              	//      reset
		.clk_divisor	(clk_divisor),         //      defines baudrate
		.rx		(serdata),         		//      rx serial connection
		.newdata		(newdata),		//	pulses for new data received
		.data		(rx_data),            	//      data to send
		.error		(rx_error),		//	bad start or stop bit
		.idle		(rx_idle)
	);


endmodule