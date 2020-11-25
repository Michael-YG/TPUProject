module CAL(
  input  [7:0]  io_input,
  input  [7:0]  io_weight,
  output [15:0] io_output
);
  assign io_output = io_input * io_weight; // @[CALUnit.scala 9:13]
endmodule
module PE(
  input         clock,
  input         reset,
  input  [7:0]  io_weight_in_0_0,
  input  [7:0]  io_weight_in_0_1,
  input  [7:0]  io_weight_in_0_2,
  input  [7:0]  io_weight_in_1_0,
  input  [7:0]  io_weight_in_1_1,
  input  [7:0]  io_weight_in_1_2,
  input  [7:0]  io_weight_in_2_0,
  input  [7:0]  io_weight_in_2_1,
  input  [7:0]  io_weight_in_2_2,
  input  [7:0]  io_ifmaps_in_0,
  input  [7:0]  io_ifmaps_in_1,
  input  [7:0]  io_ifmaps_in_2,
  output [7:0]  io_ifmaps_out_0,
  output [7:0]  io_ifmaps_out_1,
  output [7:0]  io_ifmaps_out_2,
  output [15:0] io_psum_out,
  output [15:0] io_psum_outr,
  input  [15:0] io_psum_up,
  input  [15:0] io_psum_in,
  input         io_select
);
  wire [7:0] CAL_io_input; // @[PE.scala 29:22]
  wire [7:0] CAL_io_weight; // @[PE.scala 29:22]
  wire [15:0] CAL_io_output; // @[PE.scala 29:22]
  wire [7:0] CAL_1_io_input; // @[PE.scala 33:22]
  wire [7:0] CAL_1_io_weight; // @[PE.scala 33:22]
  wire [15:0] CAL_1_io_output; // @[PE.scala 33:22]
  wire [7:0] CAL_2_io_input; // @[PE.scala 37:22]
  wire [7:0] CAL_2_io_weight; // @[PE.scala 37:22]
  wire [15:0] CAL_2_io_output; // @[PE.scala 37:22]
  wire [7:0] CAL_3_io_input; // @[PE.scala 29:22]
  wire [7:0] CAL_3_io_weight; // @[PE.scala 29:22]
  wire [15:0] CAL_3_io_output; // @[PE.scala 29:22]
  wire [7:0] CAL_4_io_input; // @[PE.scala 33:22]
  wire [7:0] CAL_4_io_weight; // @[PE.scala 33:22]
  wire [15:0] CAL_4_io_output; // @[PE.scala 33:22]
  wire [7:0] CAL_5_io_input; // @[PE.scala 37:22]
  wire [7:0] CAL_5_io_weight; // @[PE.scala 37:22]
  wire [15:0] CAL_5_io_output; // @[PE.scala 37:22]
  wire [7:0] CAL_6_io_input; // @[PE.scala 29:22]
  wire [7:0] CAL_6_io_weight; // @[PE.scala 29:22]
  wire [15:0] CAL_6_io_output; // @[PE.scala 29:22]
  wire [7:0] CAL_7_io_input; // @[PE.scala 33:22]
  wire [7:0] CAL_7_io_weight; // @[PE.scala 33:22]
  wire [15:0] CAL_7_io_output; // @[PE.scala 33:22]
  wire [7:0] CAL_8_io_input; // @[PE.scala 37:22]
  wire [7:0] CAL_8_io_weight; // @[PE.scala 37:22]
  wire [15:0] CAL_8_io_output; // @[PE.scala 37:22]
  reg [7:0] wc1_0; // @[PE.scala 19:20]
  reg [31:0] _RAND_0;
  reg [7:0] wc1_1; // @[PE.scala 19:20]
  reg [31:0] _RAND_1;
  reg [7:0] wc1_2; // @[PE.scala 19:20]
  reg [31:0] _RAND_2;
  reg [7:0] wc2_0; // @[PE.scala 20:20]
  reg [31:0] _RAND_3;
  reg [7:0] wc2_1; // @[PE.scala 20:20]
  reg [31:0] _RAND_4;
  reg [7:0] wc2_2; // @[PE.scala 20:20]
  reg [31:0] _RAND_5;
  reg [7:0] wc3_0; // @[PE.scala 21:20]
  reg [31:0] _RAND_6;
  reg [7:0] wc3_1; // @[PE.scala 21:20]
  reg [31:0] _RAND_7;
  reg [7:0] wc3_2; // @[PE.scala 21:20]
  reg [31:0] _RAND_8;
  reg [7:0] tc1_0; // @[PE.scala 22:20]
  reg [31:0] _RAND_9;
  reg [7:0] tc1_1; // @[PE.scala 22:20]
  reg [31:0] _RAND_10;
  reg [7:0] tc1_2; // @[PE.scala 22:20]
  reg [31:0] _RAND_11;
  reg [7:0] tc2_0; // @[PE.scala 23:20]
  reg [31:0] _RAND_12;
  reg [7:0] tc2_1; // @[PE.scala 23:20]
  reg [31:0] _RAND_13;
  reg [7:0] tc2_2; // @[PE.scala 23:20]
  reg [31:0] _RAND_14;
  reg [7:0] tc3_0; // @[PE.scala 24:20]
  reg [31:0] _RAND_15;
  reg [7:0] tc3_1; // @[PE.scala 24:20]
  reg [31:0] _RAND_16;
  reg [7:0] tc3_2; // @[PE.scala 24:20]
  reg [31:0] _RAND_17;
  reg [15:0] grey0; // @[PE.scala 46:22]
  reg [31:0] _RAND_18;
  wire [15:0] temp1_0; // @[PE.scala 25:21 PE.scala 25:21 PE.scala 32:14]
  wire [15:0] temp1_1; // @[PE.scala 25:21 PE.scala 25:21 PE.scala 32:14]
  wire [15:0] _T_7; // @[PE.scala 48:31]
  wire [15:0] temp1_2; // @[PE.scala 25:21 PE.scala 25:21 PE.scala 32:14]
  wire [15:0] _T_9; // @[PE.scala 48:40]
  reg [15:0] acc0; // @[PE.scala 48:22]
  reg [31:0] _RAND_19;
  wire [15:0] temp2_0; // @[PE.scala 26:21 PE.scala 26:21 PE.scala 36:14]
  wire [15:0] temp2_1; // @[PE.scala 26:21 PE.scala 26:21 PE.scala 36:14]
  wire [15:0] _T_11; // @[PE.scala 49:31]
  wire [15:0] temp2_2; // @[PE.scala 26:21 PE.scala 26:21 PE.scala 36:14]
  wire [15:0] _T_13; // @[PE.scala 49:40]
  reg [15:0] acc1; // @[PE.scala 49:22]
  reg [31:0] _RAND_20;
  wire [15:0] temp3_0; // @[PE.scala 27:21 PE.scala 27:21 PE.scala 40:14]
  wire [15:0] temp3_1; // @[PE.scala 27:21 PE.scala 27:21 PE.scala 40:14]
  wire [15:0] _T_15; // @[PE.scala 50:31]
  wire [15:0] temp3_2; // @[PE.scala 27:21 PE.scala 27:21 PE.scala 40:14]
  wire [15:0] _T_17; // @[PE.scala 50:40]
  reg [15:0] acc2; // @[PE.scala 50:22]
  reg [31:0] _RAND_21;
  wire [15:0] _T_19; // @[PE.scala 54:27]
  wire [15:0] _T_21; // @[PE.scala 54:32]
  reg [15:0] acc; // @[PE.scala 54:22]
  reg [31:0] _RAND_22;
  reg [15:0] grey2; // @[PE.scala 55:22]
  reg [31:0] _RAND_23;
  wire [15:0] _T_23; // @[PE.scala 57:21]
  reg [15:0] _T_26; // @[PE.scala 58:26]
  reg [31:0] _RAND_24;
  CAL CAL ( // @[PE.scala 29:22]
    .io_input(CAL_io_input),
    .io_weight(CAL_io_weight),
    .io_output(CAL_io_output)
  );
  CAL CAL_1 ( // @[PE.scala 33:22]
    .io_input(CAL_1_io_input),
    .io_weight(CAL_1_io_weight),
    .io_output(CAL_1_io_output)
  );
  CAL CAL_2 ( // @[PE.scala 37:22]
    .io_input(CAL_2_io_input),
    .io_weight(CAL_2_io_weight),
    .io_output(CAL_2_io_output)
  );
  CAL CAL_3 ( // @[PE.scala 29:22]
    .io_input(CAL_3_io_input),
    .io_weight(CAL_3_io_weight),
    .io_output(CAL_3_io_output)
  );
  CAL CAL_4 ( // @[PE.scala 33:22]
    .io_input(CAL_4_io_input),
    .io_weight(CAL_4_io_weight),
    .io_output(CAL_4_io_output)
  );
  CAL CAL_5 ( // @[PE.scala 37:22]
    .io_input(CAL_5_io_input),
    .io_weight(CAL_5_io_weight),
    .io_output(CAL_5_io_output)
  );
  CAL CAL_6 ( // @[PE.scala 29:22]
    .io_input(CAL_6_io_input),
    .io_weight(CAL_6_io_weight),
    .io_output(CAL_6_io_output)
  );
  CAL CAL_7 ( // @[PE.scala 33:22]
    .io_input(CAL_7_io_input),
    .io_weight(CAL_7_io_weight),
    .io_output(CAL_7_io_output)
  );
  CAL CAL_8 ( // @[PE.scala 37:22]
    .io_input(CAL_8_io_input),
    .io_weight(CAL_8_io_weight),
    .io_output(CAL_8_io_output)
  );
  assign temp1_0 = CAL_io_output; // @[PE.scala 25:21 PE.scala 25:21 PE.scala 32:14]
  assign temp1_1 = CAL_3_io_output; // @[PE.scala 25:21 PE.scala 25:21 PE.scala 32:14]
  assign _T_7 = temp1_0 + temp1_1; // @[PE.scala 48:31]
  assign temp1_2 = CAL_6_io_output; // @[PE.scala 25:21 PE.scala 25:21 PE.scala 32:14]
  assign _T_9 = _T_7 + temp1_2; // @[PE.scala 48:40]
  assign temp2_0 = CAL_1_io_output; // @[PE.scala 26:21 PE.scala 26:21 PE.scala 36:14]
  assign temp2_1 = CAL_4_io_output; // @[PE.scala 26:21 PE.scala 26:21 PE.scala 36:14]
  assign _T_11 = temp2_0 + temp2_1; // @[PE.scala 49:31]
  assign temp2_2 = CAL_7_io_output; // @[PE.scala 26:21 PE.scala 26:21 PE.scala 36:14]
  assign _T_13 = _T_11 + temp2_2; // @[PE.scala 49:40]
  assign temp3_0 = CAL_2_io_output; // @[PE.scala 27:21 PE.scala 27:21 PE.scala 40:14]
  assign temp3_1 = CAL_5_io_output; // @[PE.scala 27:21 PE.scala 27:21 PE.scala 40:14]
  assign _T_15 = temp3_0 + temp3_1; // @[PE.scala 50:31]
  assign temp3_2 = CAL_8_io_output; // @[PE.scala 27:21 PE.scala 27:21 PE.scala 40:14]
  assign _T_17 = _T_15 + temp3_2; // @[PE.scala 50:40]
  assign _T_19 = acc0 + acc1; // @[PE.scala 54:27]
  assign _T_21 = _T_19 + acc2; // @[PE.scala 54:32]
  assign _T_23 = acc + grey2; // @[PE.scala 57:21]
  assign io_ifmaps_out_0 = tc3_0; // @[PE.scala 43:17]
  assign io_ifmaps_out_1 = tc3_1; // @[PE.scala 43:17]
  assign io_ifmaps_out_2 = tc3_2; // @[PE.scala 43:17]
  assign io_psum_out = acc + grey2; // @[PE.scala 57:15]
  assign io_psum_outr = _T_26; // @[PE.scala 58:16]
  assign CAL_io_input = tc1_0; // @[PE.scala 30:19]
  assign CAL_io_weight = wc1_0; // @[PE.scala 31:19]
  assign CAL_1_io_input = tc2_0; // @[PE.scala 34:19]
  assign CAL_1_io_weight = wc2_0; // @[PE.scala 35:19]
  assign CAL_2_io_input = tc3_0; // @[PE.scala 38:19]
  assign CAL_2_io_weight = wc3_0; // @[PE.scala 39:19]
  assign CAL_3_io_input = tc1_1; // @[PE.scala 30:19]
  assign CAL_3_io_weight = wc1_1; // @[PE.scala 31:19]
  assign CAL_4_io_input = tc2_1; // @[PE.scala 34:19]
  assign CAL_4_io_weight = wc2_1; // @[PE.scala 35:19]
  assign CAL_5_io_input = tc3_1; // @[PE.scala 38:19]
  assign CAL_5_io_weight = wc3_1; // @[PE.scala 39:19]
  assign CAL_6_io_input = tc1_2; // @[PE.scala 30:19]
  assign CAL_6_io_weight = wc1_2; // @[PE.scala 31:19]
  assign CAL_7_io_input = tc2_2; // @[PE.scala 34:19]
  assign CAL_7_io_weight = wc2_2; // @[PE.scala 35:19]
  assign CAL_8_io_input = tc3_2; // @[PE.scala 38:19]
  assign CAL_8_io_weight = wc3_2; // @[PE.scala 39:19]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  wc1_0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  wc1_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  wc1_2 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  wc2_0 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  wc2_1 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  wc2_2 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  wc3_0 = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  wc3_1 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  wc3_2 = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  tc1_0 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  tc1_1 = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  tc1_2 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  tc2_0 = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  tc2_1 = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  tc2_2 = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  tc3_0 = _RAND_15[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  tc3_1 = _RAND_16[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  tc3_2 = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  grey0 = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  acc0 = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  acc1 = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  acc2 = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  acc = _RAND_22[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  grey2 = _RAND_23[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_26 = _RAND_24[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      wc1_0 <= 8'h0;
    end else begin
      wc1_0 <= io_weight_in_0_0;
    end
    if (reset) begin
      wc1_1 <= 8'h0;
    end else begin
      wc1_1 <= io_weight_in_0_1;
    end
    if (reset) begin
      wc1_2 <= 8'h0;
    end else begin
      wc1_2 <= io_weight_in_0_2;
    end
    if (reset) begin
      wc2_0 <= 8'h0;
    end else begin
      wc2_0 <= io_weight_in_1_0;
    end
    if (reset) begin
      wc2_1 <= 8'h0;
    end else begin
      wc2_1 <= io_weight_in_1_1;
    end
    if (reset) begin
      wc2_2 <= 8'h0;
    end else begin
      wc2_2 <= io_weight_in_1_2;
    end
    if (reset) begin
      wc3_0 <= 8'h0;
    end else begin
      wc3_0 <= io_weight_in_2_0;
    end
    if (reset) begin
      wc3_1 <= 8'h0;
    end else begin
      wc3_1 <= io_weight_in_2_1;
    end
    if (reset) begin
      wc3_2 <= 8'h0;
    end else begin
      wc3_2 <= io_weight_in_2_2;
    end
    if (reset) begin
      tc1_0 <= 8'h0;
    end else begin
      tc1_0 <= io_ifmaps_in_0;
    end
    if (reset) begin
      tc1_1 <= 8'h0;
    end else begin
      tc1_1 <= io_ifmaps_in_1;
    end
    if (reset) begin
      tc1_2 <= 8'h0;
    end else begin
      tc1_2 <= io_ifmaps_in_2;
    end
    if (reset) begin
      tc2_0 <= 8'h0;
    end else begin
      tc2_0 <= tc1_0;
    end
    if (reset) begin
      tc2_1 <= 8'h0;
    end else begin
      tc2_1 <= tc1_1;
    end
    if (reset) begin
      tc2_2 <= 8'h0;
    end else begin
      tc2_2 <= tc1_2;
    end
    if (reset) begin
      tc3_0 <= 8'h0;
    end else begin
      tc3_0 <= tc2_0;
    end
    if (reset) begin
      tc3_1 <= 8'h0;
    end else begin
      tc3_1 <= tc2_1;
    end
    if (reset) begin
      tc3_2 <= 8'h0;
    end else begin
      tc3_2 <= tc2_2;
    end
    if (reset) begin
      grey0 <= 16'h0;
    end else if (io_select) begin
      grey0 <= io_psum_up;
    end else begin
      grey0 <= io_psum_in;
    end
    if (reset) begin
      acc0 <= 16'h0;
    end else begin
      acc0 <= _T_9;
    end
    if (reset) begin
      acc1 <= 16'h0;
    end else begin
      acc1 <= _T_13;
    end
    if (reset) begin
      acc2 <= 16'h0;
    end else begin
      acc2 <= _T_17;
    end
    if (reset) begin
      acc <= 16'h0;
    end else begin
      acc <= _T_21;
    end
    if (reset) begin
      grey2 <= 16'h0;
    end else begin
      grey2 <= grey0;
    end
    if (reset) begin
      _T_26 <= 16'h0;
    end else begin
      _T_26 <= _T_23;
    end
  end
endmodule
