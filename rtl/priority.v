//  Library:  calc2
//  Module:  Priority logic
//  Author:  Naseer Siddique

module priority (prio_adder_cmd, prio_adder_tag, prio_adder_out_vld, prio_adder_data1, prio_adder_data2, prio_shift_cmd, prio_shift_tag, prio_shift_out_vld, prio_shift_data1, prio_shift_data2, port1_invalid_op, port1_invalid_op, port1_invalid_tag, port2_invalid_op, port2_invalid_tag, port3_invalid_op, port3_invalid_tag, port4_invalid_op, port4_invalid_tag, scan_out, hold1_data1, hold1_data2, hold2_data1, hold2_data2, hold3_data1, hold3_data2, hold4_data1, hold4_data2, hold1_tag, hold2_tag, hold3_tag, hold4_tag, hold1_cmd, hold2_cmd, hold3_cmd, hold4_cmd, reset, scan_in, a_clk, b_clk, c_clk);

   output[0:3] prio_adder_cmd, prio_adder_tag;
   output      prio_adder_out_vld, prio_shift_out_vld, port1_invalid_op, port2_invalid_op, port3_invalid_op, port4_invalid_op, scan_out;
   output [0:1] port1_invalid_tag, port2_invalid_tag, port3_invalid_tag, port4_invalid_tag;
   output [0:31] prio_adder_data1, prio_adder_data2, prio_shift_data1, prio_shift_data2;
   output [0:3]  prio_shift_cmd, prio_shift_tag;

   input [0:31]  hold1_data1, hold1_data2, hold2_data1, hold2_data2, hold3_data1, hold3_data2, hold4_data1, hold4_data2;
   input [0:1] 	 hold1_tag, hold2_tag, hold3_tag, hold4_tag;
   input [0:3] 	 hold1_cmd, hold2_cmd, hold3_cmd, hold4_cmd;
   input 	 reset, scan_in, a_clk, b_clk, c_clk;
   
   reg [0:71] addqueue1, addqueue2, addqueue3, addqueue4, addqueue5, addqueue6, addqueue7, addqueue8, addqueue9, addqueue10, addqueue11, addqueue12, addqueue13, addqueue14, addqueue15, addqueue16, shiftqueue1, shiftqueue2, shiftqueue3, shiftqueue4, shiftqueue5, shiftqueue6, shiftqueue7, shiftqueue8, shiftqueue9, shiftqueue10, shiftqueue11, shiftqueue12, shiftqueue13, shiftqueue14, shiftqueue15, shiftqueue16;

   reg 	      block_add, block_shift, block_none, block_toggle, out_of_order;

   reg [0:1]  hold1_next_tag, hold2_next_tag, hold3_next_tag, hold4_next_tag;

   wire [0:71] hold1_newentry, hold2_newentry, hold3_newentry, hold4_newentry;

   wire [0:4]  hold1_add_pos, hold2_add_pos, hold3_add_pos, hold4_add_pos;

   wire [0:4]  hold1_shift_pos, hold2_shift_pos, hold3_shift_pos, hold4_shift_pos;


   wire        hold_shift_one;

   wire [0:4]  hold1_add_valid, hold2_add_valid, hold3_add_valid, hold4_add_valid;

   wire [0:4]  hold1_shift_valid, hold2_shift_valid, hold3_shift_valid, hold4_shift_valid;

   reg [0:2]   hold1_invalid, hold2_invalid, hold3_invalid, hold4_invalid;

   reg [0:4]   addqueue_curpos;

   reg [0:4]   shiftqueue_curpos;

