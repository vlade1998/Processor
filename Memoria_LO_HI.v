module Memoria_LO_HI(wLO,wHI,rLO,rHI,clock,WriteLH);
	
	input[31:0] wLO, wHI;
	output wire[31:0] rLO, rHI;
	input clock,WriteLH;
	
	reg[31:0] LO, HI;
	
	assign rLO = LO;
	assign rHI = HI;
	
	initial begin
		LO <= 32'd6;
	end
	
	always @(negedge clock) begin
		
		if(WriteLH) begin
			LO <= wLO;
			HI <= wHI;
		end
		
	end
	
endmodule