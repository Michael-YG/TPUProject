import chisel3._

class SystolicArray extends Module {
  val dimensionM = 16 // 16
  val dimensionN = 16 // 16
  val arrayLength = 3
  val inputWidth = 8
  val outputWidth = 16
  val inputNum=2
  val io = IO(new Bundle {
    val input = Input(Vec(dimensionM, Vec(arrayLength, SInt(inputWidth.W)))) // 16 inputs
    val initEn = Input(UInt(1.W)) // Enable the initial logic (input logic and output logic)
    val weightIn = Input(Vec(arrayLength, SInt(inputWidth.W))) // weight value
    val weightInEn = Input(UInt(1.W)) // enable the weightIn logic
    val weightFull = Output(UInt(1.W))
    val PsumINEn = Input(UInt(1.W))
    val PsumInFull = Output(UInt(1.W))
    val PsumIN = Input(SInt(outputWidth.W))
    val output = Output(Vec(dimensionM,Vec(dimensionN,SInt(outputWidth.W))))
    // for debug
    val weightInPE_0_0 = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val weightInPE_0_1 = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val weightInPE_0_2 = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val bias_PE_0      = Output(SInt(outputWidth.W))
    val dataInPE_0_0   = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val dataInPE_0_1   = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val dataInPE_0_2   = Output(Vec(arrayLength, SInt(inputWidth.W)))
    val PE_0_0_output  = Output(SInt(outputWidth.W))      
    //val inputQuValue = Output(Vec(arrayLength, SInt(inputWidth.W)))
    //val tcInPE = Output(Vec(arrayLength, SInt(inputWidth.W)))
    //val selectValue = Output(UInt(1.W))
  })

  // Generation of Systolic array unit
  val PEMatrix = Array.ofDim[PE](dimensionM, dimensionN)
  for (i <- 0 until dimensionM) {
    for (j <- 0 until dimensionN) {
      PEMatrix(i)(j) = Module(new PE(3, 8, 16))
    }
  }

  // Generation and logic of Weight Value Reg File
  val weight_queue = Reg(Vec(dimensionN * dimensionM, Vec(arrayLength, Vec(arrayLength, SInt(inputWidth.W))))) // 256*3*3*8 shift array
  when (reset.toBool) {
    for (i <- 0 until dimensionN * dimensionM) {
      for (j <- 0 until arrayLength) {
        for (k <- 0 until arrayLength) {
          weight_queue(i)(j)(k) := 0.S(inputWidth.W)
        }
      }
    }
  }.otherwise {
    when ((io.weightInEn===1.U(1.W)) && io.weightFull===0.U(1.W)) {
      weight_queue(0)(0) := io.weightIn
      weight_queue(0)(1) := weight_queue(0)(0)
      weight_queue(0)(2) := weight_queue(0)(1)
      for (i <- 1 until dimensionN * dimensionM) {
        weight_queue(i)(0) := weight_queue(i-1)(arrayLength-1)
        for (j <- 1 until arrayLength){
          weight_queue(i)(j) := weight_queue(i)(j-1)
        }
      }
    }
  }

  when(weight_queue(255)(2)(0) === 0.S(inputWidth.W)){
    io.weightFull := 0.U(1.W)
  }.otherwise{
    io.weightFull := 1.U(1.W)
  }

  // Generation and logic of Input Control Reg (I wanna use wire but it will cause error, because not fully initialized)
  val input_queue = Reg(Vec(dimensionM, Vec(arrayLength, SInt(inputWidth.W)))) // 16*3*8 array
  // Generation and logic of select Reg File
  val select_queue = Reg(Vec(dimensionM, Vec(dimensionN, UInt(1.W)))) // 256*1 shift array
  when (reset.toBool) {
    for (i <- 0 until dimensionM) {
      for (j <-0 until arrayLength){
        input_queue(i)(j) := 0.S(inputWidth.W)
      }
      for (j <-0 until dimensionN){
        select_queue(i)(j) := 0.U(1.W)
      }
    }
  }.otherwise {
    when(io.initEn === 1.U(1.W)) {
        for (i <- 0 until dimensionM) {
          when( i.U(4.W)=== inputNum.U(4.W)) {
            for (j <- 0 until dimensionM / (i + 1)) {
              // input control logic
              for (k <- 0 until (i + 1)) {
                input_queue(j*(i+1)+k) := io.input(k)
                // select control logic
                if(k == 0){
                  for (m <-0 until dimensionN){
                    select_queue(j*(i+1)+k)(m) := 1.U(1.W)
                  }
                }
              }
            }
          }
        }
    }
  }

  // Generation and logic of Psum_in Control Reg
  val PsumIn_queue = Reg(Vec(dimensionM, Vec(dimensionN, SInt(outputWidth.W)))) // 16*16*16 array
  when (reset.toBool) {
    for (i <- 0 until dimensionM) {
      for (j <-0 until dimensionN){
        PsumIn_queue(i)(j) := 0.S(outputWidth.W)
      }
    }
  }.otherwise {
    when (io.PsumINEn===1.U(1.W) && io.PsumInFull===0.U(1.W)) {
      PsumIn_queue(0)(0) := io.PsumIN
      for (i <- 1 until dimensionM) {
        PsumIn_queue(i)(0) := PsumIn_queue(i-1)(dimensionN-1)
      }
      for (i <- 0 until dimensionM) {
        for (j <- 1 until dimensionN){
          PsumIn_queue(i)(j) := PsumIn_queue(i)(j-1)
        }
      }
    }
  }

  when(PsumIn_queue(dimensionM-1)(dimensionN-1) === 0.S(inputWidth.W)){
    io.PsumInFull := 0.U(1.W)
  }.otherwise{
    io.PsumInFull := 1.U(1.W)
  }


  for (i <- 0 until dimensionM) {
    for (j <- 0 until dimensionN) {
      PEMatrix(i)(j).io.weight_in := weight_queue(dimensionM*dimensionN-(i*dimensionN+j)-1)
      PEMatrix(i)(j).io.select := select_queue(i)(j)

      if (j == 0) {
        PEMatrix(i)(j).io.ifmaps_in := input_queue(i)
      } else {
        PEMatrix(i)(j).io.ifmaps_in := PEMatrix(i)(j - 1).io.ifmaps_out
      }
      if (i == 0) {
        PEMatrix(i)(j).io.psum_up := 0.S(outputWidth.W)
      } else {
        PEMatrix(i)(j).io.psum_up := PEMatrix(i - 1)(j).io.psum_out
      }

      PEMatrix(i)(j).io.psum_in := PsumIn_queue(dimensionM-i-1)(dimensionN-j-1)

      io.output(i)(j):=PEMatrix(i)(j).io.psum_outr
    }
  }

  // For debug
  io.weightInPE_0_0 := PEMatrix(2)(1).io.wc1_debug
  io.weightInPE_0_1 := PEMatrix(2)(1).io.wc2_debug
  io.weightInPE_0_2 := PEMatrix(2)(1).io.wc3_debug
  io.bias_PE_0      := PEMatrix(2)(1).io.bias_debug
  io.dataInPE_0_0   := PEMatrix(2)(1).io.tc1_debug
  io.dataInPE_0_1   := PEMatrix(2)(1).io.tc2_debug
  io.dataInPE_0_2   := PEMatrix(2)(1).io.tc3_debug
  io.PE_0_0_output  := PEMatrix(2)(1).io.psum_outr
  //io.inputQuValue := input_queue(0)
  //io.tcInPE := PEMatrix(0)(0).io.inputOut
  //io.selectValue := select_queue(1)(0)
}

