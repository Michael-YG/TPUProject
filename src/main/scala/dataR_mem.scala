import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class dataR_mem extends Module{
	val io=IO(new Bundle{
	val read_en =Input(UInt(1.W))
	val data_ch1_1=Output(SInt(8.W))
	val data_ch1_2=Output(SInt(8.W))
	val data_ch1_3=Output(SInt(8.W))
	//just for debug	
	val addr=Output(UInt(16.W))
	})
	val address=RegInit(0.U(16.W))
	val dataMemR =Mem(50175,SInt(9.W)) //224*224=50176
	loadMemoryFromFile(dataMemR,"/Users/fuuakira/Desktop/大四上/微处理器/pngr.txt")
	when(io.read_en===1.U(1.W)&&address=/=49727.U(16.W)){
		io.data_ch1_1:=dataMemR(address)
		io.data_ch1_2:=dataMemR(address+224.U(16.W))
		io.data_ch1_3:=dataMemR(address+448.U(16.W))
		address:=address+1.U(16.W)
	}.otherwise{
		io.data_ch1_1:=0.S(8.W)
		io.data_ch1_2:=0.S(8.W)
		io.data_ch1_3:=0.S(8.W)
		address:=0.U(16.W)
	}
	io.addr:=address
}
