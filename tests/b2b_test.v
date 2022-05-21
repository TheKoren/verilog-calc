`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:39 04/25/2021
// Design Name:   bin2bcd
// Module Name:   D:/files/uni/bambilabor/FPGA/123/progs/calc5_v3/calc5/b2b_test.v
// Project Name:  calc5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin2bcd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module b2b_test;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] in;
	reg strt_bcd;

	// Outputs
	wire [3:0] bcd_ones;
	wire [3:0] bcd_tens;
	wire [3:0] bcd_hundreds;
	wire [3:0] bcd_thousands;

	// Instantiate the Unit Under Test (UUT)
	bin2bcd uut (
		.clk(clk), 
		.rst(rst), 
		.in(in), 
		.strt_bcd(strt_bcd), 
		.bcd_ones(bcd_ones), 
		.bcd_tens(bcd_tens), 
		.bcd_hundreds(bcd_hundreds), 
		.bcd_thousands(bcd_thousands)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		in = 0;
		strt_bcd = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst <= 0;
		in <= 16'h4D2;
		#10;
		strt_bcd <= 1;
		#10;
		strt_bcd <= 0;
	end
      
		always #5
			clk <= ~clk;
		
		
endmodule

