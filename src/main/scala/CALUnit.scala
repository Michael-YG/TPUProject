import chisel3._

class CAL(inputWidth:Int, weightWidth:Int, outputWidth:Int) extends Module {
  val io = IO(new Bundle {
    val input = Input(SInt(inputWidth.W))
    val weight = Input(SInt(weightWidth.W))
    val output = Output(SInt(outputWidth.W))
  })
//
//  val mul = Module(new BB88)
//  mul.io.x := io.input
//  mul.io.y := io.weight
//  io.output := mul.io.r
io.output := io.input * io.weight
}

object CAL extends App{
  chisel3.Driver.execute(args, () => new CAL(8,8,16))
}