import chisel3._

class RAM extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(8.W))
    val dataIn = Input(UInt(24.W))
    val en = Input(Bool())
    val wr_en = Input(Bool())
    val rd_en = Input(Bool())
    val dataOut = Output(UInt(24.W))
  })
  val bram = Reg(Vec(256, UInt(24.W)))

  when(io.en) {
    when(io.wr_en) {
      bram(io.addr) := io.dataIn
      io.dataOut := DontCare
    }.elsewhen(io.rd_en){
      io.dataOut := bram(io.addr)
    }
  }.otherwise {
    io.dataOut := DontCare
  }
}

//object u_ram extends App {
//  chisel3.Driver.execute(args, () => new Ram())
//}