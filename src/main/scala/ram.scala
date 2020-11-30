import chisel3._
class ram extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(8.W))
    val dataIn = Input(UInt(32.W))
    val en = Input(Bool())
    val wr_en = Input(Bool())
    val rd_en = Input(Bool())
    val dataOut = Output(UInt(32.W))
  })
  val syncRAM = SyncReadMem(256, UInt(32.W))

  when(io.en) {
    when(io.wr_en) {
      syncRAM.write(io.addr, io.dataIn)
      io.dataOut := DontCare
    }.elsewhen(io.rd_en){
      io.dataOut := syncRAM.read(io.addr)
    }
  }.otherwise {
    io.dataOut := DontCare
  }
}

object u_ram extends App {
  chisel3.Driver.execute(args, () => new ram)
}