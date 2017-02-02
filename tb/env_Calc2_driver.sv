`include "env_Calc2_generator.sv"

class driver;

Transaction trans;

mailbox gen2driver;
mailbox driver2sb;

virtual intf.drv i;

function new(mailbox gen2driver, mailbox driver2sb, virtual intf i);
    this.gen2driver = gen2driver;
    this.driver2sb = driver2sb;
    this.i=i;
endfunction

task run;
        //repeat (1)
	//@(negedge i.clk);
	gen2driver.get(trans);
        i.reg1_cmd_in = trans.reg1_cmd_in;
        i.reg1_tag_in = trans.reg1_tag_in;
        i.reg1_data_in = trans.reg1_data_in;

	i.reg2_cmd_in = trans.reg2_cmd_in;
        i.reg2_tag_in = trans.reg2_tag_in;
        i.reg2_data_in = trans.reg2_data_in;

	i.reg3_cmd_in = trans.reg3_cmd_in;
        i.reg3_tag_in = trans.reg3_tag_in;
        i.reg3_data_in = trans.reg3_data_in;

	i.reg4_cmd_in = trans.reg4_cmd_in;
        i.reg4_tag_in = trans.reg4_tag_in;
        i.reg4_data_in = trans.reg4_data_in;
        $display ("Time:%d ",$time, "**Driver Values Clk edge 1** \n Command is : %d \n Tag is : %d \n Data is : %d \n", i.reg1_cmd_in, i.reg1_tag_in, i.reg1_data_in);
        driver2sb.put(trans);
    
    	
		
	repeat (1) 
	@(negedge i.clk);
	gen2driver.get(trans);
        i.reg1_cmd_in = 4'b0000;
        i.reg1_tag_in = 2'b00;
        i.reg1_data_in = trans.reg1_data_in;

	i.reg2_cmd_in = 4'b0000;
        i.reg2_tag_in = 2'b00;
        i.reg2_data_in = trans.reg2_data_in;

	i.reg3_cmd_in = 4'b0000;
        i.reg3_tag_in = 2'b00;
        i.reg3_data_in = trans.reg3_data_in;

	i.reg4_cmd_in = 4'b0000;
        i.reg4_tag_in = 2'b00;
        i.reg4_data_in = trans.reg4_data_in;
		
        $display ("Time:%d ",$time, "**Driver Values Clk edge 2** \n Command is : %d \n Tag is : %d \n Data is : %d \n", i.reg1_cmd_in, i.reg1_tag_in, i.reg1_data_in);
        
	driver2sb.put(trans);
        
endtask

endclass
