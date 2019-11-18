module CLA_B(
    input [1:0] p,
    input [1:0] g,
    input 	ci,
    output 	P,
    output      G,
    output 	c1	
);

   assign P = p[0]&p[1];
   assign G = g[1]|(p[1]&g[0]);
   assign c1 = g[0]|(p[0]&ci);
   
   
endmodule
