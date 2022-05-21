`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:33 04/21/2021 
// Design Name: 
// Module Name:    usrt_rec 
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
module usrt_rec(
    input rx,
    input usrt_clk,
    input clk,
    input rst,
	 output rdy,
    output [7:0] data
    );

wire pulse, rdy_i, rstlog;
wire [9:0] shiftdata;
assign rstlog = (rst | rdy_i);

negedge_obs negedge_obs(.in(usrt_clk),.clk(clk),.rst(rst),.out(pulse));

shr10 shr10(.si(rx),.en(pulse),.clk(clk),.rst(rst),.ld3ff(rstlog),.q(shiftdata));

// 1-es érték esetén shr értéke betöltõdik a dataregbe. Egy számlálót helyettesítünk vele, ami a keret elejét és végét vizsgálja
assign rdy_i = (~shiftdata[0] & shiftdata[9]);

usrt_datareg usrt_datareg(.clk(clk),.rst(rst),.ld(rdy_i),.d(shiftdata[8:1]),.q(data));

DFF DFF(.d(rdy_i),.q(rdy),.clk(clk),.rst(rst));

endmodule
