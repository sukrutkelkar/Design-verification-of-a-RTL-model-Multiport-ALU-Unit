module alu_output_stage(out_data1, out_resp1, out_tag1, out_data2, out_resp2, out_tag2, out_data3, out_resp3, out_tag3, out_data4, out_tag4, out_resp4, scan_out, alu_overflow, alu_result, prio_alu_out_vld, prio_alu_tag, reset, scan_in, a_clk, b_clk, c_clk);
    
   output [0:31] out_data1, out_data2, out_data3, out_data4;
   output [0:1]  out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;
   output 	 scan_out;

   input [0:63]  alu_result;
   input 	 a_clk, alu_overflow, b_clk, c_clk, prio_alu_out_vld, scan_in, reset;
   input [0:3] 	 prio_alu_tag;
   
   
   reg [0:31] 	 hold_data;
   reg [0:1] 	 hold_resp;
   reg [0:2] 	 hold_extension;
   reg [0:3] 	 hold_tag;

   always
     @ (negedge c_clk) begin

	hold_tag[0:3] <= (reset || ~prio_alu_out_vld) ? 4'b0 :
			 prio_alu_tag[0:3];
	
	hold_resp[0:1] <=
			(reset || ~prio_alu_out_vld) ? 2'b0 :
			(alu_result[31]) ? 2'b10 :
			2'b01;

	hold_data[0:31] <= (reset || ~prio_alu_out_vld) ? 32'b0 :
			   alu_result[32:63];

	hold_extension[0] <= (reset) ? 1'b0 : hold_extension[0];
	hold_extension[1:2] <= (reset) ? 2'b0 : hold_tag[2:3];

     end // always @ (negedge c_clk)
   
   assign out_resp1[0:1] = (hold_tag[0:1] == 2'b00) ? hold_resp[0:1] : 2'b00;
   
   assign   out_resp2[0:1] = (hold_tag[0:1] == 2'b01) ? hold_resp[0:1] : 2'b00;
   
   assign   out_resp3[0:1] = (hold_tag[0:1] == 2'b10) ? hold_resp[0:1] : 2'b00;
   
   assign   out_resp4[0:1] = (hold_tag[0:1] == 2'b11) ? hold_resp[0:1] : 2'b00;
   
   assign   out_data1[0:31] = (hold_tag[0:1] == 2'b00) ? hold_data[0:31] : 32'b0;
   
   assign   out_data2[0:31] = (hold_tag[0:1] == 2'b01) ? hold_data[0:31] : 32'b0;
   
   assign   out_data3[0:31] = (hold_tag[0:1] == 2'b10) ? hold_data[0:31] : 32'b0;
   
   assign   out_data4[0:31] = (hold_tag[0:1] == 2'b11) ? hold_data[0:31] : 32'b0;

   assign out_tag1[0:1] = 
	  ((hold_tag[0:1] == 2'b00) || (hold_extension[0:2] == 3'b000)) ? hold_tag[2:3] : 2'b00;

   assign out_tag2[0:1] =
	  ((hold_tag[0:1] == 2'b01) || (hold_extension[0:2] == 3'b001)) ? hold_tag[2:3] : 2'b00;

   assign out_tag3[0:1] = 
	  ((hold_tag[0:1] == 2'b10) || (hold_extension[0:2] == 3'b010)) ? hold_tag[2:3] : 2'b00;

   assign out_tag4[0:1] =
	  ((hold_tag[0:1] == 2'b11) || (hold_extension[0:2] == 3'b011)) ? hold_tag[2:3] : 2'b00;
      
endmodule