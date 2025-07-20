
module mux2x1(output logic Y, input logic A, B, Sel);
wire nSel, nSel_A, Sel_B;
not no1(nSel,Sel);
and a1 (nSel_A,nSel,A);
and a2 (Sel_B,Sel,B);
or o1  (Y, nSel_A,Sel_B);
endmodule

module Todisplay(input logic IsErr,
input logic [3:0] COUNT0,COUNT1,COUNT2,COUNT3,ERROR0,ERROR1,ERROR2,ERROR3,
output logic [3:0] SVNSG0,SVNSG1,SVNSG2,SVNSG3);

mux2x1 mymux00(SVNSG0[0],COUNT0[0],ERROR0[0],IsErr);
mux2x1 mymux01(SVNSG0[1],COUNT0[1],ERROR0[1],IsErr);
mux2x1 mymux02(SVNSG0[2],COUNT0[2],ERROR0[2],IsErr);
mux2x1 mymux03(SVNSG0[3],COUNT0[3],ERROR0[3],IsErr);

mux2x1 mymux10(SVNSG1[0],COUNT1[0],ERROR1[0],IsErr);
mux2x1 mymux11(SVNSG1[1],COUNT1[1],ERROR1[1],IsErr);
mux2x1 mymux12(SVNSG1[2],COUNT1[2],ERROR1[2],IsErr);
mux2x1 mymux13(SVNSG1[3],COUNT1[3],ERROR1[3],IsErr);

mux2x1 mymux20(SVNSG2[0],COUNT2[0],ERROR2[0],IsErr);
mux2x1 mymux21(SVNSG2[1],COUNT2[1],ERROR2[1],IsErr);
mux2x1 mymux22(SVNSG2[2],COUNT2[2],ERROR2[2],IsErr);
mux2x1 mymux23(SVNSG2[3],COUNT2[3],ERROR2[3],IsErr);

mux2x1 mymux30(SVNSG3[0],COUNT3[0],ERROR3[0],IsErr);
mux2x1 mymux31(SVNSG3[1],COUNT3[1],ERROR3[1],IsErr);
mux2x1 mymux32(SVNSG3[2],COUNT3[2],ERROR3[2],IsErr);
mux2x1 mymux33(SVNSG3[3],COUNT3[3],ERROR3[3],IsErr);

endmodule
/*
module MAINFSM(input logic clk,reset,S,M,L,output logic RSTN,MODE,LOAD,STRT,EROR,
output logic [0:3] ERR0,ERR1,ERR2,ERR3);

typedef enum {save,load,up,down,er1,er2} state_type; 
state_type state_current , state_next ;

always_ff @(posedge clk, posedge reset)
	if (reset) 
		state_current <= save ;
	else
		state_current <= state_next ;
	

always_comb
begin
	state_next = state_current;
	ERR0= 4'b0000;
	ERR1= 4'b0000;
	ERR2= 4'b0000;
	ERR3= 4'b0000;
	EROR= 1'b0;
	RSTN= 1'b0;
	MODE= 1'b0;
	LOAD= 1'b0;
	STRT= 1'b0;
	case (state_current)
		save:
			begin
				ERR0= 4'b0000;
				ERR1= 4'b0000;
				ERR2= 4'b0000;
				ERR3= 4'b0000;
				EROR= 1'b0;
				RSTN= 1'b0;
				MODE= 1'b0;
				LOAD= 1'b0;
				STRT= 1'b0;
			
			if (L)
				state_next = load;
			else if (~S)
				state_next = save;
			else if (M)
				state_next = down;
			else 
				state_next = up;
			end
		load:
			begin
				ERR0= 4'b0000;
				ERR1= 4'b0000;
				ERR2= 4'b0000;
				ERR3= 4'b0000;
				EROR= 1'b0;
				RSTN= 1'b0;
				MODE= 1'b0;
				LOAD= 1'b1;
				STRT= 1'b0;
				if (~S)
					state_next = save;
				else if (M)
					state_next = down;
				else 
					state_next = up;
			end
		up  :
			begin
				ERR1= 4'b0000;
				ERR2= 4'b0000;
				ERR3= 4'b0000;
				EROR= 1'b0;
				RSTN= 1'b0;
				MODE= 1'b0;
				LOAD= 1'b0;
				STRT= 1'b1;
				if (~S)
					state_next = save;
				else if(M)
					state_next = er1;
				else if (L)
					state_next = er2;
				else 
					state_next = up;
			end
		down:
			begin
				ERR0= 4'b0000;
				ERR1= 4'b0000;
				ERR2= 4'b0000;
				ERR3= 4'b0000;
				EROR= 1'b0;
				RSTN= 1'b0;
				MODE= 1'b1;
				LOAD= 1'b0;
				STRT= 1'b1;
				if (~S)
					state_next = save;
				else if(~M)
					state_next = er1;
				else if (L)
					state_next = er2;
				else 
					state_next = down;			
			end
		er1:
			begin
				
				ERR0= 4'b0001;
				ERR1= 4'b0000;
				ERR2= 4'b1100;
				ERR3= 4'b1110;
				EROR= 1'b1;
				RSTN= 1'b1;
				MODE= 1'b0;
				LOAD= 1'b0;
				STRT= 1'b0;
				state_next=er1;
			end
		er2:
			begin
				ERR0= 4'b0010;
				ERR1= 4'b0000;
				ERR2= 4'b1100;
				ERR3= 4'b1110;
				EROR= 1'b1;
				RSTN= 1'b1;
				MODE= 1'b0;
				LOAD= 1'b0;
				STRT= 1'b0;
				state_next=er2;
			end
		default: 
			state_next = save;
	endcase
end
endmodule*/
