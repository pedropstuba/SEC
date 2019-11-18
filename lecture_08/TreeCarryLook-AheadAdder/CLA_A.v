module CLA_A(
    input  bita,
    input  bitb,
    input  ci,
    output p,
    output g,
    output s
);

wire p;

assign p = bita^bitb;
assign s = p^ci;
assign g = bita&bitb;
   

endmodule
