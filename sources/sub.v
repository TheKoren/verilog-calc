`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:42:28 03/31/2021 
// Design Name: 
// Module Name:    sub 
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
module sub #(parameter N=8)(
    input [N-1:0] a,
    input [N-1:0] b,
    output err,
    output [2*N-1:0] out
    );

assign out = a - b;
assign err = a < b ? 1 : 0;

endmodule
