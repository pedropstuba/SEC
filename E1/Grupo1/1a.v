`timescale 1ns / 1ps
 


module RAM(
    input [9:0] address,
    input [7:0] data_in,
    input we, clk,
    output [7:0] data_out
    
);
 
reg [7:0] memram[1023:0];
 
initial begin
   $readmemh ("memram.hex",memram,0,1023);
end
 
always @(negedge clk) begin
   if(we) begin
      memram[address] =  data_in;
   end
   else begin
      data_out = memram[address];
   end
end 
 
 
 
endmodule

