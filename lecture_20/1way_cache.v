`timescale 1ns / 1ps
`include "xdefs.vh"

module 1waycache (
             input              clk,
	     input 		rst,
	     input		write,
	     input		en,
	     input [31:0]	addr,
	     input [31:0]       data_in,
	     output [31:0]      data_out,
	     output		hit_miss
	     );

	always @(posedge clk) begin
	   
	
	end
endmodule
