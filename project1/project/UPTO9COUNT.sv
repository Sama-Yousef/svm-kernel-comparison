module logicblockof9d1(input logic M,Q0,Q1,Q2,Q3,output logic x);
wire a1,a2,a3,a4,a5,Mb,Q0b,Q1b,Q2b,Q3b;
not no1(Mb,M);
not no2(Q0b,Q0);
not no3(Q1b,Q1);
not no4(Q2b,Q2);
not no5(Q3b,Q3);
and A1(a1,Mb,Q3b,Q1b,Q0);
and A2(a2,Mb,Q3b,Q1,Q0b); 
and A3(a3,M,Q3b,Q1,Q0); 
and A4(a4,M,Q3b,Q2,Q1b,Q0b); 
and A5(a5,M,Q3,Q2b,Q1b,Q0b);
or o1(x,a1,a2,a3,a4,a5);
endmodule 

module logicblockof9d2(input logic M,Q0,Q1,Q2,Q3,output logic x);
wire a1,a2,a3,a4,a5,Mb,Q0b,Q1b,Q2b,Q3b;
not no1(Mb,M);
not no2(Q0b,Q0);
not no3(Q1b,Q1);
not no4(Q2b,Q2);
not no5(Q3b,Q3);
and A1(a1,Mb,Q3b,Q2,Q1b); 
and A2(a2,Q3b,Q2,Q1,Q0b); 
and A3(a3,M,Q3b,Q2,Q0); 
and A4(a4,Mb,Q3b,Q2b,Q1,Q0); 
and A5(a5,M,Q3,Q2b,Q1b,Q0b); 
or o1(x,a1,a2,a3,a4,a5);
endmodule 

module logicblockof9d3(input logic M,Q0,Q1,Q2,Q3,output logic x);
wire a1,a2,a3,a4,a5,a6,Mb,Q0b,Q1b,Q2b,Q3b;
not no1(Mb,M);
not no2(Q0b,Q0);
not no3(Q1b,Q1);
not no4(Q2b,Q2);
not no5(Q3b,Q3);
and A1(a1,M,Q3,Q0 );
and A2(a2,M,Q3,Q1 ); 
and A3(a3,M,Q3,Q2 ); 
and A4(a4,Mb,Q3b,Q2,Q1,Q0 ); 
and A5(a5,Mb,Q3,Q2b,Q1b,Q0b); 
and A6(a6,M,Q3b,Q2b,Q1b,Q0b);
or o1(x,a1,a2,a3,a4,a5,a6);
endmodule 

module UPTO9C(input logic R,M,clk,
output logic cout,
output logic[0:3] Q,Qbar);
wire y,z,l;
logicblockof9d1 LB1 (M,Q[0],Q[1],Q[2],Q[3],y);
logicblockof9d2 LB2 (M,Q[0],Q[1],Q[2],Q[3],z);
logicblockof9d3 LB3 (M,Q[0],Q[1],Q[2],Q[3],l);
nor n1 (cout,!Q[0],Q[1],Q[2],!Q[3],R);
d_ff d0 ( Qbar[0],R,clk,Q[0],Qbar[0]);// d0 always toggles its values there is no need for logic block
d_ff d1 ( y,R,clk,Q[1],Qbar[1]);
d_ff d2 ( z,R,clk,Q[2],Qbar[2]);
d_ff d3 ( l,R,clk,Q[3],Qbar[3]);
endmodule 