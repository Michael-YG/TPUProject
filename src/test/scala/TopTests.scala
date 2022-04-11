import chisel3._
import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}

class Tests(dut: Top) extends PeekPokeTester(dut){
  poke(dut.io.weightInEn,0)
  poke(dut.io.PsumInEn,0)
  poke(dut.io.initEn,0)
  step(10)
  poke(dut.io.weightInEn,1)
  poke(dut.io.PsumInEn,1)
  step(770)
  poke(dut.io.initEn,1)
  step(60)
  expect(dut.io.output(2)(0),16683)
}


class TopTests extends FlatSpec with Matchers {
  "PETEST " should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new Top)
    { c => new Tests(c)} should be (true)
  }
}
