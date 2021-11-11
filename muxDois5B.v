module muxDois5B(in1,in2,select,out);
	input[4:0] in1, in2;
	input select;
	output wire[4:0] out;
	reg[4:0] outReg;
	assign out = outReg;
	always @(*) 
		if(select) outReg = in2;
		else outReg = in1;
endmodule