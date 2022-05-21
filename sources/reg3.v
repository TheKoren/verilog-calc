`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:20 04/03/2021 
// Design Name: 
// Module Name:    reg3 
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
module reg3 #(parameter N=8)(
    input [N-1:0] i0,
    input [N-1:0] i1,
    input ldi0,
    input ldi1,
    output [N-1:0] q,
    input rst,
    input clk
    );

reg [N-1:0] outreg;

always @(posedge clk)
    if(rst)
        outreg <= 0;
    else if(ldi1)
        outreg <= i1;
    else if(ldi0)
        outreg <= i0;
    else;
	 
	 
assign q = outreg;
endmodule
