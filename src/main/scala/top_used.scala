import chisel3._

class Top extends Module {
  val dimensionM = 16 // 16
  val dimensionN = 16 // 16
  val channelNumber = 1
  val arrayLength = 3
  val inputWidth = 8
  val outputWidth = 16

  val io = IO(new Bundle {
  val initEn = Input(UInt(1.W)) // Enable the initial logic (input logic and output logic)
  val weightInEn = Input(UInt(1.W)) // Enable the weightIn logic
  val PsumInEn   = Input(UInt(1.W)) // Enable the PsumIn(bias) logic
  val output = Output(Vec(dimensionM, Vec(dimensionN, SInt(outputWidth.W))))
  //Just for debug
  val test_addr_weight=Output(UInt(12.W))
  val test_addr_bias  =Output(UInt(8.W))
  val weightFull      =Output(UInt(1.W))
  val PsumInFull      =Output(UInt(1.W))
  val data_r	      =Output(SInt(8.W))
  val data_g	      =Output(SInt(8.W))
  val data_b	      =Output(SInt(8.W))
 
  val weightInPE_0_0 = Output(Vec(arrayLength, SInt(inputWidth.W)))
  val weightInPE_0_1 = Output(Vec(arrayLength, SInt(inputWidth.W)))
  val weightInPE_0_2 = Output(Vec(arrayLength, SInt(inputWidth.W)))
  val bias_PE_0      = Output(SInt(outputWidth.W))
  val dataInPE_0_0   = Output(Vec(arrayLength, SInt(inputWidth.W)))
  val dataInPE_0_1   = Output(Vec(arrayLength, SInt(inputWidth.W)))
  val dataInPE_0_2   = Output(Vec(arrayLength, SInt(inputWidth.W)))
    
  val PsumIn_test     =Output(SInt(8.W))
  })
///////////////////////////////////////////////////////////////////
  val systolicArray = Module(new SystolicArray)
  systolicArray.io.initEn := io.initEn
  systolicArray.io.PsumINEn := io.PsumInEn  
  io.output := systolicArray.io.output
///////////////////////////////weight mem and its control logic////////////////////////////////////
  val weight_mem=Module(new weight_mem)
  val weight_control=RegInit(0.U(1.W))
  weight_mem.io.weight_en:=io.weightInEn
  io.test_addr_weight:=weight_mem.io.weight_address
  systolicArray.io.weightIn(2):= weight_mem.io.weight(2)
  systolicArray.io.weightIn(1):= weight_mem.io.weight(1)
  systolicArray.io.weightIn(0):= weight_mem.io.weight(0)
  systolicArray.io.weightInEn := weight_control
  when(io.weightInEn ===1.U(1.W) && weight_mem.io.weight_address=/=2207.U(13.W)){
	weight_control:=1.U(1.W)
  }.otherwise{
	weight_control:=0.U(1.W)
  }
///////////////////////////////bias mem and its control logic////////////////////////////////////
  val bias_mem=Module(new bias_mem)  
  val bias_control=RegInit(0.U(1.W))
  bias_mem.io.bias_en:=bias_control
  systolicArray.io.PsumIN:= bias_mem.io.bias
  io.test_addr_bias:=bias_mem.io.bias_address
  when(io.PsumInEn===1.U(1.W) && bias_mem.io.bias_address=/=255.U(8.W)){
	bias_control:=1.U(1.W)
  }.otherwise{
	bias_control:=0.U(1.W)
  } 
///////////////////////////////data mem and its control logic////////////////////////////////////
  
  val dataR_mem=Module(new dataR_mem)
  val dataG_mem=Module(new dataG_mem)
  val dataB_mem=Module(new dataB_mem)
  val read_en_R=RegInit(0.U(1.W))
  val read_en_G=RegInit(0.U(1.W))
  val read_en_B=RegInit(0.U(1.W))
  when(io.initEn===1.U(1.W) ){ //224*222-1
	read_en_R:=1.U(1.W)
  	read_en_G:=1.U(1.W)
  	read_en_B:=1.U(1.W)
  }.otherwise{
	read_en_R:=0.U(1.W)
  	read_en_G:=0.U(1.W)
  	read_en_B:=0.U(1.W)
  }
  dataR_mem.io.read_en :=read_en_R
  dataG_mem.io.read_en :=read_en_G
  dataB_mem.io.read_en :=read_en_B

  //Channel 2
  val delay1_ch2_1=RegNext(dataG_mem.io.data_ch2_1,0.S(8.W))
  val delay2_ch2_1=RegNext(delay1_ch2_1,0.S(8.W))
  val delay3_ch2_1=RegNext(delay2_ch2_1,0.S(8.W))

  val delay1_ch2_2=RegNext(dataG_mem.io.data_ch2_2 ,0.S(8.W))
  val delay2_ch2_2=RegNext(delay1_ch2_2,0.S(8.W))
  val delay3_ch2_2=RegNext(delay2_ch2_2,0.S(8.W))

  val delay1_ch2_3=RegNext(dataG_mem.io.data_ch2_2 ,0.S(8.W))
  val delay2_ch2_3=RegNext(delay1_ch2_3,0.S(8.W))
  val delay3_ch2_3=RegNext(delay2_ch2_3,0.S(8.W))

