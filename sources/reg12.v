`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:06 04/03/2021 
// Design Name: 
// Module Name:    reg12 
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
module reg12 #(parameter N = 8)(
    input [N-1:0] in,
    input clk,
    output [N-1:0] out,
    input rst
    );

reg [N-1:0] outreg;

always @(posedge clk)
	if(rst)
		outreg <= 0;
	else
		outreg <= in;

assign out = outreg;
endmodule
