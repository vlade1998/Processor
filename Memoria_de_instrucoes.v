// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module Memoria_de_instrucoes
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
		// Write
		if(pClock) begin
			ram[1] = {6'b001111,5'b11101,21'b000000000000000000000};
ram[2] = {6'b010101,26'b00000000000000000000000100};
ram[3] = {6'b010110,5'b11111,21'b000000000000000000000};
ram[4] = {6'b001110,5'b00001,5'b11101,16'b0000000000000000};
ram[5] = {6'b001111,5'b00010,21'b000000000000000000101};
ram[6] = {6'b001011,5'b00001,5'b00010,16'b0000000000000000};
ram[7] = {6'b010000,5'b00001,5'b11101,16'b0000000000000000};
ram[8] = {6'b001110,5'b00011,5'b11101,16'b0000000000000000};
ram[9] = {6'b001110,5'b00100,5'b11101,16'b0000000000000000};
ram[10] = {6'b001110,5'b00101,5'b11101,16'b0000000000000000};
ram[11] = {6'b000011,5'b00100,5'b00101,16'b0000000000000000};
ram[12] = {6'b001100,5'b00110,21'b000000000000000000000};
ram[13] = {6'b001011,5'b00011,5'b00110,16'b0000000000000000};
ram[14] = {6'b010000,5'b00011,5'b11101,16'b0000000000000000};
ram[15] = {6'b001110,5'b00111,5'b11101,16'b0000000000000000};
ram[16] = {6'b011001,5'b00111,21'b000000000000000000000};
ram[17] = {6'b011011,26'b00000000000000000000000000};


			pClock = 0;
		end
		if (we)
			ram[write_addr] <= data;
	end
	
	always @ (posedge read_clock)
	begin
		// Read 
		q <= ram[read_addr];
	end
	
endmodule
