module CLA_top(
    input [3:0] a,
    input [3:0] b,
    input 	ci,
    output [3:0] s,
    output 	cout
);

   wire [3:0] 	p;
   wire [3:0] 	g;
   wire [2:0] 	P;
   wire [2:0] 	G;
   wire [2:0] 	co;


   assign cout = G[3]|(P[3]&ci);
   
   




CLA_A A0(
        .a(a[0]),
        .b(b[0]),
        .ci(ci),
        .p(p[0]),
	.g(g[0]),
        .s(s[0])
);


CLA_A A1(
        .a(a[1]),
        .b(b[1]),
        .ci(co[0]),
        .p(p[1]),
	.g(g[1]),
        .s(s[1])
);


CLA_A A2(
        .a(a[2]),
        .b(b[2]),
        .ci(co[1]),
        .p(p[2]),
	.g(g[2]),
        .s(s[2])
);
   
CLA_A A3(
        .a(a[3]),
        .b(b[3]),
        .ci(c0[2]),
        .p(p[3]),
	.g(g[3]),
        .s(s[3])
)

CLA_B B0(
	.p(p[3:2]),
	.g(g[3:2]),
        .ci(co[1]),
	.cout(co[2]),
        .P(P[0]),
	.G(G[0])
)

CLA_B B1(
        .ci(ci),
	.cout(co[1])
        .P(P[1]),
	.G(G[1])
)


endmodule
