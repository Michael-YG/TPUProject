;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit PE : 
  module CAL : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module CAL_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip input : UInt<8>, flip weight : UInt<8>, output : UInt<16>}
    
    node _T_11 = mul(io.input, io.weight) @[CALUnit.scala 9:25]
    io.output <= _T_11 @[CALUnit.scala 9:13]
    
  module PE : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip weight_in : UInt<8>[3][3], flip ifmaps_in : UInt<8>[3], ifmaps_out : UInt<8>[3], psum_out : UInt<16>, psum_outr : UInt<16>, flip psum_up : UInt<16>, flip psum_in : UInt<16>, flip select : UInt<1>}
    
    wire _T_225 : UInt<8>[3] @[PE.scala 17:44]
    _T_225[0] <= UInt<8>("h00") @[PE.scala 17:44]
    _T_225[1] <= UInt<8>("h00") @[PE.scala 17:44]
    _T_225[2] <= UInt<8>("h00") @[PE.scala 17:44]
    reg wc1 : UInt<8>[3], clock with : (reset => (reset, _T_225)) @[PE.scala 17:20]
    wc1[0] <= io.weight_in[0][0] @[PE.scala 17:20]
    wc1[1] <= io.weight_in[0][1] @[PE.scala 17:20]
    wc1[2] <= io.weight_in[0][2] @[PE.scala 17:20]
    wire _T_268 : UInt<8>[3] @[PE.scala 18:44]
    _T_268[0] <= UInt<8>("h00") @[PE.scala 18:44]
    _T_268[1] <= UInt<8>("h00") @[PE.scala 18:44]
    _T_268[2] <= UInt<8>("h00") @[PE.scala 18:44]
    reg wc2 : UInt<8>[3], clock with : (reset => (reset, _T_268)) @[PE.scala 18:20]
    wc2[0] <= io.weight_in[1][0] @[PE.scala 18:20]
    wc2[1] <= io.weight_in[1][1] @[PE.scala 18:20]
    wc2[2] <= io.weight_in[1][2] @[PE.scala 18:20]
    wire _T_311 : UInt<8>[3] @[PE.scala 19:44]
    _T_311[0] <= UInt<8>("h00") @[PE.scala 19:44]
    _T_311[1] <= UInt<8>("h00") @[PE.scala 19:44]
    _T_311[2] <= UInt<8>("h00") @[PE.scala 19:44]
    reg wc3 : UInt<8>[3], clock with : (reset => (reset, _T_311)) @[PE.scala 19:20]
    wc3[0] <= io.weight_in[2][0] @[PE.scala 19:20]
    wc3[1] <= io.weight_in[2][1] @[PE.scala 19:20]
    wc3[2] <= io.weight_in[2][2] @[PE.scala 19:20]
    wire _T_354 : UInt<8>[3] @[PE.scala 20:41]
    _T_354[0] <= UInt<8>("h00") @[PE.scala 20:41]
    _T_354[1] <= UInt<8>("h00") @[PE.scala 20:41]
    _T_354[2] <= UInt<8>("h00") @[PE.scala 20:41]
    reg tc1 : UInt<8>[3], clock with : (reset => (reset, _T_354)) @[PE.scala 20:20]
    tc1[0] <= io.ifmaps_in[0] @[PE.scala 20:20]
    tc1[1] <= io.ifmaps_in[1] @[PE.scala 20:20]
    tc1[2] <= io.ifmaps_in[2] @[PE.scala 20:20]
    wire _T_389 : UInt<8>[3] @[PE.scala 21:32]
    _T_389[0] <= UInt<8>("h00") @[PE.scala 21:32]
    _T_389[1] <= UInt<8>("h00") @[PE.scala 21:32]
    _T_389[2] <= UInt<8>("h00") @[PE.scala 21:32]
    reg tc2 : UInt<8>[3], clock with : (reset => (reset, _T_389)) @[PE.scala 21:20]
    tc2[0] <= tc1[0] @[PE.scala 21:20]
    tc2[1] <= tc1[1] @[PE.scala 21:20]
    tc2[2] <= tc1[2] @[PE.scala 21:20]
    wire _T_440 : UInt<8>[3] @[PE.scala 22:32]
    _T_440[0] <= UInt<8>("h00") @[PE.scala 22:32]
    _T_440[1] <= UInt<8>("h00") @[PE.scala 22:32]
    _T_440[2] <= UInt<8>("h00") @[PE.scala 22:32]
    reg tc3 : UInt<8>[3], clock with : (reset => (reset, _T_440)) @[PE.scala 22:20]
    tc3[0] <= tc2[0] @[PE.scala 22:20]
    tc3[1] <= tc2[1] @[PE.scala 22:20]
    tc3[2] <= tc2[2] @[PE.scala 22:20]
    wire temp1 : UInt<16>[3] @[PE.scala 23:21]
    temp1[0] <= UInt<16>("h00") @[PE.scala 23:21]
    temp1[1] <= UInt<16>("h00") @[PE.scala 23:21]
    temp1[2] <= UInt<16>("h00") @[PE.scala 23:21]
    wire temp2 : UInt<16>[3] @[PE.scala 24:21]
    temp2[0] <= UInt<16>("h00") @[PE.scala 24:21]
    temp2[1] <= UInt<16>("h00") @[PE.scala 24:21]
    temp2[2] <= UInt<16>("h00") @[PE.scala 24:21]
    wire temp3 : UInt<16>[3] @[PE.scala 25:21]
    temp3[0] <= UInt<16>("h00") @[PE.scala 25:21]
    temp3[1] <= UInt<16>("h00") @[PE.scala 25:21]
    temp3[2] <= UInt<16>("h00") @[PE.scala 25:21]
    inst CAL of CAL @[PE.scala 27:22]
    CAL.clock <= clock
    CAL.reset <= reset
    CAL.io.input <= tc1[0] @[PE.scala 28:19]
    CAL.io.weight <= wc1[0] @[PE.scala 29:19]
    temp1[0] <= CAL.io.output @[PE.scala 30:14]
    inst CAL_1 of CAL_1 @[PE.scala 31:22]
    CAL_1.clock <= clock
    CAL_1.reset <= reset
    CAL_1.io.input <= tc2[0] @[PE.scala 32:19]
    CAL_1.io.weight <= wc2[0] @[PE.scala 33:19]
    temp2[0] <= CAL_1.io.output @[PE.scala 34:14]
    inst CAL_2 of CAL_2 @[PE.scala 35:22]
    CAL_2.clock <= clock
    CAL_2.reset <= reset
    CAL_2.io.input <= tc3[0] @[PE.scala 36:19]
    CAL_2.io.weight <= wc3[0] @[PE.scala 37:19]
    temp3[0] <= CAL_2.io.output @[PE.scala 38:14]
    inst CAL_3 of CAL_3 @[PE.scala 27:22]
    CAL_3.clock <= clock
    CAL_3.reset <= reset
    CAL_3.io.input <= tc1[1] @[PE.scala 28:19]
    CAL_3.io.weight <= wc1[1] @[PE.scala 29:19]
    temp1[1] <= CAL_3.io.output @[PE.scala 30:14]
    inst CAL_4 of CAL_4 @[PE.scala 31:22]
    CAL_4.clock <= clock
    CAL_4.reset <= reset
    CAL_4.io.input <= tc2[1] @[PE.scala 32:19]
    CAL_4.io.weight <= wc2[1] @[PE.scala 33:19]
    temp2[1] <= CAL_4.io.output @[PE.scala 34:14]
    inst CAL_5 of CAL_5 @[PE.scala 35:22]
    CAL_5.clock <= clock
    CAL_5.reset <= reset
    CAL_5.io.input <= tc3[1] @[PE.scala 36:19]
    CAL_5.io.weight <= wc3[1] @[PE.scala 37:19]
    temp3[1] <= CAL_5.io.output @[PE.scala 38:14]
    inst CAL_6 of CAL_6 @[PE.scala 27:22]
    CAL_6.clock <= clock
    CAL_6.reset <= reset
    CAL_6.io.input <= tc1[2] @[PE.scala 28:19]
    CAL_6.io.weight <= wc1[2] @[PE.scala 29:19]
    temp1[2] <= CAL_6.io.output @[PE.scala 30:14]
    inst CAL_7 of CAL_7 @[PE.scala 31:22]
    CAL_7.clock <= clock
    CAL_7.reset <= reset
    CAL_7.io.input <= tc2[2] @[PE.scala 32:19]
    CAL_7.io.weight <= wc2[2] @[PE.scala 33:19]
    temp2[2] <= CAL_7.io.output @[PE.scala 34:14]
    inst CAL_8 of CAL_8 @[PE.scala 35:22]
    CAL_8.clock <= clock
    CAL_8.reset <= reset
    CAL_8.io.input <= tc3[2] @[PE.scala 36:19]
    CAL_8.io.weight <= wc3[2] @[PE.scala 37:19]
    temp3[2] <= CAL_8.io.output @[PE.scala 38:14]
    io.ifmaps_out[0] <= tc3[0] @[PE.scala 41:17]
    io.ifmaps_out[1] <= tc3[1] @[PE.scala 41:17]
    io.ifmaps_out[2] <= tc3[2] @[PE.scala 41:17]
    node psm = mux(io.select, io.psum_up, io.psum_in) @[PE.scala 43:18]
    reg grey0 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 44:22]
    grey0 <= psm @[PE.scala 44:22]
    node _T_536 = add(temp1[0], temp1[1]) @[PE.scala 45:31]
    node _T_537 = tail(_T_536, 1) @[PE.scala 45:31]
    node _T_538 = add(_T_537, temp1[2]) @[PE.scala 45:40]
    node _T_539 = tail(_T_538, 1) @[PE.scala 45:40]
    reg acc0 : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 45:22]
    acc0 <= _T_539 @[PE.scala 45:22]
    node _T_542 = add(temp2[0], temp2[1]) @[PE.scala 46:31]
    node _T_543 = tail(_T_542, 1) @[PE.scala 46:31]
    node _T_544 = add(_T_543, temp2[2]) @[PE.scala 46:40]
    node _T_545 = tail(_T_544, 1) @[PE.scala 46:40]
    reg acc1 : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 46:22]
    acc1 <= _T_545 @[PE.scala 46:22]
    node _T_548 = add(temp3[0], temp3[1]) @[PE.scala 47:31]
    node _T_549 = tail(_T_548, 1) @[PE.scala 47:31]
    node _T_550 = add(_T_549, temp3[2]) @[PE.scala 47:40]
    node _T_551 = tail(_T_550, 1) @[PE.scala 47:40]
    reg acc2 : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 47:22]
    acc2 <= _T_551 @[PE.scala 47:22]
    reg grey1 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 49:22]
    grey1 <= grey0 @[PE.scala 49:22]
    node _T_556 = add(acc0, acc1) @[PE.scala 51:27]
    node _T_557 = tail(_T_556, 1) @[PE.scala 51:27]
    node _T_558 = add(_T_557, acc2) @[PE.scala 51:32]
    node _T_559 = tail(_T_558, 1) @[PE.scala 51:32]
    reg acc : UInt, clock with : (reset => (reset, UInt<16>("h00"))) @[PE.scala 51:22]
    acc <= _T_559 @[PE.scala 51:22]
    reg grey2 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 52:22]
    grey2 <= grey0 @[PE.scala 52:22]
    node _T_564 = add(acc, grey2) @[PE.scala 54:21]
    node _T_565 = tail(_T_564, 1) @[PE.scala 54:21]
    io.psum_out <= _T_565 @[PE.scala 54:15]
    node _T_566 = add(acc, grey2) @[PE.scala 55:30]
    node _T_567 = tail(_T_566, 1) @[PE.scala 55:30]
    reg _T_570 : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[PE.scala 55:26]
    _T_570 <= _T_567 @[PE.scala 55:26]
    io.psum_outr <= _T_570 @[PE.scala 55:16]
    
