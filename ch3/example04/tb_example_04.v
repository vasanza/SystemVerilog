`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2024 07:22:22 PM
// Design Name: 
// Module Name: tb_example_02
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

typedef  struct packed{
    logic a, b, c;
    logic  [3:0]d ;
} ex2_stimulus;


class ex2_tb;
    ex2_stimulus [$:0] state_logic;
    ex2_stimulus [$:0] output_logic;
    
    int index; 
    
    function new(ref logic A,ref logic B,ref logic C,ref logic [2:0]D);
    index = 0;
    state_logic = 
    {{1'b1,1'b0,1'b0,3'b000},
    {1'b0,1'b0,1'b0,3'b001},
    {1'b1,1'b1,1'b1,3'b000},
    {1'b0,1'b0,1'b0,3'b111}};
    
    output_logic = 
    {{1'b1,1'b1,1'b0,3'b000},
    {1'b1,1'b0,1'b1,3'b000},
    {1'b1,1'b1,1'b1,3'b000},
    {1'b0,1'b0,1'b0,3'b011}};
    
    endfunction
    
task automatic make_stimulus(
    output logic a,
    b,
    c,
   output logic [2:0] d
);
    
    
    endtask

endclass
module tb_example_02;

    parameter CLK_PERIOD = 10; // Clock period in ns

  // Declare signals for the testbench
    logic clk, rstN, A, B, C;
    logic [3:0] D;
    logic [2:0] Q;

  // Instantiate the module under test
  example_02 uut (
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
