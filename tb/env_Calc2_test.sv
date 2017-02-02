`include "env_Calc2_environment.sv"

program env_Calc2_test(intf i);

environment en;
initial 
begin

    en=new(i);
    en.build();
    en.reset();

repeat(10000)
begin
repeat (1) @ (negedge i.clk)
    en.run();
end
end
endprogram
