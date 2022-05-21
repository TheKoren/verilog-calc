`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:27:18 04/21/2021
// Design Name:   cmd_interp
// Module Name:   D:/files/uni/bambilabor/FPGA/123/progs/calc5/cmd_int_test.v
// Project Name:  calc5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cmd_interp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cmd_int_test;

	// Inputs
	reg clk;
	reg strt;
	reg rst;
	reg [7:0] data;

	// Outputs
	wire [7:0] op_A;
	wire [7:0] op_B;
	wire [3:0] cmd;
	wire [7:0] debug;
	wire rdy;

	// Instantiate the Unit Under Test (UUT)
	cmd_interp uut (
		.clk(clk), 
		.strt(strt), 
		.rst(rst), 
		.data(data), 
		.op_A(op_A), 
		.op_B(op_B), 
		.cmd(cmd), 
		.debug(debug), 
		.rdy(rdy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		strt = 0;
		rst = 1;
		data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst <= 0;
		
		data <= 8'h32;
		strt <= 1;
		#10;
		strt <= 0;
		#100;
		
		data <= 8'h2B;
		strt <= 1;
		#10;
		strt <= 0;
		#100;
		
		data <= 8'h31;
		strt <= 1;
		#10;
		strt <= 0;
		#100;
		
		data <= 8'h35;
		strt <= 1;
		#10;
		strt <= 0;
		#100;
		
		data <= 8'h3D;
		strt <= 1;
		#10;
		strt <= 0;
		#100;
		
		data <= 8'h21;
		strt <= 1;
		#10;
		strt <= 0;
		#100;
		

	end
	
	always #5
		clk <= ~clk;
      
endmodule

