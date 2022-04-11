import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class weight_mem extends Module{
	val io=IO(new Bundle{
	val weight_en=Input(UInt(1.W))	
	val weight_address=Output(UInt(13.W))
	val weight=Output(Vec(3, SInt(8.W)))
	val weightInEn=Output(UInt(1.W))
	})
	val address=RegInit(0.U(13.W))
	val weight_mem=SyncReadMem(2303,SInt(9.W))//256*3*3=2304
	loadMemoryFromFile(weight_mem,"/Users/fuuakira/Desktop/大四上/微处理器/weight.txt")
	when(io.weight_en===1.U(1.W)){
		address:=address+1.U(13.W)
		io.weightInEn:=1.U(1.W)
		io.weight(2):=weight_mem(address+448.U(13.W))
		io.weight(1):=weight_mem(address+224.U(13.W))
		io.weight(0):=weight_mem(address)
	}.otherwise{
		io.weight(0):=0.S(8.W)
		io.weight(1):=0.S(8.W)
		io.weight(2):=0.S(8.W)
		io.weightInEn:=0.U(1.W)
		address:=0.U(13.W)
	}
	//printf(" weight_en:%d weight_address:%d weighInEn:%d\n weight(0):%d weight(1):%d weight(2):%d\n",io.weight_en,address,io.weightInEn,io.weight(0),io.weight(1),io.weight(2))
	//debug
	io.weight_address:=address
}
