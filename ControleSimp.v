module ControleSimp(opcode,RegDst,RegDstJal,WriteSrc,WriteR,AluSrc,WriteLH,LO_HI,AluOP,Branch,Beq_Bne,PcSrc,J_Jr,LessImediate,ReadM,WriteM,ReadI,WriteO,MemToReg);
	input[5:0] opcode;
	output reg RegDst,RegDstJal,WriteR,AluSrc,WriteLH,LO_HI,Branch,Beq_Bne,PcSrc,J_Jr,LessImediate,ReadM,WriteM,ReadI,WriteO,MemToReg;
	output reg[3:0] AluOP;
	output reg[2:0] WriteSrc;
	always @(*) 
		case(opcode)
			6'b000000: //add
				begin
					RegDst = 1;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b0000;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					ReadM = 0;
					WriteM = 0;
					ReadI = 0;
					WriteO = 0;
					MemToReg = 0;
				end
			6'b011001:
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 0;
					WriteR = 0;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					ReadM = 0;
					WriteM = 0;
					ReadI = 0;
					WriteO = 1;
					MemToReg = 0;
				end
			default:
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 0;
					WriteR = 0;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					ReadM = 0;
					WriteM = 0;
					ReadI = 0;
					WriteO = 0;
					MemToReg = 0;
				end
		endcase
endmodule