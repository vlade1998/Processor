module IO(End,Write,WriteO,clock,Dst0,Dst1,Dst2);
	input[17:0] Write;
	input[20:0] End;
	output wire[31:0] Dst0,Dst1,Dst2;
	input WriteO, clock;
	reg[31:0] Dst[2:0];
		
	always@(negedge clock) begin
		if(WriteO) Dst[End] <= Write;
	end
	
	assign Dst0 = Dst[0];
	assign Dst1 = Dst[1];
	assign Dst2 = Dst[2];
	
endmodule