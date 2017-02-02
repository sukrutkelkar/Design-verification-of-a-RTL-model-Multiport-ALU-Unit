module alu_input_stage (alu_data1, alu_data2, prio_cmd, prio_data1, prio_data2, alu_cmd);

   output [0:63] alu_data1, alu_data2;

   input [0:3] 	 prio_cmd, alu_cmd;
   
   input [0:31]  prio_data1, prio_data2;

   assign 	 alu_data1[32:63] = prio_data1[0:31];
   assign 	 alu_data2[32:63] = prio_data2[0:31];

   assign 	 alu_data1[0:31] = 32'b0;
   assign 	 alu_data2[0:31] = 32'b0;

   assign 	 alu_cmd[0:3] = prio_cmd[0:3];
   
endmodule // alu_input_stage
