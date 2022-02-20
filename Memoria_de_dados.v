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
	reg [DATA_WIDTH-1:0] ram[500:0];
	integer pClock = 1;
	
	always @ (posedge write_clock)
	begin
		if(pClock) begin
			ram[132] = {6'b001111, 5'd1, 21'd5}; // loadi $1, 5 
ram[133] = {6'b000001, 5'd1, 5'd1, 16'd1}; // addim $1, $1, 1
ram[134] = {6'b011001, 5'd1, 21'd0}; // out $1, 0
ram[135] = {6'b010101, 26'd291}; //jump 1
ram[232] = {6'b001111, 5'd1, 21'd8}; // loadi $1, 5 
ram[233] = {6'b000001, 5'd1, 5'd1, 16'd1}; // addim $1, $1, 1
ram[234] = {6'b011001, 5'd1, 21'd0}; // out $1, 0
ram[235] = {6'b010101, 26'd501}; //jump 1
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
