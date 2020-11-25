import chisel3._

class CAL(inputWidth:Int, weightWidth:Int, outputWidth:Int) extends Module {
  val io = IO(new Bundle {
    val input = Input(UInt(inputWidth.W))
    val weight = Input(UInt(weightWidth.W))
    val output = Output(UInt(outputWidth.W))
  })
  io.output := io.input * io.weight
}

/*This is the  multiplier we implement*/


