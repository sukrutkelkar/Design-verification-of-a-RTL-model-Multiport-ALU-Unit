// Library:  calc2
// Module:  Top-level wiriring
// Author:  Naseer Siddique

`include "adder.v"
`include "alu_input_stage.v"
`include "alu_output_stage.v"
`include "holdreg.v"
`include "mux_out.v"
`include "priority.v"
`include "shifter.v"
 

module calc2_top ( out_data1, out_data2, out_data3, out_data4, out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4, scan_out, a_clk, b_clk, c_clk, req1_cmd_in, req1_data_in, req1_tag_in, req2_cmd_in, req2_data_in, req2_tag_in, req3_cmd_in, req3_data_in, req3_tag_in, req4_cmd_in, req4_data_in, req4_tag_in, reset, scan_in);

   output [0:31] out_data1, out_data2, out_data3, out_data4;
   output [0:1]  out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;
   output 	 scan_out;

   input 	 a_clk, b_clk, c_clk, reset, scan_in;
   input [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
   input [0:1] 	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
   input [0:31]  req1_data_in, req2_data_in, req3_data_in, req4_data_in;

   wire 	 out_adder_overflow, port1_invalid_op, port2_invalid_op, port3_invalid_op, port4_invalid_op, prio_adder_out_vld, prio_shift_out_vld, scan_ring1, scan_ring2, scan_ring3, scan_ring4, scan_ring5, scan_ring6, scan_ring7, scan_ring8, scan_ring9, scan_ring10, scan_ring11, shift_overflow;
   
   wire [0:31] 	 addmux_out_data1, addmux_out_data2, addmux_out_data3, addmux_out_data4 , hold1_prio_data1, hold1_prio_data2,  hold2_prio_data1, hold2_prio_data2 ,  hold3_prio_data1, hold3_prio_data2, hold4_prio_data1, hold4_prio_data2;

   wire [0:1] 	 addmux_out_resp1, addmux_out_resp2, addmux_out_resp3, addmux_out_resp4, addmux_out_tag1, addmux_out_tag2, addmux_out_tag3, addmux_out_tag4,  hold1_prio_tag,hold2_prio_tag , hold3_prio_tag, hold4_prio_tag;

   wire [0:3] 	 hold1_prio_cmd, hold2_prio_cmd,hold3_prio_cmd, hold4_prio_cmd;

   wire [0:3] 	 instage_adder_cmd, instage_shift_cmd;
   
   wire [0:63] 	 instage_adder_data1, instage_adder_data2, instage_shift_data1, instage_shift_data2, out_adder_data, shift_out_data;
   
   wire [0:1] 	 port1_invalid_tag, port2_invalid_tag, port3_invalid_tag, port4_invalid_tag;

   wire [0:3] 	 prio_adder_cmd, prio_adder_tag, prio_shift_cmd, prio_shift_tag;

   wire [0:31] 	 prio_adder_data1, prio_adder_data2, prio_shift_data1, prio_shift_data2;

   wire [0:31] 	 shiftmux_out_data1, shiftmux_out_data2, shiftmux_out_data3, shiftmux_out_data4;
   
   wire [0:1] 	 shiftmux_out_resp1, shiftmux_out_resp2, shiftmux_out_resp3,shiftmux_out_resp4, shiftmux_out_tag1, shiftmux_out_tag2, shiftmux_out_tag3, shiftmux_out_tag4;
   
   adder adder1( 
		 .alu_cmd(instage_adder_cmd), 
		 .bin_ovfl(out_adder_overflow), 
		 .bin_sum(out_adder_data[0:63]), 
		 .fxu_areg_q(instage_adder_data1) , 
		 .fxu_breg_q(instage_adder_data2)
		 );
   
   alu_input_stage adder_input(
			       .alu_cmd(instage_adder_cmd), 
			       .alu_data1(instage_adder_data1), 
			       .alu_data2(instage_adder_data2) , 
			       .prio_cmd(prio_adder_cmd)  , 
			       .prio_data1(prio_adder_data1), 
			       .prio_data2(prio_adder_data2)
			       );
   
   alu_output_stage adder_output_stage( 
					.a_clk(a_clk), 
					.alu_overflow(out_adder_overflow), 
					.alu_result(out_adder_data), 
					.b_clk(b_clk), 
					.c_clk(c_clk), 
					.out_data1(addmux_out_data1), 
					.out_data2(addmux_out_data2), 
					.out_data3(addmux_out_data3), 
					.out_data4(addmux_out_data4), 
					.out_resp1(addmux_out_resp1), 
					.out_resp2(addmux_out_resp2), 
					.out_resp3(addmux_out_resp3), 
					.out_resp4(addmux_out_resp4), 
					.out_tag1(addmux_out_tag1), 
					.out_tag2(addmux_out_tag2), 
					.out_tag3(addmux_out_tag3), 
					.out_tag4(addmux_out_tag4), 
					.prio_alu_out_vld(prio_adder_out_vld), 
					.prio_alu_tag (prio_adder_tag), 
					.reset(reset), 
					.scan_in(scan_ring5), 
					.scan_out(scan_ring6)
					);
   
   holdreg holdreg1(
		    .a_clk(a_clk), 
		    .b_clk(b_clk), 
		    .c_clk(c_clk), 
		    .hold_data1(hold1_prio_data1), 
		    .hold_data2(hold1_prio_data2), 
		    .hold_prio_req(hold1_prio_cmd), 
		    .hold_prio_tag(hold1_prio_tag), 
		    .req_cmd_in(req1_cmd_in), 
		    .req_data_in(req1_data_in), 
		    .req_tag_in(req1_tag_in), 
		    .reset(reset), 
		    .scan_in(scan_in), 
		    .scan_out(scan_ring1)
		    );
   
   
   holdreg holdreg2(
		    .a_clk(a_clk), 
		    .b_clk(b_clk), 
		    .c_clk(c_clk), 
		    .hold_data1(hold2_prio_data1), 
		    .hold_data2(hold2_prio_data2), 
		    .hold_prio_req(hold2_prio_cmd), 
		    .hold_prio_tag(hold2_prio_tag), 
		    .req_cmd_in(req2_cmd_in), 
		    .req_data_in(req2_data_in), 
		    .req_tag_in(req2_tag_in), 
		    .reset(reset), 
		    .scan_in(scan_in), 
		    .scan_out(scan_ring1)
		    );
   
   holdreg holdreg3(
		    .a_clk(a_clk), 
		    .b_clk(b_clk), 
		    .c_clk(c_clk), 
		    .hold_data1(hold3_prio_data1), 
		    .hold_data2(hold3_prio_data2), 
		    .hold_prio_req(hold3_prio_cmd), 
		    .hold_prio_tag(hold3_prio_tag), 
		    .req_cmd_in(req3_cmd_in), 
		    .req_data_in(req3_data_in), 
		    .req_tag_in(req3_tag_in), 
		    .reset(reset), 
		    .scan_in(scan_in), 
		    .scan_out(scan_ring1)
		    );
   
   holdreg holdreg4(
		    .a_clk(a_clk), 
		    .b_clk(b_clk), 
		    .c_clk(c_clk), 
		    .hold_data1(hold4_prio_data1), 
		    .hold_data2(hold4_prio_data2), 
		    .hold_prio_req(hold4_prio_cmd), 
		    .hold_prio_tag(hold4_prio_tag), 
		    .req_cmd_in(req4_cmd_in), 
		    .req_data_in(req4_data_in), 
		    .req_tag_in(req4_tag_in), 
		    .reset(reset), 
		    .scan_in(scan_in), 
		    .scan_out(scan_ring1)
		    );
   
   mux_out mux_out4(
		    .a_clk(a_clk), 
		    .adder_data(addmux_out_data4), 
		    .adder_resp(addmux_out_resp4), 
		    .adder_tag(addmux_out_tag4), 
		    .b_clk(b_clk), 
		    .c_clk(c_clk), 
		    .invalid_op(port4_invalid_op), 
		    .invalid_op_tag(port4_invalid_tag), 
		    .req_data(out_data4), 
		    .req_resp(out_resp4), 
		    .req_tag(out_tag4), 
		    .reset(reset), 
		    .scan_in(scan_ring11), 
		    .scan_out(scan_out), 
		    .shift_data(shiftmux_out_data4), 
		    .shift_resp(shiftmux_out_resp4), 
		    .shift_tag(shiftmux_out_tag4)
		    );

      mux_out mux_out3(
		       .a_clk(a_clk), 
		       .adder_data(addmux_out_data3), 
		       .adder_resp(addmux_out_resp3), 
		       .adder_tag(addmux_out_tag3), 
		       .b_clk(b_clk), 
		       .c_clk(c_clk), 
		       .invalid_op(port3_invalid_op), 
		       .invalid_op_tag(port3_invalid_tag), 
		       .req_data(out_data3), 
		       .req_resp(out_resp3), 
		       .req_tag(out_tag3), 
		       .reset(reset), 
		       .scan_in(scan_ring10), 
		       .scan_out(scan_ring11), 
		       .shift_data(shiftmux_out_data3), 
		       .shift_resp(shiftmux_out_resp3), 
		       .shift_tag(shiftmux_out_tag3)
		       );

   mux_out mux_out2(
		    .a_clk(a_clk), 
		    .adder_data(addmux_out_data2), 
		    .adder_resp(addmux_out_resp2), 
		    .adder_tag(addmux_out_tag2), 
		    .b_clk(b_clk), 
		    .c_clk(c_clk), 
		    .invalid_op(port2_invalid_op), 
		    .invalid_op_tag(port2_invalid_tag), 
		    .req_data(out_data2), 
		    .req_resp(out_resp2), 
		    .req_tag(out_tag2), 
		    .reset(reset), 
		    .scan_in(scan_ring9), 
		    .scan_out(scan_ring10), 
		    .shift_data(shiftmux_out_data2), 
		    .shift_resp(shiftmux_out_resp2), 
		    .shift_tag(shiftmux_out_tag2)
		    );

      mux_out mux_out1(.
		       a_clk(a_clk), 
		       .adder_data(addmux_out_data1), 
		       .adder_resp(addmux_out_resp1), 
		       .adder_tag(addmux_out_tag1), 
		       .b_clk(b_clk), 
		       .c_clk(c_clk), 
		       .invalid_op(port1_invalid_op), 
		       .invalid_op_tag(port1_invalid_tag), 
		       .req_data(out_data1), 
		       .req_resp(out_resp1), 
		       .req_tag(out_tag1), 
		       .reset(reset), 
		       .scan_in(scan_ring8), 
		       .scan_out(scan_ring9), 
		       .shift_data(shiftmux_out_data1), 
		       .shift_resp(shiftmux_out_resp1), 
		       .shift_tag(shiftmux_out_tag1)
		       );

   priority priority1( 
		       .a_clk(a_clk), 
		       .b_clk(b_clk),  
		       .c_clk(c_clk), 
		       .hold1_cmd(hold1_prio_cmd), 
		       .hold1_data1( hold1_prio_data1), 
		       .hold1_data2(hold1_prio_data2), 
		       .hold1_tag(hold1_prio_tag), 
		       .hold2_cmd(hold2_prio_cmd), 
		       .hold2_data1(hold2_prio_data1), 
		       .hold2_data2(hold2_prio_data2), 
		       .hold2_tag(hold2_prio_tag), 
		       .hold3_cmd(hold3_prio_cmd),
		       .hold3_data1(hold3_prio_data1), 
		       .hold3_data2(hold3_prio_data2), 
		       .hold3_tag(hold3_prio_tag), 
		       .hold4_cmd(hold4_prio_cmd), 
		       .hold4_data1(hold4_prio_data1), 
		       .hold4_data2(hold4_prio_data2),  
		       .hold4_tag(hold4_prio_tag), 
		       .port1_invalid_op(port1_invalid_op), 
		       .port1_invalid_tag(port1_invalid_tag), 
		       .port2_invalid_op(port2_invalid_op), 
		       .port2_invalid_tag(port2_invalid_tag), 
		       .port3_invalid_op(port3_invalid_op), 
		       .port3_invalid_tag(port3_invalid_tag), 
		       .port4_invalid_op(port4_invalid_op), 
		       .port4_invalid_tag(port4_invalid_tag), 
		       .prio_adder_cmd(prio_adder_cmd), 
		       .prio_adder_data1(prio_adder_data1), 
		       .prio_adder_data2(prio_adder_data2), 
		       .prio_adder_out_vld(prio_adder_out_vld), 
		       .prio_adder_tag(prio_adder_tag), 
		       .prio_shift_cmd(prio_shift_cmd), 
		       .prio_shift_data1(prio_shift_data1), 
		       .prio_shift_data2(prio_shift_data2), 
		       .prio_shift_out_vld(prio_shift_out_vld), 
		       .prio_shift_tag(prio_shift_tag), 
		       .reset(reset), 
		       .scan_in(scan_ring4), 
		       .scan_out(scan_ring5)
		       );
   

   shifter shifter1( 
		     .a_clk (a_clk) , 
		     .b_clk(b_clk), 
		     .c_clk(c_clk), 
		     .bin_ovfl(bin_ovfl), 
		     .shift_out(shift_out_data), 
		     .shift_cmd(instage_shift_cmd), 
		     .shift_places(instage_shift_data2), 
		     .shift_val(instage_shift_data1), 
		     .reset(reset), 
		     .scan_in(scan_ring6), 
		     .scan_out(scan_ring7)
		     );

   alu_input_stage shifter_input ( 
				   .alu_cmd(instage_shift_cmd), 
				   .alu_data1(instage_shift_data1), 
				   .alu_data2(instage_shift_data2), 
				   .prio_cmd(prio_shift_cmd), 
				   .prio_data1(prio_shift_data1), 
				   .prio_data2(prio_shift_data2)
				   );

   alu_output_stage shifter_output_stage (
					  .a_clk (a_clk),
					  .alu_overflow ( shift_overflow),
					  .alu_result ( shift_out_data),
					  .b_clk ( b_clk),
					  .c_clk ( c_clk),
					  .out_data1( shiftmux_out_data1),
					  .out_data2(shiftmux_out_data2),
					  .out_data3(shiftmux_out_data3),
					  .out_data4 (shiftmux_out_data4),
					  .out_resp1 (shiftmux_out_resp1),
					  .out_resp2(shiftmux_out_resp2),
					  .out_resp3 ( shiftmux_out_resp3),
					  .out_resp4 ( shiftmux_out_resp4),
					  .out_tag1 ( shiftmux_out_tag1),
					  .out_tag2 ( shiftmux_out_tag2),
					  .out_tag3 ( shiftmux_out_tag3),
					  .out_tag4 ( shiftmux_out_tag4),
					  .prio_alu_out_vld ( prio_shift_out_vld),
					  .prio_alu_tag ( prio_shift_tag),
					  .reset ( reset),
					  .scan_in ( scan_ring7),
					  .scan_out ( scan_ring8)
					  );
   
   
endmodule
 
