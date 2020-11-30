import chisel3._

class PE(array_length:Int, input_width:Int, output_width:Int) extends Module{
//  val arrayLength = 3
//  val inputWidth  = 8
//  val outputWidth = 16
  val arrayLength = array_length
  val inputWidth  = input_width
  val outputWidth = output_width
  val io = IO(iodef = new Bundle {
    val weight_in = Input(Vec(arrayLength, Vec(arrayLength,UInt(inputWidth.W))))
    val ifmaps_in = Input(Vec(arrayLength, UInt(inputWidth.W)))
    val ifmaps_out= Output(Vec(arrayLength, UInt(inputWidth.W)))
    val psum_out  = Output(UInt(outputWidth.W))
    val psum_outr = Output(UInt(outputWidth.W))
    val psum_up   = Input(UInt(outputWidth.W))
    val psum_in   = Input(UInt(outputWidth.W))
    val select    = Input(UInt(1.W))
  })
  //io signals interface define

  val wc1 = RegNext(io.weight_in(0),VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
  val wc2 = RegNext(io.weight_in(1),VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
  val wc3 = RegNext(io.weight_in(2),VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
  val tc1 = RegNext(io.ifmaps_in,VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
  val tc2 = RegNext(tc1,VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
  val tc3 = RegNext(tc2,VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
  val temp1= VecInit(0.U(outputWidth.W),0.U(outputWidth.W),0.U(outputWidth.W))
  val temp2= VecInit(0.U(outputWidth.W),0.U(outputWidth.W),0.U(outputWidth.W))
  val temp3= VecInit(0.U(outputWidth.W),0.U(outputWidth.W),0.U(outputWidth.W))
  for (a <- 0 until arrayLength){
    val CAL1 = Module(new CAL(inputWidth,inputWidth,outputWidth)) // call the multiplier
    CAL1.io.input := tc1(a)
    CAL1.io.weight:= wc1(a)
    temp1(a) := CAL1.io.output
    val CAL2 = Module(new CAL(inputWidth,inputWidth,outputWidth))
    CAL2.io.input := tc2(a)
    CAL2.io.weight:= wc2(a)
    temp2(a) := CAL2.io.output
    val CAL3 = Module(new CAL(inputWidth,inputWidth,outputWidth))
    CAL3.io.input := tc3(a)
    CAL3.io.weight:= wc3(a)
    temp3(a) := CAL3.io.output
  }

  io.ifmaps_out := tc3
  val psm   = Mux(io.select===1.U,io.psum_up,io.psum_in)
  val grey0 = RegNext(psm,0.U)
  // the register to store psum_in/psum_up temporarily
  val acc0  = RegNext(temp1(0)+temp1(1)+temp1(2),0.U(outputWidth.W))
  val acc1  = RegNext(temp2(0)+temp2(1)+temp2(2),0.U(outputWidth.W))
  val acc2  = RegNext(temp3(0)+temp3(1)+temp3(2),0.U(outputWidth.W))

  val grey1 = RegNext(grey0,0.U)
  // transfer the temporary data to the next one
  val acc   = RegNext(acc0+acc1+acc2,0.U(outputWidth.W))
  val grey2 = RegNext(grey0,0.U)
 //val grey2 = RegNext(grey1,0.U)

  io.psum_out := acc+grey2
  io.psum_outr := RegNext(acc+grey2,0.U)
}

//object PE extends App{
//  chisel3.Driver.execute(args, () => new PE)
//}