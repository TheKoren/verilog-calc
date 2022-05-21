`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:23 04/17/2021
// Design Name:   div_result_proc
// Module Name:   D:/files/uni/bambilabor/FPGA/123/progs/calc4/divproctest.v
// Project Name:  calc4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: div_result_proc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divproctest;

	// Inputs
	reg clk;
	reg rst;
	reg start;
	reg [3:0] divisor;
	reg [7:0] mux_input;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	div_result_proc uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.divisor(divisor), 
		.mux_input(mux_input), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		start = 0;
		divisor = 0;
		mux_input = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst <= 0;
		mux_input <= 8'b00100010;
		divisor <= 4'b0011;
		#20;
		start <= 1;
		#20;
		start <= 0;
		// Add stimulus here

	end
      
		always #5
			clk <= ~clk;
endmodule

