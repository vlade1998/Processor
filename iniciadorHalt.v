module iniciadorHalt(clock,saida);
	input clock;
	output reg saida;
	integer pClock = 1;
	always @(posedge clock) begin
		if(pClock) begin
			saida = 1;
			pClock = 0;
		end else begin
			saida = 0;
		end
	end
endmodule
