`include "Full_adder.v"
`include "out.v"
module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less );

  output wire result;
  output wire carryOut;

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
  wire nb;
  not(nb, b);

  and op2(f0, a, b);
  or op3(f1, a, b);
  Full_adder op0(f2, carryout[0], carryIn, a, b);
  Full_adder op1(f3, carryout[1], carryIn, a, nb);
  and op4(f4, ~a, ~b);
  or op5(f5, ~a, ~b);
  assign f6 = less;
  wire [3:0] sel =  {invertA, invertB, operation};
  out outsel(f0, f1, f2, f3, f4, f5, f6,  sel[0], sel[1], sel[2], sel[3], carryout[0], carryout[1], carryOut, result);

endmodule

// module testbench();
//      reg a, b, ia, ib,less, cin;
//     reg [1:0] op;
//     reg [3:0] sel;
//     wire res, cout;
//     ALU_1bit alu(res, cout, a, b, ia, ib, op, cin, less);
//     initial begin
//         {ia, ib, op, a, b, less, cin} = {8'b01101000};
//         sel = {ia, ib, op};
//         $display("sel[2] = %b\n", sel[2]);
//         #100 $display($time,,"result = %b, cout = %b , a = %b, b = %b\n", res, cout, a, b);
//         {ia, ib, op, a, b, less, cin} = {8'b01100100};
//         #100 $display($time,,"result = %b, cout = %b , a = %b, b = %b\n", res, cout, a, b);
//         {ia, ib, op, a, b, less, cin} = {8'b01100000};
//         #100 $display($time,,"result = %b, cout = %b , a = %b, b = %b\n", res, cout, a, b);
//         {ia, ib, op, a, b, less, cin} = {8'b01101100};
//         #100 $display($time,,"result = %b, cout = %b , a = %b, b = %b\n", res, cout, a, b);
//     end
//
// endmodule
