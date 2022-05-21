`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:56:57 03/31/2021 
// Design Name: 
// Module Name:    mpx 
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
module mpx #(parameter N=8)(
    input [N-1:0] i0,
    input [N-1:0] i1,
    input [N-1:0] i2,
    input [N-1:0] i3,
    input [3:0] sel,
    output reg [N-1:0] out
    );

always @(*)
	case (sel)
		4'b0001: out <= i0;
		4'b0010: out <= i1;
		4'b0100: out <= i2;
		4'b1000: out <= i3;
		default: out <= 0;
	endcase


endmodule
