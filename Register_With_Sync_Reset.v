 /******************************************************************* 
* Name:
*	RegisterWithEnable.v
* Description:
* 	This module is a register with eanble.
* Inputs:
*	clk: Clock signal 
*  reset: reset signal 
	Sync_Reset: When 1 the register value is clear, but only if the register is enable and there a clock edge
*  enable: when 1 the signal on Data_Input is latched, when 0 the previous value is maintained
*	Data_Input: Data to lache data 
* Outputs:
* 	Mux_Output: Data to provide lached data
* Versión:  
*	1.0
* Author: 
*	José Luis Pizano Escalante
* Fecha: 
*	07/02/2013 
*********************************************************************/

 module Register_With_Sync_Reset
#(
	parameter WORD_LENGTH = 8
)

(
	// Input Ports
	input clk,
	input reset,
	input enable,
	input Sync_Reset,
	input [WORD_LENGTH-1 : 0] Data_Input,

	// Output Ports
	output [WORD_LENGTH-1 : 0] Data_Output
);

reg  [WORD_LENGTH-1 : 0] Data_reg;

always@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
		Data_reg <= 0;
	else 
		if(enable == 1'b1)
			if(Sync_Reset == 1'b0)
				Data_reg <= {WORD_LENGTH{1'b0}};
			else
				Data_reg <= Data_Input;
end

assign Data_Output = Data_reg;

endmodule