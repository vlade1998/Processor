module muxQuatro5B(in1,in2, in3, in4, select,out);
	input[4:0] in1, in2, in3, in4;
	input [1:0] select;
	output wire[4:0] out;
	reg[4:0] outReg;
	assign out = outReg;
	always @(*) 
		case(select)
			2'b00: outReg = in1;
			2'b01: outReg = in2;
			2'b10: outReg = in3;
			2'b11: outReg = in4;
		endcase
endmodule