module serielload5(input logic load,reset,CLK ,output K);//this is a shift register that inverts the signal for each bit ,it will deliver five pulses (0101010101 serial input)if load is high.
 wire A,B,C,D,E,F,G,H,I,J,rst,loadr;
 wire sigA,sigB,sigC,sigD,sigE,sigF,sigG,sigH,sigI,sigJ;
 wire Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib,Jb,Kb;
 d_ff dl(1,reset,load,loadr);
 or or1(rst,reset,load);
 mux2x1 muxA (sigA,A,Ab,loadr);
 mux2x1 muxB (sigB,B,Bb,loadr);
 mux2x1 muxC (sigC,C,Cb,loadr);
 mux2x1 muxD (sigD,D,Db,loadr);
 mux2x1 muxE (sigE,E,Eb,loadr);
 mux2x1 muxF (sigF,F,Fb,loadr);
 mux2x1 muxG (sigG,G,Gb,loadr); 
 mux2x1 muxH (sigH,H,Hb,loadr); 
 mux2x1 muxI (sigI,I,Ib,loadr);
 mux2x1 muxJ (sigJ,J,Jb,loadr); 

 d_ff d0(0   ,rst,CLK,A,Ab);
 d_ff d1(sigA,rst,CLK,B,Bb);
 d_ff d2(sigB,rst,CLK,C,Cb);
 d_ff d3(sigC,rst,CLK,D,Db);
 d_ff d4(sigD,rst,CLK,E,Eb);
 d_ff d5(sigE,rst,CLK,F,Fb);
 d_ff d6(sigF,rst,CLK,G,Gb);
 d_ff d7(sigG,rst,CLK,H,Hb); 
 d_ff d8(sigH,rst,CLK,I,Ib); 
 d_ff d9(sigI,rst,CLK,J,Jb);
d_ff d10(sigJ,rst,CLK,K,Kb); 
 endmodule 
 