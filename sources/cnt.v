`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:36 04/03/2021 
// Design Name: 
// Module Name:    cnt 
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
module cnt #(parameter N = 8)(
    input en,
    output tc,
    input clk,
    output reg [N-1:0] q,
    input rst
    );

always @(posedge clk)
begin
	if(rst)
		q <= 0;
	else if(en)
		q <= q + 1;
end

assign tc = (q == (255));

endmodule
