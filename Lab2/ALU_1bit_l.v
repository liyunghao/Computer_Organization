
module ALU_1bit_l( result, carryOut, a, b, invertA, invertB, operation, carryIn, less, set, overflow);

  output wire result;
  output wire carryOut;
  output wire overflow;
  output wire set;
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  /*your code here*/
  wire f0, f1, f2, f3, f4, f5, f6, zero, one;
  wire [2:0] carryout;
  assign zero = 1'b0;
  assign one = 1'b1;
  wire nb, w1, w2;
  not(nb, b);

  and op2(f0, a, b);
  or op3(f1, a, b);
  Full_adder op0(f2, carryout[0], zero, a, b);
  Full_adder op1(f3, carryout[1], one, a, nb);
  and op4(f4, ~a, ~b);
  or op5(f5, ~a, ~b);
  assign f6 = less;


  wire [3:0] sel =  {invertA, invertB, operation};
  out outsel(f0, f1, f2, f3, f4, f5, f6, sel[0], sel[1], sel[2], sel[3], carryout[0], carryout[1], carryOut, result);
  assign set = result;
endmodule
