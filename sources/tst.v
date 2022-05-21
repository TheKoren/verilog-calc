`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:42 04/25/2021 
// Design Name: 
// Module Name:    tst 
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
module tst(
    input sw,
    input [3:0] cmd,
    output selout
    );
// teszt és nincs még cmd akkor a kijelzõkre az A és B jelenik meg.

assign selout = (sw | (cmd == 4'b0000));
endmodule
