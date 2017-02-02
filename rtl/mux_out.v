// Library: calc2
// Module: mux_out
// Created by: siddique


module mux_out(req_data, req_resp, req_tag, adder_data, adder_resp, adder_tag, shift_data, shift_resp, shift_tag, invalid_op, invalid_op_tag, reset, scan_in, a_clk, b_clk, c_clk, scan_out);

   output [0:31] req_data;
   output [0:1]  req_resp;
   output [0:1]  req_tag;
   output 	 scan_out;
      
   input [0:31]  adder_data, shift_data;
   input [0:1] 	 adder_resp, adder_tag, shift_resp, shift_tag, invalid_op_tag;
   input 	 invalid_op, reset, scan_in, a_clk, b_clk, c_clk;

   reg [0:2] 	 inv_op1_tag, inv_op2_tag;
   reg 		 inv_tag;
   
   
   always @ 
     (negedge c_clk) begin
	// inv_opx_tag definition: bit 0 is "valid bit", Bit 1 to 2 is tag
	inv_op1_tag[0:2] <=
		      (reset) ? 3'b0:
		      (invalid_op && (~inv_op1_tag[0] || ((shift_resp == 'b00) && adder_resp == 'b00))) ? { 1'b1 , invalid_op_tag[0:1] } :
		      ((shift_resp != 'b00) || (adder_resp != 'b00)) ? inv_op1_tag[0:2] :
		      inv_op2_tag[0:2];

	inv_op2_tag <= 
		       (reset) ? 3'b0 :
		       (invalid_op && inv_op1_tag[0] && inv_tag && ((shift_resp != 'b00) || (adder_resp != 'b00))) ? { 1'b1, invalid_op_tag[0:1] } :
		       ((shift_resp != 'b00) || (adder_resp != 'b00)) ? inv_op2_tag[0:2] :
		       3'b0;
	
     end
   
   assign req_resp[0:1] = ((adder_resp != 'b00) || (shift_resp != 'b00)) ? adder_resp[0:1] | shift_resp[0:1] :
		     (inv_op1_tag[0]) ? 'b10 :
		     'b00;
   
   assign req_data = 
	  ((adder_resp != 'b00) || (shift_resp != 'b00)) ? (adder_data | shift_data)  :
	  32'b0;

   assign req_tag =
	  (adder_resp != 'b00) ? adder_tag :
	  (shift_resp != 'b00) ? shift_tag :
	  (inv_op1_tag[0]) ? inv_op1_tag [1:2] :
	  adder_tag | shift_tag;

endmodule // mux_out


