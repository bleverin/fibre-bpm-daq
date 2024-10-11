// st_splitter16.v

// Generated using ACDS version 19.1 670

`timescale 1 ps / 1 ps
module st_splitter16 (
		input  wire        st_splitter16_clk_clk,            //   st_splitter16_clk.clk
		output wire        st_splitter16_in_ready,           //    st_splitter16_in.ready
		input  wire        st_splitter16_in_valid,           //                    .valid
		input  wire        st_splitter16_in_startofpacket,   //                    .startofpacket
		input  wire        st_splitter16_in_endofpacket,     //                    .endofpacket
		input  wire [0:0]  st_splitter16_in_empty,           //                    .empty
		input  wire [15:0] st_splitter16_in_data,            //                    .data
		input  wire        st_splitter16_out0_ready,         //  st_splitter16_out0.ready
		output wire        st_splitter16_out0_valid,         //                    .valid
		output wire        st_splitter16_out0_startofpacket, //                    .startofpacket
		output wire        st_splitter16_out0_endofpacket,   //                    .endofpacket
		output wire [0:0]  st_splitter16_out0_empty,         //                    .empty
		output wire [15:0] st_splitter16_out0_data,          //                    .data
		input  wire        st_splitter16_out1_ready,         //  st_splitter16_out1.ready
		output wire        st_splitter16_out1_valid,         //                    .valid
		output wire        st_splitter16_out1_startofpacket, //                    .startofpacket
		output wire        st_splitter16_out1_endofpacket,   //                    .endofpacket
		output wire [0:0]  st_splitter16_out1_empty,         //                    .empty
		output wire [15:0] st_splitter16_out1_data,          //                    .data
		input  wire        st_splitter16_reset_reset         // st_splitter16_reset.reset
	);

	altera_avalon_st_splitter #(
		.NUMBER_OF_OUTPUTS (2),
		.QUALIFY_VALID_OUT (1),
		.USE_PACKETS       (1),
		.DATA_WIDTH        (16),
		.CHANNEL_WIDTH     (1),
		.ERROR_WIDTH       (1),
		.BITS_PER_SYMBOL   (8),
		.EMPTY_WIDTH       (1)
	) st_splitter16 (
		.clk                 (st_splitter16_clk_clk),            //   clk.clk
		.reset               (st_splitter16_reset_reset),        // reset.reset
		.in0_ready           (st_splitter16_in_ready),           //    in.ready
		.in0_valid           (st_splitter16_in_valid),           //      .valid
		.in0_startofpacket   (st_splitter16_in_startofpacket),   //      .startofpacket
		.in0_endofpacket     (st_splitter16_in_endofpacket),     //      .endofpacket
		.in0_empty           (st_splitter16_in_empty),           //      .empty
		.in0_data            (st_splitter16_in_data),            //      .data
		.out0_ready          (st_splitter16_out0_ready),         //  out0.ready
		.out0_valid          (st_splitter16_out0_valid),         //      .valid
		.out0_startofpacket  (st_splitter16_out0_startofpacket), //      .startofpacket
		.out0_endofpacket    (st_splitter16_out0_endofpacket),   //      .endofpacket
		.out0_empty          (st_splitter16_out0_empty),         //      .empty
		.out0_data           (st_splitter16_out0_data),          //      .data
		.out1_ready          (st_splitter16_out1_ready),         //  out1.ready
		.out1_valid          (st_splitter16_out1_valid),         //      .valid
		.out1_startofpacket  (st_splitter16_out1_startofpacket), //      .startofpacket
		.out1_endofpacket    (st_splitter16_out1_endofpacket),   //      .endofpacket
		.out1_empty          (st_splitter16_out1_empty),         //      .empty
		.out1_data           (st_splitter16_out1_data),          //      .data
		.in0_channel         (1'b0),                             // (terminated)
		.in0_error           (1'b0),                             // (terminated)
		.out0_channel        (),                                 // (terminated)
		.out0_error          (),                                 // (terminated)
		.out1_channel        (),                                 // (terminated)
		.out1_error          (),                                 // (terminated)
		.out2_ready          (1'b1),                             // (terminated)
		.out2_valid          (),                                 // (terminated)
		.out2_startofpacket  (),                                 // (terminated)
		.out2_endofpacket    (),                                 // (terminated)
		.out2_empty          (),                                 // (terminated)
		.out2_channel        (),                                 // (terminated)
		.out2_error          (),                                 // (terminated)
		.out2_data           (),                                 // (terminated)
		.out3_ready          (1'b1),                             // (terminated)
		.out3_valid          (),                                 // (terminated)
		.out3_startofpacket  (),                                 // (terminated)
		.out3_endofpacket    (),                                 // (terminated)
		.out3_empty          (),                                 // (terminated)
		.out3_channel        (),                                 // (terminated)
		.out3_error          (),                                 // (terminated)
		.out3_data           (),                                 // (terminated)
		.out4_ready          (1'b1),                             // (terminated)
		.out4_valid          (),                                 // (terminated)
		.out4_startofpacket  (),                                 // (terminated)
		.out4_endofpacket    (),                                 // (terminated)
		.out4_empty          (),                                 // (terminated)
		.out4_channel        (),                                 // (terminated)
		.out4_error          (),                                 // (terminated)
		.out4_data           (),                                 // (terminated)
		.out5_ready          (1'b1),                             // (terminated)
		.out5_valid          (),                                 // (terminated)
		.out5_startofpacket  (),                                 // (terminated)
		.out5_endofpacket    (),                                 // (terminated)
		.out5_empty          (),                                 // (terminated)
		.out5_channel        (),                                 // (terminated)
		.out5_error          (),                                 // (terminated)
		.out5_data           (),                                 // (terminated)
		.out6_ready          (1'b1),                             // (terminated)
		.out6_valid          (),                                 // (terminated)
		.out6_startofpacket  (),                                 // (terminated)
		.out6_endofpacket    (),                                 // (terminated)
		.out6_empty          (),                                 // (terminated)
		.out6_channel        (),                                 // (terminated)
		.out6_error          (),                                 // (terminated)
		.out6_data           (),                                 // (terminated)
		.out7_ready          (1'b1),                             // (terminated)
		.out7_valid          (),                                 // (terminated)
		.out7_startofpacket  (),                                 // (terminated)
		.out7_endofpacket    (),                                 // (terminated)
		.out7_empty          (),                                 // (terminated)
		.out7_channel        (),                                 // (terminated)
		.out7_error          (),                                 // (terminated)
		.out7_data           (),                                 // (terminated)
		.out8_ready          (1'b1),                             // (terminated)
		.out8_valid          (),                                 // (terminated)
		.out8_startofpacket  (),                                 // (terminated)
		.out8_endofpacket    (),                                 // (terminated)
		.out8_empty          (),                                 // (terminated)
		.out8_channel        (),                                 // (terminated)
		.out8_error          (),                                 // (terminated)
		.out8_data           (),                                 // (terminated)
		.out9_ready          (1'b1),                             // (terminated)
		.out9_valid          (),                                 // (terminated)
		.out9_startofpacket  (),                                 // (terminated)
		.out9_endofpacket    (),                                 // (terminated)
		.out9_empty          (),                                 // (terminated)
		.out9_channel        (),                                 // (terminated)
		.out9_error          (),                                 // (terminated)
		.out9_data           (),                                 // (terminated)
		.out10_ready         (1'b1),                             // (terminated)
		.out10_valid         (),                                 // (terminated)
		.out10_startofpacket (),                                 // (terminated)
		.out10_endofpacket   (),                                 // (terminated)
		.out10_empty         (),                                 // (terminated)
		.out10_channel       (),                                 // (terminated)
		.out10_error         (),                                 // (terminated)
		.out10_data          (),                                 // (terminated)
		.out11_ready         (1'b1),                             // (terminated)
		.out11_valid         (),                                 // (terminated)
		.out11_startofpacket (),                                 // (terminated)
		.out11_endofpacket   (),                                 // (terminated)
		.out11_empty         (),                                 // (terminated)
		.out11_channel       (),                                 // (terminated)
		.out11_error         (),                                 // (terminated)
		.out11_data          (),                                 // (terminated)
		.out12_ready         (1'b1),                             // (terminated)
		.out12_valid         (),                                 // (terminated)
		.out12_startofpacket (),                                 // (terminated)
		.out12_endofpacket   (),                                 // (terminated)
		.out12_empty         (),                                 // (terminated)
		.out12_channel       (),                                 // (terminated)
		.out12_error         (),                                 // (terminated)
		.out12_data          (),                                 // (terminated)
		.out13_ready         (1'b1),                             // (terminated)
		.out13_valid         (),                                 // (terminated)
		.out13_startofpacket (),                                 // (terminated)
		.out13_endofpacket   (),                                 // (terminated)
		.out13_empty         (),                                 // (terminated)
		.out13_channel       (),                                 // (terminated)
		.out13_error         (),                                 // (terminated)
		.out13_data          (),                                 // (terminated)
		.out14_ready         (1'b1),                             // (terminated)
		.out14_valid         (),                                 // (terminated)
		.out14_startofpacket (),                                 // (terminated)
		.out14_endofpacket   (),                                 // (terminated)
		.out14_empty         (),                                 // (terminated)
		.out14_channel       (),                                 // (terminated)
		.out14_error         (),                                 // (terminated)
		.out14_data          (),                                 // (terminated)
		.out15_ready         (1'b1),                             // (terminated)
		.out15_valid         (),                                 // (terminated)
		.out15_startofpacket (),                                 // (terminated)
		.out15_endofpacket   (),                                 // (terminated)
		.out15_empty         (),                                 // (terminated)
		.out15_channel       (),                                 // (terminated)
		.out15_error         (),                                 // (terminated)
		.out15_data          ()                                  // (terminated)
	);

endmodule
