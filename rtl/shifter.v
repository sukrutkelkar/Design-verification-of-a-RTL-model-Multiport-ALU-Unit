// Library:  calc2
// Module:  32-bit shifter
// Author:  Naseer SIddique

module shifter ( bin_ovfl, shift_out, scan_out, shift_cmd, shift_places, shift_val, reset, scan_in, a_clk, b_clk, c_clk);

   output bin_ovfl, scan_out;
   output [0:63] shift_out;
   
   input [0:3] 	 shift_cmd;
   input [0:63]  shift_places, shift_val;
   input 	 reset, scan_in, a_clk, b_clk, c_clk;
   
   reg [0:4] 	 pos;
   
   wire [0:63] 	 shiftleft, shiftright;

//   wire [0:63] 	 tempshiftl;
   reg [0:63] 	 tempshiftl;
   
   reg [0:31] 	 tempshift_gate;
//   wire [0:31] 	 tempshift_gate;
   
   wire 	 bin_ovfl;
   wire [0:63] 	 shift_out;
   
   always 
     @  (shift_places) begin
	pos[0:4] <= shift_places[59:63];
     end
   

   always
     @ (shift_val) begin
	tempshiftl[0:31] <= shift_val[32:63];
	tempshiftl[32:63] <= 32'b0;
     end
   
   
   always
     @ (negedge c_clk) begin
	tempshift_gate[0:15] <= 
			       (reset) ? { 16{1'b1} } :
			       tempshift_gate[0:15];
	
	tempshift_gate[16:31] <= 
				(reset) ? {1'b0, {15{1'b1}} } :
				tempshift_gate[16:31];
     end
   
   
   
   assign shiftleft[0] =  
			  ( pos[0:4] == 5'b00000 ) ? tempshiftl[0] :
   			  ( pos[0:4] == 5'b00001 ) ? tempshiftl[0+1]:
			  ( pos[0:4] == 5'b00010 ) ? tempshiftl[0+2]:     
			  ( pos[0:4] == 5'b00011 ) ? tempshiftl[0+3]:
			  ( pos[0:4] == 5'b00100 ) ? tempshiftl[0+4]:
			  ( pos[0:4] == 5'b00101 ) ? tempshiftl[0+5]:
			  ( pos[0:4] == 5'b00110 ) ? tempshiftl[0+6]:
			  ( pos[0:4] == 5'b00111 ) ? tempshiftl[0+7]:
			  ( pos[0:4] == 5'b01000 ) ? tempshiftl[0+8] :
			  ( pos[0:4] == 5'b01001 ) ? tempshiftl[0+9] :
			  ( pos[0:4] == 5'b01010 ) ? tempshiftl[0+10] :
			  ( pos[0:4] == 5'b01011 ) ? tempshiftl[0+11] :
			  ( pos[0:4] == 5'b01100 ) ? tempshiftl[0+12] :
			  ( pos[0:4] == 5'b01101 ) ? tempshiftl[0+13] :
			  ( pos[0:4] == 5'b01110 ) ? tempshiftl[0+14] :
			  ( pos[0:4] == 5'b01111 ) ? tempshiftl[0+15] :
			  ( pos[0:4] == 5'b10000 ) ? tempshiftl[0+16] :
			  ( pos[0:4] == 5'b10001 ) ? tempshiftl[0+17] :
			  ( pos[0:4] == 5'b10010 ) ? tempshiftl[0+18] :   
			  ( pos[0:4] == 5'b10011 ) ? tempshiftl[0+19] :
			  ( pos[0:4] == 5'b10100 ) ? tempshiftl[0+20] :
			  ( pos[0:4] == 5'b10101 ) ? tempshiftl[0+21] :
			  ( pos[0:4] == 5'b10110 ) ? tempshiftl[0+22] :
			  ( pos[0:4] == 5'b10111 ) ? tempshiftl[0+23] :
			  ( pos[0:4] == 5'b11000 ) ? tempshiftl[0+24] :
			  ( pos[0:4] == 5'b11001 ) ? tempshiftl[0+25] :
			  ( pos[0:4] == 5'b11010 ) ? tempshiftl[0+26] :
			  ( pos[0:4] == 5'b11011 ) ? tempshiftl[0+27] :
			  ( pos[0:4] == 5'b11100 ) ? tempshiftl[0+28] :
			  ( pos[0:4] == 5'b11101 ) ? tempshiftl[0+29] :
			  ( pos[0:4] == 5'b11110 ) ? tempshiftl[0+30] :
			  ( pos[0:4] == 5'b11111 ) ? tempshiftl[0+31] :
			  0;
   
   assign shiftleft[1] = 
	  ( pos[0:4] == 5'b00000) ? tempshiftl[1] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[1+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[1+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[1+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[1+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[1+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[1+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[1+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[1+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[1+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[1+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[1+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[1+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[1+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[1+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[1+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[1+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[1+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[1+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[1+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[1+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[1+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[1+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[1+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[1+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[1+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[1+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[1+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[1+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[1+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[1+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[1+31] :
	  0;
   
   assign shiftleft[2] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[2] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[2+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[2+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[2+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[2+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[2+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[2+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[2+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[2+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[2+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[2+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[2+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[2+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[2+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[2+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[2+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[2+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[2+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[2+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[2+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[2+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[2+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[2+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[2+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[2+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[2+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[2+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[2+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[2+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[2+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[2+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[2+31] :
	  0;

   assign shiftleft[3] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[3] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[3+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[3+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[3+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[3+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[3+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[3+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[3+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[3+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[3+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[3+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[3+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[3+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[3+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[3+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[3+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[3+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[3+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[3+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[3+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[3+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[3+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[3+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[3+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[3+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[3+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[3+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[3+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[3+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[3+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[3+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[3+31] :
	  0;
   
   assign shiftleft[4] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[4] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[4+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[4+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[4+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[4+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[4+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[4+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[4+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[4+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[4+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[4+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[4+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[4+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[4+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[4+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[4+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[4+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[4+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[4+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[4+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[4+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[4+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[4+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[4+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[4+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[4+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[4+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[4+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[4+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[4+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[4+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[4+31] :
	  0;

   assign shiftleft[5] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[5] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[5+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[5+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[5+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[5+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[5+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[5+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[5+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[5+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[5+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[5+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[5+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[5+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[5+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[5+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[5+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[5+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[5+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[5+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[5+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[5+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[5+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[5+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[5+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[5+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[5+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[5+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[5+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[5+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[5+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[5+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[5+31] :
	  0;

   assign shiftleft[6] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[6] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[6+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[6+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[6+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[6+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[6+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[6+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[6+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[6+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[6+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[6+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[6+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[6+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[6+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[6+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[6+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[6+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[6+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[6+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[6+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[6+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[6+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[6+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[6+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[6+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[6+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[6+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[6+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[6+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[6+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[6+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[6+31] :
	  0;

   assign shiftleft[7] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[7] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[7+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[7+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[7+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[7+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[7+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[7+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[7+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[7+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[7+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[7+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[7+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[7+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[7+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[7+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[7+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[7+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[7+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[7+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[7+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[7+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[7+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[7+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[7+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[7+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[7+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[7+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[7+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[7+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[7+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[7+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[7+31] :
	  0;

   assign shiftleft[8] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[8] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[8+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[8+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[8+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[8+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[8+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[8+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[8+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[8+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[8+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[8+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[8+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[8+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[8+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[8+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[8+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[8+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[8+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[8+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[8+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[8+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[8+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[8+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[8+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[8+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[8+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[8+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[8+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[8+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[8+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[8+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[8+31] :
	  0;

   assign shiftleft[9] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[9] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[9+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[9+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[9+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[9+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[9+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[9+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[9+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[9+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[9+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[9+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[9+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[9+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[9+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[9+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[9+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[9+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[9+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[9+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[9+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[9+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[9+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[9+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[9+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[9+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[9+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[9+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[9+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[9+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[9+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[9+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[9+31] :
	  0;

   assign shiftleft[10] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[10] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[10+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[10+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[10+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[10+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[10+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[10+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[10+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[10+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[10+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[10+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[10+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[10+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[10+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[10+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[10+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[10+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[10+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[10+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[10+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[10+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[10+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[10+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[10+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[10+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[10+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[10+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[10+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[10+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[10+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[10+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[10+31] :
	  0;

   assign shiftleft[11] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[11] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[11+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[11+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[11+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[11+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[11+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[11+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[11+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[11+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[11+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[11+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[11+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[11+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[11+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[11+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[11+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[11+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[11+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[11+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[11+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[11+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[11+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[11+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[11+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[11+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[11+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[11+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[11+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[11+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[11+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[11+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[11+31] :
	  0;

   assign shiftleft[12] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[12] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[12+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[12+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[12+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[12+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[12+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[12+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[12+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[12+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[12+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[12+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[12+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[12+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[12+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[12+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[12+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[12+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[12+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[12+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[12+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[12+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[12+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[12+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[12+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[12+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[12+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[12+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[12+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[12+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[12+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[12+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[12+31] :
	  0;

   assign shiftleft[13] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[13] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[13+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[13+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[13+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[13+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[13+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[13+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[13+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[13+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[13+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[13+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[13+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[13+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[13+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[13+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[13+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[13+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[13+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[13+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[13+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[13+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[13+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[13+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[13+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[13+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[13+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[13+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[13+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[13+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[13+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[13+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[13+31] :
	  0;

   assign shiftleft[14] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[14] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[14+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[14+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[14+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[14+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[14+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[14+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[14+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[14+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[14+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[14+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[14+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[14+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[14+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[14+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[14+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[14+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[14+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[14+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[14+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[14+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[14+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[14+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[14+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[14+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[14+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[14+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[14+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[14+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[14+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[14+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[14+31] :
	  0;

   assign shiftleft[15] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[15] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[15+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[15+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[15+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[15+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[15+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[15+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[15+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[15+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[15+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[15+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[15+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[15+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[15+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[15+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[15+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[15+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[15+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[15+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[15+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[15+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[15+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[15+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[15+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[15+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[15+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[15+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[15+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[15+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[15+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[15+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[15+31] :
	  0;

   assign shiftleft[16] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[16] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[16+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[16+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[16+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[16+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[16+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[16+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[16+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[16+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[16+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[16+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[16+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[16+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[16+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[16+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[16+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[16+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[16+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[16+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[16+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[16+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[16+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[16+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[16+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[16+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[16+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[16+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[16+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[16+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[16+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[16+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[16+31] :
	  0;

   assign shiftleft[17] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[17] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[17+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[17+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[17+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[17+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[17+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[17+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[17+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[17+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[17+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[17+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[17+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[17+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[17+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[17+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[17+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[17+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[17+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[17+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[17+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[17+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[17+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[17+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[17+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[17+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[17+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[17+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[17+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[17+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[17+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[17+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[17+31] :
	  0;

   assign shiftleft[18] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[18] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[18+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[18+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[18+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[18+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[18+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[18+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[18+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[18+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[18+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[18+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[18+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[18+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[18+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[18+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[18+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[18+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[18+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[18+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[18+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[18+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[18+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[18+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[18+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[18+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[18+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[18+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[18+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[18+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[18+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[18+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[18+31] :
	  0;

   assign shiftleft[19] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[19] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[19+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[19+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[19+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[19+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[19+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[19+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[19+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[19+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[19+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[19+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[19+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[19+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[19+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[19+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[19+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[19+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[19+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[19+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[19+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[19+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[19+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[19+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[19+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[19+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[19+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[19+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[19+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[19+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[19+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[19+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[19+31] :
	  0;

   assign shiftleft[20] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[20] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[20+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[20+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[20+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[20+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[20+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[20+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[20+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[20+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[20+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[20+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[20+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[20+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[20+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[20+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[20+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[20+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[20+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[20+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[20+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[20+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[20+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[20+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[20+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[20+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[20+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[20+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[20+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[20+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[20+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[20+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[20+31] :
	  0;

   assign shiftleft[21] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[21] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[21+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[21+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[21+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[21+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[21+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[21+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[21+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[21+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[21+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[21+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[21+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[21+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[21+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[21+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[21+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[21+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[21+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[21+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[21+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[21+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[21+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[21+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[21+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[21+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[21+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[21+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[21+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[21+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[21+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[21+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[21+31] :
	  0;

   assign shiftleft[22] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[22] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[22+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[22+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[22+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[22+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[22+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[22+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[22+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[22+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[22+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[22+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[22+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[22+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[22+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[22+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[22+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[22+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[22+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[22+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[22+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[22+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[22+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[22+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[22+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[22+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[22+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[22+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[22+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[22+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[22+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[22+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[22+31] :
	  0;

   assign shiftleft[23] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[23] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[23+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[23+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[23+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[23+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[23+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[23+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[23+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[23+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[23+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[23+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[23+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[23+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[23+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[23+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[23+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[23+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[23+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[23+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[23+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[23+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[23+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[23+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[23+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[23+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[23+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[23+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[23+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[23+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[23+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[23+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[23+31] :
	  0;

   assign shiftleft[24] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[24] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[24+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[24+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[24+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[24+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[24+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[24+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[24+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[24+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[24+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[24+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[24+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[24+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[24+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[24+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[24+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[24+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[24+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[24+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[24+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[24+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[24+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[24+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[24+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[24+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[24+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[24+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[24+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[24+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[24+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[24+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[24+31] :
	  0;

   assign shiftleft[25] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[25] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[25+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[25+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[25+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[25+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[25+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[25+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[25+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[25+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[25+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[25+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[25+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[25+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[25+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[25+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[25+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[25+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[25+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[25+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[25+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[25+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[25+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[25+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[25+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[25+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[25+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[25+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[25+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[25+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[25+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[25+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[25+31] :
	  0;

   assign shiftleft[26] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[26] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[26+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[26+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[26+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[26+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[26+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[26+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[26+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[26+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[26+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[26+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[26+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[26+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[26+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[26+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[26+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[26+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[26+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[26+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[26+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[26+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[26+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[26+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[26+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[26+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[26+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[26+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[26+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[26+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[26+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[26+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[26+31] :
	  0;

   assign shiftleft[27] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[27] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[27+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[27+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[27+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[27+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[27+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[27+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[27+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[27+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[27+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[27+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[27+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[27+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[27+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[27+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[27+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[27+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[27+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[27+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[27+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[27+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[27+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[27+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[27+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[27+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[27+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[27+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[27+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[27+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[27+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[27+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[27+31] :
	  0;

   assign shiftleft[28] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[28] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[28+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[28+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[28+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[28+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[28+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[28+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[28+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[28+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[28+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[28+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[28+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[28+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[28+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[28+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[28+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[28+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[28+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[28+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[28+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[28+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[28+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[28+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[28+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[28+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[28+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[28+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[28+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[28+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[28+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[28+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[28+31] :
	  0;

   assign shiftleft[29] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[29] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[29+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[29+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[29+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[29+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[29+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[29+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[29+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[29+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[29+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[29+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[29+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[29+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[29+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[29+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[29+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[29+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[29+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[29+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[29+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[29+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[29+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[29+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[29+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[29+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[29+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[29+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[29+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[29+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[29+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[29+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[29+31] :
	  0;

   assign shiftleft[30] = 
	  ( pos[0:4] == 5'b00000 ) ? tempshiftl[30] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[30+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[30+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[30+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[30+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[30+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[30+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[30+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[30+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[30+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[30+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[30+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[30+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[30+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[30+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[30+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[30+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[30+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[30+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[30+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[30+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[30+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[30+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[30+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[30+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[30+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[30+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[30+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[30+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[30+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[30+30] :
	  ( pos[0:4] == 5'b11111 ) ? tempshiftl[30+31] :
	  0;

   assign shiftleft[31] = 
	  (pos[0:4] == 5'b00000) ? tempshiftl[31] :
	  ( pos[0:4] == 5'b00001 ) ? tempshiftl[31+1]:
	  ( pos[0:4] == 5'b00010 ) ? tempshiftl[31+2]:     
	  ( pos[0:4] == 5'b00011 ) ? tempshiftl[31+3]:
	  ( pos[0:4] == 5'b00100 ) ? tempshiftl[31+4]:
	  ( pos[0:4] == 5'b00101 ) ? tempshiftl[31+5]:
	  ( pos[0:4] == 5'b00110 ) ? tempshiftl[31+6]:
	  ( pos[0:4] == 5'b00111 ) ? tempshiftl[31+7]:
	  ( pos[0:4] == 5'b01000 ) ? tempshiftl[31+8] :
	  ( pos[0:4] == 5'b01001 ) ? tempshiftl[31+9] :
	  ( pos[0:4] == 5'b01010 ) ? tempshiftl[31+10] :
	  ( pos[0:4] == 5'b01011 ) ? tempshiftl[31+11] :
	  ( pos[0:4] == 5'b01100 ) ? tempshiftl[31+12] :
	  ( pos[0:4] == 5'b01101 ) ? tempshiftl[31+13] :
	  ( pos[0:4] == 5'b01110 ) ? tempshiftl[31+14] :
	  ( pos[0:4] == 5'b01111 ) ? tempshiftl[31+15] :
	  ( pos[0:4] == 5'b10000 ) ? tempshiftl[31+16] :
	  ( pos[0:4] == 5'b10001 ) ? tempshiftl[31+17] :
	  ( pos[0:4] == 5'b10010 ) ? tempshiftl[31+18] :   
	  ( pos[0:4] == 5'b10011 ) ? tempshiftl[31+19] :
	  ( pos[0:4] == 5'b10100 ) ? tempshiftl[31+20] :
	  ( pos[0:4] == 5'b10101 ) ? tempshiftl[31+21] :
	  ( pos[0:4] == 5'b10110 ) ? tempshiftl[31+22] :
	  ( pos[0:4] == 5'b10111 ) ? tempshiftl[31+23] :
	  ( pos[0:4] == 5'b11000 ) ? tempshiftl[31+24] :
	  ( pos[0:4] == 5'b11001 ) ? tempshiftl[31+25] :
	  ( pos[0:4] == 5'b11010 ) ? tempshiftl[31+26] :
	  ( pos[0:4] == 5'b11011 ) ? tempshiftl[31+27] :
	  ( pos[0:4] == 5'b11100 ) ? tempshiftl[31+28] :
	  ( pos[0:4] == 5'b11101 ) ? tempshiftl[31+29] :
	  ( pos[0:4] == 5'b11110 ) ? tempshiftl[31+30] :
	   ( pos[0:4] == 5'b11111 ) ? tempshiftl[31+31] :
	   0;
	   
   assign shiftright[32] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[32] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[32-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[32-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[32-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[32-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[32-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[32-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[32-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[32-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[32-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[32-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[32-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[32-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[32-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[32-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[32-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[32-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[32-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[32-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[32-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[32-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[32-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[32-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[32-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[32-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[32-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[32-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[32-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[32-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[32-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[32-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[32-31] :
	  0;

     assign shiftright[33] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[33] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[33-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[33-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[33-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[33-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[33-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[33-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[33-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[33-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[33-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[33-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[33-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[33-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[33-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[33-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[33-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[33-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[33-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[33-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[33-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[33-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[33-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[33-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[33-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[33-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[33-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[33-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[33-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[33-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[33-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[33-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[33-31] :
	  0;

     assign shiftright[34] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[34] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[34-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[34-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[34-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[34-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[34-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[34-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[34-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[34-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[34-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[34-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[34-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[34-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[34-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[34-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[34-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[34-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[34-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[34-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[34-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[34-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[34-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[34-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[34-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[34-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[34-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[34-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[34-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[34-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[34-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[34-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[34-31] :
	  0;

     assign shiftright[35] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[35] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[35-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[35-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[35-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[35-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[35-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[35-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[35-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[35-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[35-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[35-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[35-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[35-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[35-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[35-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[35-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[35-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[35-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[35-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[35-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[35-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[35-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[35-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[35-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[35-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[35-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[35-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[35-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[35-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[35-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[35-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[35-31] :
	  0;

     assign shiftright[36] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[36] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[36-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[36-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[36-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[36-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[36-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[36-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[36-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[36-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[36-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[36-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[36-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[36-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[36-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[36-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[36-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[36-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[36-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[36-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[36-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[36-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[36-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[36-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[36-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[36-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[36-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[36-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[36-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[36-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[36-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[36-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[36-31] :
	  0;

     assign shiftright[37] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[37] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[37-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[37-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[37-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[37-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[37-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[37-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[37-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[37-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[37-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[37-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[37-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[37-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[37-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[37-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[37-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[37-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[37-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[37-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[37-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[37-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[37-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[37-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[37-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[37-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[37-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[37-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[37-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[37-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[37-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[37-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[37-31] :
	  0;

     assign shiftright[38] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[38] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[38-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[38-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[38-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[38-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[38-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[38-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[38-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[38-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[38-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[38-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[38-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[38-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[38-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[38-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[38-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[38-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[38-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[38-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[38-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[38-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[38-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[38-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[38-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[38-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[38-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[38-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[38-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[38-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[38-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[38-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[38-31] :
	  0;

     assign shiftright[39] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[39] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[39-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[39-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[39-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[39-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[39-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[39-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[39-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[39-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[39-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[39-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[39-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[39-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[39-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[39-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[39-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[39-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[39-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[39-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[39-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[39-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[39-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[39-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[39-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[39-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[39-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[39-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[39-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[39-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[39-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[39-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[39-31] :
	  0;

     assign shiftright[40] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[40] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[40-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[40-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[40-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[40-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[40-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[40-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[40-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[40-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[40-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[40-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[40-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[40-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[40-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[40-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[40-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[40-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[40-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[40-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[40-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[40-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[40-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[40-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[40-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[40-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[40-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[40-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[40-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[40-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[40-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[40-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[40-31] :
	  0;

     assign shiftright[41] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[41] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[41-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[41-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[41-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[41-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[41-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[41-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[41-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[41-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[41-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[41-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[41-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[41-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[41-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[41-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[41-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[41-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[41-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[41-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[41-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[41-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[41-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[41-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[41-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[41-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[41-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[41-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[41-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[41-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[41-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[41-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[41-31] :
	  0;

     assign shiftright[42] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[42] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[42-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[42-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[42-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[42-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[42-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[42-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[42-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[42-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[42-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[42-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[42-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[42-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[42-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[42-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[42-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[42-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[42-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[42-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[42-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[42-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[42-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[42-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[42-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[42-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[42-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[42-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[42-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[42-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[42-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[42-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[42-31] :
	  0;

   	   
   assign shiftright[43] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[43] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[43-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[43-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[43-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[43-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[43-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[43-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[43-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[43-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[43-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[43-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[43-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[43-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[43-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[43-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[43-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[43-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[43-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[43-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[43-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[43-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[43-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[43-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[43-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[43-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[43-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[43-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[43-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[43-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[43-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[43-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[43-31] :
	  0;

     assign shiftright[44] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[44] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[44-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[44-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[44-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[44-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[44-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[44-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[44-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[44-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[44-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[44-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[44-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[44-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[44-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[44-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[44-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[44-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[44-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[44-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[44-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[44-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[44-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[44-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[44-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[44-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[44-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[44-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[44-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[44-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[44-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[44-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[44-31] :
	  0;

     assign shiftright[45] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[45] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[45-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[45-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[45-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[45-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[45-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[45-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[45-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[45-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[45-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[45-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[45-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[45-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[45-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[45-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[45-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[45-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[45-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[45-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[45-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[45-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[45-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[45-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[45-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[45-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[45-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[45-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[45-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[45-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[45-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[45-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[45-31] :
	  0;

     assign shiftright[46] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[46] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[46-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[46-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[46-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[46-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[46-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[46-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[46-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[46-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[46-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[46-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[46-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[46-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[46-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[46-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[46-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[46-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[46-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[46-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[46-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[46-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[46-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[46-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[46-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[46-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[46-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[46-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[46-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[46-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[46-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[46-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[46-31] :
	  0;

     assign shiftright[47] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[47] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[47-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[47-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[47-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[47-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[47-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[47-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[47-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[47-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[47-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[47-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[47-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[47-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[47-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[47-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[47-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[47-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[47-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[47-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[47-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[47-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[47-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[47-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[47-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[47-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[47-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[47-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[47-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[47-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[47-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[47-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[47-31] :
	  0;

     assign shiftright[48] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[48] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[48-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[48-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[48-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[48-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[48-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[48-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[48-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[48-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[48-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[48-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[48-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[48-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[48-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[48-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[48-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[48-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[48-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[48-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[48-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[48-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[48-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[48-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[48-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[48-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[48-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[48-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[48-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[48-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[48-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[48-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[48-31] :
	  0;

   assign   shiftright[49] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[49] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[49-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[49-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[49-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[49-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[49-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[49-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[49-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[49-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[49-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[49-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[49-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[49-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[49-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[49-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[49-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[49-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[49-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[49-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[49-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[49-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[49-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[49-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[49-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[49-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[49-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[49-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[49-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[49-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[49-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[49-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[49-31] :
	  0;

   assign   shiftright[50] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[50] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[50-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[50-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[50-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[50-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[50-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[50-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[50-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[50-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[50-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[50-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[50-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[50-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[50-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[50-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[50-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[50-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[50-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[50-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[50-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[50-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[50-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[50-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[50-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[50-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[50-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[50-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[50-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[50-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[50-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[50-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[50-31] :
	  0;

   assign   shiftright[51] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[51] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[51-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[51-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[51-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[51-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[51-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[51-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[51-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[51-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[51-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[51-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[51-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[51-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[51-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[51-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[51-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[51-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[51-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[51-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[51-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[51-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[51-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[51-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[51-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[51-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[51-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[51-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[51-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[51-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[51-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[51-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[51-31] :
	  0;

   assign   shiftright[52] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[52] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[52-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[52-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[52-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[52-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[52-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[52-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[52-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[52-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[52-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[52-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[52-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[52-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[52-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[52-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[52-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[52-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[52-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[52-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[52-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[52-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[52-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[52-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[52-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[52-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[52-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[52-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[52-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[52-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[52-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[52-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[52-31] :
	  0;

   assign   shiftright[53] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[53] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[53-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[53-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[53-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[53-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[53-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[53-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[53-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[53-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[53-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[53-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[53-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[53-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[53-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[53-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[53-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[53-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[53-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[53-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[53-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[53-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[53-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[53-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[53-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[53-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[53-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[53-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[53-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[53-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[53-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[53-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[53-31] :
	  0;

   assign   shiftright[54] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[54] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[54-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[54-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[54-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[54-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[54-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[54-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[54-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[54-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[54-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[54-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[54-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[54-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[54-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[54-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[54-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[54-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[54-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[54-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[54-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[54-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[54-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[54-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[54-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[54-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[54-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[54-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[54-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[54-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[54-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[54-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[54-31] :
	  0;

   assign   shiftright[55] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[55] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[55-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[55-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[55-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[55-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[55-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[55-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[55-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[55-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[55-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[55-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[55-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[55-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[55-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[55-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[55-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[55-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[55-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[55-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[55-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[55-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[55-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[55-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[55-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[55-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[55-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[55-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[55-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[55-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[55-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[55-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[55-31] :
	  0;

   assign   shiftright[56] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[56] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[56-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[56-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[56-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[56-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[56-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[56-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[56-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[56-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[56-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[56-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[56-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[56-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[56-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[56-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[56-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[56-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[56-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[56-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[56-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[56-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[56-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[56-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[56-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[56-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[56-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[56-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[56-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[56-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[56-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[56-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[56-31] :
	  0;

   assign   shiftright[57] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[57] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[57-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[57-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[57-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[57-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[57-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[57-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[57-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[57-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[57-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[57-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[57-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[57-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[57-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[57-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[57-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[57-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[57-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[57-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[57-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[57-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[57-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[57-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[57-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[57-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[57-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[57-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[57-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[57-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[57-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[57-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[57-31] :
	  0;

   assign   shiftright[58] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[58] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[58-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[58-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[58-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[58-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[58-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[58-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[58-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[58-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[58-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[58-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[58-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[58-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[58-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[58-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[58-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[58-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[58-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[58-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[58-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[58-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[58-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[58-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[58-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[58-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[58-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[58-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[58-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[58-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[58-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[58-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[58-31] :
	  0;

   assign   shiftright[59] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[59] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[59-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[59-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[59-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[59-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[59-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[59-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[59-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[59-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[59-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[59-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[59-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[59-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[59-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[59-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[59-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[59-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[59-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[59-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[59-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[59-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[59-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[59-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[59-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[59-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[59-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[59-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[59-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[59-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[59-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[59-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[59-31] :
	  0;

   assign   shiftright[60] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[60] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[60-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[60-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[60-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[60-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[60-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[60-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[60-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[60-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[60-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[60-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[60-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[60-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[60-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[60-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[60-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[60-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[60-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[60-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[60-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[60-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[60-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[60-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[60-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[60-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[60-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[60-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[60-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[60-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[60-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[60-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[60-31] :
	  0;

   assign   shiftright[61] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[61] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[61-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[61-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[61-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[61-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[61-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[61-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[61-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[61-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[61-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[61-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[61-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[61-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[61-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[61-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[61-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[61-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[61-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[61-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[61-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[61-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[61-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[61-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[61-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[61-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[61-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[61-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[61-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[61-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[61-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[61-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[61-31] :
	  0;

   assign   shiftright[62] = 
	  
	  ( pos[0:4] == 5'b00000 ) ? shift_val[62] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[62-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[62-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[62-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[62-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[62-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[62-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[62-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[62-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[62-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[62-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[62-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[62-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[62-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[62-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[62-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[62-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[62-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[62-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[62-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[62-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[62-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[62-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[62-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[62-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[62-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[62-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[62-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[62-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[62-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[62-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[62-31] :
	  0;

   assign   shiftright[63] = 
	  
	 ( pos[0:4] == 5'b00000 ) ? shift_val[63] :
	  ( pos[0:4] == 5'b00001 ) ? shift_val[63-1]:
	  ( pos[0:4] == 5'b00010 ) ? shift_val[63-2]:     
	  ( pos[0:4] == 5'b00011 ) ? shift_val[63-3]:
	  ( pos[0:4] == 5'b00100 ) ? shift_val[63-4]:
	  ( pos[0:4] == 5'b00101 ) ? shift_val[63-5]:
	  ( pos[0:4] == 5'b00110 ) ? shift_val[63-6]:
	  ( pos[0:4] == 5'b00111 ) ? shift_val[63-7]:
	  ( pos[0:4] == 5'b01000 ) ? shift_val[63-8] :
	  ( pos[0:4] == 5'b01001 ) ? shift_val[63-9] :
	  ( pos[0:4] == 5'b01010 ) ? shift_val[63-10] :
	  ( pos[0:4] == 5'b01011 ) ? shift_val[63-11] :
	  ( pos[0:4] == 5'b01100 ) ? shift_val[63-12] :
	  ( pos[0:4] == 5'b01101 ) ? shift_val[63-13] :
	  ( pos[0:4] == 5'b01110 ) ? shift_val[63-14] :
	  ( pos[0:4] == 5'b01111 ) ? shift_val[63-15] :
	  ( pos[0:4] == 5'b10000 ) ? shift_val[63-16] :
	  ( pos[0:4] == 5'b10001 ) ? shift_val[63-17] :
	  ( pos[0:4] == 5'b10010 ) ? shift_val[63-18] :   
	  ( pos[0:4] == 5'b10011 ) ? shift_val[63-19] :
	  ( pos[0:4] == 5'b10100 ) ? shift_val[63-20] :
	  ( pos[0:4] == 5'b10101 ) ? shift_val[63-21] :
	  ( pos[0:4] == 5'b10110 ) ? shift_val[63-22] :
	  ( pos[0:4] == 5'b10111 ) ? shift_val[63-23] :
	  ( pos[0:4] == 5'b11000 ) ? shift_val[63-24] :
	  ( pos[0:4] == 5'b11001 ) ? shift_val[63-25] :
	  ( pos[0:4] == 5'b11010 ) ? shift_val[63-26] :
	  ( pos[0:4] == 5'b11011 ) ? shift_val[63-27] :
	  ( pos[0:4] == 5'b11100 ) ? shift_val[63-28] :
	  ( pos[0:4] == 5'b11101 ) ? shift_val[63-29] :
	  ( pos[0:4] == 5'b11110 ) ? shift_val[63-30] :
	  ( pos[0:4] == 5'b11111 ) ? shift_val[63-31] :
	  0;
   
   assign   shift_out[0:31] = 32'b0;
	
   assign   shift_out[32:63] =  
	    ( shift_cmd[0:3] == 4'b0101 ) ? shiftleft[0:31]  & tempshift_gate[0:31]  :
	    ( shift_cmd[0:3] == 4'b0110 ) ? shiftright[32:63] :
	    32'b0;

   assign   bin_ovfl = 'b0;

endmodule // shifter