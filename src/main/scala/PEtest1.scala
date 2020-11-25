/*
import chisel3._

val arrayLength = 3
val inputWidth  = 8
val outputWidth = 16

class PE extends Module{
//  val arrayLength = 3
//  val inputWidth  = 8
//  val outputWidth = 16
  val io = IO(iodef = new Bundle {
    val weight_in = Input(Vec(arrayLength, Vec(arrayLength,UInt(inputWidth.W))))
    val ifmaps_in = Input(Vec(arrayLength, UInt(inputWidth.W)))
    val ifmaps_out= Output(Vec(arrayLength, UInt(inputWidth.W)))
    val psum_out  = Output(UInt(outputWidth.W))
    val psum_outr = Output(UInt(outputWidth.W))
    val psum_up   = Input(UInt(outputWidth.W))
    val psum_in   = Input(UInt(outputWidth.W))
    val select    = Input(Bool())
  })
//  val wc1 = RegNext(io.weight_in(0),VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
//  val wc2 = RegNext(io.weight_in(1),VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
//  val wc3 = RegNext(io.weight_in(2),VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
//  val tc1 = RegNext(io.ifmaps_in,VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
//  val tc2 = RegNext(tc1,VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
//  val tc3 = RegNext(tc2,VecInit(0.U(inputWidth.W),0.U(inputWidth.W),0.U(inputWidth.W)))
//  val temp1= VecInit(0.U(outputWidth.W),0.U(outputWidth.W),0.U(outputWidth.W))
//  val temp2= VecInit(0.U(outputWidth.W),0.U(outputWidth.W),0.U(outputWidth.W))
//  val temp3= VecInit(0.U(outputWidth.W),0.U(outputWidth.W),0.U(outputWidth.W))
//  for (a <- 0 until arrayLength){
//    val CAL1 = Module(new CAL(inputWidth,inputWidth,outputWidth))
//    CAL1.io.input := tc1(a)
//    CAL1.io.weight:= wc1(a)
//    temp1(a) := CAL1.io.output
//    val CAL2 = Module(new CAL(inputWidth,inputWidth,outputWidth))
//    CAL2.io.input := tc2(a)
//    CAL2.io.weight:= wc2(a)
//    temp2(a) := CAL2.io.output
//    val CAL3 = Module(new CAL(inputWidth,inputWidth,outputWidth))
//    CAL3.io.input := tc3(a)
//    CAL3.io.weight:= wc3(a)
//    temp3(a) := CAL3.io.output
//  }

  val wc   = RegNext(io.weight_in)
  val tc   = RegNext(io.ifmaps_in)
  val temp = RegNext(Vec(arrayLength,(Vec(arrayLength,0.U(outputWidth.W)))))

  for (i <- 0 until arrayLength ){
    for (j <- 0 until arrayLength){
      val CAL = Module(new CAL(inputWidth,inputWidth,outputWidth))
      CAL.io.input  := tc(i)(j)
      CAL.io.weight := wc(i)(j)
      temp(i)(j)    := CAL.io.output
    }
  }


  io.ifmaps_out := tc(2)

  val psm   = Mux(io.select,io.psum_up,io.psum_in)
  val grey0 = RegNext(psm,0.U)


  val acc0  = RegNext(temp(0)(0)+temp(0)(1)+temp(0)(2),0.U(outputWidth.W))
  val acc1  = RegNext(temp(1)(0)+temp(1)(1)+temp(1)(2),0.U(outputWidth.W))
  val acc2  = RegNext(temp(2)(0)+temp(2)(1)+temp(2)(2),0.U(outputWidth.W))

  val grey1 = RegNext(grey0,0.U)

  val acc   = RegNext(acc0+acc1+acc2,0.U(outputWidth.W))
  val grey2 = RegNext(grey0,0.U)

  io.psum_out := acc+grey2
  io.psum_outr := RegNext(acc+grey2,0.U)
}

//  def adder(temp:Array[arrayLength]) : UInt = {
//  val sum = UInt(outputWidth.W)
//  for (i <- 0 until arrayLength){
//
//  }

  return sum
}

object PE1 extends App{
  chisel3.Driver.execute(args, () => new PE1)
}

 */