`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:04:45 03/31/2021 
// Design Name: 
// Module Name:    err_logic 
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
module err_logic(
    input err_in_sub,
    input err_in_div,
    input subcmd,
	 input divcmd,
    output [3:0] out
    );

assign out = ((subcmd & err_in_sub) | (divcmd & err_in_div)) ? 4'b1111 : 4'b0000;

endmodule