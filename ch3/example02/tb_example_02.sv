`timescale 1ns / 1ns

module example_02_tb;

    // Inputs
    logic clk, rstN, A, B, C;
    logic [3:0] D;
    
    // Outputs
    logic [2:0] Q;
    
    // Instantiate the example_02 module
    example_02 dut (
        .clk(clk),
        .rstN(rstN),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Q(Q)
    );
    
    // Clock generation
    always begin
        #5 clk = !clk;
    end
    
    // Initialize inputs
    initial begin
        clk = 0;
        rstN = 0;
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        
        // Apply reset
        #10 rstN = 1;
        
        // Apply stimulus
        #10 A = 1;
        #10 B = 1;
        #10 C = 1;

        #10 D = 4'b0001;
        #10 D = 4'b0011;
        #10 D = 4'b1111;

        // End simulation
        #10 $finish;
    end

    initial begin
      $dumpfile("tb_example_02.vcd");
      $dumpvars(0, example_02_tb);
    end

endmodule
