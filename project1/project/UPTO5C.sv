module logicblockof5d1(input logic Mo,Q0,Q1,Q2,output logic x);
wire a1,a2,a3,a4,Mb,Q0b,Q1b,Q2b;
not no1(Mb,Mo);
not no2(Q0b,Q0);
not no3(Q1b,Q1);
not no4(Q2b,Q2);
and A1(a1,Mo,Q2,Q1b,Q0b); 
and A2(a2,Mb,Q2b,Q1b,Q0); 
and A3(a3,Mo,Q2b,Q1,Q0); 
and A4(a4,Mb,Q2b,Q1,Q0b);   
or o1(x,a1,a2,a3,a4);
endmodule 

module logicblockof5d2(input logic M,Q0,Q1,Q2,output logic x);
wire a1,a2,a3,a4,a5,Mb,Q0b,Q1b,Q2b;
not no1(Mb,M);
not no2(Q0b,Q0);
not no3(Q1b,Q1);
not no4(Q2b,Q2);
and A1(a1,Q0,Q2,M);
and A2(a2,Q2,Q1,M); 
and A3(a3,Mb,Q2b,Q1,Q0); 
and A4(a4,Mb,Q2,Q0b,Q0b); 
and A5(a5,M,Q2b,Q1b,Q0b);
or o1(x,a1,a2,a3,a4,a5);
endmodule 

module UPTO5C(input logic R,M,clk,
output logic cout,
output logic[0:3] Q,Qbar);
wire y,z;
logicblockof5d1 LB1 (M,Q[0],Q[1],Q[2],y);
logicblockof5d2 LB2 (M,Q[0],Q[1],Q[2],z);
nor n1 (cout,!Q[0],Q[1],!Q[2],R);
d_ff d0 ( Qbar[0],R,clk,Q[0],Qbar[0]);
d_ff d1 ( y,R,clk,Q[1],Qbar[1]);
d_ff d2 ( z,R,clk,Q[2],Qbar[2]);
assign Q[3]='b0;
assign Qbar[3]='b1;
endmodule 
