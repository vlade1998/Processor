module UnidadeHalt(halt,reset,haltOut);
	input halt, reset;
	output reg haltOut;
	always @(*) begin
		case({halt,reset}) 
			2'b00: haltOut = haltOut;
			2'b01: haltOut = 1'b0;
			2'b10: haltOut = 1'b1;
			2'b11: haltOut = 1'b0;
		endcase
	end
endmodule