module teste(halt,reset,saida,clock);

	input halt,reset,saida,clock;

	JKFF whatever(
			.j(0), 
			.k(0), 
			.clk(clock), 
			.clrn(Reset&&(!halt)), 
			.prn(halt), 
			.q(saida)
			);

endmodule