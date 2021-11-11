module ProcessadorVlademir(clockR,cont,reset,in,out1,out2,out3,debug,debugPC,clockL); //remover fio de debug no final
	input clockR;
	input cont;
	input reset;
	wire[31:0] EnderecoInstrucao;
	wire[31:0] Instrucao;
	wire[4:0] outRegDst;
	wire[4:0] outRegDstJal;
	wire[31:0] ReadA;
	wire[31:0] ReadB;
	wire[31:0] Extensor16b;
	wire[31:0] WLo;
	wire[31:0] WHi;
	wire[31:0] RLo;
	wire[31:0] RHi;
	wire[31:0] ResULA;
	wire[31:0] ReadRAM;
	wire[31:0] ReadIO;
	wire[31:0] Extensor21b;
	wire[31:0] outLO_HI;
	wire[31:0] outMemToReg;
	wire[31:0] outWriteSrc;
	wire[31:0] outAluSrc;
	wire contDeb;
	wire resetDeb;
	wire clock;
	wire Less;
	wire LessI;
	wire Zero;
	wire beq_bne;
	wire outLess;
 	wire outLessImediate;
	wire out_beq_bne;
	wire outCont;
	wire outReset;
	wire RegDst, RegDstJal, WriteR, AluSrc, WriteLH, LO_HI, Branch, Beq_Bne, PcSrc, J_Jr, LessImediate, WriteM, ReadI, WriteO, MemToReg, Halt; //controle
	wire[3:0] AluOP; //controle
	wire[2:0] WriteSrc; //controle 
	input[17:0] in;
	output wire[31:0] out1;
	output wire[31:0] out2;
	output wire[31:0] out3;
	output wire[31:0] debug; //remover no final, ajuste a vontade o tamanho dessa porra
	output wire[31:0] debugPC; //remover no final
	output clockL; //remover no final
	
	
	assign debugPC = EnderecoInstrucao;
	assign clockL = clock;
	
	Clock_divider divisorClock(
		.clock_in(clockR),
		.clock_out(clock)
	);
	
	PC pc(
		.halt(Halt&(~outCont)), 
		.clock(clock),
		.endereco(EnderecoInstrucao),
		.branch(Branch),
		.pcsrc(PcSrc),
		.j_jr(J_Jr),
		.endBranch(Extensor16b),
		.endJump(Instrucao[25:0]),
		.endJumpR(ReadA),
		.zeroULA(out_beq_bne),
		.reset(outReset)
		);
		
	monostable tratamentoCont(
		.clk(clock),
		.reset(0),
		.trigger(~cont),
		.pulse(outCont)
	);
	
	monostable tratamentoReset(
		.clk(clock),
		.reset(0),
		.trigger(~reset), 
		.pulse(outReset)
	);
		
	Controle controle(
		.opcode(Instrucao[31:26]),
		.RegDst(RegDst),
		.RegDstJal(RegDstJal),
		.WriteSrc(WriteSrc),
		.WriteR(WriteR),
		.AluSrc(AluSrc),
		.WriteLH(WriteLH),
		.LO_HI(LO_HI),
		.AluOP(AluOP),
		.Branch(Branch),
		.Beq_Bne(Beq_Bne),
		.PcSrc(PcSrc),
		.J_Jr(J_Jr),
		.LessImediate(LessImediate),
		.WriteM(WriteM),
		.ReadI(ReadI),
		.WriteO(WriteO),
		.MemToReg(MemToReg),
		.Halt(Halt)
		);
		
	muxDoisPad muxBeq_Bne(
		.in1(!(ReadA==ReadB)), //!(ReadA==ReadB)
		.in2(ReadA==ReadB), //(ReadA==ReadB)
		.select(Beq_Bne),
		.out(out_beq_bne)
	);
				
	Memoria_de_instrucoes instmem(
		.read_addr(EnderecoInstrucao),
		.q(Instrucao),
		.write_clock(clock),
		.read_clock(clockR)
		);
		
	muxDois5B muxRegDst(
		.in1(Instrucao[25:21]),
		.in2(Instrucao[15:11]),
		.select(RegDst),
		.out(outRegDst)
		);
	
	muxDois5B muxRegDstJal(
		.in1(outRegDst),
		.in2(5'd31),
		.select(RegDstJal),
		.out(outRegDstJal)
		);
	
	Banco_de_registradores breg(
		.ra(Instrucao[25:21]),
		.rb(Instrucao[20:16]),
		.rc(outRegDstJal),
		.write(outWriteSrc),
		.readA(ReadA),
		.readB(ReadB),
		.clock(clock),
		.writeReg(WriteR),
		.debug(debug) //remove at the end
		);	
	
	extensor16_32 extensor16(
		.in(Instrucao[15:0]),
		.out(Extensor16b)
		);
		
	muxDoisPad muxAluSrc(
		.in1(Extensor16b),
		.in2(ReadA),
		.select(AluSrc),
		.out(outAluSrc)
		);
	
	ULA ULA(
		.AluOp(AluOP),
		.A(outAluSrc),
		.B(ReadB),
		.Res(ResULA),
		.Zero(Zero),
		.LO(WLo),
		.HI(WHi)
		);
		
	Memoria_de_dados RAM(
		.read_addr(ResULA),
		.write_addr(ResULA),
		.data(ReadA),
		.q(ReadRAM),
		.we(WriteM),
		.write_clock(clock),
		.read_clock(clockR)
		);
		
	muxDoisPad muxMemToReg(
		.in1(ResULA),
		.in2(ReadRAM),
		.select(MemToReg),
		.out(outMemToReg)
		);
	
	Memoria_LO_HI(
		.wLO(WLo),
		.wHI(WHi),
		.rLO(RLo),
		.rHI(RHi),
		.clock(clock),
		.WriteLH(WriteLH)
		);
		
		
	IO IO(
		.End(Instrucao[20:0]), //Instrucao[20:0]
		.Write(ReadA), //ReadA
		.WriteO(WriteO), //WriteO 
		.clock(clock),
		.Dst0(out1),
		.Dst1(out2),
		.Dst2(out3),
		);
	
	muxDoisPad muxLO_HI(
		.in1(RLo),
		.in2(RHi),
		.select(LO_HI),
		.out(outLO_HI)
		);
		
	muxDois1B Less_LessI(
		.in1(ResULA[31]),
		.in2((!ResULA[31])&&!(Extensor16b==ReadB)),
		.select(LessImediate),
		.out(outLess)
		);
		
	muxDoisPad muxLessI(
		.in1(0),
		.in2(1),
		.select(outLess),
		.out(outLessImediate)
		);
	
	muxOitoPad muxWriteSrc(
		.in1(ReadB), 
		.in2(outLO_HI),
		.in3(outMemToReg), 
		.in4(Extensor21b), 
		.in5({14'd0,in}), //ReadIO
		.in6(outLessImediate), 
		.in7(EnderecoInstrucao + 1), 
		.in8(32'd0), 
		.select(WriteSrc), 
		.out(outWriteSrc) 
	);
	
	extensor21_32 extensor21(
		.in(Instrucao[20:0]),
		.out(Extensor21b)
		);
endmodule