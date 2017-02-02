`ifndef env_Calc2_Scoreboard_sv
`define env_Calc2_Scoreboard_sv
`include "env_Calc2_driver.sv"
`include "env_Calc2_monitor.sv"
`include "env_Calc2_Transaction.sv"

class Scoreboard;
Transaction trans1,trans2;

mailbox monitor2sb;
mailbox driver2sb;

function new(mailbox driver2sb, mailbox monitor2sb);
    this.driver2sb = driver2sb;
    this.monitor2sb = monitor2sb;
endfunction

task run;
    logic [0:31] temp_data_OpA1,temp_data_OpB1;
    logic [0:31] temp_data_OpA2,temp_data_OpB2;
    logic [0:31] temp_data_OpA3,temp_data_OpB3;
    logic [0:31] temp_data_OpA4,temp_data_OpB4;
    
    logic [0:1] temp_Tag1;
    logic [0:1] temp_Tag2;
    logic [0:1] temp_Tag3;
    logic [0:1] temp_Tag4;

    logic [0:3] temp_Cmd1;
    logic [0:3] temp_Cmd2;
    logic [0:3] temp_Cmd3;
    logic [0:3] temp_Cmd4;
    
    driver2sb.get(trans2);
    
    temp_data_OpA1 = trans2.reg1_data_in;
    temp_Tag1 = trans2.reg1_tag_in;
    temp_Cmd1 = trans2.reg1_cmd_in;

    temp_data_OpA2 = trans2.reg2_data_in;
    temp_Tag2 = trans2.reg2_tag_in;
    temp_Cmd2 = trans2.reg2_cmd_in;

    temp_data_OpA3 = trans2.reg3_data_in;
    temp_Tag3 = trans2.reg3_tag_in;
    temp_Cmd3 = trans2.reg3_cmd_in;

    temp_data_OpA4 = trans2.reg4_data_in;
    temp_Tag4 = trans2.reg4_tag_in;
    temp_Cmd4 = trans2.reg4_cmd_in;
    
    
    driver2sb.get(trans2);
    temp_data_OpB1 = trans2.reg1_data_in;
    temp_data_OpB2 = trans2.reg2_data_in;
    temp_data_OpB3 = trans2.reg3_data_in;
    temp_data_OpB4 = trans2.reg4_data_in;

$display("Time:%d ",$time,"**This is the value we get from driver at scoreboard 1) Data A = %d, 2) Data B = %d  (Driver -> scoreboard)\n",temp_data_OpA1,temp_data_OpB1);

    
    monitor2sb.get(trans1);

$display("Time:%d ",$time,"**This is the value we get from monitor at scoreboard 1) Response = %d, 2) Data Out = %d, 3) Tag Out = %d  \n (Driver -> scoreboard)\n",trans1.out_resp1,trans1.out_data1,trans1.out_tag1);

//____________ASSERTION Port 1_____________________//
assert((trans1.out_resp1!==1'bx)&&(trans1.out_data1!==32'bx)&&(trans1.out_tag1!==32'bx)) else $error (" Port 1 Initialization failure! undefined values propagated \n");

//____________ASSERTION Port 2_____________________//
assert((trans1.out_resp2!==1'bx)&&(trans1.out_data2!==32'bx)&&(trans1.out_tag2!==32'bx)) else $error (" Port 2 Initialization failure! undefined values propagated \n");

//____________ASSERTION Port 3_____________________//
assert((trans1.out_resp3!==1'bx)&&(trans1.out_data3!==32'bx)&&(trans1.out_tag3!==32'bx)) else $error (" Port 3 Initialization failure! undefined values propagated \n");

//____________ASSERTION Port 4_____________________//
assert((trans1.out_resp4!==1'bx)&&(trans1.out_data4!==32'bx)&&(trans1.out_tag4!==32'bx)) else $error (" Port 4 Initialization failure! undefined values propagated \n");



//*************************************************************Port 1****************************************************************
case(temp_Cmd1)
    4'b0001: begin
                trans2.out_data1 = temp_data_OpA1 + temp_data_OpB1;
                trans2.out_tag1 = temp_Tag1;
                
                if ((trans2.out_data1 == trans1.out_data1)&& (trans2.out_tag1 == trans1.out_tag1))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp1);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp1);
             end

    4'b0010: begin
                trans2.out_data1 = temp_data_OpA1 - temp_data_OpB1;
                trans2.out_tag1 = temp_Tag1;
                
                if ((trans2.out_data1 == trans1.out_data1)&& (trans2.out_tag1 == trans1.out_tag1))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp1);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp1);
             end

    4'b0101: begin
                trans2.out_data1 = temp_data_OpA1 << temp_data_OpB1;
                trans2.out_tag1 = temp_Tag1;
                
                if ((trans2.out_data1 == trans1.out_data1)&& (trans2.out_tag1 == trans1.out_tag1))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp1);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp1);
             end
    
    4'b0110: begin
                trans2.out_data1 = temp_data_OpA1 >> temp_data_OpB1;
                trans2.out_tag1 = temp_Tag1;
                
                if ((trans2.out_data1 == trans1.out_data1)&& (trans2.out_tag1 == trans1.out_tag1))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp1);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp1);
             end
    
    default: begin
                trans2.out_data1 = trans2.out_data1;
                trans2.out_tag1 = trans2.out_tag1;
                
                $display ("**Scoreboard** \n Default case ententered due to invalid command \n");
             end
endcase
//*************************************************************Port 2****************************************************************
case(temp_Cmd2)
    4'b0001: begin
                trans2.out_data2 = temp_data_OpA2 + temp_data_OpB2;
                trans2.out_tag2 = temp_Tag2;
                
                if ((trans2.out_data2 == trans1.out_data2)&& (trans2.out_tag2 == trans1.out_tag2))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp2);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp2);
             end

    4'b0010: begin
                trans2.out_data2 = temp_data_OpA2 - temp_data_OpB2;
                trans2.out_tag2 = temp_Tag2;
                
                if ((trans2.out_data2 == trans1.out_data2)&& (trans2.out_tag2 == trans1.out_tag2))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp2);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp2);
             end

    4'b0101: begin
                trans2.out_data2 = temp_data_OpA2 << temp_data_OpB2;
                trans2.out_tag2 = temp_Tag2;
                
                if ((trans2.out_data2 == trans1.out_data2)&& (trans2.out_tag2 == trans1.out_tag2))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp2);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp2);
             end
    
    4'b0110: begin
                trans2.out_data2 = temp_data_OpA2 >> temp_data_OpB2;
                trans2.out_tag2 = temp_Tag2;
                
                if ((trans2.out_data2 == trans1.out_data2)&& (trans2.out_tag2 == trans1.out_tag2))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp2);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp2);
             end
    
    default: begin
                trans2.out_data2 = trans2.out_data2;
                trans2.out_tag2 = trans2.out_tag2;
                
                $display ("**Scoreboard** \n Default case ententered due to invalid command \n");
             end
endcase
//*************************************************************Port 3****************************************************************
case(temp_Cmd3)
    4'b0001: begin
                trans2.out_data3 = temp_data_OpA3 + temp_data_OpB3;
                trans2.out_tag3 = temp_Tag3;
                
                if ((trans2.out_data3 == trans1.out_data3)&& (trans2.out_tag3 == trans1.out_tag3))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp3);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp3);
             end

    4'b0010: begin
                trans2.out_data3 = temp_data_OpA3 - temp_data_OpB3;
                trans2.out_tag3 = temp_Tag3;
                
                if ((trans2.out_data3 == trans1.out_data3)&& (trans2.out_tag3 == trans1.out_tag3))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp3);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp3);
             end

    4'b0101: begin
                trans2.out_data3 = temp_data_OpA3 << temp_data_OpB3;
                trans2.out_tag3 = temp_Tag3;
                
                if ((trans2.out_data3 == trans1.out_data3)&& (trans2.out_tag3 == trans1.out_tag3))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp3);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp3);
             end
    
    4'b0110: begin
                trans2.out_data3 = temp_data_OpA3 >> temp_data_OpB3;
                trans2.out_tag3 = temp_Tag3;
                
                if ((trans2.out_data3 == trans1.out_data3)&& (trans2.out_tag3 == trans1.out_tag3))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp3);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp3);
             end
    
    default: begin
                trans2.out_data3 = trans2.out_data3;
                trans2.out_tag3 = trans2.out_tag3;
                
                $display ("**Scoreboard** \n Default case ententered due to invalid command \n");
             end
endcase
//*************************************************************Port 4****************************************************************
case(temp_Cmd4)
    4'b0001: begin
                trans2.out_data4 = temp_data_OpA4 + temp_data_OpB4;
                trans2.out_tag4 = temp_Tag4;
                
                if ((trans2.out_data4 == trans1.out_data4)&& (trans2.out_tag4 == trans1.out_tag4))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp4);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp4);
             end

    4'b0010: begin
                trans2.out_data4 = temp_data_OpA4 - temp_data_OpB4;
                trans2.out_tag4 = temp_Tag4;
                
                if ((trans2.out_data4 == trans1.out_data4)&& (trans2.out_tag4 == trans1.out_tag4))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp4);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp4);
             end

    4'b0101: begin
                trans2.out_data4 = temp_data_OpA4 << temp_data_OpB4;
                trans2.out_tag4 = temp_Tag4;
                
                if ((trans2.out_data4 == trans1.out_data4)&& (trans2.out_tag4 == trans1.out_tag4))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp4);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp4);
             end
    
    4'b0110: begin
                trans2.out_data4 = temp_data_OpA4 >> temp_data_OpB4;
                trans2.out_tag4 = temp_Tag4;
                
                if ((trans2.out_data4 == trans1.out_data4)&& (trans2.out_tag4 == trans1.out_tag4))
                    $display ("**Scoreboard** \n The output is correct, Output Response is: %b \n", trans2.out_resp4);
                else
                    $display ("**Scoreboard** \n Error: The output is Incorrect, Output Response is: %b \n", trans2.out_resp4);
             end
    
    default: begin
                trans2.out_data4 = trans2.out_data4;
                trans2.out_tag4 = trans2.out_tag4;
                
                $display ("**Scoreboard** \n Default case ententered due to invalid command \n");
             end
endcase

endtask
endclass
`endif
