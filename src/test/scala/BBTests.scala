//import chisel3.iotesters.PeekPokeTester
//import org.scalatest.{FlatSpec, Matchers}
//
//class Tests(dut: BB88) extends PeekPokeTester(dut){
//  poke(dut.io.x,24)
//  poke(dut.io.y,24)
//  expect(dut.io.r,576)
//  step(1)
//  poke(dut.io.x,11)
//  poke(dut.io.y,11)
//  expect(dut.io.r,121)
//}
//
//
//class BBTests extends FlatSpec with Matchers {
//  "PETEST " should "pass" in {
//    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new BB88)
//    { c => new Tests(c)} should be (true)
//  }
//}
