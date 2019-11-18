`timescale 1ns / 1ps

module CLA_tb;

   reg     [3:0] a;
   reg     [3:0] b;
   wire    [3:0] s;
   reg     ci;
   wire    co;

   CLA_top uut (
         .a    (a),
         .b		(b),
         .ci	(ci),
         .co	(co),
         .s	   (s)
         );

 
   
   initial begin
      $dumpfile("CLA_top.vcd");
      $dumpvars();
      
      a = 5;
      b = 2;

      #10

      a = 4;
      b = 5;

      #10
      $finish;

   end
   
   

endmodule

