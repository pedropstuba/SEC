

module adder_tb;

 // Inputs
 reg [31:0] a;
 reg [31:0] b;
 // Outputs
 wire [31:0] result;


 N_bit_adder uut (
  .a(4), 
  .b(2), 
  .result (resolt)
 );
   

endmodule

