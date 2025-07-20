module serielload5(input logic Load,CLK ,output J);//this is a shift register that inverts the signal for each bit ,it will deliver five pulses (0101010101 serial input)if load is high.
 wire A,B,C,D,E,F,G,H,I;
 wire Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib,Jb;
 d_ff d0(1 ,Load,CLK,A,Ab);
 d_ff d1(Ab,Load,CLK,B,Bb);
 d_ff d2(Bb,Load,CLK,C,Cb);
 d_ff d3(Cb,Load,CLK,D,Db);
 d_ff d4(Db,Load,CLK,E,Eb);
 d_ff d5(Eb,Load,CLK,F,Fb);
 d_ff d6(Fb,Load,CLK,G,Gb);
 d_ff d7(Gb,Load,CLK,H,Hb); 
 d_ff d8(Hb,Load,CLK,I,Ib); 
 d_ff d9(Ib,Load,CLK,J,Jb); 

 endmodule 