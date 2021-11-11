module extensor16_32(in,out);
	input[15:0] in;
	output wire[31:0] out;
	reg[31:0] outReg;
	assign out = outReg;
	always @(*)
		outReg <= $signed(in);
endmodule