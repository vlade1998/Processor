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
	reg [DATA_WIDTH-1:0] ram[1000:0];
	integer pClock = 1;
	
	always @ (posedge write_clock)
	begin
		// Write
		if(pClock) begin
ram[1] = {6'b001111, 5'b11110, 21'd32};
ram[2] = {6'b000001,5'b11101,5'b11110,16'b0000000000101110};
ram[3] = {6'b010101,26'b00000000000000000101110110};
ram[4] = {6'b010110,5'b11111,21'b000000000000000000000};
ram[5] = {6'b010000,5'b10001,5'b11101,16'b0000000000000000};
ram[6] = {6'b010000,5'b10010,5'b11101,16'b0000000000000001};
ram[7] = {6'b001110,5'b00001,5'b11101,16'b0000000000000000};
ram[8] = {6'b001110,5'b00010,5'b11101,16'b0000000000000001};
ram[9] = {6'b001110,5'b00011,5'b11101,16'b0000000000000000};
ram[10] = {6'b001110,5'b00100,5'b11101,16'b0000000000000001};
ram[11] = {6'b000100,5'b00011,5'b00100,16'b0000000000000000};
ram[12] = {6'b001101,5'b00101,21'b000000000000000000000};
ram[13] = {6'b000011,5'b00010,5'b00101,16'b0000000000000000};
ram[14] = {6'b001100,5'b00110,21'b000000000000000000000};
ram[15] = {6'b000010,5'b00001,5'b00110,5'b00111,11'b00000000000};
ram[16] = {6'b001011,5'b11100,5'b00111,16'b0000000000000000};
ram[17] = {6'b010110,5'b11111,21'b000000000000000000000};
ram[18] = {6'b010000,5'b10001,5'b11101,16'b0000000000000000};
ram[19] = {6'b001110,5'b00001,5'b11101,16'b0000000000000000};
ram[20] = {6'b001111,5'b00010,21'b000000000000000000001};
ram[21] = {6'b011010,5'b00001,5'b00010,5'b00011,11'b00000000000};
ram[22] = {6'b001111,5'b00100,21'b000000000000000000010};
ram[23] = {6'b001011,5'b10010,5'b00100,16'b0000000000000000};
ram[24] = {6'b001011,5'b10001,5'b00011,16'b0000000000000000};
ram[25] = {6'b010000,5'b11111,5'b11101,16'b0000000000000001};
ram[26] = {6'b000001,5'b11101,5'b11101,16'b0000000000000010};
ram[27] = {6'b010111,26'b00000000000000000000000101};
ram[28] = {6'b000001,5'b11101,5'b11101,16'b1111111111111110};
ram[29] = {6'b001110,5'b11111,5'b11101,16'b0000000000000001};
ram[30] = {6'b001011,5'b00101,5'b11100,16'b0000000000000000};
ram[31] = {6'b001011,5'b11100,5'b00101,16'b0000000000000000};
ram[32] = {6'b010110,5'b11111,21'b000000000000000000000};
ram[33] = {6'b010000,5'b10001,5'b11101,16'b0000000000000000};
ram[34] = {6'b001110,5'b00001,5'b11101,16'b0000000000000001};
ram[35] = {6'b001110,5'b00010,5'b11101,16'b0000000000000000};
ram[36] = {6'b001011,5'b10001,5'b00010,16'b0000000000000000};
ram[37] = {6'b010000,5'b11111,5'b11101,16'b0000000000000010};
ram[38] = {6'b010000,5'b00001,5'b11101,16'b0000000000000011};
ram[39] = {6'b000001,5'b11101,5'b11101,16'b0000000000000100};
ram[40] = {6'b010111,26'b00000000000000000000010010};
ram[41] = {6'b000001,5'b11101,5'b11101,16'b1111111111111100};
ram[42] = {6'b001110,5'b00001,5'b11101,16'b0000000000000011};
ram[43] = {6'b001110,5'b11111,5'b11101,16'b0000000000000010};
ram[44] = {6'b001011,5'b00011,5'b11100,16'b0000000000000000};
ram[45] = {6'b001011,5'b00001,5'b00011,16'b0000000000000000};
ram[46] = {6'b010000,5'b00001,5'b11101,16'b0000000000000001};
ram[47] = {6'b001110,5'b00100,5'b11101,16'b0000000000000001};
ram[48] = {6'b011010,5'b00100,5'b11110,5'b00100,11'b00000000000};
ram[49] = {6'b001110,5'b00101,5'b00100,16'b0000000000001110};
ram[50] = {6'b001111,5'b00110,21'b000000000000000000001};
ram[51] = {6'b010001,5'b00101,5'b00110,16'b0000000000010010};
ram[52] = {6'b001110,5'b01000,5'b11101,16'b0000000000000001};
ram[53] = {6'b001110,5'b01001,5'b11101,16'b0000000000000001};
ram[54] = {6'b001011,5'b10001,5'b01001,16'b0000000000000000};
ram[55] = {6'b010000,5'b11111,5'b11101,16'b0000000000000010};
ram[56] = {6'b010000,5'b00101,5'b11101,16'b0000000000000011};
ram[57] = {6'b010000,5'b00110,5'b11101,16'b0000000000000100};
ram[58] = {6'b010000,5'b01000,5'b11101,16'b0000000000000101};
ram[59] = {6'b000001,5'b11101,5'b11101,16'b0000000000000110};
ram[60] = {6'b010111,26'b00000000000000000000010010};
ram[61] = {6'b000001,5'b11101,5'b11101,16'b1111111111111010};
ram[62] = {6'b001110,5'b01000,5'b11101,16'b0000000000000101};
ram[63] = {6'b001110,5'b00110,5'b11101,16'b0000000000000100};
ram[64] = {6'b001110,5'b00101,5'b11101,16'b0000000000000011};
ram[65] = {6'b001110,5'b11111,5'b11101,16'b0000000000000010};
ram[66] = {6'b001011,5'b01010,5'b11100,16'b0000000000000000};
ram[67] = {6'b001011,5'b01000,5'b01010,16'b0000000000000000};
ram[68] = {6'b010000,5'b01000,5'b11101,16'b0000000000000001};
ram[69] = {6'b010101,26'b00000000000000000000101111};
ram[70] = {6'b001110,5'b01011,5'b11101,16'b0000000000000001};
ram[71] = {6'b001011,5'b11100,5'b01011,16'b0000000000000000};
ram[72] = {6'b010110,5'b11111,21'b000000000000000000000};
ram[73] = {6'b010000,5'b10001,5'b11101,16'b0000000000000000};
ram[74] = {6'b001110,5'b00001,5'b11101,16'b0000000000000000};
ram[75] = {6'b011010,5'b00001,5'b11110,5'b00001,11'b00000000000};
ram[76] = {6'b001110,5'b00010,5'b00001,16'b0000000000000110};
ram[77] = {6'b001111,5'b00011,21'b000000000000000000001};
ram[78] = {6'b001011,5'b00010,5'b00011,16'b0000000000000000};
ram[79] = {6'b001110,5'b00100,5'b11101,16'b0000000000000000};
ram[80] = {6'b011010,5'b00100,5'b11110,5'b00100,11'b00000000000};
ram[81] = {6'b010000,5'b00010,5'b00100,16'b0000000000000110};
ram[82] = {6'b001110,5'b00101,5'b11101,16'b0000000000000000};
ram[83] = {6'b011010,5'b00101,5'b11110,5'b00101,11'b00000000000};
ram[84] = {6'b001110,5'b00110,5'b00101,16'b0000000000001110};
ram[85] = {6'b001110,5'b00111,5'b11110,16'b0000000000000001};
ram[86] = {6'b001011,5'b00110,5'b00111,16'b0000000000000000};
ram[87] = {6'b001110,5'b01000,5'b11101,16'b0000000000000000};
ram[88] = {6'b011010,5'b01000,5'b11110,5'b01000,11'b00000000000};
ram[89] = {6'b010000,5'b00110,5'b01000,16'b0000000000001110};
ram[90] = {6'b001110,5'b01001,5'b11110,16'b0000000000000011};
ram[91] = {6'b001110,5'b01010,5'b11101,16'b0000000000000000};
ram[92] = {6'b001110,5'b01011,5'b11110,16'b0000000000000101};
ram[93] = {6'b000011,5'b01010,5'b01011,16'b0000000000000000};
ram[94] = {6'b001100,5'b01100,21'b000000000000000000000};
ram[95] = {6'b011010,5'b01001,5'b01100,5'b01101,11'b00000000000};
ram[96] = {6'b001110,5'b01110,5'b11110,16'b0000000000000100};
ram[97] = {6'b010000,5'b01110,5'b01101,16'b0000000000011011};
ram[98] = {6'b010000,5'b01110,5'b01101,16'b0000000000011110};
ram[99] = {6'b010110,5'b11111,21'b000000000000000000000};
ram[100] = {6'b010000,5'b10001,5'b11101,16'b0000000000000000};
ram[101] = {6'b001110,5'b00001,5'b11101,16'b0000000000000000};
ram[102] = {6'b011010,5'b00001,5'b11110,5'b00001,11'b00000000000};
ram[103] = {6'b001110,5'b00010,5'b00001,16'b0000000000001110};
ram[104] = {6'b001110,5'b00011,5'b11110,16'b0000000000000000};
ram[105] = {6'b001011,5'b00010,5'b00011,16'b0000000000000000};
ram[106] = {6'b001110,5'b00100,5'b11101,16'b0000000000000000};
ram[107] = {6'b011010,5'b00100,5'b11110,5'b00100,11'b00000000000};
ram[108] = {6'b010000,5'b00010,5'b00100,16'b0000000000001110};
ram[109] = {6'b001110,5'b00101,5'b11101,16'b0000000000000001};
ram[110] = {6'b001110,5'b00110,5'b11110,16'b0000000000000011};
ram[111] = {6'b001110,5'b00111,5'b11101,16'b0000000000000000};
ram[112] = {6'b001110,5'b01000,5'b11110,16'b0000000000000101};
ram[113] = {6'b000011,5'b00111,5'b01000,16'b0000000000000000};
ram[114] = {6'b001100,5'b01001,21'b000000000000000000000};
ram[115] = {6'b011010,5'b00110,5'b01001,5'b01010,11'b00000000000};
ram[116] = {6'b001111,5'b01011,21'b000000000000000100000};
ram[117] = {6'b011010,5'b01010,5'b01011,5'b01100,11'b00000000000};
ram[118] = {6'b001011,5'b00101,5'b01100,16'b0000000000000000};
ram[119] = {6'b010000,5'b00101,5'b11101,16'b0000000000000001};
ram[120] = {6'b001111,5'b01101,21'b000000000000000000000};
ram[121] = {6'b011111,26'b00000000000000000000000000};
ram[122] = {6'b010000,5'b00000,5'b01101,16'b0000000000000000};
ram[123] = {6'b010000,5'b00001,5'b01101,16'b0000000000000001};
ram[124] = {6'b010000,5'b00010,5'b01101,16'b0000000000000010};
ram[125] = {6'b010000,5'b00011,5'b01101,16'b0000000000000011};
ram[126] = {6'b010000,5'b00100,5'b01101,16'b0000000000000100};
ram[127] = {6'b010000,5'b00101,5'b01101,16'b0000000000000101};
ram[128] = {6'b010000,5'b00110,5'b01101,16'b0000000000000110};
ram[129] = {6'b010000,5'b00111,5'b01101,16'b0000000000000111};
ram[130] = {6'b010000,5'b01000,5'b01101,16'b0000000000001000};
ram[131] = {6'b010000,5'b01001,5'b01101,16'b0000000000001001};
ram[132] = {6'b010000,5'b01010,5'b01101,16'b0000000000001010};
ram[133] = {6'b010000,5'b01011,5'b01101,16'b0000000000001011};
ram[134] = {6'b010000,5'b01100,5'b01101,16'b0000000000001100};
ram[135] = {6'b010000,5'b01101,5'b01101,16'b0000000000001101};
ram[136] = {6'b010000,5'b01110,5'b01101,16'b0000000000001110};
ram[137] = {6'b010000,5'b01111,5'b01101,16'b0000000000001111};
ram[138] = {6'b010000,5'b10000,5'b01101,16'b0000000000010000};
ram[139] = {6'b010000,5'b10001,5'b01101,16'b0000000000010001};
ram[140] = {6'b010000,5'b10010,5'b01101,16'b0000000000010010};
ram[141] = {6'b010000,5'b10011,5'b01101,16'b0000000000010011};
ram[142] = {6'b010000,5'b10100,5'b01101,16'b0000000000010100};
ram[143] = {6'b010000,5'b10101,5'b01101,16'b0000000000010101};
ram[144] = {6'b010000,5'b10110,5'b01101,16'b0000000000010110};
ram[145] = {6'b010000,5'b10111,5'b01101,16'b0000000000010111};
ram[146] = {6'b010000,5'b11000,5'b01101,16'b0000000000011000};
ram[147] = {6'b010000,5'b11001,5'b01101,16'b0000000000011001};
ram[148] = {6'b010000,5'b11010,5'b01101,16'b0000000000011010};
ram[149] = {6'b010000,5'b11011,5'b01101,16'b0000000000011011};
ram[150] = {6'b010000,5'b11100,5'b01101,16'b0000000000011100};
ram[151] = {6'b010000,5'b11101,5'b01101,16'b0000000000011101};
ram[152] = {6'b010000,5'b11110,5'b01101,16'b0000000000011110};
ram[153] = {6'b010000,5'b11111,5'b01101,16'b0000000000011111};
ram[154] = {6'b001110,5'b01110,5'b11101,16'b0000000000000001};
ram[155] = {6'b001110,5'b01111,5'b11110,16'b0000000000000100};
ram[156] = {6'b001110,5'b10000,5'b11101,16'b0000000000000000};
ram[157] = {6'b011010,5'b10000,5'b11110,5'b10000,11'b00000000000};
ram[158] = {6'b001110,5'b00001,5'b10000,16'b0000000000100110};
ram[159] = {6'b001111,5'b00010,21'b000000000000000000000};
ram[160] = {6'b001111,5'b00101,21'b000000000000000000001};
ram[161] = {6'b010011,5'b00010,5'b00001,5'b00011,11'b00000000000};
ram[162] = {6'b010001,5'b00011,5'b00000,16'b0000000000000110};
ram[163] = {6'b001110,5'b00100,5'b01110,16'b0000000000000000};
ram[164] = {6'b011100,5'b00100,5'b01111,16'b0000000000000000};
ram[165] = {6'b011010,5'b01110,5'b00101,5'b01110,11'b00000000000};
ram[166] = {6'b011010,5'b01111,5'b00101,5'b01111,11'b00000000000};
ram[167] = {6'b011010,5'b00010,5'b00101,5'b00010,11'b00000000000};
ram[168] = {6'b010101,26'b00000000000000000010100001};
ram[169] = {6'b001110,5'b00110,5'b11110,16'b0000000000000011};
ram[170] = {6'b001110,5'b00111,5'b11101,16'b0000000000000000};
ram[171] = {6'b001110,5'b01000,5'b11110,16'b0000000000000101};
ram[172] = {6'b000011,5'b00111,5'b01000,16'b0000000000000000};
ram[173] = {6'b001100,5'b01001,21'b000000000000000000000};
ram[174] = {6'b011010,5'b00110,5'b01001,5'b01010,11'b00000000000};
ram[175] = {6'b001011,5'b11010,5'b01010,16'b0000000000000000};
ram[176] = {6'b001110,5'b00000,5'b11010,16'b0000000000000000};
ram[177] = {6'b001110,5'b00001,5'b11010,16'b0000000000000001};
ram[178] = {6'b001110,5'b00010,5'b11010,16'b0000000000000010};
ram[179] = {6'b001110,5'b00011,5'b11010,16'b0000000000000011};
ram[180] = {6'b001110,5'b00100,5'b11010,16'b0000000000000100};
ram[181] = {6'b001110,5'b00101,5'b11010,16'b0000000000000101};
ram[182] = {6'b001110,5'b00110,5'b11010,16'b0000000000000110};
ram[183] = {6'b001110,5'b00111,5'b11010,16'b0000000000000111};
ram[184] = {6'b001110,5'b01000,5'b11010,16'b0000000000001000};
ram[185] = {6'b001110,5'b01001,5'b11010,16'b0000000000001001};
ram[186] = {6'b001110,5'b01010,5'b11010,16'b0000000000001010};
ram[187] = {6'b001110,5'b01011,5'b11010,16'b0000000000001011};
ram[188] = {6'b001110,5'b01100,5'b11010,16'b0000000000001100};
ram[189] = {6'b001110,5'b01101,5'b11010,16'b0000000000001101};
ram[190] = {6'b001110,5'b01110,5'b11010,16'b0000000000001110};
ram[191] = {6'b001110,5'b01111,5'b11010,16'b0000000000001111};
ram[192] = {6'b001110,5'b10000,5'b11010,16'b0000000000010000};
ram[193] = {6'b001110,5'b10001,5'b11010,16'b0000000000010001};
ram[194] = {6'b001110,5'b10010,5'b11010,16'b0000000000010010};
ram[195] = {6'b001110,5'b10011,5'b11010,16'b0000000000010011};
ram[196] = {6'b001110,5'b10100,5'b11010,16'b0000000000010100};
ram[197] = {6'b001110,5'b10101,5'b11010,16'b0000000000010101};
ram[198] = {6'b001110,5'b10110,5'b11010,16'b0000000000010110};
ram[199] = {6'b001110,5'b10111,5'b11010,16'b0000000000010111};
ram[200] = {6'b001110,5'b11000,5'b11010,16'b0000000000011000};
ram[201] = {6'b001110,5'b11001,5'b11010,16'b0000000000011001};
ram[202] = {6'b001110,5'b11011,5'b11010,16'b0000000000011011};
ram[203] = {6'b001110,5'b11100,5'b11010,16'b0000000000011100};
ram[204] = {6'b001110,5'b11101,5'b11010,16'b0000000000011101};
ram[205] = {6'b001110,5'b11110,5'b11010,16'b0000000000011110};
ram[206] = {6'b001110,5'b11111,5'b11010,16'b0000000000011111};
ram[207] = {6'b011110,26'b00000000000000000000000000};
ram[208] = {6'b010110,5'b11011,21'b000000000000000000000};
ram[209] = {6'b001111,5'b01011,21'b000000000000000000001};
ram[210] = {6'b001111,5'b01100,21'b000000000000000000000};
ram[211] = {6'b010001,5'b01011,5'b01100,16'b0000000000000001};
ram[212] = {6'b010101,26'b00000000000000000100011111};
ram[213] = {6'b011111,26'b00000000000000000000000000};
ram[214] = {6'b010000,5'b00000,5'b11010,16'b0000000000000000};
ram[215] = {6'b010000,5'b00001,5'b11010,16'b0000000000000001};
ram[216] = {6'b010000,5'b00010,5'b11010,16'b0000000000000010};
ram[217] = {6'b010000,5'b00011,5'b11010,16'b0000000000000011};
ram[218] = {6'b010000,5'b00100,5'b11010,16'b0000000000000100};
ram[219] = {6'b010000,5'b00101,5'b11010,16'b0000000000000101};
ram[220] = {6'b010000,5'b00110,5'b11010,16'b0000000000000110};
ram[221] = {6'b010000,5'b00111,5'b11010,16'b0000000000000111};
ram[222] = {6'b010000,5'b01000,5'b11010,16'b0000000000001000};
ram[223] = {6'b010000,5'b01001,5'b11010,16'b0000000000001001};
ram[224] = {6'b010000,5'b01010,5'b11010,16'b0000000000001010};
ram[225] = {6'b010000,5'b01011,5'b11010,16'b0000000000001011};
ram[226] = {6'b010000,5'b01100,5'b11010,16'b0000000000001100};
ram[227] = {6'b010000,5'b01101,5'b11010,16'b0000000000001101};
ram[228] = {6'b010000,5'b01110,5'b11010,16'b0000000000001110};
ram[229] = {6'b010000,5'b01111,5'b11010,16'b0000000000001111};
ram[230] = {6'b010000,5'b10000,5'b11010,16'b0000000000010000};
ram[231] = {6'b010000,5'b10001,5'b11010,16'b0000000000010001};
ram[232] = {6'b010000,5'b10010,5'b11010,16'b0000000000010010};
ram[233] = {6'b010000,5'b10011,5'b11010,16'b0000000000010011};
ram[234] = {6'b010000,5'b10100,5'b11010,16'b0000000000010100};
ram[235] = {6'b010000,5'b10101,5'b11010,16'b0000000000010101};
ram[236] = {6'b010000,5'b10110,5'b11010,16'b0000000000010110};
ram[237] = {6'b010000,5'b10111,5'b11010,16'b0000000000010111};
ram[238] = {6'b010000,5'b11000,5'b11010,16'b0000000000011000};
ram[239] = {6'b010000,5'b11001,5'b11010,16'b0000000000011001};
ram[240] = {6'b010000,5'b11010,5'b11010,16'b0000000000011010};
ram[241] = {6'b010000,5'b11011,5'b11010,16'b0000000000011011};
ram[242] = {6'b010000,5'b11100,5'b11010,16'b0000000000011100};
ram[243] = {6'b010000,5'b11101,5'b11010,16'b0000000000011101};
ram[244] = {6'b010000,5'b11110,5'b11010,16'b0000000000011110};
ram[245] = {6'b010000,5'b11111,5'b11010,16'b0000000000011111};
ram[246] = {6'b001111,5'b01110,21'b000000000000000000000};
ram[247] = {6'b001011,5'b11010,5'b01110,16'b0000000000000000};
ram[248] = {6'b001110,5'b00000,5'b11010,16'b0000000000000000};
ram[249] = {6'b001110,5'b00001,5'b11010,16'b0000000000000001};
ram[250] = {6'b001110,5'b00010,5'b11010,16'b0000000000000010};
ram[251] = {6'b001110,5'b00011,5'b11010,16'b0000000000000011};
ram[252] = {6'b001110,5'b00100,5'b11010,16'b0000000000000100};
ram[253] = {6'b001110,5'b00101,5'b11010,16'b0000000000000101};
ram[254] = {6'b001110,5'b00110,5'b11010,16'b0000000000000110};
ram[255] = {6'b001110,5'b00111,5'b11010,16'b0000000000000111};
ram[256] = {6'b001110,5'b01000,5'b11010,16'b0000000000001000};
ram[257] = {6'b001110,5'b01001,5'b11010,16'b0000000000001001};
ram[258] = {6'b001110,5'b01010,5'b11010,16'b0000000000001010};
ram[259] = {6'b001110,5'b01011,5'b11010,16'b0000000000001011};
ram[260] = {6'b001110,5'b01100,5'b11010,16'b0000000000001100};
ram[261] = {6'b001110,5'b01101,5'b11010,16'b0000000000001101};
ram[262] = {6'b001110,5'b01110,5'b11010,16'b0000000000001110};
ram[263] = {6'b001110,5'b01111,5'b11010,16'b0000000000001111};
ram[264] = {6'b001110,5'b10000,5'b11010,16'b0000000000010000};
ram[265] = {6'b001110,5'b10001,5'b11010,16'b0000000000010001};
ram[266] = {6'b001110,5'b10010,5'b11010,16'b0000000000010010};
ram[267] = {6'b001110,5'b10011,5'b11010,16'b0000000000010011};
ram[268] = {6'b001110,5'b10100,5'b11010,16'b0000000000010100};
ram[269] = {6'b001110,5'b10101,5'b11010,16'b0000000000010101};
ram[270] = {6'b001110,5'b10110,5'b11010,16'b0000000000010110};
ram[271] = {6'b001110,5'b10111,5'b11010,16'b0000000000010111};
ram[272] = {6'b001110,5'b11000,5'b11010,16'b0000000000011000};
ram[273] = {6'b001110,5'b11001,5'b11010,16'b0000000000011001};
ram[274] = {6'b001110,5'b11011,5'b11010,16'b0000000000011011};
ram[275] = {6'b001110,5'b11100,5'b11010,16'b0000000000011100};
ram[276] = {6'b001110,5'b11101,5'b11010,16'b0000000000011101};
ram[277] = {6'b001110,5'b11110,5'b11010,16'b0000000000011110};
ram[278] = {6'b001110,5'b11111,5'b11010,16'b0000000000011111};
ram[279] = {6'b001110,5'b01111,5'b11101,16'b0000000000000000};
ram[280] = {6'b011010,5'b01111,5'b11110,5'b01111,11'b00000000000};
ram[281] = {6'b001110,5'b10000,5'b01111,16'b0000000000001110};
ram[282] = {6'b001110,5'b00001,5'b11110,16'b0000000000000001};
ram[283] = {6'b001011,5'b10000,5'b00001,16'b0000000000000000};
ram[284] = {6'b001110,5'b00010,5'b11101,16'b0000000000000000};
ram[285] = {6'b011010,5'b00010,5'b11110,5'b00010,11'b00000000000};
ram[286] = {6'b010000,5'b10000,5'b00010,16'b0000000000001110};
ram[287] = {6'b001111,5'b00011,21'b000000000000000000001};
ram[288] = {6'b001111,5'b00100,21'b000000000000000000000};
ram[289] = {6'b010001,5'b00011,5'b00100,16'b0000000000000001};
ram[290] = {6'b010101,26'b00000000000000000101110101};
ram[291] = {6'b011111,26'b00000000000000000000000000};
ram[292] = {6'b010000,5'b00000,5'b11010,16'b0000000000000000};
ram[293] = {6'b010000,5'b00001,5'b11010,16'b0000000000000001};
ram[294] = {6'b010000,5'b00010,5'b11010,16'b0000000000000010};
ram[295] = {6'b010000,5'b00011,5'b11010,16'b0000000000000011};
ram[296] = {6'b010000,5'b00100,5'b11010,16'b0000000000000100};
ram[297] = {6'b010000,5'b00101,5'b11010,16'b0000000000000101};
ram[298] = {6'b010000,5'b00110,5'b11010,16'b0000000000000110};
ram[299] = {6'b010000,5'b00111,5'b11010,16'b0000000000000111};
ram[300] = {6'b010000,5'b01000,5'b11010,16'b0000000000001000};
ram[301] = {6'b010000,5'b01001,5'b11010,16'b0000000000001001};
ram[302] = {6'b010000,5'b01010,5'b11010,16'b0000000000001010};
ram[303] = {6'b010000,5'b01011,5'b11010,16'b0000000000001011};
ram[304] = {6'b010000,5'b01100,5'b11010,16'b0000000000001100};
ram[305] = {6'b010000,5'b01101,5'b11010,16'b0000000000001101};
ram[306] = {6'b010000,5'b01110,5'b11010,16'b0000000000001110};
ram[307] = {6'b010000,5'b01111,5'b11010,16'b0000000000001111};
ram[308] = {6'b010000,5'b10000,5'b11010,16'b0000000000010000};
ram[309] = {6'b010000,5'b10001,5'b11010,16'b0000000000010001};
ram[310] = {6'b010000,5'b10010,5'b11010,16'b0000000000010010};
ram[311] = {6'b010000,5'b10011,5'b11010,16'b0000000000010011};
ram[312] = {6'b010000,5'b10100,5'b11010,16'b0000000000010100};
ram[313] = {6'b010000,5'b10101,5'b11010,16'b0000000000010101};
ram[314] = {6'b010000,5'b10110,5'b11010,16'b0000000000010110};
ram[315] = {6'b010000,5'b10111,5'b11010,16'b0000000000010111};
ram[316] = {6'b010000,5'b11000,5'b11010,16'b0000000000011000};
ram[317] = {6'b010000,5'b11001,5'b11010,16'b0000000000011001};
ram[318] = {6'b010000,5'b11010,5'b11010,16'b0000000000011010};
ram[319] = {6'b010000,5'b11011,5'b11010,16'b0000000000011011};
ram[320] = {6'b010000,5'b11100,5'b11010,16'b0000000000011100};
ram[321] = {6'b010000,5'b11101,5'b11010,16'b0000000000011101};
ram[322] = {6'b010000,5'b11110,5'b11010,16'b0000000000011110};
ram[323] = {6'b010000,5'b11111,5'b11010,16'b0000000000011111};
ram[324] = {6'b001111,5'b00110,21'b000000000000000000000};
ram[325] = {6'b001011,5'b11010,5'b00110,16'b0000000000000000};
ram[326] = {6'b001110,5'b00000,5'b11010,16'b0000000000000000};
ram[327] = {6'b001110,5'b00001,5'b11010,16'b0000000000000001};
ram[328] = {6'b001110,5'b00010,5'b11010,16'b0000000000000010};
ram[329] = {6'b001110,5'b00011,5'b11010,16'b0000000000000011};
ram[330] = {6'b001110,5'b00100,5'b11010,16'b0000000000000100};
ram[331] = {6'b001110,5'b00101,5'b11010,16'b0000000000000101};
ram[332] = {6'b001110,5'b00110,5'b11010,16'b0000000000000110};
ram[333] = {6'b001110,5'b00111,5'b11010,16'b0000000000000111};
ram[334] = {6'b001110,5'b01000,5'b11010,16'b0000000000001000};
ram[335] = {6'b001110,5'b01001,5'b11010,16'b0000000000001001};
ram[336] = {6'b001110,5'b01010,5'b11010,16'b0000000000001010};
ram[337] = {6'b001110,5'b01011,5'b11010,16'b0000000000001011};
ram[338] = {6'b001110,5'b01100,5'b11010,16'b0000000000001100};
ram[339] = {6'b001110,5'b01101,5'b11010,16'b0000000000001101};
ram[340] = {6'b001110,5'b01110,5'b11010,16'b0000000000001110};
ram[341] = {6'b001110,5'b01111,5'b11010,16'b0000000000001111};
ram[342] = {6'b001110,5'b10000,5'b11010,16'b0000000000010000};
ram[343] = {6'b001110,5'b10001,5'b11010,16'b0000000000010001};
ram[344] = {6'b001110,5'b10010,5'b11010,16'b0000000000010010};
ram[345] = {6'b001110,5'b10011,5'b11010,16'b0000000000010011};
ram[346] = {6'b001110,5'b10100,5'b11010,16'b0000000000010100};
ram[347] = {6'b001110,5'b10101,5'b11010,16'b0000000000010101};
ram[348] = {6'b001110,5'b10110,5'b11010,16'b0000000000010110};
ram[349] = {6'b001110,5'b10111,5'b11010,16'b0000000000010111};
ram[350] = {6'b001110,5'b11000,5'b11010,16'b0000000000011000};
ram[351] = {6'b001110,5'b11001,5'b11010,16'b0000000000011001};
ram[352] = {6'b001110,5'b11011,5'b11010,16'b0000000000011011};
ram[353] = {6'b001110,5'b11100,5'b11010,16'b0000000000011100};
ram[354] = {6'b001110,5'b11101,5'b11010,16'b0000000000011101};
ram[355] = {6'b001110,5'b11110,5'b11010,16'b0000000000011110};
ram[356] = {6'b001110,5'b11111,5'b11010,16'b0000000000011111};
ram[357] = {6'b001110,5'b00111,5'b11101,16'b0000000000000000};
ram[358] = {6'b011010,5'b00111,5'b11110,5'b00111,11'b00000000000};
ram[359] = {6'b001110,5'b01000,5'b00111,16'b0000000000001110};
ram[360] = {6'b001111,5'b01001,21'b000000000000000000000};
ram[361] = {6'b001011,5'b01000,5'b01001,16'b0000000000000000};
ram[362] = {6'b001110,5'b01010,5'b11101,16'b0000000000000000};
ram[363] = {6'b011010,5'b01010,5'b11110,5'b01010,11'b00000000000};
ram[364] = {6'b010000,5'b01000,5'b01010,16'b0000000000001110};
ram[365] = {6'b001110,5'b01011,5'b11101,16'b0000000000000000};
ram[366] = {6'b011010,5'b01011,5'b11110,5'b01011,11'b00000000000};
ram[367] = {6'b001110,5'b01100,5'b01011,16'b0000000000000110};
ram[368] = {6'b001111,5'b01101,21'b000000000000000000000};
ram[369] = {6'b001011,5'b01100,5'b01101,16'b0000000000000000};
ram[370] = {6'b001110,5'b01110,5'b11101,16'b0000000000000000};
ram[371] = {6'b011010,5'b01110,5'b11110,5'b01110,11'b00000000000};
ram[372] = {6'b010000,5'b01100,5'b01110,16'b0000000000000110};
ram[373] = {6'b010110,5'b11111,21'b000000000000000000000};
ram[374] = {6'b001110,5'b00001,5'b11110,16'b0000000000000000};
ram[375] = {6'b001111,5'b00010,21'b000000000000000000000};
ram[376] = {6'b001011,5'b00001,5'b00010,16'b0000000000000000};
ram[377] = {6'b010000,5'b00001,5'b11110,16'b0000000000000000};
ram[378] = {6'b001110,5'b00011,5'b11110,16'b0000000000000001};
ram[379] = {6'b001111,5'b00100,21'b000000000000000000001};
ram[380] = {6'b001011,5'b00011,5'b00100,16'b0000000000000000};
ram[381] = {6'b010000,5'b00011,5'b11110,16'b0000000000000001};
ram[382] = {6'b001110,5'b00101,5'b11110,16'b0000000000000010};
ram[383] = {6'b001111,5'b00110,21'b000000000000000000010};
ram[384] = {6'b001011,5'b00101,5'b00110,16'b0000000000000000};
ram[385] = {6'b010000,5'b00101,5'b11110,16'b0000000000000010};
ram[386] = {6'b001110,5'b00111,5'b11110,16'b0000000000000011};
ram[387] = {6'b001111,5'b01000,21'b000000000000001100100};
ram[388] = {6'b001011,5'b00111,5'b01000,16'b0000000000000000};
ram[389] = {6'b010000,5'b00111,5'b11110,16'b0000000000000011};
ram[390] = {6'b001110,5'b01001,5'b11110,16'b0000000000000101};
ram[391] = {6'b001111,5'b01010,21'b000000000000001100100};
ram[392] = {6'b001011,5'b01001,5'b01010,16'b0000000000000000};
ram[393] = {6'b010000,5'b01001,5'b11110,16'b0000000000000101};
ram[394] = {6'b001110,5'b01011,5'b11110,16'b0000000000000100};
ram[395] = {6'b001111,5'b01100,21'b000000000000111110100};
ram[396] = {6'b001011,5'b01011,5'b01100,16'b0000000000000000};
ram[397] = {6'b010000,5'b01011,5'b11110,16'b0000000000000100};
ram[398] = {6'b001110,5'b01101,5'b11101,16'b0000000000000000};
ram[399] = {6'b001111,5'b01110,21'b000000000000000000111};
ram[400] = {6'b001011,5'b01101,5'b01110,16'b0000000000000000};
ram[401] = {6'b010000,5'b01101,5'b11101,16'b0000000000000000};
ram[402] = {6'b001111,5'b01111,21'b000000000000000000000};
ram[403] = {6'b001011,5'b10001,5'b01111,16'b0000000000000000};
ram[404] = {6'b010000,5'b11111,5'b11101,16'b0000000000000001};
ram[405] = {6'b000001,5'b11101,5'b11101,16'b0000000000000010};
ram[406] = {6'b010111,26'b00000000000000000001001001};
ram[407] = {6'b000001,5'b11101,5'b11101,16'b1111111111111110};
ram[408] = {6'b001110,5'b11111,5'b11101,16'b0000000000000001};
ram[409] = {6'b001011,5'b10000,5'b11100,16'b0000000000000000};
ram[410] = {6'b001111,5'b00001,21'b000000000000000000001};
ram[411] = {6'b001011,5'b10001,5'b00001,16'b0000000000000000};
ram[412] = {6'b010000,5'b11111,5'b11101,16'b0000000000000001};
ram[413] = {6'b010000,5'b10000,5'b11101,16'b0000000000000010};
ram[414] = {6'b000001,5'b11101,5'b11101,16'b0000000000000011};
ram[415] = {6'b010111,26'b00000000000000000001001001};
ram[416] = {6'b000001,5'b11101,5'b11101,16'b1111111111111101};
ram[417] = {6'b001110,5'b10000,5'b11101,16'b0000000000000010};
ram[418] = {6'b001110,5'b11111,5'b11101,16'b0000000000000001};
ram[419] = {6'b001011,5'b00010,5'b11100,16'b0000000000000000};
ram[420] = {6'b001111,5'b00011,21'b000000000000000000000};
ram[421] = {6'b011010,5'b00011,5'b11110,5'b00011,11'b00000000000};
ram[422] = {6'b001110,5'b00100,5'b00011,16'b0000000000100110};
ram[423] = {6'b001111,5'b00101,21'b000000000000000000100};
ram[424] = {6'b001011,5'b00100,5'b00101,16'b0000000000000000};
ram[425] = {6'b001111,5'b00110,21'b000000000000000000000};
ram[426] = {6'b011010,5'b00110,5'b11110,5'b00110,11'b00000000000};
ram[427] = {6'b010000,5'b00100,5'b00110,16'b0000000000100110};
ram[428] = {6'b001111,5'b00111,21'b000000000000000000001};
ram[429] = {6'b011010,5'b00111,5'b11110,5'b00111,11'b00000000000};
ram[430] = {6'b001110,5'b01000,5'b00111,16'b0000000000100110};
ram[431] = {6'b001111,5'b01001,21'b000000000000000000100};
ram[432] = {6'b001011,5'b01000,5'b01001,16'b0000000000000000};
ram[433] = {6'b001111,5'b01010,21'b000000000000000000001};
ram[434] = {6'b011010,5'b01010,5'b11110,5'b01010,11'b00000000000};
ram[435] = {6'b010000,5'b01000,5'b01010,16'b0000000000100110};
ram[436] = {6'b001111,5'b01011,21'b000000000000000000001};
ram[437] = {6'b001111,5'b01100,21'b000000000000000000001};
ram[438] = {6'b010010,5'b01011,5'b01100,16'b0000000000011100};
ram[439] = {6'b001110,5'b01110,5'b11101,16'b0000000000000000};
ram[440] = {6'b001110,5'b01111,5'b11101,16'b0000000000000000};
ram[441] = {6'b001011,5'b10001,5'b01111,16'b0000000000000000};
ram[442] = {6'b010000,5'b11111,5'b11101,16'b0000000000000001};
ram[443] = {6'b010000,5'b10000,5'b11101,16'b0000000000000010};
ram[444] = {6'b010000,5'b00010,5'b11101,16'b0000000000000011};
ram[445] = {6'b010000,5'b01110,5'b11101,16'b0000000000000100};
ram[446] = {6'b000001,5'b11101,5'b11101,16'b0000000000000101};
ram[447] = {6'b010111,26'b00000000000000000000100001};
ram[448] = {6'b000001,5'b11101,5'b11101,16'b1111111111111011};
ram[449] = {6'b001110,5'b01110,5'b11101,16'b0000000000000100};
ram[450] = {6'b001110,5'b00010,5'b11101,16'b0000000000000011};
ram[451] = {6'b001110,5'b10000,5'b11101,16'b0000000000000010};
ram[452] = {6'b001110,5'b11111,5'b11101,16'b0000000000000001};
ram[453] = {6'b001011,5'b10000,5'b11100,16'b0000000000000000};
ram[454] = {6'b001011,5'b01110,5'b10000,16'b0000000000000000};
ram[455] = {6'b010000,5'b01110,5'b11101,16'b0000000000000000};
ram[456] = {6'b001110,5'b00001,5'b11101,16'b0000000000000000};
ram[457] = {6'b001011,5'b10001,5'b00001,16'b0000000000000000};
ram[458] = {6'b010000,5'b11111,5'b11101,16'b0000000000000001};
ram[459] = {6'b010000,5'b00010,5'b11101,16'b0000000000000010};
ram[460] = {6'b000001,5'b11101,5'b11101,16'b0000000000000011};
ram[461] = {6'b010111,26'b00000000000000000001100100};
ram[462] = {6'b000001,5'b11101,5'b11101,16'b1111111111111101};
ram[463] = {6'b001110,5'b00010,5'b11101,16'b0000000000000010};
ram[464] = {6'b001110,5'b11111,5'b11101,16'b0000000000000001};
ram[465] = {6'b001011,5'b00010,5'b11100,16'b0000000000000000};
ram[466] = {6'b010101,26'b00000000000000000110110100};
ram[467] = {6'b011011,26'b00000000000000000000000000};



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
