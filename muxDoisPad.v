module muxDoisPad(in1,in2,select,out);
	input[31:0] in1, in2;
	input select;
	output wire[31:0] out;
	reg[31:0] outReg;
	assign out = outReg;
	always @(*) 
		if(select) outReg = in2;
		else outReg = in1;
endmodule