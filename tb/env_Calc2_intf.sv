interface intf(input bit clk,input logic [5:0] ClkCount); 

logic resetInt;

//Inputs to the Calc 2 Port1
logic [0:3] reg1_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
logic [0:31] reg1_data_in; // 32 bit input data
logic [0:1] reg1_tag_in; // 2 bit tag for the input port

//Inputs to the Calc 2 Port2
logic [0:3] reg2_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
logic [0:31] reg2_data_in; // 32 bit input data
logic [0:1] reg2_tag_in; // 2 bit tag for the input port

//Inputs to the Calc 2 Port3
logic [0:3] reg3_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
logic [0:31] reg3_data_in; // 32 bit input data
logic [0:1] reg3_tag_in; // 2 bit tag for the input port

//Inputs to the Calc 2 Port4
logic [0:3] reg4_cmd_in; // 4 bit Command for ADD, Subtract, Shift 
logic [0:31] reg4_data_in; // 32 bit input data
logic [0:1] reg4_tag_in; // 2 bit tag for the input port


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

//logic [5:0] ClkCount;


modport driver(input clk, output reg1_cmd_in, output reg1_data_in, output reg1_tag_in,
		output reg2_cmd_in, output reg2_data_in, output reg2_tag_in,
		output reg3_cmd_in, output reg3_data_in, output reg3_tag_in,
		output reg4_cmd_in, output reg4_data_in, output reg4_tag_in
		);
modport monitor(input clk, input out_resp1, input out_data1, input out_tag1,
		input out_resp2, input out_data2, input out_tag2,
		input out_resp3, input out_data3, input out_tag3,
		input out_resp4, input out_data4, input out_tag4,
		input scan_out,input ClkCount
		);

endinterface
