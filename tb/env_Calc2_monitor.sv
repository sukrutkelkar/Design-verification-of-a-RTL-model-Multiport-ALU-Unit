`ifndef env_Calc2_monitor_sv
`define env_Calc2_monitor_sv
`include "env_Calc2_Transaction.sv"

class monitor;

Transaction trans;

mailbox monitor2sb;

virtual intf.monitor i;

function new(mailbox monitor2sb, virtual intf i);
    this.monitor2sb = monitor2sb;
    this.i=i;
endfunction

task run;
    trans = new();
    
    //repeat (4) @(negedge i.clk)
    //if ((i.ClkCount%4)==0)
	//begin
	trans.out_resp1 = i.out_resp1;
    	trans.out_data1 = i.out_data1;
    	trans.out_tag1 = i.out_tag1;

    	trans.out_resp2 = i.out_resp2;
    	trans.out_data2 = i.out_data2;
    	trans.out_tag2 = i.out_tag2;

    	trans.out_resp3 = i.out_resp3;
    	trans.out_data3 = i.out_data3;
    	trans.out_tag3 = i.out_tag3;
	
    	trans.out_resp4 = i.out_resp4;
    	trans.out_data4 = i.out_data4;
    	trans.out_tag4 = i.out_tag4;

    	$display ("Time:%d ",$time, "**Monitor Values** \n Response is : %d \n Tag is : %d \n Data is : %d \n", trans.out_resp1, trans.out_tag1, trans.out_data1);
    
    	monitor2sb.put(trans);
	
    	trans.scan_out = i.scan_out;
	//end
    
endtask
endclass
`endif //env_Calc2_monitor_sv