initial begin
//$display ("******************************************************************************************************************************************************************************************** \n h1d1: %d,h1d2: %d,h2d1: %d,h2d2: %d,h3d1: %d,h3d2: %d,h4d1: %d,h4d2: %d \n h1t: %d, h2t: %d,h3t: %d,h4t: %d \n h1c:%d, h2c:%d, h3c:%d, h4c:%d \n reset: %d, scan_in: %d, a_clk: %d, b_clk:%d,c_clk:%d \n",hold1_data1, hold1_data2, hold2_data1, hold2_data2, hold3_data1, hold3_data2, hold4_data1, hold4_data2,hold1_tag, hold2_tag, hold3_tag, hold4_tag,hold1_cmd, hold2_cmd, hold3_cmd, hold4_cmd,reset, scan_in, a_clk, b_clk, c_clk); 
end
   always
     @ (negedge c_clk) begin

	// set the values of the addqueue for the next cycles
	// the next cycle's value either comes from a new command or from the next position in addqueue

	addqueue1[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b1) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b1) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b1) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b1) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue1[0:71] : 
			   addqueue2[0:71];

	addqueue2[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b10) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b10) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b10) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b10) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue2[0:71] : 
			   addqueue3[0:71];
	
	addqueue3[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b11) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b11) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b11) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b11) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue3[0:71] : 
			   addqueue4[0:71];

	addqueue4[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b100) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b100) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b100) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b100) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue4[0:71] : 
			   addqueue5[0:71];

	addqueue5[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b101) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b101) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b101) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b101) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue5[0:71] : 
			   addqueue6[0:71];

	addqueue6[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b110) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b110) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b110) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b110) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue6[0:71] : 
			   addqueue7[0:71];

	addqueue7[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b111) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b111) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b111) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b111) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue7[0:71] : 
			   addqueue8[0:71];

	addqueue8[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b1000) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b1000) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b1000) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b1000) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue8[0:71] : 
			   addqueue9[0:71];

	addqueue9[0:71] <= (reset) ? 72'b0 : 
			   (hold1_add_pos[0:4] == 5'b1001) ? hold1_newentry[0:71] : 
			   (hold2_add_pos[0:4] == 5'b1001) ? hold2_newentry[0:71] : 
			   (hold3_add_pos[0:4] == 5'b1001) ? hold3_newentry[0:71] : 
			   (hold4_add_pos[0:4] == 5'b1001) ? hold4_newentry[0:71] : 
			   (block_add) ? addqueue9[0:71] : 
			   addqueue10[0:71];

	addqueue10[0:71] <= (reset) ? 72'b0 : 
			    (hold1_add_pos[0:4] == 5'b1010) ? hold1_newentry[0:71] : 
			    (hold2_add_pos[0:4] == 5'b1010) ? hold2_newentry[0:71] : 
			    (hold3_add_pos[0:4] == 5'b1010) ? hold3_newentry[0:71] : 
			    (hold4_add_pos[0:4] == 5'b1010) ? hold4_newentry[0:71] : 
			    (block_add) ? addqueue10[0:71] : 
			    addqueue11[0:71];
	
	addqueue11[0:71] <= (reset) ? 72'b0 : 
			    (hold1_add_pos[0:4] == 5'b1011) ? hold1_newentry[0:71] : 
			    (hold2_add_pos[0:4] == 5'b1011) ? hold2_newentry[0:71] : 
			    (hold3_add_pos[0:4] == 5'b1011) ? hold3_newentry[0:71] : 
			    (hold4_add_pos[0:4] == 5'b1011) ? hold4_newentry[0:71] : 
			    (block_add) ? addqueue11[0:71] : 
			    addqueue12[0:71];

	addqueue12[0:71] <= (reset) ? 72'b0 : 
			    (hold1_add_pos[0:4] == 5'b1100) ? hold1_newentry[0:71] : 
			    (hold2_add_pos[0:4] == 5'b1100) ? hold2_newentry[0:71] : 
			    (hold3_add_pos[0:4] == 5'b1100) ? hold3_newentry[0:71] : 
			    (hold4_add_pos[0:4] == 5'b1100) ? hold4_newentry[0:71] : 
			    (block_add) ? addqueue12[0:71] : 
			    addqueue13[0:71];

	addqueue13[0:71] <= (reset) ? 72'b0 : 
			    (hold1_add_pos[0:4] == 5'b1101) ? hold1_newentry[0:71] : 
			    (hold2_add_pos[0:4] == 5'b1101) ? hold2_newentry[0:71] : 
			    (hold3_add_pos[0:4] == 5'b1101) ? hold3_newentry[0:71] : 
			    (hold4_add_pos[0:4] == 5'b1101) ? hold4_newentry[0:71] : 
			    (block_add) ? addqueue13[0:71] : 
			    addqueue14[0:71];

	addqueue14[0:71] <= (reset) ? 72'b0 : 
			    (hold1_add_pos[0:4] == 5'b1110) ? hold1_newentry[0:71] : 
			    (hold2_add_pos[0:4] == 5'b1110) ? hold2_newentry[0:71] : 
			    (hold3_add_pos[0:4] == 5'b1110) ? hold3_newentry[0:71] : 
			    (hold4_add_pos[0:4] == 5'b1110) ? hold4_newentry[0:71] : 
			    (block_add) ? addqueue14[0:71] : 
			    addqueue15[0:71];

	addqueue15[0:71] <= (reset) ? 72'b0 : 
			    (hold1_add_pos[0:4] == 5'b1111) ? hold1_newentry[0:71] : 
			    (hold2_add_pos[0:4] == 5'b1111) ? hold2_newentry[0:71] : 
			    (hold3_add_pos[0:4] == 5'b1111) ? hold3_newentry[0:71] : 
			    (hold4_add_pos[0:4] == 5'b1111) ? hold4_newentry[0:71] : 
			    (block_add) ? addqueue15[0:71] : 
			    addqueue16[0:71];

	addqueue16[0:71] <= (reset) ? {3'b0,1'b1,68'b0} : 
			    (hold1_add_pos[0:4] == 5'b10000) ? hold1_newentry[0:71] : 
			    (hold2_add_pos[0:4] == 5'b10000) ? hold2_newentry[0:71] : 
			    (hold3_add_pos[0:4] == 5'b10000) ? hold3_newentry[0:71] : 
			    (hold4_add_pos[0:4] == 5'b10000) ? hold4_newentry[0:71] : 
			    72'b0;

     end

   always 
     @ (negedge c_clk) begin

	// Set the values of the shiftqueue for the next cycles
	// The next cycle's value either comes from a new command or from the next position in shiftqueue

	shiftqueue1[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b1) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b1) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b1) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b1) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue1[0:71] : 
			     shiftqueue2[0:71];

	shiftqueue2[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b10) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b10) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b10) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b10) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue2[0:71] : 
			     shiftqueue3[0:71];
	
	shiftqueue3[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b11) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b11) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b11) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b11) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue3[0:71] : 
			     shiftqueue4[0:71];

	shiftqueue4[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b100) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b100) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b100) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b100) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue4[0:71] : 
			     shiftqueue5[0:71];

	shiftqueue5[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b101) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b101) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b101) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b101) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue5[0:71] : 
			     shiftqueue6[0:71];

	shiftqueue6[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b110) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b110) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b110) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b110) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue6[0:71] : 
			     shiftqueue7[0:71];

	shiftqueue7[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b111) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b111) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b111) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b111) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue7[0:71] : 
			     shiftqueue8[0:71];

	shiftqueue8[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b1000) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b1000) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b1000) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b1000) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue8[0:71] : 
			     shiftqueue9[0:71];

	shiftqueue9[0:71] <= (reset) ? 72'b0 : 
			     (hold1_shift_pos[0:4] == 5'b1001) ? hold1_newentry[0:71] : 
			     (hold2_shift_pos[0:4] == 5'b1001) ? hold2_newentry[0:71] : 
			     (hold3_shift_pos[0:4] == 5'b1001) ? hold3_newentry[0:71] : 
			     (hold4_shift_pos[0:4] == 5'b1001) ? hold4_newentry[0:71] : 
			     (block_shift) ? shiftqueue9[0:71] : 
			     shiftqueue10[0:71];

	shiftqueue10[0:71] <= (reset) ? 72'b0 : 
			      (hold1_shift_pos[0:4] == 5'b1010) ? hold1_newentry[0:71] : 
			      (hold2_shift_pos[0:4] == 5'b1010) ? hold2_newentry[0:71] : 
			      (hold3_shift_pos[0:4] == 5'b1010) ? hold3_newentry[0:71] : 
			      (hold4_shift_pos[0:4] == 5'b1010) ? hold4_newentry[0:71] : 
			      (block_shift) ? shiftqueue10[0:71] : 
			      shiftqueue11[0:71];
	
	shiftqueue11[0:71] <= (reset) ? 72'b0 :
			      (hold1_shift_pos[0:4] == 5'b1011) ? hold1_newentry[0:71] : 
			      (hold2_shift_pos[0:4] == 5'b1011) ? hold2_newentry[0:71] : 
			      (hold3_shift_pos[0:4] == 5'b1011) ? hold3_newentry[0:71] : 
			      (hold4_shift_pos[0:4] == 5'b1011) ? hold4_newentry[0:71] : 
			      (block_shift) ? shiftqueue11[0:71] :
			      (~hold_shift_one) ? shiftqueue11[0:71] :
			      shiftqueue12[0:71];

	shiftqueue12[0:71] <= (reset) ? 72'b0 : 
			      (hold1_shift_pos[0:4] == 5'b1100) ? hold1_newentry[0:71] : 
			      (hold2_shift_pos[0:4] == 5'b1100) ? hold2_newentry[0:71] : 
			      (hold3_shift_pos[0:4] == 5'b1100) ? hold3_newentry[0:71] : 
			      (hold4_shift_pos[0:4] == 5'b1100) ? hold4_newentry[0:71] : 
			      (block_shift) ? shiftqueue12[0:71] : 
			      shiftqueue13[0:71];

	shiftqueue13[0:71] <= (reset) ? 72'b0 : 
			      (hold1_shift_pos[0:4] == 5'b1101) ? hold1_newentry[0:71] : 
			      (hold2_shift_pos[0:4] == 5'b1101) ? hold2_newentry[0:71] : 
			      (hold3_shift_pos[0:4] == 5'b1101) ? hold3_newentry[0:71] : 
			      (hold4_shift_pos[0:4] == 5'b1101) ? hold4_newentry[0:71] : 
			      (block_shift) ? shiftqueue13[0:71] : 
			      shiftqueue14[0:71];

	shiftqueue14[0:71] <= (reset) ? 72'b0 : 
			      (hold1_shift_pos[0:4] == 5'b1110) ? hold1_newentry[0:71] : 
			      (hold2_shift_pos[0:4] == 5'b1110) ? hold2_newentry[0:71] : 
			      (hold3_shift_pos[0:4] == 5'b1110) ? hold3_newentry[0:71] : 
			      (hold4_shift_pos[0:4] == 5'b1110) ? hold4_newentry[0:71] : 
			      (block_shift) ? shiftqueue14[0:71] : 
			      shiftqueue15[0:71];

	shiftqueue15[0:71] <= (reset) ? 72'b0 : 
			      (hold1_shift_pos[0:4] == 5'b1111) ? hold1_newentry[0:71] : 
			      (hold2_shift_pos[0:4] == 5'b1111) ? hold2_newentry[0:71] : 
			      (hold3_shift_pos[0:4] == 5'b1111) ? hold3_newentry[0:71] : 
			      (hold4_shift_pos[0:4] == 5'b1111) ? hold4_newentry[0:71] : 
			      (block_shift) ? shiftqueue15[0:71] : 
			      shiftqueue16[0:71];

	shiftqueue16[0:71] <= (reset) ? 72'b0 : 
			      (hold1_shift_pos[0:4] == 5'b10000) ? hold1_newentry[0:71] : 
			      (hold2_shift_pos[0:4] == 5'b10000) ? hold2_newentry[0:71] : 
			      (hold3_shift_pos[0:4] == 5'b10000) ? hold3_newentry[0:71] : 
			      (hold4_shift_pos[0:4] == 5'b10000) ? hold4_newentry[0:71] : 
			      72'b0;
	

     end // always @ (negedge c_clk)

   // holdx_add_valid and holdx_shift_valid is set to 1 if there's a valid new command from holdreg x

   assign hold1_add_valid = ((hold1_cmd == 4'b0001 || hold1_cmd == 4'b0010) && ((hold1_tag[0:1] == hold1_next_tag[0:1]) || (hold1_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;

   assign hold2_add_valid = ((hold2_cmd == 4'b0001 || hold2_cmd == 4'b0010) && ((hold2_tag[0:1] == hold2_next_tag[0:1]) || (hold2_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;

   assign hold3_add_valid = ((hold3_cmd == 4'b0001 || hold3_cmd == 4'b0010) && ((hold3_tag[0:1] == hold3_next_tag[0:1]) || (hold3_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;
   
   assign hold4_add_valid = ((hold4_cmd == 4'b0001 || hold4_cmd == 4'b0010) && ((hold4_tag[0:1] == hold4_next_tag[0:1]) || (hold4_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;
   
   assign hold1_shift_valid = ((hold1_cmd == 4'b0101 || hold1_cmd == 4'b0110) && ((hold1_tag[0:1] == hold1_next_tag[0:1]) || (hold1_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;
   
   assign hold2_shift_valid = ((hold2_cmd == 4'b0101 || hold2_cmd == 4'b0110) && ((hold2_tag[0:1] == hold2_next_tag[0:1]) || (hold2_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;
   
   assign hold3_shift_valid = ((hold3_cmd == 4'b0101 || hold3_cmd == 4'b0110) && ((hold3_tag[0:1] == hold3_next_tag[0:1]) || (hold3_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;
   
   assign hold4_shift_valid = ((hold4_cmd == 4'b0101 || hold4_cmd == 4'b0110) && ((hold4_tag[0:1] == hold4_next_tag[0:1]) || (hold4_next_tag[0:1] == 2'b00) || ~out_of_order)) ? 5'b00001 : 5'b0;
   
   // holdx__newentry holds the 72-bit value to be put in one of the two queues
   // We can set it whether there's a command or not because we set holdx_add_valid and
   // holdx_shift_valid above
   
   assign hold1_newentry = {
			    hold1_cmd[0:3] , 
			    2'b00 , 
			    hold1_tag[0:1] , 
			    hold1_data1[0:31] , 
			    hold1_data2[0:31] 
			    };
   
   assign hold2_newentry = {
			    hold2_cmd[0:3] , 
			    2'b01 ,  
			    hold2_tag[0:1] , 
			    hold2_data1[0:31] , 
			    hold2_data2[0:31] 
			    };
   
   assign hold3_newentry = { 
			     hold3_cmd[0:3] ,
			     2'b10 ,
			     hold3_tag[0:1] ,
			     hold3_data1[0:31] ,
			     hold3_data2[0:31]
			     };

   assign hold4_newentry = {
			    hold4_cmd[0:3] ,
			    2'b11 ,
			    hold4_tag[0:1] ,
			    hold4_data1[0:31] ,
			    hold4_data2[0:31]
			    };
   
   //holdx_add_pos is where the command and data will go in the addqueue
   //A value of 5'b00000 means there's no new command this cycle
   
   assign hold1_add_pos = (hold1_add_valid == 5'b0) ? 5'b0 : 
	  ((addqueue_curpos == 5'b0) || (block_add)) ? addqueue_curpos + 1 : 
	  addqueue_curpos;
   
   assign hold2_add_pos = (hold2_add_valid == 5'b0) ? 5'b0 : 
	  ((addqueue_curpos == 5'b0) || (block_add)) ? addqueue_curpos + hold1_add_valid + 1 : 
	  addqueue_curpos + hold1_add_valid;
   
   assign hold3_add_pos = (hold3_add_valid == 5'b0) ? 5'b0 : 
	  ((addqueue_curpos == 5'b0) || (block_add)) ? addqueue_curpos + hold1_add_valid + hold2_add_valid + 1 : 
	  addqueue_curpos + hold1_add_valid + hold2_add_valid;
   
   assign hold4_add_pos = (hold4_add_valid == 5'b0) ? 5'b0 : 
	  ((addqueue_curpos == 5'b0) || (block_add)) ? addqueue_curpos + hold1_add_valid + hold2_add_valid + hold3_add_valid + 1 : 
	  addqueue_curpos + hold1_add_valid + hold2_add_valid + hold3_add_valid;
   
   //holdx_shift_pos is where the command and data will go in the shiftqueue
   //A value of 5'b0 means there is no new command this cycle
   
   assign hold1_shift_pos = (hold1_shift_valid == 5'b0) ? 5'b0 : 
	  ((shiftqueue_curpos == 5'b0) || (block_shift)) ? shiftqueue_curpos + 1 : 
	  shiftqueue_curpos;

   assign hold2_shift_pos = (hold2_shift_valid == 5'b0) ? 5'b0 : 
	  ((shiftqueue_curpos == 5'b0) || (block_shift)) ? shiftqueue_curpos + hold1_shift_valid + 1 :
	  shiftqueue_curpos + hold1_shift_valid;
   
   assign hold3_shift_pos = (hold3_shift_valid == 5'b0) ? 5'b0 : 
	  ((shiftqueue_curpos == 5'b0) || (block_shift)) ? shiftqueue_curpos + hold1_shift_valid + hold2_shift_valid + 1 : 
	  shiftqueue_curpos + hold1_shift_valid + hold2_shift_valid;
   
   assign hold4_shift_pos = (hold4_shift_valid == 5'b0) ? 5'b0 : 
	  ((shiftqueue_curpos == 5'b0) || (block_shift)) ? shiftqueue_curpos + hold1_shift_valid + hold2_shift_valid + hold3_shift_valid + 1 : 
	  shiftqueue_curpos + hold1_shift_valid + hold2_shift_valid + hold3_shift_valid;
   
   always 
     @ (negedge c_clk) begin

	// addqueue_curpos holds the number of valid commands in the addqueue at this time
	// This is where it's calculated for the next cycle
	// A value of 5'b0 means there are no commands in the addqueue
	// A value of 5'b10000 means it's filled, but that can't happen because of throughput
	
	addqueue_curpos <= (reset) ? 5'b0 : ((addqueue_curpos == 5'b0) || block_add) ? addqueue_curpos + hold1_add_valid + hold2_add_valid + hold3_add_valid + hold4_add_valid : addqueue_curpos + hold1_add_valid + hold2_add_valid + hold3_add_valid + hold4_add_valid -1;
	
// the case above takes into the account that 1 command will be dispatched (hence the '-1')
	
	// shiftqueue_curpos holds the number of valid commands in the shiftqueue at this time
	// this is where it's calculated for the next cycle
	// a value of 5'b0 means there are no commands in the shiftqueue
	// a value of 5'b10000 means it's filled, but that can't happen because of throughput
	shiftqueue_curpos <= (reset) ? 5'b0 : ((shiftqueue_curpos == 5'b0) || block_shift) ? shiftqueue_curpos + hold1_shift_valid + hold2_shift_valid + hold3_shift_valid + hold4_shift_valid : shiftqueue_curpos + hold1_shift_valid + hold2_shift_valid + hold3_shift_valid + hold4_shift_valid -1;
	
	// the case above takes into the account that 1 command will be dispatched (hence the '-1')
	
	// set block_add or block_shift if the addqueue and shiftqueue have commands from the same port on the next cycle

	block_add <= ((~block_shift) && (addqueue2[4:5] == shiftqueue2[4:5]) && 
		      (addqueue2[0:3] != 4'b0) && (shiftqueue2[0:3] != 4'b0) && 
		      ~block_add && block_none && block_toggle) ? 
		     1'b1 : 
		     (block_shift && (addqueue2[4:5] == shiftqueue1[4:5])  && 
		      (addqueue2[0:3] != 4'b0) && (shiftqueue1[0:3] != 4'b0) && 
		      ~block_add && block_none && block_toggle) ?
		     1'b1 : 
		     (((hold1_add_pos == 5'b00001) && block_none && 
		       ((shiftqueue2[4:5] == 2'b0 && (shiftqueue2[0:3] != 4'b0) && ~block_shift) || 
			((shiftqueue1[4:5] == 2'b00) && (shiftqueue1[0:3] != 4'b0) && block_shift)))  || 
		      ((hold2_add_pos == 5'b00001) && block_none && 
		       ((shiftqueue2[4:5] == 2'b01 && (shiftqueue2[0:3] != 4'b0) && ~block_shift) || 
			((shiftqueue1[4:5] == 2'b01) && (shiftqueue1[0:3] != 4'b0) && block_shift))) || 
		      ((hold3_add_pos == 5'b00001) && block_none && 
		       ((shiftqueue2[4:5] == 2'b10 && (shiftqueue2[0:3] != 4'b0) && ~block_shift) || 
			((shiftqueue1[4:5] == 2'b10) && (shiftqueue1[0:3] != 4'b0) && block_shift))) || 
		      ((hold4_add_pos == 5'b00001) && block_none && 
		       ((shiftqueue2[4:5] == 2'b11 && (shiftqueue2[0:3] != 4'b0) && ~block_shift) || 
			((shiftqueue1[4:5] == 2'b11) && (shiftqueue1[0:3] != 4'b0) && block_shift)))) ? 
		     1'b1 : 1'b0;

	block_shift <=  ((~block_add) && (addqueue2[4:5] == shiftqueue2[4:5]) && 
			 (addqueue2[0:3] != 4'b0) && (shiftqueue2[0:3] != 4'b0) && 
			 ~block_shift && block_none && ~block_toggle) ? 
			1'b1 : 
			(block_add && (addqueue1[4:5] == shiftqueue2[4:5])  && 
			 (addqueue1[0:3] != 4'b0) && (shiftqueue2[0:3] != 4'b0) && 
			 ~block_shift && block_none && ~block_toggle)  ? 
			1'b1 : 
			(((hold1_shift_pos == 5'b00001) && block_none && 
			  ((addqueue2[4:5] == 2'b0 && (addqueue2[0:3] != 4'b0) && ~block_add) || 
			   ((addqueue1[4:5] == 2'b00) && (addqueue1[0:3] != 4'b0) && block_add)))  || 
			 ((hold2_shift_pos == 5'b00001) && block_none && 
			  ((addqueue2[4:5] == 2'b01 && (addqueue2[0:3] != 4'b0) && ~block_add) || 
			   ((addqueue1[4:5] == 2'b01) && (addqueue1[0:3] != 4'b0) && block_add))) || 
			 ((hold3_shift_pos == 5'b00001) && block_none && 
			  ((addqueue2[4:5] == 2'b10 && (addqueue2[0:3] != 4'b0) && ~block_add) || 
			   ((addqueue1[4:5] == 2'b10) && (addqueue1[0:3] != 4'b0) && block_add))) || 
			 ((hold4_shift_pos == 5'b00001) && block_none && 
			  ((addqueue2[4:5] == 2'b11 && (addqueue2[0:3] != 4'b0) && ~block_add) || 
			   ((addqueue1[4:5] == 2'b11) && (addqueue1[0:3] != 4'b0) && block_add)))) ? 
			1'b1 : 1'b0;

	block_none <= (reset) ? 1'b0 : (block_shift && block_add) ? 1'b1 : block_none;

	block_toggle <= (reset) ? 1'b0 :  
			( ~block_shift  && (addqueue2[4:5] == shiftqueue2[4:5]) && 
			  (addqueue2[0:3] != 4'b0 ) && (shiftqueue2[0:3]  != 4'b0) && 
			  ~block_add && block_toggle  ) ? 
			1'b0 : 
			( block_shift && (addqueue2[4:5] == shiftqueue1[4: 5]) && 
			  (addqueue2[0:3] != 4'b0) && (shiftqueue1[0:3] != 4'b0) && 
			  ~block_add && block_toggle) ? 
			1'b0 :  
			( ~block_add  && (addqueue2[4:5] == shiftqueue2[4:5]) && 
			  (addqueue2[0:3] != 4'b0) && (shiftqueue2[0:3] != 4'b0) && 
			  ~block_shift && ~block_toggle ) ? 
			1'b1 :  
			( block_add  && (addqueue1[4:5] == shiftqueue2[4:5]) && 
			  (addqueue1[0:3] != 4'b0) && (shiftqueue2[0:3] != 4'b0) && 
			  ~block_shift && ~block_toggle ) ? 
			1'b1 : block_toggle;

	// figure out next tag
	
	hold1_next_tag <= (reset) ? 2'b00 : 
			  ( (hold1_cmd != 4'b0) && (hold1_tag == 2'b00)) ? 2'b01 : 
			  ( (hold1_cmd != 4'b0) && (hold1_tag == 2'b01)) ? 2'b10 : 
			  ( (hold1_cmd != 4'b0) && (hold1_tag == 2'b10) ) ? 2'b11 : 
			  ((hold1_cmd != 4'b0) && (hold1_tag == 2'b11)) ? 2'b00 : 
			  hold1_next_tag;
	
	hold2_next_tag <= (reset) ? 2'b00 : 
			  ( (hold2_cmd != 4'b0) && (hold2_tag == 2'b00)) ? 2'b01 : 
			  ( (hold2_cmd != 4'b0) && (hold2_tag == 2'b01)) ? 2'b10 : 
			  ( (hold2_cmd != 4'b0) && (hold2_tag == 2'b10) ) ? 2'b11 : 
			  ((hold2_cmd != 4'b0) && (hold2_tag == 2'b11)) ? 2'b00 : 
			  hold2_next_tag;
	
	hold3_next_tag <= (reset) ? 2'b00 : 
			  ( (hold3_cmd != 4'b0) && (hold3_tag == 2'b00)) ? 2'b01 : 
			  ( (hold3_cmd != 4'b0) && (hold3_tag == 2'b01)) ? 2'b10 : 
			  ( (hold3_cmd != 4'b0) && (hold3_tag == 2'b10) ) ? 2'b11 : 
			  ((hold3_cmd != 4'b0) && (hold3_tag == 2'b11)) ? 2'b00 : 
			  hold3_next_tag;
	
	hold4_next_tag <= (reset) ? 2'b00 : 
			  ( (hold4_cmd != 4'b0) && (hold4_tag == 2'b00)) ? 2'b01 : 
			  ( (hold4_cmd != 4'b0) && (hold4_tag == 2'b01)) ? 2'b10 : 
			  ( (hold4_cmd != 4'b0) && (hold4_tag == 2'b10) ) ? 2'b11 : 
			  ((hold4_cmd != 4'b0) && (hold4_tag == 2'b11)) ? 2'b00 : 
			  hold4_next_tag;

	out_of_order <= (reset) ? 1'b1 : out_of_order;
	
	// if the new command from the holdreg is invalid, then set the holdx_invalid registers

	hold1_invalid <= ( ( hold1_add_valid == 5'b0) && 
			   (hold1_shift_valid == 5'b0) && 
			   (hold1_cmd != 4'b0) ) ?  { 1'b1,  hold1_tag[0:1] } : 
			 3'b0;

	hold2_invalid <= ( ( hold2_add_valid == 5'b0) && 
			   (hold2_shift_valid == 5'b0) && 
			   (hold2_cmd != 4'b0) ) ? { 1'b1, hold2_tag[0:1] } : 
			 3'b0;
	
	hold3_invalid <= ( ( hold3_add_valid == 5'b0) && 
			   (hold3_shift_valid == 5'b0) && 
			   (hold3_cmd != 4'b0) ) ? {1'b1, hold3_tag[0:1] } : 
			 3'b0;
	
	hold4_invalid <= ( ( hold4_add_valid == 5'b0) && 
			   (hold4_shift_valid == 5'b0) && 
			   (hold4_cmd != 4'b0) ) ? { 1'b1, hold4_tag[0:1] } : 
			 3'b0;

     end // always @ (negedge c_clk)

   // set all outputs below
   // set the tag output to the mux_out for invalid opcodes

   assign port1_invalid_op = hold1_invalid[0];
   assign port1_invalid_tag = hold1_invalid[1:2];
   assign port2_invalid_op = hold2_invalid[0];
   assign port2_invalid_tag = hold2_invalid[1:2];
   assign port3_invalid_op = hold3_invalid[0];
   assign port3_invalid_tag = hold3_invalid[1:2];
   assign port4_invalid_op = hold4_invalid[0];
   assign port4_invalid_tag = hold4_invalid[1:2];

   // set the outputs that drive the adder

   assign prio_adder_cmd = addqueue1[0:3];
   assign prio_adder_tag = addqueue1[4:7];
   assign prio_adder_out_vld = ( (addqueue1[0:3] != 4'b0) && ~block_add) ? 1'b1 : 1'b0;
   assign prio_adder_data1 = addqueue1[8:39];
   assign prio_adder_data2 = addqueue1[40:71];

   // set the outputs that drive the shifter

   assign prio_shift_cmd = shiftqueue1[0:3];
   assign prio_shift_tag = shiftqueue1[4:7];
   assign prio_shift_out_vld = ( (shiftqueue1[0:3] != 4'b0) && ~block_shift) ? 1'b1 : 1'b0;
   assign prio_shift_data1 = shiftqueue1[8:39];
   assign prio_shift_data2 = shiftqueue1[40:71];

//$display("************************************************************************************************************************* prio_adder_cmd:%d, prio_adder_tag:%d,prio_adder_out_vld:%d, prio_shift_out_vld:%d, port1_invalid_op:%d, port2_invalid_op:%d, port3_invalid_op:%d, port4_invalid_op:%d, scan_out:%d,port1_invalid_tag:%d, port2_invalid_tag:%d, port3_invalid_tag:%d, port4_invalid_tag:%d,prio_adder_data1:%d, prio_adder_data2:%d, prio_shift_data1:%d, prio_shift_data2:%d,prio_shift_cmd:%d, prio_shift_tag:%d",prio_adder_cmd, prio_adder_tag,prio_adder_out_vld, prio_shift_out_vld, port1_invalid_op, port2_invalid_op, port3_invalid_op, port4_invalid_op, scan_out,port1_invalid_tag, port2_invalid_tag, port3_invalid_tag, port4_invalid_tag,prio_adder_data1, prio_adder_data2, prio_shift_data1, prio_shift_data2,prio_shift_cmd, prio_shift_tag);


endmodule // priority 
