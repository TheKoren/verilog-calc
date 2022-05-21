`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:25:22 04/26/2021
// Design Name:   usrt_rec
// Module Name:   D:/files/uni/bambilabor/FPGA/123/progs/calc5_v3/calc5/usrt_test.v
// Project Name:  calc5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: usrt_rec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module usrt_test;

    // Inputs
    reg rx;
    reg usrt_clk;
    reg clk;
    reg rst;

    // Outputs
    wire rdy;
    wire [7:0] data;

    // Instantiate the Unit Under Test (UUT)
    usrt_rec uut (
        .rx(rx), 
        .usrt_clk(usrt_clk), 
        .clk(clk), 
        .rst(rst), 
        .rdy(rdy), 
        .data(data)
    );

    initial begin
        // Initialize Inputs
        rx = 0;
        usrt_clk = 0;
        clk = 0;
        rst = 1;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        rst = 0;
        #10;
        
        #20;
        rx = 1;
        #20;
        rx = 1;
        #20;
        rx = 0;
        #20;
        rx = 1;
        #20;
        rx = 0;
        #20;
        rx = 1;
        #20;
        rx = 0;
        #20;
        rx = 1;
        #20;
        rx = 0;
        #20;
        rx = 1;
        #20;
        rx = 0;
        #20;
        rx = 1;
        #20;
        rx = 1;
        #20;
        rx = 1;
        #20;
        rx = 1;

    end
    
        always #5
        clk <= ~clk;
        
        always #10
        usrt_clk <= ~usrt_clk;
        
        
      
endmodule

