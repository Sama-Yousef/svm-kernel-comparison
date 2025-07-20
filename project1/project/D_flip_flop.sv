
module d_ff(
 input d,
 input rstn,
 input clk,
 output logic q,
 output logic qbar);
d_ff1 mydff (d,0,clk,rstn,q,qbar);
endmodule

module d_ff1(d,set,clk,rest,q,qbar);
input logic d,set,rest,clk;
output logic q,qbar;

not d2(restb,rest);
not d3(setb,set);
nand n1(t1,t2,t4,setb);
nand n2(t2,t1,clk,restb);
nand n3(t3,t4,clk,t2);
nand n4(t4,d,restb,t3);
nand n5(q,setb,t2,qbar);
nand n6(qbar,q,t3,restb);
endmodule