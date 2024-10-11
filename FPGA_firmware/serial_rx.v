// 9-bit Serial port receiver
// It's very simple, just single sample halfway of each bit.
// If start bit is not zero or stop bit is not one, an error will be signaled.
// In general, this module is prone to glitches in signal. First of all, any glitch > Tclk will trigger the reception process.
// RX is high on idle.
// Baud rate is programmable via clk_divisor
// clk_divisor ids internally divided by 2 to get in the middle of bit, so need to be at least 2.

`timescale 100 ps / 100 ps
module serial_rx (
		input  wire        	clk,                	//      full-speed clock
		input  wire        	rst,              	//      reset
		input  wire [7:0]  	clk_divisor,         //      defines baudrate
		input  wire 	   	rx,         		//      rx serial connection
		output wire	   		newdata,		//	pulses for new data received
		output wire [8:0]  	data,            	//      data to send
		output wire	   		error,		//	bad start or stop bit
		output wire	   		idle			//	1 if receiver in idle state
	);

	reg	[1:0]	state;		//State of the state machine
	localparam STATE_IDLE		= 0;	//waiting for enable
	localparam STATE_DATA		= 1;	//sending data
	localparam STATE_FINISH		= 2;	//finished

	reg	[4:0]	rx_ctr;			//counter of received data words
	reg [7:0]	downctr;		//counter to generate baudrate
	reg	[10:0]	buffer;			//internal latch/shift register with start and stop bit
	reg	[8:0]	reg_data;		//latched received data
	reg			reg_error;		//latched error

		//The state machine
	always @(posedge clk or posedge rst)
	begin 
		if (rst)
		begin
			state <= STATE_IDLE;
			reg_data <= 0;
			reg_error <= 0;
		end
		else
			case(state)
				STATE_IDLE:
				begin
					if (~rx)
					begin
						state 		<= STATE_DATA;
						rx_ctr 		<= 10;
						downctr[6:0]<= clk_divisor[7:1];	//wait half a bit
						downctr[7]	<= 0;
						buffer		<= 0;
					end
				end
				STATE_DATA:
				begin
					downctr = downctr - 1;
					if (downctr == 0)
					begin
						downctr 	<= clk_divisor;
						rx_ctr 		<= rx_ctr - 1;
						buffer[9:0] <= buffer[10:1];
						buffer[10] 	<= rx;
						if (rx_ctr == 0)
							state 	<= STATE_FINISH;
					end
				end
				STATE_FINISH:
				begin
					reg_data[8:0] 	<= buffer[9:1];
					reg_error		<= buffer[0] | ~buffer[10];	//high start or low stop bit
					state 			<= STATE_IDLE;
				end
				default:
					state 			<= STATE_IDLE;
			endcase
	end
	
		//assignments
	assign idle = (state == STATE_IDLE) ? 1 : 0;
	assign data = reg_data;
	assign error =  reg_error;


endmodule
