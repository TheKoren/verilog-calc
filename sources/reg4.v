`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:29 04/03/2021 
// Design Name: 
// Module Name:    reg4 
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
module reg4 #(parameter N=8)(
    input [N-1:0] D,
    output [N-1:0] q,
    input init,
    input rst,
    input clk
    );

reg [N-1:0] outreg;

always @(posedge clk)
    if(rst)
        outreg <= 1;
    else if (init)
        outreg <= D;
		  
assign q = outreg;		  
endmodule
