import chisel3._

class BB88 extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(8.W))
    val y = Input(UInt(8.W))
    val r = Output(UInt(16.W))
  })
  val BB0 = Module(new BB44)
  val BB1 = Module(new BB44)
  val BB2 = Module(new BB44)
  val BB3 = Module(new BB44)
  val bb_out = Wire(Vec(4, UInt(16.W)))
  BB0.io.x := io.x(7,4)
  BB0.io.y := io.y(3,0)
  BB0.io.n := 4.U(4.W)
  bb_out(0):= BB0.io.r

  BB1.io.x := io.x(3,0)
  BB1.io.y := io.y(3,0)
  BB1.io.n := 0.U(4.W)
  bb_out(1):= BB1.io.r
  BB2.io.x := io.x(7,4)
  BB2.io.y := io.y(7,4)
  BB2.io.n := 8.U(4.W)
  bb_out(2):= BB2.io.r
  BB3.io.x := io.x(3,0)
  BB3.io.y := io.y(7,4)
  BB3.io.n := 4.U(4.W)
  bb_out(3):= BB3.io.r

  io.r := (bb_out(0)+bb_out(1)+bb_out(2)+bb_out(3))

}

object BB88 extends App{
  chisel3.Driver.execute(args, () => new BB88)
}