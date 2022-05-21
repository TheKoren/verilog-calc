`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:34 04/14/2021 
// Design Name: 
// Module Name:    dp_logic 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dp_logic(
   input [3:0] cmd,
   input sw,
   output reg [3:0] out
    );

always @(*)
	begin
		 if( (sw == 0) & (cmd == 4'b1000))
			  out <= 4'b0100;
		 else if ((sw == 0) & (cmd == 4'b0000))
					out <= 4'b1111;
			  else
			  out <= 0;
	end

endmodule