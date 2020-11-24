module CAL( // @[:@3.2]
  input  [7:0]  io_input, // @[:@6.4]
  input  [7:0]  io_weight, // @[:@6.4]
  output [15:0] io_output // @[:@6.4]
);
  assign io_output = io_input * io_weight; // @[CALUnit.scala 9:13:@9.4]
endmodule
module PE( // @[:@75.2]
  input         clock, // @[:@76.4]
  input         reset, // @[:@77.4]
  input  [7:0]  io_weight_in_0_0, // @[:@78.4]
  input  [7:0]  io_weight_in_0_1, // @[:@78.4]
  input  [7:0]  io_weight_in_0_2, // @[:@78.4]
  input  [7:0]  io_weight_in_1_0, // @[:@78.4]
  input  [7:0]  io_weight_in_1_1, // @[:@78.4]
  input  [7:0]  io_weight_in_1_2, // @[:@78.4]
  input  [7:0]  io_weight_in_2_0, // @[:@78.4]
  input  [7:0]  io_weight_in_2_1, // @[:@78.4]
  input  [7:0]  io_weight_in_2_2, // @[:@78.4]
  input  [7:0]  io_ifmaps_in_0, // @[:@78.4]
  input  [7:0]  io_ifmaps_in_1, // @[:@78.4]
  input  [7:0]  io_ifmaps_in_2, // @[:@78.4]
  output [7:0]  io_ifmaps_out_0, // @[:@78.4]
  output [7:0]  io_ifmaps_out_1, // @[:@78.4]
  output [7:0]  io_ifmaps_out_2, // @[:@78.4]
  output [15:0] io_psum_out, // @[:@78.4]
  output [15:0] io_psum_outr, // @[:@78.4]
  input  [15:0] io_psum_up, // @[:@78.4]
  input  [15:0] io_psum_in, // @[:@78.4]
  input         io_select // @[:@78.4]
);
  wire [7:0] CAL_io_input; // @[PE.scala 27:22:@140.4]
  wire [7:0] CAL_io_weight; // @[PE.scala 27:22:@140.4]
  wire [15:0] CAL_io_output; // @[PE.scala 27:22:@140.4]
  wire [7:0] CAL_1_io_input; // @[PE.scala 31:22:@146.4]
  wire [7:0] CAL_1_io_weight; // @[PE.scala 31:22:@146.4]
  wire [15:0] CAL_1_io_output; // @[PE.scala 31:22:@146.4]
  wire [7:0] CAL_2_io_input; // @[PE.scala 35:22:@152.4]
  wire [7:0] CAL_2_io_weight; // @[PE.scala 35:22:@152.4]
  wire [15:0] CAL_2_io_output; // @[PE.scala 35:22:@152.4]
  wire [7:0] CAL_3_io_input; // @[PE.scala 27:22:@158.4]
  wire [7:0] CAL_3_io_weight; // @[PE.scala 27:22:@158.4]
  wire [15:0] CAL_3_io_output; // @[PE.scala 27:22:@158.4]
  wire [7:0] CAL_4_io_input; // @[PE.scala 31:22:@164.4]
  wire [7:0] CAL_4_io_weight; // @[PE.scala 31:22:@164.4]
  wire [15:0] CAL_4_io_output; // @[PE.scala 31:22:@164.4]
  wire [7:0] CAL_5_io_input; // @[PE.scala 35:22:@170.4]
  wire [7:0] CAL_5_io_weight; // @[PE.scala 35:22:@170.4]
  wire [15:0] CAL_5_io_output; // @[PE.scala 35:22:@170.4]
  wire [7:0] CAL_6_io_input; // @[PE.scala 27:22:@176.4]
  wire [7:0] CAL_6_io_weight; // @[PE.scala 27:22:@176.4]
  wire [15:0] CAL_6_io_output; // @[PE.scala 27:22:@176.4]
  wire [7:0] CAL_7_io_input; // @[PE.scala 31:22:@182.4]
  wire [7:0] CAL_7_io_weight; // @[PE.scala 31:22:@182.4]
  wire [15:0] CAL_7_io_output; // @[PE.scala 31:22:@182.4]
  wire [7:0] CAL_8_io_input; // @[PE.scala 35:22:@188.4]
  wire [7:0] CAL_8_io_weight; // @[PE.scala 35:22:@188.4]
  wire [15:0] CAL_8_io_output; // @[PE.scala 35:22:@188.4]
  reg [7:0] wc1_0; // @[PE.scala 17:20:@84.4]
  reg [31:0] _RAND_0;
  reg [7:0] wc1_1; // @[PE.scala 17:20:@84.4]
  reg [31:0] _RAND_1;
  reg [7:0] wc1_2; // @[PE.scala 17:20:@84.4]
  reg [31:0] _RAND_2;
  reg [7:0] wc2_0; // @[PE.scala 18:20:@92.4]
  reg [31:0] _RAND_3;
  reg [7:0] wc2_1; // @[PE.scala 18:20:@92.4]
  reg [31:0] _RAND_4;
  reg [7:0] wc2_2; // @[PE.scala 18:20:@92.4]
  reg [31:0] _RAND_5;
  reg [7:0] wc3_0; // @[PE.scala 19:20:@100.4]
  reg [31:0] _RAND_6;
  reg [7:0] wc3_1; // @[PE.scala 19:20:@100.4]
  reg [31:0] _RAND_7;
  reg [7:0] wc3_2; // @[PE.scala 19:20:@100.4]
  reg [31:0] _RAND_8;
  reg [7:0] tc1_0; // @[PE.scala 20:20:@108.4]
  reg [31:0] _RAND_9;
  reg [7:0] tc1_1; // @[PE.scala 20:20:@108.4]
  reg [31:0] _RAND_10;
  reg [7:0] tc1_2; // @[PE.scala 20:20:@108.4]
  reg [31:0] _RAND_11;
  reg [7:0] tc2_0; // @[PE.scala 21:20:@116.4]
  reg [31:0] _RAND_12;
  reg [7:0] tc2_1; // @[PE.scala 21:20:@116.4]
  reg [31:0] _RAND_13;
  reg [7:0] tc2_2; // @[PE.scala 21:20:@116.4]
  reg [31:0] _RAND_14;
  reg [7:0] tc3_0; // @[PE.scala 22:20:@124.4]
  reg [31:0] _RAND_15;
  reg [7:0] tc3_1; // @[PE.scala 22:20:@124.4]
  reg [31:0] _RAND_16;
  reg [7:0] tc3_2; // @[PE.scala 22:20:@124.4]
  reg [31:0] _RAND_17;
  wire [15:0] psm; // @[PE.scala 43:18:@197.4]
  reg [15:0] grey0; // @[PE.scala 44:22:@198.4]
  reg [31:0] _RAND_18;
  wire [15:0] temp1_0; // @[PE.scala 23:21:@128.4 PE.scala 23:21:@129.4 PE.scala 30:14:@145.4]
  wire [15:0] temp1_1; // @[PE.scala 23:21:@128.4 PE.scala 23:21:@130.4 PE.scala 30:14:@163.4]
  wire [16:0] _T_536; // @[PE.scala 45:31:@200.4]
  wire [15:0] _T_537; // @[PE.scala 45:31:@201.4]
  wire [15:0] temp1_2; // @[PE.scala 23:21:@128.4 PE.scala 23:21:@131.4 PE.scala 30:14:@181.4]
  wire [16:0] _T_538; // @[PE.scala 45:40:@202.4]
  wire [15:0] _T_539; // @[PE.scala 45:40:@203.4]
  reg [15:0] acc0; // @[PE.scala 45:22:@204.4]
  reg [31:0] _RAND_19;
  wire [15:0] temp2_0; // @[PE.scala 24:21:@132.4 PE.scala 24:21:@133.4 PE.scala 34:14:@151.4]
  wire [15:0] temp2_1; // @[PE.scala 24:21:@132.4 PE.scala 24:21:@134.4 PE.scala 34:14:@169.4]
  wire [16:0] _T_542; // @[PE.scala 46:31:@206.4]
  wire [15:0] _T_543; // @[PE.scala 46:31:@207.4]
  wire [15:0] temp2_2; // @[PE.scala 24:21:@132.4 PE.scala 24:21:@135.4 PE.scala 34:14:@187.4]
  wire [16:0] _T_544; // @[PE.scala 46:40:@208.4]
  wire [15:0] _T_545; // @[PE.scala 46:40:@209.4]
  reg [15:0] acc1; // @[PE.scala 46:22:@210.4]
  reg [31:0] _RAND_20;
  wire [15:0] temp3_0; // @[PE.scala 25:21:@136.4 PE.scala 25:21:@137.4 PE.scala 38:14:@157.4]
  wire [15:0] temp3_1; // @[PE.scala 25:21:@136.4 PE.scala 25:21:@138.4 PE.scala 38:14:@175.4]
  wire [16:0] _T_548; // @[PE.scala 47:31:@212.4]
  wire [15:0] _T_549; // @[PE.scala 47:31:@213.4]
  wire [15:0] temp3_2; // @[PE.scala 25:21:@136.4 PE.scala 25:21:@139.4 PE.scala 38:14:@193.4]
  wire [16:0] _T_550; // @[PE.scala 47:40:@214.4]
  wire [15:0] _T_551; // @[PE.scala 47:40:@215.4]
  reg [15:0] acc2; // @[PE.scala 47:22:@216.4]
  reg [31:0] _RAND_21;
  wire [16:0] _T_556; // @[PE.scala 51:27:@220.4]
  wire [15:0] _T_557; // @[PE.scala 51:27:@221.4]
  wire [16:0] _T_558; // @[PE.scala 51:32:@222.4]
  wire [15:0] _T_559; // @[PE.scala 51:32:@223.4]
  reg [15:0] acc; // @[PE.scala 51:22:@224.4]
  reg [31:0] _RAND_22;
  reg [15:0] grey2; // @[PE.scala 52:22:@226.4]
  reg [31:0] _RAND_23;
  wire [16:0] _T_564; // @[PE.scala 54:21:@228.4]
  wire [15:0] _T_565; // @[PE.scala 54:21:@229.4]
  reg [15:0] _T_570; // @[PE.scala 55:26:@233.4]
  reg [31:0] _RAND_24;
  CAL CAL ( // @[PE.scala 27:22:@140.4]
    .io_input(CAL_io_input),
    .io_weight(CAL_io_weight),
    .io_output(CAL_io_output)
  );
  CAL CAL_1 ( // @[PE.scala 31:22:@146.4]
    .io_input(CAL_1_io_input),
    .io_weight(CAL_1_io_weight),
    .io_output(CAL_1_io_output)
  );
  CAL CAL_2 ( // @[PE.scala 35:22:@152.4]
    .io_input(CAL_2_io_input),
    .io_weight(CAL_2_io_weight),
    .io_output(CAL_2_io_output)
  );
  CAL CAL_3 ( // @[PE.scala 27:22:@158.4]
    .io_input(CAL_3_io_input),
    .io_weight(CAL_3_io_weight),
    .io_output(CAL_3_io_output)
  );
  CAL CAL_4 ( // @[PE.scala 31:22:@164.4]
    .io_input(CAL_4_io_input),
    .io_weight(CAL_4_io_weight),
    .io_output(CAL_4_io_output)
  );
  CAL CAL_5 ( // @[PE.scala 35:22:@170.4]
    .io_input(CAL_5_io_input),
    .io_weight(CAL_5_io_weight),
    .io_output(CAL_5_io_output)
  );
  CAL CAL_6 ( // @[PE.scala 27:22:@176.4]
    .io_input(CAL_6_io_input),
    .io_weight(CAL_6_io_weight),
    .io_output(CAL_6_io_output)
  );
  CAL CAL_7 ( // @[PE.scala 31:22:@182.4]
    .io_input(CAL_7_io_input),
    .io_weight(CAL_7_io_weight),
    .io_output(CAL_7_io_output)
  );
  CAL CAL_8 ( // @[PE.scala 35:22:@188.4]
    .io_input(CAL_8_io_input),
    .io_weight(CAL_8_io_weight),
    .io_output(CAL_8_io_output)
  );
  assign psm = io_select ? io_psum_up : io_psum_in; // @[PE.scala 43:18:@197.4]
  assign temp1_0 = CAL_io_output; // @[PE.scala 23:21:@128.4 PE.scala 23:21:@129.4 PE.scala 30:14:@145.4]
  assign temp1_1 = CAL_3_io_output; // @[PE.scala 23:21:@128.4 PE.scala 23:21:@130.4 PE.scala 30:14:@163.4]
  assign _T_536 = temp1_0 + temp1_1; // @[PE.scala 45:31:@200.4]
  assign _T_537 = _T_536[15:0]; // @[PE.scala 45:31:@201.4]
  assign temp1_2 = CAL_6_io_output; // @[PE.scala 23:21:@128.4 PE.scala 23:21:@131.4 PE.scala 30:14:@181.4]
  assign _T_538 = _T_537 + temp1_2; // @[PE.scala 45:40:@202.4]
  assign _T_539 = _T_538[15:0]; // @[PE.scala 45:40:@203.4]
  assign temp2_0 = CAL_1_io_output; // @[PE.scala 24:21:@132.4 PE.scala 24:21:@133.4 PE.scala 34:14:@151.4]
  assign temp2_1 = CAL_4_io_output; // @[PE.scala 24:21:@132.4 PE.scala 24:21:@134.4 PE.scala 34:14:@169.4]
  assign _T_542 = temp2_0 + temp2_1; // @[PE.scala 46:31:@206.4]
  assign _T_543 = _T_542[15:0]; // @[PE.scala 46:31:@207.4]
  assign temp2_2 = CAL_7_io_output; // @[PE.scala 24:21:@132.4 PE.scala 24:21:@135.4 PE.scala 34:14:@187.4]
  assign _T_544 = _T_543 + temp2_2; // @[PE.scala 46:40:@208.4]
  assign _T_545 = _T_544[15:0]; // @[PE.scala 46:40:@209.4]
  assign temp3_0 = CAL_2_io_output; // @[PE.scala 25:21:@136.4 PE.scala 25:21:@137.4 PE.scala 38:14:@157.4]
  assign temp3_1 = CAL_5_io_output; // @[PE.scala 25:21:@136.4 PE.scala 25:21:@138.4 PE.scala 38:14:@175.4]
  assign _T_548 = temp3_0 + temp3_1; // @[PE.scala 47:31:@212.4]
  assign _T_549 = _T_548[15:0]; // @[PE.scala 47:31:@213.4]
  assign temp3_2 = CAL_8_io_output; // @[PE.scala 25:21:@136.4 PE.scala 25:21:@139.4 PE.scala 38:14:@193.4]
  assign _T_550 = _T_549 + temp3_2; // @[PE.scala 47:40:@214.4]
  assign _T_551 = _T_550[15:0]; // @[PE.scala 47:40:@215.4]
  assign _T_556 = acc0 + acc1; // @[PE.scala 51:27:@220.4]
  assign _T_557 = _T_556[15:0]; // @[PE.scala 51:27:@221.4]
  assign _T_558 = _T_557 + acc2; // @[PE.scala 51:32:@222.4]
  assign _T_559 = _T_558[15:0]; // @[PE.scala 51:32:@223.4]
  assign _T_564 = acc + grey2; // @[PE.scala 54:21:@228.4]
  assign _T_565 = _T_564[15:0]; // @[PE.scala 54:21:@229.4]
  assign io_ifmaps_out_0 = tc3_0; // @[PE.scala 41:17:@194.4]
  assign io_ifmaps_out_1 = tc3_1; // @[PE.scala 41:17:@195.4]
  assign io_ifmaps_out_2 = tc3_2; // @[PE.scala 41:17:@196.4]
  assign io_psum_out = _T_564[15:0]; // @[PE.scala 54:15:@230.4]
  assign io_psum_outr = _T_570; // @[PE.scala 55:16:@235.4]
  assign CAL_io_input = tc1_0; // @[PE.scala 28:19:@143.4]
  assign CAL_io_weight = wc1_0; // @[PE.scala 29:19:@144.4]
  assign CAL_1_io_input = tc2_0; // @[PE.scala 32:19:@149.4]
  assign CAL_1_io_weight = wc2_0; // @[PE.scala 33:19:@150.4]
  assign CAL_2_io_input = tc3_0; // @[PE.scala 36:19:@155.4]
  assign CAL_2_io_weight = wc3_0; // @[PE.scala 37:19:@156.4]
  assign CAL_3_io_input = tc1_1; // @[PE.scala 28:19:@161.4]
  assign CAL_3_io_weight = wc1_1; // @[PE.scala 29:19:@162.4]
  assign CAL_4_io_input = tc2_1; // @[PE.scala 32:19:@167.4]
  assign CAL_4_io_weight = wc2_1; // @[PE.scala 33:19:@168.4]
  assign CAL_5_io_input = tc3_1; // @[PE.scala 36:19:@173.4]
  assign CAL_5_io_weight = wc3_1; // @[PE.scala 37:19:@174.4]
  assign CAL_6_io_input = tc1_2; // @[PE.scala 28:19:@179.4]
  assign CAL_6_io_weight = wc1_2; // @[PE.scala 29:19:@180.4]
  assign CAL_7_io_input = tc2_2; // @[PE.scala 32:19:@185.4]
  assign CAL_7_io_weight = wc2_2; // @[PE.scala 33:19:@186.4]
  assign CAL_8_io_input = tc3_2; // @[PE.scala 36:19:@191.4]
  assign CAL_8_io_weight = wc3_2; // @[PE.scala 37:19:@192.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  wc1_0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  wc1_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  wc1_2 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  wc2_0 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  wc2_1 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  wc2_2 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  wc3_0 = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  wc3_1 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  wc3_2 = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  tc1_0 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  tc1_1 = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  tc1_2 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  tc2_0 = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  tc2_1 = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  tc2_2 = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  tc3_0 = _RAND_15[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  tc3_1 = _RAND_16[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  tc3_2 = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  grey0 = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  acc0 = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  acc1 = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  acc2 = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  acc = _RAND_22[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  grey2 = _RAND_23[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  _T_570 = _RAND_24[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
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
    end else begin
      if (io_select) begin
        grey0 <= io_psum_up;
      end else begin
        grey0 <= io_psum_in;
      end
    end
    if (reset) begin
      acc0 <= 16'h0;
    end else begin
      acc0 <= _T_539;
    end
    if (reset) begin
      acc1 <= 16'h0;
    end else begin
      acc1 <= _T_545;
    end
    if (reset) begin
      acc2 <= 16'h0;
    end else begin
      acc2 <= _T_551;
    end
    if (reset) begin
      acc <= 16'h0;
    end else begin
      acc <= _T_559;
    end
    if (reset) begin
      grey2 <= 16'h0;
    end else begin
      grey2 <= grey0;
    end
    if (reset) begin
      _T_570 <= 16'h0;
    end else begin
      _T_570 <= _T_565;
    end
  end
endmodule
