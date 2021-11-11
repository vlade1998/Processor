module Banco_de_registradores(ra,rb,rc,write,readA,readB,clock,writeReg, debug);
	input clock, writeReg;
	input[4:0] ra, rb, rc;
	input[31:0] write;
	output wire[31:0] readA, readB;
	output wire[31:0] debug; // remove at the end, debugging sp
	reg[31:0] registradores[31:0];
	
	assign readA = registradores[ra];
	assign readB = registradores[rb];
	assign debug = registradores[rb];
	
	
	always@(negedge clock) begin
	
		if(writeReg) registradores[rc] <= write;

	end

endmodule