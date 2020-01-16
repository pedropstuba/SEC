// #addr = 1kb
// addr = 1Byte
// para 32kB => 32kB/1KB = 32

`timescale 1ns / 1ps

module RAMb(
	    input [14:0]  address,
	    input [7:0]  data_in,
	    input 	 we, clk,
	    output [7:0] data_out
	    );
generate 
   for(i=0; i<32; i=i+1)
     RAM ram(
	     .we(we),
	     .clk(clk),
	     .address(address),
	     .data_in(data_in),
	     .data_out(data_out)
	     );

endgenerate
   
