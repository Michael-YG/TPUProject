import chisel3._

class SystolicArray(dimension_m:Int, dimension_n:Int, channel_number:Int) extends Module {
  val dimensionM = dimension_m
  val dimensionN = dimension_n
  val channelNumber = channel_number
  val arrayLength = 3
  val inputWidth = 8
  val outputWidth = 16

  val io = IO(new Bundle {
    val input = Input(Vec(dimensionM, Vec(arrayLength, UInt(inputWidth.W))))
    val weightIn = Input(Vec(dimensionN * dimensionM, Vec(arrayLength, Vec(arrayLength, UInt(inputWidth.W)))))
    val selectControl = Input(Vec(dimensionM, Vec(dimensionN, UInt(1.W))))
    val PsumIN = Input(UInt(inputWidth.W))
    val output = Output(Vec(dimensionM,Vec(dimensionN,UInt(outputWidth.W))))
  })

  val PEMatrix = Array.ofDim[PE](dimensionM, dimensionN)
  for (i <- 0 until dimensionM) {
    for (j <- 0 until dimensionN) {
      PEMatrix(i)(j) = Module(new PE(3, 8, 16))
    }
  }
  // Generation of Systolic array unit

  for (i <- 0 until dimensionM) {
    for (j <- 0 until dimensionN) {
      PEMatrix(i)(j).io.weight_in := io.weightIn(i * dimensionN + j)

      PEMatrix(i)(j).io.select := io.selectControl(i)(j)

      if (j == 0) {
        PEMatrix(i)(j).io.ifmaps_in := io.input(i)
      } else {
        PEMatrix(i)(j).io.ifmaps_in := PEMatrix(i)(j - 1).io.ifmaps_out
      }
      if (i == 0) {
        PEMatrix(i)(j).io.psum_up := io.PsumIN
      } else {
        PEMatrix(i)(j).io.psum_up := PEMatrix(i - 1)(j).io.psum_out
      }

      PEMatrix(i)(j).io.psum_in := io.PsumIN

      io.output(i)(j):=PEMatrix(i)(j).io.psum_outr
    }
  }
}

//object SystolicArray extends App{
//  chisel3.Driver.execute(args, () => new SystolicArray(16,16,3))
//}
