`ifndef env_Calc2_environment_sv
`define env_Calc2_environment_sv
`include "env_Calc2_Scoreboard.sv"
`include "env_Calc2_monitor.sv"

class environment;
mailbox gen2driver;
mailbox driver2sb;
mailbox monitor2sb;

virtual intf i;

generator g1;
driver d1;
monitor m1;
Scoreboard s1;

function new(virtual intf i);
    this.i=i;
endfunction

function void build();
fork                   //So that every thing is built parallely
    gen2driver=new();
    g1=new(gen2driver,i);

    driver2sb=new();
    d1=new(gen2driver,driver2sb,i);

    monitor2sb=new();
    m1= new(monitor2sb,i);

    s1= new(driver2sb,monitor2sb);
join
endfunction

task run;
fork
    g1.run();
    d1.run();
    
    //if ((i.ClkCount%4)==0)
	//begin
		m1.run();
		s1.run();
	//end
    
join
endtask
/******************************************************************************************/
task reset();
int count;
$display($time,"***********RESET STARTS HERE****************************\n");

i.resetInt = 1'b1;

i.reg1_cmd_in = 4'b0; // 4 bit Command for ADD, Subtract, Shift 
i.reg1_data_in = 32'b0; // 32 bit input data
i.reg1_tag_in = 2'b0; 

i.reg2_cmd_in = 4'b0; // 4 bit Command for ADD, Subtract, Shift 
i.reg2_data_in = 32'b0; // 32 bit input data
i.reg2_tag_in = 2'b0; 

i.reg3_cmd_in = 4'b0; // 4 bit Command for ADD, Subtract, Shift 
i.reg3_data_in = 32'b0; // 32 bit input data
i.reg3_tag_in = 2'b0; 

i.reg4_cmd_in = 4'b0; // 4 bit Command for ADD, Subtract, Shift 
i.reg4_data_in = 32'b0; // 32 bit input data
i.reg4_tag_in = 2'b0; 

repeat (3) @(negedge i.clk);
i.resetInt = 1'b0;
$display($time,"***********RESET ENDS HERE****************************\n");

endtask

endclass
`endif