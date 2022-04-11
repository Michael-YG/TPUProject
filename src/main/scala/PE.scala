import chisel3._

class PE(ArrayLength:Int, InputWidth:Int, OutputWidth:Int) extends Module{
  val arrayLength  = ArrayLength
  val inputWidth  = InputWidth
  val outputWidth = OutputWidth

  val io = IO(iodef = new Bundle {
    val weight_in = Input(Vec(arrayLength, Vec(arrayLength,SInt(inputWidth.W))))
    val ifmaps_in = Input(Vec(arrayLength, SInt(inputWidth.W)))
    val ifmaps_out= Output(Vec(arrayLength, SInt(inputWidth.W)))
    val psum_out  = Output(SInt(outputWidth.W))
    val psum_outr = Output(SInt(outputWidth.W))
    val psum_up   = Input(SInt(outputWidth.W))
    val psum_in   = Input(SInt(outputWidth.W))
    val select    = Input(UInt(1.W))

    // for debug
    val wc1_debug = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val wc2_debug = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val wc3_debug = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val bias_debug= Output(SInt(outputWidth.W))
    val tc1_debug = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val tc2_debug = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val tc3_debug = Output(Vec(arrayLength, SInt(inputWidth.W)))

})

  val wc1 = io.weight_in(2)
  val wc2 = io.weight_in(1)
  val wc3 = io.weight_in(0)
  val tc1 = RegNext(io.ifmaps_in,VecInit(0.S(inputWidth.W),0.S(inputWidth.W),0.S(inputWidth.W)))
  val tc2 = RegNext(tc1,VecInit(0.S(inputWidth.W),0.S(inputWidth.W),0.S(inputWidth.W)))
  val tc3 = RegNext(tc2,VecInit(0.S(inputWidth.W),0.S(inputWidth.W),0.S(inputWidth.W)))
  val temp1= VecInit(0.S(outputWidth.W),0.S(outputWidth.W),0.S(outputWidth.W))
  val temp2= VecInit(0.S(outputWidth.W),0.S(outputWidth.W),0.S(outputWidth.W))
  val temp3= VecInit(0.S(outputWidth.W),0.S(outputWidth.W),0.S(outputWidth.W))

  val psm   = Mux(io.select===1.U(1.W),io.psum_in,io.psum_up)
  val grey0 = RegNext(psm,0.S)
  val acc0  = RegNext(temp1(0)+temp1(1)+temp1(2),0.S(outputWidth.W))
  val acc1  = RegNext(temp2(0)+temp2(1)+temp2(2),0.S(outputWidth.W))
  val acc2  = RegNext(temp3(0)+temp3(1)+temp3(2),0.S(outputWidth.W))

  val grey1 = RegNext(grey0,0.S)

  val acc   = RegNext(acc0+acc1+acc2,0.S(outputWidth.W))
  val grey2 = RegNext(grey1,0.S)

  for (a <- 0 until arrayLength){
    val CAL1 = Module(new CAL(inputWidth,inputWidth,outputWidth))
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
  io.psum_out := acc+grey2
  io.psum_outr := RegNext(io.psum_out,0.S)

  // for debug
  io.wc1_debug:= wc1
  io.wc2_debug:= wc2
  io.wc3_debug:= wc3
  io.bias_debug:=psm
  io.tc1_debug:= tc1
  io.tc2_debug:= tc2
  io.tc3_debug:= tc3
}

//object PE extends App{
//  chisel3.Driver.execute(args, () => new PE(3, 8, 16))
//}
