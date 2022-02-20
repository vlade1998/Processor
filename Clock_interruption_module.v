module Clock_interruption_module
#(parameter quantum=20)
(
	input clock,
	input reset,
	input stop,
	output reg sigint
);

	reg[31:0] counter = 32'd0;
	reg off = 1'b1;
	
	always @ (posedge clock) 
	begin
		if(stop) begin
			off = 1;
			sigint = 0;
		end
		if(reset) begin
			sigint = 0;
			counter = 0;
			off = 0;
		end
		
		if(!off) begin
			counter = counter + 8'd1;
			if(counter >= quantum + 1) begin
				sigint = 1;
				counter = 0;
			end
			else begin
				sigint = 0;
			end
		end
	end

endmodule