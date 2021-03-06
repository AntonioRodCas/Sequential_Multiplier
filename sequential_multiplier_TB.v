 /*********************************************************
 * Description:
 * This module is test bench file for testing the binary to BCD converter
 *
 *
 *	Author:  Antonio Rodríguez    md193781   ITESO 
 *	Date:    13/09/18
 *
 **********************************************************/ 
 
 
 
module sequential_multiplier_TB;

parameter WORD_LENGTH = 8;


reg clk_tb = 0;
reg reset_tb;
reg start_tb = 0;

reg [WORD_LENGTH - 1 : 0] Multiplier_tb;
reg [WORD_LENGTH - 1 : 0] Multiplicand_tb;

wire ready_tb;
wire [(WORD_LENGTH*2)-1 : 0] Product_tb;


sequential_multiplier
#(
	.WORD_LENGTH(WORD_LENGTH)
)
SM_1
(
	.clk(clk_tb),
	.reset(reset_tb),
	.start(start_tb),
	.Multiplier(Multiplier_tb),
	.Multiplicand(Multiplicand_tb),
	
	.ready(ready_tb),
	.Product(Product_tb)

);

/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
   #0 reset_tb = 0;
   #5 reset_tb = 1;
end

/*********************************************************/
initial begin // start generator
	#5 start_tb = 1;
	#15 start_tb = 0;
	#45 start_tb = 1;
	#15 start_tb = 0;
end


/*********************************************************/
initial begin // Multiplier generator
	#5 Multiplier_tb = 6;
	#45 Multiplier_tb = 2;
end
/*********************************************************/

/*********************************************************/
initial begin // Multiplicand generator
	#5 Multiplicand_tb = 3;
	#45 Multiplicand_tb = 251;
end
/*********************************************************/

endmodule