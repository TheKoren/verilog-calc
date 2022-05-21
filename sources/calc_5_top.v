`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:28 02/05/2020 
// Design Name: 
// Module Name:    calc_5 
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

module calc_5(
	 input [0:0] sw, //teszt funkció sw[0]
	 input rst,
	 input clk16M,
	 input clk,				//USRT clk
	 input mosi,			//USRT RX
	 output [7:0] seg_n,
	 output [3:0] dig_n,
	 output [4:0] col_n,
	 output [7:0] ld
    );


assign col_n = 5'h1f;

//operandusok
wire [7:0] a, b;

//mûveletek eredményeit tartalmazó vezetékek
wire [15:0] add_a_b, sub_a_b, mul_a_b, div_result_full;
wire [7:0] div_a_b, mod_a_b;

//a modulok összekötéséhez használt vezetékek
wire [15:0] mpx_out, mpx2_out, bin2bcd_out_con;
wire [7:0] data;
wire sub_err, div_err, usrt_rdy, cmd_interp_rdy, tst_out, bcd_tick;
wire [3:0] err_out, dp_out, blank_out, cmd;

//osztó alternatív bekötéséhez tartozó eredmény formázása
/* wire [15:0] div_mod;
assign div_mod = {div_a_b[7:0], mod_a_b[7:0]}; */

//bináris - bcd átalakításhoz tartozó jelek
wire [3:0] bcd0, bcd1, bcd2, bcd3;
assign bin2bcd_out_con = {bcd3, bcd2, bcd1, bcd0};

//osztandó 100-szorosának elõállítása
wire [15:0] a_times_hundred;
mul#(.N(8)) mul100(.a(a), .b(8'd100), .out(a_times_hundred));

//mûveletvégzõk
add#(.N(8)) add(.a(a), .b(b), .out(add_a_b));
sub#(.N(8)) sub(.a(a), .b(b), .out(sub_a_b), .err(sub_err));
mul#(.N(8)) mul(.a(a), .b(b), .out(mul_a_b));
div#(.N(16)) div(.a(a_times_hundred), .b(b), .strt(cmd_interp_rdy), .rst(rst), .clk(clk16M), .err(div_err), .out(div_result_full));

//osztó alternatív bekötése
/*div#(.N(8)) div(.a(a), .b(b), .strt(cmd_interp_rdy), .rst(rst), .clk(clk16M), .err(div_err), .out(div_a_b), .mod(mod_a_b)); */

//kijelzõt vezérlõ logikák bekötése
err_logic err_logic(.err_in_sub(sub_err), .err_in_div(div_err),. subcmd(cmd[1]), .divcmd(cmd[3]), .out(err_out));
blank_logic blank_logic(.cmd(cmd), .sw(sw), .out(blank_out));
dp_logic dp_logic(.cmd(cmd), .sw(sw), .out(dp_out));

//usrt fogadó áramkör bekötése
usrt_rec usrt_rec(.rx(mosi), .usrt_clk(clk), .clk(clk16M), .rst(rst), .rdy(usrt_rdy), .data(data));

//command interpreter bekötése
cmd_interp cmd_interp(.clk(clk16M), .strt(usrt_rdy), .rst(rst), .data(data), .op_A(a), .op_B(b),.debug(ld), .cmd(cmd), .rdy(cmd_interp_rdy));

//mûveletek közt választó multiplexer bekötése
mpx#(.N(16)) mpx16_4_1(.sel(cmd), .i0(add_a_b), .i1(sub_a_b), .i2(mul_a_b), .i3(div_result_full), .out(mpx_out));

//elõzõ multiplexer bekötése alternatív osztás esetén
/*mpx#(.N(16)) mpx16_4_1(.sel(cmd), .i0(add_a_b), .i1(sub_a_b), .i2(mul_a_b), .i3(div_mod), .out(mpx_out));*/

//bináris - bcd átalakító bekötése
bin2bcd bin2bcd(.clk(clk16M), .rst(rst), .in(mpx_out), .strt_bcd(bcd_tick), .bcd_ones(bcd0), .bcd_tens(bcd1), .bcd_hundreds(bcd2), .bcd_thousands(bcd3));

//második multiplexer bekötése
mpx16_2_1 mpx16_2_1(.l0(bin2bcd_out_con), .l1({a,b}), .s(tst_out), .out(mpx2_out));
tst tst(.cmd(cmd), .sw(sw), .selout(tst_out));

//kijelzõ vezérlése
kijelzo kijelzo(.err(err_out), .dp(dp_out), .blank(blank_out), .num0(mpx2_out[3:0]), .num1(mpx2_out[7:4]), .num2(mpx2_out[11:8]), .num3(mpx2_out[15:12]), .clk(clk16M),
					.rst(rst), .out100hz(bcd_tick), .seg_n(seg_n), .dig_n(dig_n));


endmodule
