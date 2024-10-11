// 9-bit Serial port transmitter
// TX is high on idle.
// Baud rate is programmable via clk_divisor

`timescale 100 ps / 100 ps
module serial_tx (
		input  wire        clk,                	//      full-speed clock
		input  wire        rst,              	//      reset
		input  wire [8:0]  data,            	//      data to send
		input  wire [7:0]  clk_divisor,         //      defines baudrate
		input  wire 	   trigger,          	//      pulse to start transmission
		output wire 	   tx,         		//      tx serial connection
		output wire	   idle			//	1 if sender in idle state

	);

	reg	[2:0]	state;		//State of the state machine
	localparam STATE_IDLE		= 0;	//waiting for enable
	localparam STATE_STARTBIT	= 1;	//sending start bit
	localparam STATE_DATA		= 2;	//sending data
	localparam STATE_STOPBIT	= 3;	//sending stop bit
	localparam STATE_FINISH		= 4;	//finished

	reg	[4:0]	tx_ctr;			//counter of sent data words
	reg 	[7:0]	downctr;		//counter to generate baudrate
	reg	[8:0]	buffer;			//internal latch/shift register
	reg		reg_tx;

		//The state machine
	always @(posedge clk or posedge rst)
	begin 
		if (rst)
			state <= STATE_FINISH;
		else
			case(state)
				STATE_IDLE:
				begin
					if (trigger)
					begin
						state <= STATE_STARTBIT;
						tx_ctr <= 8;
						buffer <= data;
						downctr <= clk_divisor;
					end
				end
				STATE_STARTBIT:
				begin
					downctr = downctr - 1;
					if (downctr == 0)
					begin
						downctr <= clk_divisor;
						state <= STATE_DATA;
					end

				end
				STATE_DATA:
				begin
					downctr = downctr - 1;
					if (downctr == 0)
					begin
						downctr <= clk_divisor;
						tx_ctr <= tx_ctr - 1;
						buffer[7:0] <= buffer[8:1];
						buffer[8] <= 0;
						if (tx_ctr == 0)
							state <= STATE_STOPBIT;
					end
				end
				STATE_STOPBIT:
				begin
					downctr = downctr - 1;
					if (downctr == 0)
					begin
						downctr <= clk_divisor;
						state <= STATE_FINISH;
					end

				end
				STATE_FINISH:
				begin
					if (~trigger)
						state <= STATE_IDLE;
				end
				default:
					state <= STATE_FINISH;
			endcase
	end
	
		//tx assignment
	always @( * )
	begin
		if (rst)
			reg_tx = 1;
		else
			case(state)
				STATE_IDLE:
					reg_tx = 1;
				STATE_STARTBIT:
					reg_tx = 0;
				STATE_DATA:
					reg_tx = buffer[0];
				STATE_STOPBIT:
					reg_tx = 1;
				STATE_FINISH:
					reg_tx = 1;
				default:
					reg_tx = 1;
			endcase
	end
	assign tx = reg_tx;

		//idle assignment
	assign idle = (state == STATE_IDLE) ? 1 : 0;

endmodule
