`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:36 04/14/2021 
// Design Name: 
// Module Name:    shr4 
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
module shr4(
    input en,
    input rst,
    input clk,
    input si,
    output reg [3:0] q
    );


always @(posedge clk)
begin
    if(rst)
        q <= 4'b1110;
    else if(en)
        q <= {q[2:0], si}; // 1110 default. <- shift: 110[O3] = 1101
end    


endmodule
