`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:17 03/31/2021 
// Design Name: 
// Module Name:    div 
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
module div #(parameter N=8)(
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] out,
	 output [N-1:0] mod,
    input clk,
    input rst,
    output rdy,
    output err,
    input strt
    );

wire [N-1:0] i0, D, dvr, mod_i, div_i, diff;
wire upd, init, rdy_i, err_i, altb, zero_b, cnt_rst;

assign cnt_rst = (rst | init);
assign zero_b = &(~D);

reg12#(.N(N)) reg1(.in(a), .out(i0), .clk(clk), .rst(rst));
reg12#(.N(N)) reg2(.in(b), .out(D), .clk(clk), .rst(rst));
reg3#(.N(N)) reg3(.i1(diff), .i0(i0), .ldi1(upd), .ldi0(init), .q(mod_i), .rst(rst), .clk(clk));
reg4#(.N(N)) reg4(.D(D), .q(dvr), .init(init), .rst(rst), .clk(clk));
reg56#(.N(N)) reg5(.d(div_i), .q(out), .rst(rst), .clk(clk), .ld(rdy_i));
reg56#(.N(N)) reg6(.d(mod_i), .q(mod), .rst(rst), .clk(clk), .ld(rdy_i));
reg7 reg7(.d0(rdy_i), .d1(err_i), .q0(rdy), .q1(err), .clk(clk));

FSM FSM(.start(strt), .ini(init), .upd(upd), .altb(altb), .zero_b(zero_b), .rdy(rdy_i), .err(err_i), .rst(rst), .clk(clk));

cnt#(.N(N)) cnt(.en(upd), .q(div_i), .rst(cnt_rst), .clk(clk));

cmp#(.N(N)) cmp(.a(mod_i), .b(dvr), .a_lt_b(altb));

sub_div#(.N(N)) sub_div(.a(mod_i), .b(dvr), .a_sub_b(diff));

endmodule
