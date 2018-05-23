module mux16to1(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, s0, s1, s2, s3, f);
    input d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, s0, s1, s2, s3;
    output f;
    wire w1, w2;
    mux8to1 mux0(d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2, w1);
    mux8to1 mux1(d8, d9, d10, d11, d12, d13, d14, d15, s0, s1, s2, w2);
    mux2to1 mux2(w1, w2, s3, f);
endmodule


module mux8to1(d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2, f);
    input d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2;
    output f;
    wire w1, w2;
    mux4to1 mux0(d0, d1, d2, d3, s0, s1, w1);
    mux4to1 mux1(d4, d5, d6, d7, s0, s1, w2);
    mux2to1 mux2(w1, w2, s2, f);
endmodule

module mux4to1(d0, d1, d2, d3, s0, s1, f);
    input d0, d1, d2, d3, s0, s1;
    output f;
    wire w1, w2;
    mux2to1 mux0(d0, d1, s0, w1);
    mux2to1 mux1(d2, d3, s0, w2);
    mux2to1 mux2(w1, w2, s1, f);

endmodule

module mux2to1(d0, d1, s0 , f);
    input d0, d1, s0;
    output f;
    wire w1, w2, w3;

    and (w1, d1, s0);
    not (w2, s0);
    and (w3, w2, d0);
    or(f, w1, w3);
endmodule

// module testbench();
//     reg r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, s0, s1, s2, s3;
//     wire res;
//     mux16to1 mux0(r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, s0, s1, s2, s3,res);
//     initial begin
//         #20 {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15} = {16'b0000001000000001};
//         #20 {s0, s1, s2, s3} = {4'b0110};
//         #100 $display($time,, "result = %b", res);
//     end
// endmodule
