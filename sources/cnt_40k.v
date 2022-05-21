`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:54 04/14/2021 
// Design Name: 
// Module Name:    cnt_40k 
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
module cnt_40k(
    input rst,
    input clk,
    output tc
    );
reg [15:0] q = 39999;

always @(posedge clk)
begin
    if(rst | q == 0 )
        q <= 39999;
    else
        q <= q-1;
end

assign tc = (q == 0);

endmodule
