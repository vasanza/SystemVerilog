`timescale 1ns / 1ns

module example_04_tb;

    // Inputs
    logic clk, rstN, A, B, C;
    logic [3:0] D;
    
    // Outputs
    logic [7:0] Q;
    
    // Instantiate the example_02 module
    example_04 dut (
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
        A = 1;
        B = 1;
        C = 1;
        #10
        D = 4'b0010;
        #10
        A = 0;
        B = 0;
        C = 0;
        #10
        A = 1;
        C = 1;
        #10
        B = 1;
        #10 D = 4'b1000;
        #10
        #10 D =4'b0010;

        // End simulation
        #10 $finish;
    end

    initial begin
      $dumpfile("tb_example_04.vcd");
      $dumpvars(0, example_04_tb);
    end

endmodule
