`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:59:44 04/14/2021 
// Design Name: 
// Module Name:    kijelzo 
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
module kijelzo(
    input [3:0] err,
    input [3:0] dp,
    input [3:0] blank,
	 input [3:0] num0,
	 input [3:0] num1,
	 input [3:0] num2,
	 input [3:0] num3,
    input clk,
    input rst,
	 output out100hz,
	 output [7:0] seg_n,
	 output [3:0] dig_n
    );

wire [6:0] di3, di2, di1, di0, mpx_out, seg7_out;
wire err_i, inh, tc_en, shift_input;
wire [3:0] dcba, shr_out, mpx_sel;

assign di3 = {err[3], blank[3], dp[3], num3[3:0]};
assign di2 = {err[2], blank[2], dp[2], num2[3:0]};
assign di1 = {err[1], blank[1], dp[1], num1[3:0]};
assign di0 = {err[0], blank[0], dp[0], num0[3:0]};
assign dcba = mpx_out[3:0];
assign err_i = mpx_out[6];
assign inh = mpx_out[5];
assign seg_n = {(~mpx_out[4]), seg7_out[6:0]};
assign dig_n = shr_out;
assign mpx_sel = shr_out;
assign shift_input = shr_out[3];
assign out100hz = (shift_input & tc_en);

mpx6_4_1 mpx6(.di0(di0), .di1(di1), .di2(di2), .di3(di3), .sel(mpx_sel), .out(mpx_out));
hex_to_7seg ht7(.in(dcba), .err(err_i), .inh(inh), .seg_n(seg7_out));
cnt_40k cnt_40k(.clk(clk), .rst(rst), .tc(tc_en));
shr4 shr4(.clk(clk), .rst(rst), .en(tc_en), .si(shift_input), .q(shr_out));


endmodule
