`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:50 04/03/2021 
// Design Name: 
// Module Name:    fsm 
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
module FSM(
    input start,
    input clk,
    input rst,
    output ini,
    output upd,
    input altb,
    input zero_b,
    output rdy,
    output err
    );
localparam IDLE = 1'b0, WORK = 1'b1;
reg state, next_state;

//Állapotregiszter:
always@(posedge clk)
    if(rst) 
        state <= IDLE;
    else 
        state <= next_state;

//Következõ állapot logika:
always@(*)
    case(state)
        IDLE: if(start && !zero_b) next_state <= WORK;
                else next_state <= IDLE;
        WORK: if(!altb) next_state <= WORK;
                else next_state <= IDLE;
    endcase

//Kimeneti logika (vezérlõ jelek):
assign ini = (state == IDLE)& start & ~zero_b;
assign upd = (state == WORK)& ~altb;

//státus jelek:
assign rdy = (state == WORK)& altb | (state == IDLE) & start & zero_b;
assign err = (state == IDLE)& zero_b; //kiszedtem egy starttal éselést

endmodule
