`timescale 1ns/1ps

/* Contador de 2 bits */

module counter (
  input 	   clk,
  input 	   rst,
  input 	   en,
  output reg [1:0] data_out
);

   
   always @ (posedge clk) begin
      if (rst == 1'b1) begin	/* Se tivermos um flanco ascendente e reset = 1, data_out = 0 com dois bits */
	 data_out <= 2'b0;
      end
      else if (en == 1'b1 ) begin	/* se reset diferente de 1 e enable = 1, contador é incrementado */ 
	 if(data_out != 2'b11)		/* Verifica se o contador chegou ao fim */
	    data_out <= data_out+1'b1;  /* if not incrementa */
      end
   end

endmodule
