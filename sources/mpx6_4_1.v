`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:03:00 04/14/2021 
// Design Name: 
// Module Name:    mpx6_4_1 
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
module mpx6_4_1(
	 input [6:0] di3,
	 input [6:0] di2,
	 input [6:0] di1,
	 input [6:0] di0,
	 input [3:0] sel,
	 output reg [6:0] out
    );
	 
	 
always @(*)
begin
	case (sel)
		4'b1110: out <= di0;
		4'b1101: out <= di1;
		4'b1011: out <= di2;
		4'b0111: out <= di3;
		default: out <= 0;
	endcase
end

endmodule
