module ULA(AluOp,A,B,Res,Zero,LO,HI);

input[31:0] A,B;
input[3:0] AluOp;
output reg[31:0] Res,LO,HI;
output reg Zero;

always @(*)
	case(AluOp)

	4'b0000: Res = A + B;
	4'b0001: Res = A - B;
	4'b0010: {HI,LO} = A*B;
	4'b0011: begin HI = A/B; LO = A%B; end
	4'b0100: Res = A & B;
	4'b0101: Res = A | B;
	4'b0110: Res = A ^ B;
	4'b0111: Res = ~B;
	4'b1000: Res = B>>1;
	4'b1001: Res = B<<1;
	4'b1010: Zero = (A==B)?1'b1:1'b0;

	endcase

endmodule