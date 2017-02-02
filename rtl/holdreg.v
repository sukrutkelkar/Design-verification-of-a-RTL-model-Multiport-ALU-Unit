module holdreg(hold_data1, hold_data2, hold_prio_req, hold_prio_tag, scan_out, req_cmd_in, req_data_in, req_tag_in, reset, scan_in, a_clk, b_clk, c_clk);

   input a_clk, b_clk, c_clk, scan_in;
   input [0:3] req_cmd_in;
   input       reset;
   input [0:31] req_data_in;
   input [0:1] 	req_tag_in;
   
   output scan_out;
   output [0:3] hold_prio_req;
   output [0:1] hold_prio_tag;
   output [0:31] hold_data1, hold_data2;
 
   
   reg [0:3] 	 cmd_hold, cmd_hold_buf;
   wire [0:3] 	 cmd_hold_q;
   reg [0:31] 	 hold_data1_q, hold_data2_q;
   reg [0:1] 	 tag_hold, tag_hold_buf;
   
   
   always 
     @ (negedge c_clk) begin
//	fork
	   cmd_hold <= (reset) ?  4'b0 : req_cmd_in;
	   cmd_hold_buf <= (reset) ? 4'b0 : cmd_hold;
	   tag_hold <= (reset) ? 2'b0 : req_tag_in;
	   tag_hold_buf <= (reset) ? 2'b0 : tag_hold;
	//$display("**************************************HOLDREG********************************************\n cmd_hold_buf%d,tag_hold_buf:%d\n",cmd_hold_buf,tag_hold_buf);
//	join
     end

   always
     @ (negedge c_clk) begin
	//fork
	   hold_data1_q <= 
			   (reset) ? 32'b0 :
			   (req_cmd_in != 4'b0) ? req_data_in :
			   hold_data1_q;

	   hold_data2_q <=
			  (reset) ? 32'b0 :
			  (cmd_hold != 4'b0) ? req_data_in :
			  hold_data2_q;
	//$display("**************************************HOLDREG********************************************\n hold_data1_q%d,hold_data2_q:%d\n",hold_data1_q,hold_data2_q);
//	join
     end // always @ (negedge c_clk)

   assign hold_data1 = hold_data1_q;
   assign hold_data2 = hold_data2_q;
   assign hold_prio_req = cmd_hold_buf;
   assign hold_prio_tag = tag_hold_buf;
      
endmodule // holdreg

/*
 module hold_test;
   
   reg a_clk, b_clk, c_clk, scan_in;
   
   
   reg [0:3] req_cmd_in;
   
   reg [1:7] reset;
   
   reg [0:31] req_data_in;
   
   
   wire scan_out;
   wire [0:3] hold_prio_req;
   wire [0:31] hold_data1, hold_data2;

   holdreg H1(hold_data1, hold_data2, hold_prio_req, scan_out, a_clk, b_clk, c_clk, req_cmd_in, req_data_in, reset, scan_in);

   initial c_clk = 1'b0;
   always #100 c_clk = ~c_clk;
	
   initial
     begin

	req_cmd_in = 0;
	req_data_in = 0;
	reset[1] = 0;
	
	#600 req_cmd_in = 1;
	req_data_in = 10;
	#200 req_data_in=12;
	#200 req_cmd_in = 2;
	req_data_in = 15;

	#200 req_data_in=20;
	#200 req_cmd_in=3;
	req_data_in = 25;
	#200 req_data_in=5;
	#200 reset[1] = 1;
	req_data_in=17;
	#200 req_data_in=13;
	#400 reset[1] = 0;
	#200 req_cmd_in = 5;
	req_data_in={25'b0,2'b1,5'b00110};
	#200 $stop;
 
     end // initial begin
   
   always
     @ (reset or c_clk or  req_cmd_in or req_data_in) begin
	
	$display("at time %t, res=%d, reqcmd=%b, reqdata=%d, hold1=%d, hold2=%d, hold_req=%b", $time, reset[1], req_cmd_in, req_data_in, hold_data1, hold_data2, hold_prio_req);
	
	
     end
   
	
endmodule // hold_test
*/
   
