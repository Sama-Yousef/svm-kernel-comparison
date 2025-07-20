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
endmodule

module clkdiv(reset, clock_in, clock_out);
input logic clock_in; // input clock on FPGA
input logic reset;
output logic clock_out; // output clock after dividing the input clock by divisor
logic [27:0] counter=28'd0;
//parameter DIVISOR = 28'd50000000; //real
parameter DIVISOR = 28'd50; //simulation
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clock_in, posedge reset)
begin
		if (reset == 1'b1)
			counter = 28'd0;
		else begin
			counter <= counter + 28'd1;
		if(counter>=(DIVISOR-1))
			counter <= 28'd0;
		clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
		end
end
endmodule