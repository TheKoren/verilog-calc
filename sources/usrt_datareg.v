`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:34 04/21/2021 
// Design Name: 
// Module Name:    usrt_datareg 
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
module usrt_datareg(
    input clk,
    input rst,
    input ld,
    input [7:0] d,
    output reg [7:0] q
    );

always @ (posedge clk)
begin
    if(rst)
        q <= 0;
    else if(ld)
        q <= d;
end
endmodule
