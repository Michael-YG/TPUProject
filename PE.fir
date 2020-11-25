;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit PE : 
  module CAL : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module CAL_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T @[CALUnit.scala 9:13]
    
  module PE : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip weight_in : UInt<8>[3][3], flip ifmaps_in : UInt<8>[3], ifmaps_out : UInt<8>[3], psum_out : UInt<16>, psum_outr : UInt<16>, flip psum_up : UInt<16>, flip psum_in : UInt<16>, flip select : UInt<1>}
    
    wire _T : UInt<8>[3] @[PE.scala 19:44]
    _T[0] <= UInt<8>("h00") @[PE.scala 19:44]
    _T[1] <= UInt<8>("h00") @[PE.scala 19:44]
    _T[2] <= UInt<8>("h00") @[PE.scala 19:44]
    reg wc1 : UInt<8>[3], clock with : (reset => (reset, _T)) @[PE.scala 19:20]
    wc1[0] <= io.weight_in[0][0] @[PE.scala 19:20]
    wc1[1] <= io.weight_in[0][1] @[PE.scala 19:20]
    wc1[2] <= io.weight_in[0][2] @[PE.scala 19:20]
    wire _T_1 : UInt<8>[3] @[PE.scala 20:44]
    _T_1[0] <= UInt<8>("h00") @[PE.scala 20:44]
    _T_1[1] <= UInt<8>("h00") @[PE.scala 20:44]
    _T_1[2] <= UInt<8>("h00") @[PE.scala 20:44]
    reg wc2 : UInt<8>[3], clock with : (reset => (reset, _T_1)) @[PE.scala 20:20]
    wc2[0] <= io.weight_in[1][0] @[PE.scala 20:20]
    wc2[1] <= io.weight_in[1][1] @[PE.scala 20:20]
    wc2[2] <= io.weight_in[1][2] @[PE.scala 20:20]
    wire _T_2 : UInt<8>[3] @[PE.scala 21:44]
    _T_2[0] <= UInt<8>("h00") @[PE.scala 21:44]
    _T_2[1] <= UInt<8>("h00") @[PE.scala 21:44]
    _T_2[2] <= UInt<8>("h00") @[PE.scala 21:44]
    reg wc3 : UInt<8>[3], clock with : (reset => (reset, _T_2)) @[PE.scala 21:20]
    wc3[0] <= io.weight_in[2][0] @[PE.scala 21:20]
    wc3[1] <= io.weight_in[2][1] @[PE.scala 21:20]
    wc3[2] <= io.weight_in[2][2] @[PE.scala 21:20]
    wire _T_3 : UInt<8>[3] @[PE.scala 22:41]
    _T_3[0] <= UInt<8>("h00") @[PE.scala 22:41]
    _T_3[1] <= UInt<8>("h00") @[PE.scala 22:41]
    _T_3[2] <= UInt<8>("h00") @[PE.scala 22:41]
    reg tc1 : UInt<8>[3], clock with : (reset => (reset, _T_3)) @[PE.scala 22:20]
    tc1[0] <= io.ifmaps_in[0] @[PE.scala 22:20]
    tc1[1] <= io.ifmaps_in[1] @[PE.scala 22:20]
    tc1[2] <= io.ifmaps_in[2] @[PE.scala 22:20]
    wire _T_4 : UInt<8>[3] @[PE.scala 23:32]
    _T_4[0] <= UInt<8>("h00") @[PE.scala 23:32]
    _T_4[1] <= UInt<8>("h00") @[PE.scala 23:32]
    _T_4[2] <= UInt<8>("h00") @[PE.scala 23:32]
    reg tc2 : UInt<8>[3], clock with : (reset => (reset, _T_4)) @[PE.scala 23:20]
    tc2[0] <= tc1[0] @[PE.scala 23:20]
    tc2[1] <= tc1[1] @[PE.scala 23:20]
    tc2[2] <= tc1[2] @[PE.scala 23:20]
    wire _T_5 : UInt<8>[3] @[PE.scala 24:32]
    _T_5[0] <= UInt<8>("h00") @[PE.scala 24:32]
    _T_5[1] <= UInt<8>("h00") @[PE.scala 24:32]
    _T_5[2] <= UInt<8>("h00") @[PE.scala 24:32]
    reg tc3 : UInt<8>[3], clock with : (reset => (reset, _T_5)) @[PE.scala 24:20]
    tc3[0] <= tc2[0] @[PE.scala 24:20]
    tc3[1] <= tc2[1] @[PE.scala 24:20]
    tc3[2] <= tc2[2] @[PE.scala 24:20]
    wire temp1 : UInt<16>[3] @[PE.scala 25:21]
    temp1[0] <= UInt<16>("h00") @[PE.scala 25:21]
    temp1[1] <= UInt<16>("h00") @[PE.scala 25:21]
    temp1[2] <= UInt<16>("h00") @[PE.scala 25:21]
    wire temp2 : UInt<16>[3] @[PE.scala 26:21]
    temp2[0] <= UInt<16>("h00") @[PE.scala 26:21]
    temp2[1] <= UInt<16>("h00") @[PE.scala 26:21]
    temp2[2] <= UInt<16>("h00") @[PE.scala 26:21]
    wire temp3 : UInt<16>[3] @[PE.scala 27:21]
    temp3[0] <= UInt<16>("h00") @[PE.scala 27:21]
    temp3[1] <= UInt<16>("h00") @[PE.scala 27:21]
    temp3[2] <= UInt<16>("h00") @[PE.scala 27:21]
    inst CAL of CAL @[PE.scala 29:22]
    CAL.clock <= clock
    CAL.reset <= reset
    CAL.io.input <= tc1[0] @[PE.scala 30:19]
    CAL.io.weight <= wc1[0] @[PE.scala 31:19]
    temp1[0] <= CAL.io.output @[PE.scala 32:14]
    inst CAL_1 of CAL_1 @[PE.scala 33:22]
    CAL_1.clock <= clock
    CAL_1.reset <= reset
    CAL_1.io.input <= tc2[0] @[PE.scala 34:19]
    CAL_1.io.weight <= wc2[0] @[PE.scala 35:19]
    temp2[0] <= CAL_1.io.output @[PE.scala 36:14]
    inst CAL_2 of CAL_2 @[PE.scala 37:22]
    CAL_2.clock <= clock
    CAL_2.reset <= reset
    CAL_2.io.input <= tc3[0] @[PE.scala 38:19]
    CAL_2.io.weight <= wc3[0] @[PE.scala 39:19]
    temp3[0] <= CAL_2.io.output @[PE.scala 40:14]
    inst CAL_3 of CAL_3 @[PE.scala 29:22]
    CAL_3.clock <= clock
    CAL_3.reset <= reset
    CAL_3.io.input <= tc1[1] @[PE.scala 30:19]
    CAL_3.io.weight <= wc1[1] @[PE.scala 31:19]
    temp1[1] <= CAL_3.io.output @[PE.scala 32:14]
    inst CAL_4 of CAL_4 @[PE.scala 33:22]
    CAL_4.clock <= clock
    CAL_4.reset <= reset
    CAL_4.io.input <= tc2[1] @[PE.scala 34:19]
    CAL_4.io.weight <= wc2[1] @[PE.scala 35:19]
    temp2[1] <= CAL_4.io.output @[PE.scala 36:14]
    inst CAL_5 of CAL_5 @[PE.scala 37:22]
    CAL_5.clock <= clock
    CAL_5.reset <= reset
    CAL_5.io.input <= tc3[1] @[PE.scala 38:19]
    CAL_5.io.weight <= wc3[1] @[PE.scala 39:19]
    temp3[1] <= CAL_5.io.output @[PE.scala 40:14]
    inst CAL_6 of CAL_6 @[PE.scala 29:22]
    CAL_6.clock <= clock
    CAL_6.reset <= reset
    CAL_6.io.input <= tc1[2] @[PE.scala 30:19]
    CAL_6.io.weight <= wc1[2] @[PE.scala 31:19]
    temp1[2] <= CAL_6.io.output @[PE.scala 32:14]
    inst CAL_7 of CAL_7 @[PE.scala 33:22]
    CAL_7.clock <= clock
    CAL_7.reset <= reset
    CAL_7.io.input <= tc2[2] @[PE.scala 34:19]
    CAL_7.io.weight <= wc2[2] @[PE.scala 35:19]
    temp2[2] <= CAL_7.io.output @[PE.scala 36:14]
    inst CAL_8 of CAL_8 @[PE.scala 37:22]
    CAL_8.clock <= clock
    CAL_8.reset <= reset
    CAL_8.io.input <= tc3[2] @[PE.scala 38:19]
    CAL_8.io.weight <= wc3[2] @[PE.scala 39:19]
    temp3[2] <= CAL_8.io.output @[PE.scala 40:14]
    io.ifmaps_out[0] <= tc3[0] @[PE.scala 43:17]
    io.ifmaps_out[1] <= tc3[1] @[PE.scala 43:17]
    io.ifmaps_out[2] <= tc3[2] @[PE.scala 43:17]
    node psm = mux(io.select, io.psum_up, io.psum_in) @[PE.scala 45:18]
    reg grey0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 46:22]
    grey0 <= psm @[PE.scala 46:22]
    node _T_6 = add(temp1[0], temp1[1]) @[PE.scala 48:31]
    node _T_7 = tail(_T_6, 1) @[PE.scala 48:31]
    node _T_8 = add(_T_7, temp1[2]) @[PE.scala 48:40]
    node _T_9 = tail(_T_8, 1) @[PE.scala 48:40]
    reg acc0 : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 48:22]
    acc0 <= _T_9 @[PE.scala 48:22]
    node _T_10 = add(temp2[0], temp2[1]) @[PE.scala 49:31]
    node _T_11 = tail(_T_10, 1) @[PE.scala 49:31]
    node _T_12 = add(_T_11, temp2[2]) @[PE.scala 49:40]
    node _T_13 = tail(_T_12, 1) @[PE.scala 49:40]
    reg acc1 : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 49:22]
    acc1 <= _T_13 @[PE.scala 49:22]
    node _T_14 = add(temp3[0], temp3[1]) @[PE.scala 50:31]
    node _T_15 = tail(_T_14, 1) @[PE.scala 50:31]
    node _T_16 = add(_T_15, temp3[2]) @[PE.scala 50:40]
    node _T_17 = tail(_T_16, 1) @[PE.scala 50:40]
    reg acc2 : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 50:22]
    acc2 <= _T_17 @[PE.scala 50:22]
    reg grey1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 52:22]
    grey1 <= grey0 @[PE.scala 52:22]
    node _T_18 = add(acc0, acc1) @[PE.scala 54:27]
    node _T_19 = tail(_T_18, 1) @[PE.scala 54:27]
    node _T_20 = add(_T_19, acc2) @[PE.scala 54:32]
    node _T_21 = tail(_T_20, 1) @[PE.scala 54:32]
    reg acc : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 54:22]
    acc <= _T_21 @[PE.scala 54:22]
    reg grey2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 55:22]
    grey2 <= grey0 @[PE.scala 55:22]
    node _T_22 = add(acc, grey2) @[PE.scala 57:21]
    node _T_23 = tail(_T_22, 1) @[PE.scala 57:21]
    io.psum_out <= _T_23 @[PE.scala 57:15]
    node _T_24 = add(acc, grey2) @[PE.scala 58:30]
    node _T_25 = tail(_T_24, 1) @[PE.scala 58:30]
    reg _T_26 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 58:26]
    _T_26 <= _T_25 @[PE.scala 58:26]
    io.psum_outr <= _T_26 @[PE.scala 58:16]
    
