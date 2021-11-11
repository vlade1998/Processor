module muxDois1B(in1,in2,select,out);
	input in1, in2,select;
	output wire out;
	reg outReg;
	assign out = outReg;
	always @(*) 
		if(select) outReg = in2;
		else outReg = in1;
endmodule