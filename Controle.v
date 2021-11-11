module Controle(opcode,RegDst,RegDstJal,WriteSrc,WriteR,AluSrc,WriteLH,LO_HI,AluOP,Branch,Beq_Bne,PcSrc,J_Jr,LessImediate,ReadM,WriteM,ReadI,WriteO,MemToReg,Halt);
	input[5:0] opcode;
	output reg RegDst,RegDstJal,WriteR,AluSrc,WriteLH,LO_HI,Branch,Beq_Bne,PcSrc,J_Jr,LessImediate,ReadM,WriteM,ReadI,WriteO,MemToReg,Halt;
	output reg[3:0] AluOP;
	output reg[2:0] WriteSrc;
	always @(opcode) 
		case(opcode)
			6'b011010: //add
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
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b000001: //addi
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b0000;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b000010: //sub
				begin
					RegDst = 1;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b0001;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b000011: //mult
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 3'b000;
					WriteR = 0;
					AluSrc = 1;
					WriteLH = 1;
					LO_HI = 0;
					AluOP = 4'b0010;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b000100: //div
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 3'b000;
					WriteR = 0;
					AluSrc = 1;
					WriteLH = 1;
					LO_HI = 0;
					AluOP = 4'b0011;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b000101: //and
				begin
					RegDst = 1;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b0100;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b000110: //or
				begin
					RegDst = 1;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b0101;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b000111: //xor
				begin
					RegDst = 1;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b0110;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
				end
			6'b001000: //not
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b0111;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
				end
			6'b001001: //sr
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b1000;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b001010: //sl
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 3'b010;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 4'b1001;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b001011: //move
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 0;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b001100: //mLO
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 1;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b001101: //mHI
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 1;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 1;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b001110: //load
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 10;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0000;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 1;
					Halt = 0;
				end
			6'b001111: //loadi
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 11;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010000: //store
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 0;
					WriteR = 0;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0000;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 1;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010001: //beq
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 0;
					WriteR = 0;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 1010;
					Branch = 1;
					Beq_Bne = 1;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010010: //bne
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 0;
					WriteR = 0;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 1010;
					Branch = 1;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010011: //slt
				begin
					RegDst = 1;
					RegDstJal = 0;
					WriteSrc = 101;
					WriteR = 1;
					AluSrc = 1;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0001; //1010
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010100: //slti
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 101;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0001; //1011
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 1; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010101: //jump
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
					PcSrc = 0;
					J_Jr = 1;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010110: //jumpr
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
					PcSrc = 0;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b010111: //jal
				begin
					RegDst = 0;
					RegDstJal = 1;
					WriteSrc = 110;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 0;
					J_Jr = 1;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
			6'b011000: //in
				begin
					RegDst = 0;
					RegDstJal = 0;
					WriteSrc = 100;
					WriteR = 1;
					AluSrc = 0;
					WriteLH = 0;
					LO_HI = 0;
					AluOP = 0;
					Branch = 0;
					Beq_Bne = 0;
					PcSrc = 1;
					J_Jr = 0;
					LessImediate = 0; 
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 1;
				end
			6'b011001: //out
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
					WriteM = 0;
					WriteO = 1;
					MemToReg = 0;
					Halt = 0;
				end
			6'b011011: //halt
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
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 1;
				end
			default: //nop
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
					WriteM = 0;
					WriteO = 0;
					MemToReg = 0;
					Halt = 0;
				end
		endcase
endmodule