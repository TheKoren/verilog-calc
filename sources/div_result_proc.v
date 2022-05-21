`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:49 04/17/2021 
// Design Name: 
// Module Name:    div_result_proc 
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
module div_result_proc(
    input clk,
    input rst,
	 input start,
	 input [3:0] divisor,
	 input [7:0] mux_input, //{div, mod}
	 output [7:0] out
    );

wire [3:0] div, mod, divisor_half, mod_for_rounding, frac;
wire [7:0] div_times_10, mod_times_10, div_result, divisor_8bit;
wire rounding;


assign div = mux_input[7:4];
assign mod = mux_input[3:0];
assign divisor_half = (divisor == 1) ? 1 : {divisor >> 1};
assign rounding = (divisor_half <= mod_for_rounding);
assign divisor_8bit = {4'b0000, divisor[3:0]};

mul mul2(.a(div), .b(10), .out(div_times_10));
mul mul3(.a(mod), .b(10), .out(mod_times_10));

div#(.N(8)) div3(.a(mod_times_10), .b(divisor_8bit), .strt(start), .rst(rst), .clk(clk), .out(div_result), .mod(mod_for_rounding));

assign frac = rounding + div_result;
assign out = div_times_10 + frac;

endmodule
