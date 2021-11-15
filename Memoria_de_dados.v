// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module Memoria_de_dados
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=32)
(
	input [(DATA_WIDTH-1):0] data,
		input [(ADDR_WIDTH-1):0] read_addr, write_addr,
	input we, read_clock, write_clock,
	output reg [(DATA_WIDTH-1):0] q
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[200:0];
	integer pClock = 1;
	
	always @ (posedge write_clock)
	begin
		if(pClock) begin
			ram[1] = {6'b011001,5'b00001,21'b000000000000000000000};
			pClock = 0;
		end
		// Write
		if (we)
			ram[write_addr] <= data;
	end
	
	always @ (posedge read_clock)
	begin
		// Read 
		q <= ram[read_addr];
	end
	
endmodule
