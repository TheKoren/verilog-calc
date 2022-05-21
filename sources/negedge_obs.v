`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:54 04/21/2021 
// Design Name: 
// Module Name:    negedge_obs 
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
module negedge_obs(
    input in,
    input clk,
    output out,
    input rst
    );

reg [1:0] shr = 2'b00;

always @(posedge clk)
begin
    if(rst)
        shr <= 2'b00;
    else
        shr <= {shr[0],in};
end

assign out = ( shr == 2'b10);

endmodule