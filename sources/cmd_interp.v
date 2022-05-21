`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:09:37 04/21/2021 
// Design Name: 
// Module Name:    cmd_interp 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: I completed this module for the small
//								cost of my mental well-being.
//
//////////////////////////////////////////////////////////////////////////////////
module cmd_interp(
    input clk,
    input strt,
    input rst,
    input [7:0] data,
    output reg [7:0] op_A,
    output reg [7:0] op_B,
    output [3:0] cmd,
    output [7:0] debug,
    output rdy
    );


//�llapotok
localparam OPA = 3'b000, OPA2 = 3'b001, OP = 3'b010, OPB = 3'b011, OPB2 = 3'b100, EQU = 3'b101;
reg [2:0] state, next_state;

//bej�v� karakterek figyel�se, debug c�lra
assign debug = data;

//logikai vezet�kek a bej�v� karekterek t�pus�nak meghat�roz�s�ra
wire operator, equsymbol, number, escape;
assign operator = ((data == 8'h2B) || (data == 8'h2D ) || (data == 8'h2A ) || (data == 8'h2F));
assign equsymbol = ((data == 8'h3D) || (data == 8'h0D));
assign number = ((data >= 8'h30) && (data <= 8'h39));
assign escape = (data == 8'h1B);


//m�velet kiv�laszt�s�hoz sz�ks�ges regiszterek
reg [3:0] command_code, cmd_out;

//cmd kimeneti logika (rst figyelembev�tel�vel)
assign cmd = rst ? 4'b0000 : cmd_out;

//m�velet kiv�laszt�sa
always @(posedge clk)
	if(operator && ((state == OP) || (state == OPA2)))
		case(data)
			8'h2B:	command_code <= 4'b0001;
			8'h2D:	command_code <= 4'b0010;
			8'h2A:	command_code <= 4'b0100;
			8'h2F:	command_code <= 4'b1000;
			default: command_code <= 4'b0000;
		endcase
		
		
//bemeneti ASCII �rt�kb�l sz�m el��ll�t�sa
wire [3:0] in_num;
assign in_num = {data[3:0]};	

//ready jel el��ll�t�sa
assign rdy = (((state == OPB2) || (state == EQU)) && (equsymbol));

//annak biztos�t�sa, hogy a bemenet stabil legyen, amikor a start �rkezik
wire strt_d;
delay d_cmd(.in(strt), .clk(clk), .rst(rst), .out(strt_d));

//�llapot�tmenet vez�rl�se
always @(posedge clk)
	if (rst)
	begin
		state <= OPA;
	end
	else
	begin
		state <= next_state;
	end

//�llapotg�p m�k�d�s�nek le�r�sa
always @(posedge strt_d)
begin
	if (escape)
		next_state <= OPA;
	else
		case(state)
			OPA:	if (number)
					begin
						next_state <= OPA2;
						op_A <= {4'b0000, in_num};
						cmd_out <= 4'b0000;
					end
					else
						next_state <= OPA;
						
			OPA2:	if (number)
					begin
						next_state <= OP;
						op_A <= (op_A * 4'd10) + in_num;
					end
					else if (operator)
					begin
						next_state <= OPB;
					end
					else
						next_state <= OPA2;
						
			OP:	if (operator)
					begin
						next_state <= OPB;
					end
					else
						next_state <= OP;
			
			OPB:	if (number)
					begin
						next_state <= OPB2;
						op_B <= {4'b0000, in_num};
					end
					else
						next_state <= OPB;
						
			OPB2:	if (number)
					begin
						next_state <= EQU;
						op_B <= (op_B * 4'd10) + in_num;
					end
					else if (equsymbol)
					begin
						next_state <= OPA;
						cmd_out <= command_code;
					end
					else
						next_state <= OPB2;
						
			EQU:	if(equsymbol)
					begin
						next_state <= OPA;
						cmd_out <= command_code;
					end
					else
						next_state <= EQU;
		endcase
end


endmodule
