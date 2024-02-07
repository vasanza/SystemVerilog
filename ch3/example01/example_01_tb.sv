//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2024 08:22:21 PM
// Design Name: 
// Module Name: example_01_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ns

module tb_example_01;

  // Define parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Declare signals for the testbench
  logic clk, rstN, A, B, C;
  logic [3:0] D;
  logic [2:0] Q;

  // Instantiate the module under test
  example_01 uut (
    .clk(clk),
    .rstN(rstN),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .Q(Q)
  );

  // Clock generation process
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Initial block for stimulus
  initial begin
    // Initialize inputs
    clk   = 0;
    rstN  = 1;
    A     = 0;
    B     = 0;
    C     = 0;
    D     = 4'b0000;

    // Apply reset
    #10 rstN = 0;

    // Wait for a few clock cycles
    #20 rstN = 1;

    // Apply test vectors
    A = 1;
    #20
    D = 4'b0001;
    #20
    B = 1;
    C = 1;
    #20
    D = 4'b1111;

    #20;

    // Add more test vectors as needed

    // End simulation after some time
   $finish;
  end
 
 endmodule
  
 
 

