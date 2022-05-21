`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:18 04/03/2021 
// Design Name: 
// Module Name:    reg7 
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
module reg7(
    input d0,
    input d1,
    output q0,
    output q1,
    input clk
    );

reg out0, out1;

always @(posedge clk)
begin
	out0 <= d0;
	out1 <= d1;
end

assign q0 = out0;
assign q1 = out1;

endmodule
