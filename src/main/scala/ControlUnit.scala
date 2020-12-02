import chisel3._

class ControlUnit extends Module{
  val m = 16
  val n = 16
  val arrayLength = 3
  val inputWidth  = 8
  val outputWidth = 16

  val io = IO(new Bundle() {
    val EnableIn        = Input(Bool())
    val InputChannel = Input(UInt(8.W))
    val Break         = Input(Bool())
    val WeighIn  = Input(Vec(m*n, Vec(arrayLength, Vec(arrayLength, UInt(inputWidth.W)))))
    val PsumIn  = Input(UInt(inputWidth.W))
    val IfmapsIn = Input(Vec(m,Vec(arrayLength,UInt(inputWidth.W))))
    val EnableOut       = Output(Bool())
    val IfmapsOut    = Output(Vec(m,Vec(arrayLength,UInt(inputWidth.W))))
    val PusmOut   = Output(UInt(inputWidth.W))
    val WeightOut  = Output(Vec(m*n, Vec(arrayLength, Vec(arrayLength, UInt(inputWidth.W)))))
    val SelectControlOut = Output(Vec(m, Vec(n, UInt(1.W))))
  })
  io.EnableOut := io.EnableIn


}