`include "env_Calc2_test.sv"
module env_Calc2_top();
bit clk;

always #100 clk=~clk;

logic [5:0] ClkCount = 6'd0;

always @(negedge clk)
begin
     ClkCount = ClkCount + 1'b1;
end


intf i(clk,ClkCount);

calc2_top Calc2DUT(.c_clk(i.clk),.b_clk(1'b0),.a_clk(1'b0),.scan_in(1'b0),.reset(i.resetInt),
		.req1_cmd_in(i.reg1_cmd_in),.req1_data_in(i.reg1_data_in),.req1_tag_in(i.reg1_tag_in),.out_resp1(i.out_resp1),.out_data1(i.out_data1),.out_tag1(i.out_tag1),
		.req2_cmd_in(i.reg2_cmd_in),.req2_data_in(i.reg2_data_in),.req2_tag_in(i.reg2_tag_in),.out_resp2(i.out_resp2),.out_data2(i.out_data2),.out_tag2(i.out_tag2),
		.req3_cmd_in(i.reg3_cmd_in),.req3_data_in(i.reg3_data_in),.req3_tag_in(i.reg3_tag_in),.out_resp3(i.out_resp3),.out_data3(i.out_data3),.out_tag3(i.out_tag3),
		.req4_cmd_in(i.reg4_cmd_in),.req4_data_in(i.reg4_data_in),.req4_tag_in(i.reg4_tag_in),.out_resp4(i.out_resp4),.out_data4(i.out_data4),.out_tag4(i.out_tag4),
		.scan_out(scan_out)
		);

env_Calc2_test testt (i);

endmodule
