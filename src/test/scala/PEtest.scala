//import chisel3._
//import chisel3.iotesters.PeekPokeTester
//import org.scalatest._
//
//class test(dut: PE) extends PeekPokeTester(dut) {
//  poke(dut.io.weight_in(0)(0),1)
//  poke(dut.io.weight_in(0)(1),1)
//  poke(dut.io.weight_in(0)(2),1)
//  poke(dut.io.weight_in(1)(0),1)
//  poke(dut.io.weight_in(1)(1),1)
//  poke(dut.io.weight_in(1)(2),1)
//  poke(dut.io.weight_in(2)(0),1)
//  poke(dut.io.weight_in(2)(1),1)
//  poke(dut.io.weight_in(2)(2),1)
//  poke(dut.io.psum_up,0)
//  poke(dut.io.psum_in,0)
//  poke(dut.io.select,1)
//  poke(dut.io.ifmaps_in(0),1)
//  poke(dut.io.ifmaps_in(1),2)
//  poke(dut.io.ifmaps_in(2),3)
//  step(1)
//  poke(dut.io.ifmaps_in(0),4)
//  poke(dut.io.ifmaps_in(1),5)
//  poke(dut.io.ifmaps_in(2),6)
//  step(1)
//  poke(dut.io.ifmaps_in(0),7)
//  poke(dut.io.ifmaps_in(1),8)
//  poke(dut.io.ifmaps_in(2),9)
//  step(3)
//  expect(dut.io.psum_out,45)
//}
//
//class PEtest extends FlatSpec with Matchers {
//  "PETEST " should "pass" in {
//    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new PE)
//    { c => new test(c)} should be (true)
//  }
//}