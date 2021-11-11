module unidadeProcessamento(clock,out1,out2,out3,in,RegDst,RegDstJal,WriteR,AluSrc,WriteLH,LO_HI,Branch,Beq_Bne,PcSrc,J_Jr,LessImediate,ReadM,WriteM,ReadI,WriteO,MemToReg,AluOP,WriteSrc);
	input clock;
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
	wire Less;
	wire LessI;
	wire Zero;
	wire beq_bne;
 	wire outLessImediate;
	wire out_beq_bne;
	input RegDst, RegDstJal, WriteR, AluSrc, WriteLH, LO_HI, Branch, Beq_Bne, PcSrc, J_Jr, LessImediate, ReadM, WriteM, ReadI, WriteO, MemToReg; //controle
	input[3:0] AluOP;
	input[2:0] WriteSrc;
	output wire[31:0] out1, out2, out3;
	input[31:0] in;
	
	PC pc(
		.halt(0),
		.clock(clock),
		.endereco(EnderecoInstrucao),
		.branch(Branch),
		.pcsrc(PcSrc),
		.j_jr(J_Jr),
		.endBranch(Extensor16B),
		.endJump(Instrucao[25:0]),
		.endJumpR(ReadA),
		.zeroULA(out_beq_bne)
		);
		
	muxDoisPad muxBeq_Bne(
		.in1(~Zero),
		.in2(Zero),
		.select(beq_bne),
		.out(out_beq_bne)
	);
				
	Memoria_de_instrucoes instmem(
		.endereco(EnderecoInstrucao),
		.instrucao(Instrucao),
		.clock(clock)
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
		.writeReg(WriteR)
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
		.A(ReadA),
		.B(ReadB),
		.Res(ResULA),
		.Zero(Zero),
		.Less(Less),
		.LessI(LessI),
		.LO(WLo),
		.HI(WHi)
		);
		
	Memoria_de_dados RAM(
		.endereco(ResULA),
		.write(ReadA),
		.read(ReadRAM),
		.readM(ReadM),
		.writeM(WriteM),
		.clock(clock)
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
		.End(Instrucao[20:0]),
		.Write(ReadA), 
		.Read(ReadIO),
		.ReadI(ReadI),
		.WriteO(WriteO),
		.clock(clock),
		.Dst0(out1),
		.Dst1(out2),
		.Dst2(out3),
		.In(in)
		);
		
	
	muxDoisPad muxLO_HI(
		.in1(RLo),
		.in2(RHi),
		.select(LO_HI),
		.out(outLO_HI)
		);
		
	muxDois1B muxLessI(
		.in1(Less),
		.in2(LessI),
		.select(LessImediate),
		.out(outLessImediate)
		);
	
	muxOitoPad muxWriteSrc(
		.in1(ReadB),
		.in2(outLO_HI),
		.in3(outMemToReg),
		.in4(Extensor21b), 
		.in5(ReadIO), //
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