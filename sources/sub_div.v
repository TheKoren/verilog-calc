`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:45 04/03/2021 
// Design Name: 
// Module Name:    sub_div 
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
module sub_div #(parameter N = 8)(
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] a_sub_b
    );
assign a_sub_b = a - b;

endmodule