  //Channel 3
  val delay1_ch3_1=RegNext(dataB_mem.io.data_ch3_1 ,0.S(8.W))
  val delay2_ch3_1=RegNext(delay1_ch3_1,0.S(8.W))
  val delay3_ch3_1=RegNext(delay2_ch3_1,0.S(8.W))
  val delay4_ch3_1=RegNext(delay3_ch3_1,0.S(8.W))
  val delay5_ch3_1=RegNext(delay4_ch3_1,0.S(8.W))
  val delay6_ch3_1=RegNext(delay5_ch3_1,0.S(8.W))

  val delay1_ch3_2=RegNext(dataB_mem.io.data_ch3_2 ,0.S(8.W))
  val delay2_ch3_2=RegNext(delay1_ch3_2,0.S(8.W))
  val delay3_ch3_2=RegNext(delay2_ch3_2,0.S(8.W))
  val delay4_ch3_2=RegNext(delay3_ch3_2,0.S(8.W))
  val delay5_ch3_2=RegNext(delay4_ch3_2,0.S(8.W))
  val delay6_ch3_2=RegNext(delay5_ch3_2,0.S(8.W))

  val delay1_ch3_3=RegNext(dataB_mem.io.data_ch3_3,0.S(8.W))
  val delay2_ch3_3=RegNext(delay1_ch3_3,0.S(8.W))
  val delay3_ch3_3=RegNext(delay2_ch3_3,0.S(8.W))
  val delay4_ch3_3=RegNext(delay3_ch3_3,0.S(8.W))
  val delay5_ch3_3=RegNext(delay4_ch3_3,0.S(8.W))
  val delay6_ch3_3=RegNext(delay5_ch3_3,0.S(8.W))
  for(i<-0 until 4){
	systolicArray.io.input(i*3)(0)  :=dataR_mem.io.data_ch1_1
	systolicArray.io.input(i*3)(1)  :=dataR_mem.io.data_ch1_2
	systolicArray.io.input(i*3)(2)  :=dataR_mem.io.data_ch1_3

	systolicArray.io.input(i*3+1)(0):=delay3_ch2_1
	systolicArray.io.input(i*3+1)(1):=delay3_ch2_2
	systolicArray.io.input(i*3+1)(2):=delay3_ch2_3

	systolicArray.io.input(i*3+2)(0):=delay6_ch3_1
	systolicArray.io.input(i*3+2)(1):=delay6_ch3_2
	systolicArray.io.input(i*3+2)(2):=delay6_ch3_3
  }
 for(i<-12 until 16){
	systolicArray.io.input(i)(0):=0.S(8.W)
	systolicArray.io.input(i)(1):=0.S(8.W)
	systolicArray.io.input(i)(2):=0.S(8.W)
	
  }
/////////////////////////////////////////debug/////////////////////////////////////////
  io.weightFull := systolicArray.io.weightFull
  io.PsumInFull := systolicArray.io.PsumInFull
  io.data_r	:=dataR_mem.io.data_ch1_1
  io.weightInPE_0_0 := systolicArray.io.weightInPE_0_0
  io.weightInPE_0_1 := systolicArray.io.weightInPE_0_1
  io.weightInPE_0_2 := systolicArray.io.weightInPE_0_2
  io.bias_PE_0      := systolicArray.io.bias_PE_0
  io.dataInPE_0_0   := systolicArray.io.dataInPE_0_0
  io.dataInPE_0_1   := systolicArray.io.dataInPE_0_1
  io.dataInPE_0_2   := systolicArray.io.dataInPE_0_2
  
printf("bias:%d  Output:%d read_en:%d address:%d weight_full:%d\n tc1(0):%d tc2(0):%d tc3(0):%d wc1(0):%d wc2(0):%d wc3(0):%d\n tc1(1):%d tc2(1):%d tc3(1):%d wc1(1):%d wc2(1):%d wc3(1):%d\n tc1(2):%d tc2(2):%d tc3(2):%d wc1(2):%d wc2(2):%d wc3(2):%d\n\n ",io.bias_PE_0,systolicArray.io.PE_0_0_output,read_en_R,dataR_mem.io.addr,systolicArray.io.weightFull,io.dataInPE_0_0(0),io.dataInPE_0_1(0),io.dataInPE_0_2(0),io.weightInPE_0_0(0),io.weightInPE_0_1(0),io.weightInPE_0_2(0),io.dataInPE_0_0(1),io.dataInPE_0_1(1),io.dataInPE_0_2(1),io.weightInPE_0_0(1),io.weightInPE_0_1(1),io.weightInPE_0_2(1),io.dataInPE_0_0(2),io.dataInPE_0_1(2),io.dataInPE_0_2(2),io.weightInPE_0_0(2),io.weightInPE_0_1(2),io.weightInPE_0_2(2))
  io.data_g	:=delay3_ch2_1
  io.data_b	:=delay6_ch3_1
  io.PsumIn_test:=bias_mem.io.bias
}

object Top extends App{
  chisel3.Driver.execute(args, () => new Top)
}

 
