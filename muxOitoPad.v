module muxOitoPad(in1,in2, in3, in4, in5, in6, in7, in8,select,out);
	input[31:0] in1, in2, in3, in4, in5, in6, in7, in8;
	input[2:0] select;
	output wire[31:0] out;
	reg[31:0] outReg;
	assign out = outReg;
	always @(*) 
		case(select)
			3'b000: outReg <= in1;
			3'b001: outReg <= in2;
			3'b010: outReg <= in3;
			3'b011: outReg <= in4;
			3'b100: outReg <= in5;
			3'b101: outReg <= in6;
			3'b110: outReg <= in7;
			3'b111: outReg <= in8;
		endcase
endmodule