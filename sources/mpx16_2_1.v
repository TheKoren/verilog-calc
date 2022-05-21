`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:25:31 04/25/2021 
// Design Name: 
// Module Name:    mpx16_2_1 
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
module mpx16_2_1(
    input [15:0] l0,
    input [15:0] l1,
    input s,
    output reg [15:0] out
    );

always @(*)
    case (s)
        0: out <= l0;
        1: out <= l1;
        default: out <= l1;
    endcase
endmodule
