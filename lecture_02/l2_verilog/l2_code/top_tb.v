
`timescale 1ns / 1ps

/* Módulo com o intuito de simular os circuitos aka test bench */

module top_tb;

   reg 		rst;
   reg 		clk;
   
   reg [7:0] data_in;
   reg data_in_valid;

   
   reg [31:0] data_out_ref;
   wire [31:0] data_out;
   wire       data_out_valid;
   

   integer 	      i;
   
   
   // Instantiate the Unit Under Test (UUT)
   top uut (
		.rst            (rst),
		.clk		(clk),
		.data_in	(data_in),
		.data_in_valid	(data_in_valid),
		.data_out	(data_out),
		.data_out_valid	(data_out_valid)
		);
 
   
   initial begin
      $dumpfile("top.vcd");	/* Escreve no ficheiro top.vcd */
      $dumpvars();
      
	/* Inicialização dos sinais de clk e rst com um determinado valor */

      rst = 1;
      clk = 1;
      
      data_in_valid = 0;

      #50.1 rst = 0;

	/* Excitação dos sinais de entrada um número determinado de vezes (ciclo for)
 	e em determinados instantes de tempo #10 e #50 (este tem como base o valor #10, não acontece aos 50 do circuito) de forma a verificar os outputs e se o circuito funciona de forma correta */

      for(i=0; i < 10; i++) begin 
	 data_in = i+2;
	 data_in_valid = 1;
	 data_out_ref = (i+2)**4;
	 #10 data_in_valid = 0;
	 #50 data_in = 0;
	 
      end
	 
      $finish;

   end
   
	/* Clk gerado com determinada frequencia de operação */

   always
     #(10/2) clk = ~clk; //period=10ns => 100MHz
   

endmodule

