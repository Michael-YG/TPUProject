//import chisel3.iotesters._
//import org.scalatest._
//import chisel3._
//
//class test1(dut: weight_mem) extends PeekPokeTester(dut) {
//  poke(dut.io.weight_en,1)
//  step(12)
//  expect(dut.io.weightInEn,1)
//}
//
//
//class mem_tb extends FlatSpec with Matchers {
//  "PETEST " should "pass" in {
//    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new weight_mem)
//    { c => new test1(c)} should be (true)
//  }
//}