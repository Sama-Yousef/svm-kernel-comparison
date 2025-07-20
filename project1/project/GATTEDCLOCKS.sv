module ANDGCLK (output logic gclk,input logic R, en,clk);
wire enbl;
d_ff DFF1(en,R,!clk,enbl);// to prevent very short pulses a d flip flop is used to time the enable signal 
and A1(gclk,enbl,clk);
endmodule


