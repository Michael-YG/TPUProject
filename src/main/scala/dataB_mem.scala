import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class dataB_mem extends Module{
	val io=IO(new Bundle{
	val read_en =Input(UInt(1.W))
	val data_ch3_1=Output(SInt(8.W))
	val data_ch3_2=Output(SInt(8.W))
	val data_ch3_3=Output(SInt(8.W))
	})
	val address=RegInit(0.U(16.W))
	val dataMemB =SyncReadMem(50175,SInt(9.W)) //224*224=50176
	loadMemoryFromFile(dataMemB,"/Users/fuuakira/Desktop/大四上/微处理器/pngb.txt")
	when(io.read_en===1.U(1.W)&&address=/=49727.U(16.W)){
		io.data_ch3_1:=dataMemB(address)
		io.data_ch3_2:=dataMemB(address+224.U(16.W))
		io.data_ch3_3:=dataMemB(address+448.U(16.W))
		address:=address+1.U(16.W)
	}.otherwise{
		io.data_ch3_1:=0.S(8.W)
		io.data_ch3_2:=0.S(8.W)
		io.data_ch3_3:=0.S(8.W)
		address:=0.U(16.W)
	}
}
