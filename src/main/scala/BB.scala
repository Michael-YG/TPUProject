import chisel3.util.Cat
import chisel3._

class BB extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(2.W))
    val y = Input(UInt(2.W))
    val n = Input(UInt(3.W))
    val r = Output(UInt(8.W))
  })
  val adder = Wire(UInt(4.W))
  val rom = VecInit(0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W), 0.U(4.W),
    1.U(4.W), 2.U(4.W), 3.U(4.W), 0.U(4.W), 2.U(4.W), 4.U(4.W),
    6.U(4.W), 0.U(4.W), 3.U(4.W), 6.U(4.W), 9.U(4.W))
  adder := Cat(io.x, io.y)
  io.r := rom(adder) << io.n
}
