`timescale 1ns / 1ps

//compute p**q, where q=4


/* flip flop do tipo D com reset ativo no flanco ascendente*/

module control (
		//top interface
	input 	    clk,
	input 	    rst,
	input 	    data_in_valid,
		//counter interface 
	input [1:0] cnt_data,
	output 	    cnt_rst, cnt_en,
		//register interface
	output 	    reg_en
);


   
   
//state vars
   reg   state, state_nxt;
   
   //state register 
   always @ (posedge clk) begin
      if(rst)
	state <= 1'b0;
      else
	state <= state_nxt;
   end

   //state transition 
   always @* begin
      //defaults 
      
      state_nxt = state; /* Atualização do estado */

      case (state)
	1'b0: //Init
	  if(data_in_valid) /* Entrada só é registada quando dat_in_valid = 1 */
	    state_nxt = 1'b1;
	default:;//Accumulate
      endcase    
   end 
   
   //counter management
   assign cnt_rst = data_in_valid;
   assign cnt_en = (state != 1'b0); /* O enable está ativo se o state for diferente de 0 */

   //register management
   assign reg_en = data_in_valid | (cnt_data < 2'd3); /* reg_en ativo se data_in_valid = 1 ou cnt_data não estiver cheio */
   

endmodule
