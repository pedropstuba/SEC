module Divider(
    input [3:0]      D,
    input [3:0]      d,
    input 	     start,
    input 	     rst,
    input 	     clk,
    output reg 	     dd,
    output reg 	     r,
    output reg [3:0] DD,
    output [3:0]     q,
    output reg [7:0] RD
);

   reg 	     qq;
  
   

always@(posedge clk)
  if(rst)
    dd<=0;
  else if(start)
    dd<=d;


always@*
  if(DD>d) begin
     r = DD - d;
     qq = 1;
  end
  else begin
     r = DD;
     qq = 0;
  end


always@(posedge clk)
  if(rst)
    DD <= 0;
  else if(start)
    DD <= D;
  else
    RD <= {r,D[2:0],q};

endmodule

module Divider_tb;

   reg     [3:0] D;
   reg     [3:0] d;
   reg 		 start;
   reg 		 rst;
   reg           clk;
   wire    [3:0] q;
   


   Divider uut (
	 .clk(clk),
         .D     (D),
         .d     (d),
	 .start (start),
	 .rst   (rst),	
	 .q     (q)	
         );

 
   
   initial begin
      $dumpfile("Divider.vcd");
      $dumpvars();
      
      clk = 1;
      start = 1;
      rst = 0;
      
      D = 5;
      d = 2;

      #10

      clk = 1;
      start = 0;
      rst = 1;
      
      D = 2;
      d = 2;

      #10
      $finish;

   end // initial begin
   always #10 clk = ~clk;
   
endmodule
