`include "env_Calc2_Transaction.sv"

class generator;

Transaction trans;

mailbox gen2driver;

virtual intf i;
int a;

function new(mailbox gen2driver,virtual intf i);
    this.gen2driver = gen2driver;
    this.i=i;
endfunction

task run;
    trans = new();
	//@(negedge i.clk);
	assert(trans.randomize()) else $error("randomization failed");
	gen2driver.put(trans);
	$display ("Time:%d ",$time, "**Generator Values** \n Command is : %d \n Tag is : %d \n Data is : %d \n", trans.reg1_cmd_in, trans.reg1_tag_in, trans.reg1_data_in);
	
	repeat (1)
	 @(negedge i.clk);
	assert(trans.randomize()) else $error("randomization failed");
	gen2driver.put(trans);
	$display ("Time:%d ",$time, "**Generator Values** \n Command is : %d \n Tag is : %d \n Data is : %d \n", trans.reg1_cmd_in, trans.reg1_tag_in, trans.reg1_data_in);

        
endtask

endclass
