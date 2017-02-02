`ifndef env_Calc2_Transaction_sv
`define env_Calc2_Transaction_sv

//Transaction Class
class Transaction;

//Inputs to the Calc 2 Port1
rand logic [0:3] reg1_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
rand logic [0:31] reg1_data_in; // 32 bit input data
rand logic [0:1] reg1_tag_in; // 2 bit tag for the input port

//Inputs to the Calc 2 Port2
rand logic [0:3] reg2_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
rand logic [0:31] reg2_data_in; // 32 bit input data
rand logic [0:1] reg2_tag_in; // 2 bit tag for the input port

//Inputs to the Calc 2 Port3
rand logic [0:3] reg3_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
rand logic [0:31] reg3_data_in; // 32 bit input data
rand logic [0:1] reg3_tag_in; // 2 bit tag for the input port

//Inputs to the Calc 2 Port4
rand logic [0:3] reg4_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
rand logic [0:31] reg4_data_in; // 32 bit input data
rand logic [0:1] reg4_tag_in; // 2 bit tag for the input port


//Outputs from the Calc 2 Port1
logic [0:1] out_resp1; //Response signal shows if the response is one among Good response, Underflow/overflow/Invalid command, internal error and no response
logic [0:31] out_data1;
logic [0:1] out_tag1;

//Outputs from the Calc 2 Port2
logic [0:1] out_resp2; //Response signal shows if the response is one among Good response, Underflow/overflow/Invalid command, internal error and no response
logic [0:31] out_data2;
logic [0:1] out_tag2;

//Outputs from the Calc 2 Port3
logic [0:1] out_resp3; //Response signal shows if the response is one among Good response, Underflow/overflow/Invalid command, internal error and no response
logic [0:31] out_data3;
logic [0:1] out_tag3;

//Outputs from the Calc 2 Port4
logic [0:1] out_resp4; //Response signal shows if the response is one among Good response, Underflow/overflow/Invalid command, internal error and no response
logic [0:31] out_data4;
logic [0:1] out_tag4;

logic scan_out;

//Constraints on Cmd input
constraint cons_cmd1
{
    reg1_cmd_in dist {1:/35,2:/35,5:/15,6:/15}; 
}

//Constraints on Cmd input
constraint cons_cmd2
{
    reg2_cmd_in dist {1:/35,2:/35,5:/15,6:/15}; 
}

//Constraints on Cmd input
constraint cons_cmd3
{
    reg3_cmd_in dist {1:/35,2:/35,5:/15,6:/15}; 
}

//Constraints on Cmd input
constraint cons_cmd4
{
    reg4_cmd_in dist {1:/35,2:/35,5:/15,6:/15}; 
}

//********************************************************************************************
//Constraints on input data
constraint cons_data_in1
{
    reg1_data_in dist {[0:1023]:/50,[1024:1048575]:/30,[1048576:2147483648]:/20}; 
}

//Constraints on input data
constraint cons_data_in2
{
    reg2_data_in dist {[0:1023]:/50,[1024:1048575]:/30,[1048576:2147483648]:/20}; 
}

//Constraints on input data
constraint cons_data_in3
{
    reg3_data_in dist {[0:1023]:/50,[1024:1048575]:/30,[1048576:2147483648]:/20}; 
}

//Constraints on input data
constraint cons_data_in4
{
    reg4_data_in dist {[0:1023]:/50,[1024:1048575]:/30,[1048576:2147483648]:/20}; 
}



endclass
`endif
