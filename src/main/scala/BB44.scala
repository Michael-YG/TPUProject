import chisel3._

class BB44 extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(4.W))
    val y = Input(UInt(4.W))
    val n = Input(UInt(4.W))
    val r = Output(UInt(16.W))
  })
  val BB0 = Module(new BB)
  val BB1 = Module(new BB)
  val BB2 = Module(new BB)
  val BB3 = Module(new BB)
  val bb_out = Wire(Vec(4, UInt(8.W)))
  BB0.io.x := io.x(3,2)
  BB0.io.y := io.y(1,0)
  BB0.io.n := 2.U(3.W)
  bb_out(0):= BB0.io.r

  BB1.io.x := io.x(1,0)
  BB1.io.y := io.y(1,0)
  BB1.io.n := 0.U(3.W)
  bb_out(1):= BB1.io.r
  BB2.io.x := io.x(3,2)
  BB2.io.y := io.y(3,2)
  BB2.io.n := 4.U(3.W)
  bb_out(2):= BB2.io.r
  BB3.io.x := io.x(1,0)
  BB3.io.y := io.y(3,2)
  BB3.io.n := 2.U(3.W)
  bb_out(3):= BB3.io.r

  io.r := (bb_out(0)+bb_out(1)+bb_out(2)+bb_out(3))<< io.n

}