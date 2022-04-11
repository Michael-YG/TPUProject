//import chisel3.iotesters._
//import org.scalatest._
//
//class test(dut: PE) extends PeekPokeTester(dut) {
////  poke(dut.io.weight_in(0)(0),1)
////  poke(dut.io.weight_in(0)(1),1)
////  poke(dut.io.weight_in(0)(2),1)
////  poke(dut.io.weight_in(1)(0),1)
////  poke(dut.io.weight_in(1)(1),1)
////  poke(dut.io.weight_in(1)(2),1)
////  poke(dut.io.weight_in(2)(0),1)
////  poke(dut.io.weight_in(2)(1),1)
////  poke(dut.io.weight_in(2)(2),1)
////  poke(dut.io.psum_up,0)
////  poke(dut.io.psum_in,0)
////  poke(dut.io.select,1)
////  poke(dut.io.ifmaps_in(0),1)
////  poke(dut.io.ifmaps_in(1),2)
////  poke(dut.io.ifmaps_in(2),3)
////  step(1)
////  poke(dut.io.ifmaps_in(0),4)
////  poke(dut.io.ifmaps_in(1),5)
////  poke(dut.io.ifmaps_in(2),6)
////  step(1)
////  poke(dut.io.ifmaps_in(0),7)
////  poke(dut.io.ifmaps_in(1),8)
////  poke(dut.io.ifmaps_in(2),9)
////  step(1)
////  poke(dut.io.ifmaps_in(0),4)
////  poke(dut.io.ifmaps_in(1),5)
////  poke(dut.io.ifmaps_in(2),6)
////  step(1)
////  poke(dut.io.ifmaps_in(0),1)
////  poke(dut.io.ifmaps_in(1),2)
////  poke(dut.io.ifmaps_in(2),3)
////  step(1)
////  expect(dut.io.psum_out,45)
////  step(1)
////  expect(dut.io.psum_out,54)
//  for(i <- 0 until 16){
//    for(j <- 0 until 3){
//      poke(dut.io.input(i)(j),0)
//    }
//  }
//  poke(dut.io.initEn,0)
//  poke(dut.io.inputNum,0)
//  for(i <- 0 until 3){
//    poke(dut.io.weightIn(i),0)
//  }
//  poke(dut.io.weightInEn,0)
//  poke(dut.io.PsumIN,0)
//  step(2)
//  poke(dut.io.weightIn(0),1)
//  poke(dut.io.weightIn(1),1)
//  poke(dut.io.weightIn(2),1)
//  poke(dut.io.weightInEn,1)
//  step(1)
//  poke(dut.io.weightIn(0),1)
//  poke(dut.io.weightIn(1),1)
//  poke(dut.io.weightIn(2),1)
//  step(1)
//  poke(dut.io.weightIn(0),1)
//  poke(dut.io.weightIn(1),1)
//  poke(dut.io.weightIn(2),1)
//  step(1)
//  poke(dut.io.weightIn(0),0)
//  poke(dut.io.weightIn(1),0)
//  poke(dut.io.weightIn(2),0)
//  step(765)
//  expect(dut.io.weightFull,1)
//  poke(dut.io.weightInEn,0)
//  step(2)
//  poke(dut.io.inputNum,1)
//  poke(dut.io.initEn,1)
//  step(1)
//  poke(dut.io.initEn,0)
//  poke(dut.io.input(0)(0),1)
//  poke(dut.io.input(0)(1),2)
//  poke(dut.io.input(0)(2),3)
//  step(3)
//  poke(dut.io.input(0)(0),0)
//  poke(dut.io.input(0)(1),0)
//  poke(dut.io.input(0)(2),0)
//  step(6)
//  expect(dut.io.output(0)(0),18)
//}
//
//class PEtest extends FlatSpec with Matchers {
//  "PETEST " should "pass" in {
//    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new SystolicArray(16, 16, 3))
//    { c => new test(c)} should be (true)
//  }
//}
//
////object PEtest extends App {
////  chisel3.iotesters.Driver.execute(args, () => new SystolicArray(16,16,4))(c => new test(c))
////}