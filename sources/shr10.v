`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:14 04/21/2021 
// Design Name: 
// Module Name:    shr10 
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
module shr10(
    input si,
    input en,
    input clk,
    input rst,
    input ld3ff,
    output [9:0] q
    );

reg [9:0] shr = 10'b1111111111;

always @(posedge clk)
begin
    if(ld3ff | rst)
        shr <= 10'b1111111111;
    else if (en)
        shr <= {si, shr[9:1]}; // Jobbra shift. �gy a v�g�n alulra ker�l a START bit �s fel�lre a STOP bit
end

assign q = shr;

endmodule
