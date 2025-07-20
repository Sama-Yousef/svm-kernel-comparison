module STOPWATCH_TB;//to correctly run the testbench got Disp_hex_mux file  uncomment line 12 and comment line 11 and got to file MAINFSM uncomment line 144 and comment line 143 (those clocks are to long work with)
logic MCLK,MR,ML,MS,MM;
wire [7:0] SEG7;
wire [3:0] ENSEG;
STOPWATCH teststopwatch( MCLK,MR,ML,MS,MM,SEG7,ENSEG);
always #1 MCLK= ~MCLK;

initial begin
MCLK= 0;   
MR=1;//Reset the counter
ML=0;
MS=0;
MM=0;
#100 
MR=0;//start counting up
ML=0;
MS=1;
MM=0;
#10000
MR=0; //show error code
ML=0;
MS=1;
MM=1;
#10000
MR=1; //reset to get out of error
ML=0;
MS=0;
MM=0;
#10000
MR=0; //start counting up again
ML=0;
MS=1;
MM=0;
#10000
MR=1; //reset
ML=0;
MS=0;
MM=0;
#10000
MR=0; //stop
ML=0;
MS=0;
MM=0;
#10000
MR=0; // start counting down
ML=0;
MS=1;
MM=1;
#10000
MR=0; //stop
ML=0;
MS=0;
MM=1;
#10000
MR=0; //push load 5min
ML=1;
MS=0;
MM=1;
#10000
MR=0; // start loading 5min (load will not strat till the user removes their finger).
ML=0;
MS=0;
MM=1;
#10000;
$stop;
 end
endmodule 