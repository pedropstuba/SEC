module test_ex1 (
                  input clk,
                  input [3:0] a,
                  output signed [11:0] c
                  );

   signed reg [7:0]                  y;

   always @(posedge clk) begin 
        y <= a*a;
        c  <= y*a;
   end

endmodule // test_ex1

module elevatres_tb;

   reg     [3:0] a;
   reg           clk;
   output signed [11:0] c;
      
   initial begin
      
      clk = 1;
      a = 2;
      

   end // initial begin
   always #10 clk = ~clk;
   
endmodule

