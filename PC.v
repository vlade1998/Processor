module PC(halt,clock,endereco,branch,pcsrc,j_jr,endBranch,endJump,endJumpR,zeroULA,reset);
	input[31:0] endJumpR;
	input[15:0] endBranch;
	input[25:0] endJump;
	input halt, clock, branch, pcsrc, j_jr,zeroULA,reset;
	
	output wire[31:0] endereco;
	
	reg[31:0] enderecoReg = 0;
	
	assign endereco = enderecoReg;
	always @(posedge clock) begin
		if(reset) enderecoReg = 0;
		if(~halt) enderecoReg = enderecoReg + 1;
		if(branch && zeroULA && pcsrc) enderecoReg = enderecoReg + endBranch;
		if(j_jr && ~pcsrc) enderecoReg = {enderecoReg[31:26],endJump};
		if(~j_jr && ~pcsrc) enderecoReg = endJumpR;
	end
endmodule
