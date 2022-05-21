`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:35 04/17/2021 
// Design Name: 
// Module Name:    input_logic 
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
module input_logic(
		input clk,
		input rst,
		input [3:0] a,
		input [3:0] b,
		output reg err_a,
		output reg err_b,
		output reg [3:0] out_a,
		output reg [3:0] out_b
    );
	 
	 always @(posedge clk)
	 if (rst)
	 begin
		err_a <= 0;
		err_b <= 0;
		out_a <= 0;
		out_b <= 0;
	 end
	 else 
	 begin
		if (a < 4'd10)
		begin
			err_a <= 0;
			out_a <= a;
		end
		else
			err_a <= 1;
		if (b < 4'd10)
		begin
			err_b <= 0;
			out_b <= b;
		end
		else 
			err_b <= 1;
		
	 end
		
	

endmodule
