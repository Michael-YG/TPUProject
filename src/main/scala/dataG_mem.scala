import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class dataG_mem extends Module{
	val io=IO(new Bundle{
	val read_en =Input(UInt(1.W))
	val data_ch2_1=Output(SInt(8.W))
	val data_ch2_2=Output(SInt(8.W))
	val data_ch2_3=Output(SInt(8.W))
	})
	val address=RegInit(0.U(16.W))
	val dataMemG =SyncReadMem(50175,SInt(9.W)) //224*224=50176
	loadMemoryFromFile(dataMemG,"/Users/fuuakira/Desktop/大四上/微处理器/pngg.txt")
	when(io.read_en===1.U(1.W)&&address=/=49727.U(16.W)){
		io.data_ch2_1:=dataMemG(address)
		io.data_ch2_2:=dataMemG(address+224.U(16.W))
		io.data_ch2_3:=dataMemG(address+448.U(16.W))
		address:=address+1.U(16.W)
	}.otherwise{
		io.data_ch2_1:=0.S(8.W)
		io.data_ch2_2:=0.S(8.W)
		io.data_ch2_3:=0.S(8.W)
		address:=0.U(16.W)
	}
}
