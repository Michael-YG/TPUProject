import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class bias_mem extends Module{
	val io=IO(new Bundle{
	val bias_en=Input(UInt(1.W))	
	val bias_address=Output(UInt(8.W))
	val bias=Output(SInt(16.W))
	})
	val address=RegInit(0.U(8.W))
	val bias_mem=SyncReadMem(255,SInt(16.W))
	loadMemoryFromFile(bias_mem,"/Users/fuuakira/Desktop/大四上/微处理器/bias.txt")
	when(io.bias_en===1.U(1.W)){
		io.bias:=bias_mem(address)
		address:=address+1.U(8.W)
	}.otherwise{
		io.bias:=0.S(16.W)
		address:=0.U(8.W)
	}
	io.bias_address:=address
}
