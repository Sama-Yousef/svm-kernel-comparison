module MIN_SEC_COUNTER(
input logic MODE,START,CLOCK,clk1s,RST,LOAD,
output logic [3:0] HEX3 , HEX2 , HEX1, HEX0);//MODE is high when counting down and low when counting down
//HEX0 is ones of secounds (HEX0[0] is least signifcant bit and HEX0[3] is most signifcant bit), HEX1 is tens of secounds,HEX2 is ones of minutes,HEX3 is tens of minutes  
wire out1,out2,out3,out4,C1,C2,C3,AGCLK,OGCLK,LOAD1;
ANDGCLK A1(AGCLK,RST,START,clk1s);

UPTO9C SEC_ONES(RST,MODE,AGCLK,out1,HEX0);//wire out1 gets a signal instanteously when the each couter reaches the maximum number
d_ff d0(out1,RST,AGCLK,C1);//wire C1 get the signals from out1 after one clock cycle(1sec)


UPTO5C SEC_TENS(RST,MODE,C1,out2,HEX1);
d_ff d1(out2,RST,AGCLK,C2);

serielload5 load5min(LOAD,RST,CLOCK,LOAD1);//wire LOAD1 gets 5 pulses when LOAD is high
or g1(OGCLK,LOAD1,C2);//OGCLK is the clock of the tens of minutes counter it will be high if LOAD1 is high or the previous counter reached maximum number


UPTO9C MIN_ONES(RST,MODE,OGCLK,out3,HEX2);
d_ff d2(out3,RST,AGCLK,C3);

UPTO5C MIN_TENS(RST,MODE,C3,out4,HEX3);//wire out4 is useless
endmodule

