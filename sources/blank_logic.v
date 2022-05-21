`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:09 04/14/2021 
// Design Name: 
// Module Name:    blank_logic 
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
module blank_logic(
    input [3:0] cmd,
    input sw,
    output reg [3:0] out
    );

always @ (*)
	begin
		 if ((sw == 0) & (cmd == 0))
			  out <= 4'b1111;
		 else
			  out <= 0;
	end

endmodule
