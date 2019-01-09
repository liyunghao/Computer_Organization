`include "ALU_1bit.v"

module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );

  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  wire [32:0] cout;
  wire set;
  wire e = 1'b0;
  wire cin;
  wire control;
  wire [1:0]action;
  wire sign1;
  wire sign2;
  assign control = {invertA, invertB, operation};
  assign sign1 = aluSrc1[31] ^ invertA;
  assign sign2 = aluSrc2[31] ^ invertB;
  assign cin = (invertB ^ invertA) ? 1 : 0;
  wire less;
  assign less = (aluSrc1[31] && !aluSrc2[31]) || (!aluSrc1[31] && !aluSrc2[31] &&  (aluSrc1 < aluSrc2)) || (aluSrc1[31] && aluSrc2[31] &&  (aluSrc1 < aluSrc2));
  ALU_1bit alu0(
    result[0],
    cout[1],
    aluSrc1[0],
    aluSrc2[0],
    invertA,
    invertB,
    operation,
    cin,
    less
    );
  generate
    genvar i;
    for (i = 1; i < 32; i = i + 1) begin: start
      ALU_1bit alu1(
        result[i],
        cout[i+1],
        aluSrc1[i],
        aluSrc2[i],
        invertA,
        invertB,
        operation,
        cout[i],
        1'b0
        );
    end
  endgenerate

  assign zero = (result == 32'b0);
  assign overflow = (operation == 2'b10 || operation == 2'b11) ? cout[32] ^ cout[31] : 0;
endmodule

