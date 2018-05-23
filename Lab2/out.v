`include "mux.v"
module out(f0, f1, f2, f3, f4, f5, f6, s0, s1, s2, s3, of0, of1,  cout, f);
    input f0, f1, f2, f3, f4, f5, f6, s0, s1, s2, s3, of0, of1;
    output f, cout;
    wire e = 1'b0;
    mux16to1 mux0(f0, f1, f2, e, e, e, f3, f6, e, e, e, e, f4, f5, e, e, s0, s1, s2, s3, f);
    mux16to1 mux1(e, e, of0, e, e, e, of1, e, e, e, e, e, e, e, e, e, s0, s1, s2, s3, cout);
    // mux16to1 mux0(f0, f1, f2, e, e, e, f3, e, e, e, e, e, f4, f5, e, e, s0, s1, s2, s3, f);
    // mux16to1 mux1(e, e, of0, e, e, e, of1, e, e, e, e, e, e, e, e, e, s0, s1, s2, s3, cout);
endmodule




/*
0000 and 0 0000
0001 or  1 1000
0010 add 2 0100
0110 sub 6 0110
0111 slt 7 1110
1101 nand 13 1011
1100 nor 12 0011
*/
