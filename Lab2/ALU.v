`include "ALU_1bit_f.v"
`include "ALU_1bit.v"
`include "ALU_1bit_l.v"
`include "or.v"

module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );

  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  wire [31:0] cout;
  wire set;
  wire e = 1'b0;

  ALU_1bit_f alu0(result[0], cout[0], aluSrc1[0], aluSrc2[0], invertA, invertB, operation, e, set);
  ALU_1bit alu1(result[1], cout[1], aluSrc1[1], aluSrc2[1], invertA, invertB, operation, cout[0], e);
  ALU_1bit alu2(result[2], cout[2], aluSrc1[2], aluSrc2[2], invertA, invertB, operation, cout[1], e);
  ALU_1bit alu3(result[3], cout[3], aluSrc1[3], aluSrc2[3], invertA, invertB, operation, cout[2], e);
  ALU_1bit alu4(result[4], cout[4], aluSrc1[4], aluSrc2[4], invertA, invertB, operation, cout[3], e);
  ALU_1bit alu5(result[5], cout[5], aluSrc1[5], aluSrc2[5], invertA, invertB, operation, cout[4], e);
  ALU_1bit alu6(result[6], cout[6], aluSrc1[6], aluSrc2[6], invertA, invertB, operation, cout[5], e);
  ALU_1bit alu7(result[7], cout[7], aluSrc1[7], aluSrc2[7], invertA, invertB, operation, cout[6], e);
  ALU_1bit alu8(result[8], cout[8], aluSrc1[8], aluSrc2[8], invertA, invertB, operation, cout[7], e);
  ALU_1bit alu9(result[9], cout[9], aluSrc1[9], aluSrc2[9], invertA, invertB, operation, cout[8], e);
  ALU_1bit alu10(result[10], cout[10], aluSrc1[10], aluSrc2[10], invertA, invertB, operation, cout[9], e);
  ALU_1bit alu11(result[11], cout[11], aluSrc1[11], aluSrc2[11], invertA, invertB, operation, cout[10], e);
  ALU_1bit alu12(result[12], cout[12], aluSrc1[12], aluSrc2[12], invertA, invertB, operation, cout[11], e);
  ALU_1bit alu13(result[13], cout[13], aluSrc1[13], aluSrc2[13], invertA, invertB, operation, cout[12], e);
  ALU_1bit alu14(result[14], cout[14], aluSrc1[14], aluSrc2[14], invertA, invertB, operation, cout[13], e);
  ALU_1bit alu15(result[15], cout[15], aluSrc1[15], aluSrc2[15], invertA, invertB, operation, cout[14], e);
  ALU_1bit alu16(result[16], cout[16], aluSrc1[16], aluSrc2[16], invertA, invertB, operation, cout[15], e);
  ALU_1bit alu17(result[17], cout[17], aluSrc1[17], aluSrc2[17], invertA, invertB, operation, cout[16], e);
  ALU_1bit alu18(result[18], cout[18], aluSrc1[18], aluSrc2[18], invertA, invertB, operation, cout[17], e);
  ALU_1bit alu19(result[19], cout[19], aluSrc1[19], aluSrc2[19], invertA, invertB, operation, cout[18], e);
  ALU_1bit alu20(result[20], cout[20], aluSrc1[20], aluSrc2[20], invertA, invertB, operation, cout[19], e);
  ALU_1bit alu21(result[21], cout[21], aluSrc1[21], aluSrc2[21], invertA, invertB, operation, cout[20], e);
  ALU_1bit alu22(result[22], cout[22], aluSrc1[22], aluSrc2[22], invertA, invertB, operation, cout[21], e);
  ALU_1bit alu23(result[23], cout[23], aluSrc1[23], aluSrc2[23], invertA, invertB, operation, cout[22], e);
  ALU_1bit alu24(result[24], cout[24], aluSrc1[24], aluSrc2[24], invertA, invertB, operation, cout[23], e);
  ALU_1bit alu25(result[25], cout[25], aluSrc1[25], aluSrc2[25], invertA, invertB, operation, cout[24], e);
  ALU_1bit alu26(result[26], cout[26], aluSrc1[26], aluSrc2[26], invertA, invertB, operation, cout[25], e);
  ALU_1bit alu27(result[27], cout[27], aluSrc1[27], aluSrc2[27], invertA, invertB, operation, cout[26], e);
  ALU_1bit alu28(result[28], cout[28], aluSrc1[28], aluSrc2[28], invertA, invertB, operation, cout[27], e);
  ALU_1bit alu29(result[29], cout[29], aluSrc1[29], aluSrc2[29], invertA, invertB, operation, cout[28], e);
  ALU_1bit alu30(result[30], cout[30], aluSrc1[30], aluSrc2[30], invertA, invertB, operation, cout[29], e);
  ALU_1bit_l alu31(result[31], overflow, aluSrc1[31], aluSrc2[31], invertA, invertB, operation, cout[30], e, set, overflow);
  Or op(zero, result);
endmodule
//
// module testbench();
//     reg [31:0]a, b;
//     reg ia, ib;
//     reg [1:0] op;
//     wire [31:0] res;
//     wire of, zero;
//     ALU alu(res, zero, of, a, b, ia, ib, op);
//     initial begin
//         #20 a = 32'b00000000000000000000000000000010; b = 32'b00000000000000000000000000000111;
//         #20 {ia, ib, op} = {4'b0111};
//         #100 $display($time,, "zero = %b ,result = %b, overflow = %b", zero, res, of);
//
//     end
// endmodule
