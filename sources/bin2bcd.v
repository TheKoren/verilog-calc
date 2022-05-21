`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:57 04/17/2021 
// Design Name: 
// Module Name:    bin2bcd 
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
//b az osztó

module bin2bcd(
    input clk,
    input rst,
	 input [15:0] in,
	 input strt_bcd,
	 output [3:0] bcd_ones,
	 output [3:0] bcd_tens,
	 output [3:0] bcd_hundreds,
	 output [3:0] bcd_thousands
    );

//az osztók indítására szolgáló jelek
wire ready1, ready2, ready1_d, ready2_d;

//köztes eredmények
wire [15:0] result1, result2, bcd_res0, bcd_res1, bcd_res2, bcd_res3;

//bináris - bcd átalakítás osztásokkal
div#(.N(16)) div_bcd1(.a(in), .b(16'd1000), .strt(strt_bcd), .rst(rst), .clk(clk), .out(bcd_res3), .mod(result1), .rdy(ready1));
div#(.N(16)) div_bcd2(.a(result1), .b(16'd100), .strt(ready1_d), .rst(rst), .clk(clk), .out(bcd_res2), .mod(result2), .rdy(ready2));
div#(.N(16)) div_bcd3(.a(result2), .b(16'd10), .strt(ready2_d), .rst(rst), .clk(clk), .out(bcd_res1), .mod(bcd_res0));

//annak biztosítása, hogy az osztók bemenetén megjelenjen idõben a megfelelõ szám
delay d1(.clk(clk), .rst(rst), .in(ready1), .out(ready1_d));
delay d2(.clk(clk), .rst(rst), .in(ready2), .out(ready2_d));

//kimenetek beállítása
assign bcd_ones      = bcd_res0[3:0];
assign bcd_tens      = bcd_res1[3:0];
assign bcd_hundreds  = bcd_res2[3:0];
assign bcd_thousands = bcd_res3[3:0];

endmodule





