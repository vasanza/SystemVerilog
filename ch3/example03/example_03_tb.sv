//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chapter: 3
// 
// example number 3 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ns

module tb_example_03;

  // Define parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Declare signals for the testbench
  logic clk, rstN, A, B, C;
  logic [3:0] D;
  logic [2:0] Q;

  // Instantiate the module under test
  example_03 uut (
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
    B = 1;
    #10 D = 4'b0001;
    #10 D = 4'b0011;
    #10 D = 4'b0100;
    A = 1;
    C = 1;
    #10
    D = 4'b1111;
    #10
    D = 4'b1000;
    #20;

    // End simulation after some time
   $finish;
  end

  initial begin
    $dumpfile("tb_example_03.vcd");
    $dumpvars(0, tb_example_03);
  end
 
 endmodule
  
 
 

