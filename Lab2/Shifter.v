module Shifter( result, leftRight, shamt, sftSrc  );

  output reg [31:0] result;

  input wire leftRight;
  input wire[4:0] shamt;
  input wire [31:0] sftSrc ;
  reg [31:0] a;
  wire zero = 1'b0;
  //wire sign = sftSrc[31];
  integer i ;
  always @ ( leftRight or shamt or sftSrc ) begin
    a = sftSrc;
      if (leftRight == 0) begin
        for (i = 0; i < shamt; i = i + 1)
        begin
            a[30:0] = a[31:1];
            a[31] = 0;
        end
      end else begin
          for (i = 0; i < shamt; i = i + 1)
          begin
            a[31:1] = a[30:0];
            a[0] = zero;
          end
      end
      result = a;

  end

endmodule
