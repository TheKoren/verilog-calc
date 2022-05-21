`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:13 04/03/2021 
// Design Name: 
// Module Name:    reg56 
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
module reg56 #(parameter N = 8)(
    input [N-1:0] d,
    output [N-1:0] q,
    input ld,
    input rst,
	 input clk
    );

reg [N-1:0] outreg;

always @(posedge clk)
begin
	if(rst)
		outreg <= 0;
	else if (ld)
		outreg <= d;
end

assign q = outreg;

endmodule
