`timescale 1ns/1ns

module tb_Comparator;

    // Parameters
    parameter int N = 4; // Number of bits

    // Inputs
    logic [N-1:0] A;
    logic [N-1:0] B;
    
    // Outputs
    logic equal;
    logic A_greater_than_B;
    logic B_greater_than_A;

    // Instantiate the Comparator module
    Comparator #(N) comparator (
        .A(A),
        .B(B),
        .equal(equal),
        .A_greater_than_B(A_greater_than_B),
        .B_greater_than_A(B_greater_than_A)
    );

    // Random stimulus generation
    initial begin
        $display("Stimulus: A, B");
        repeat (10) begin // Repeat for 10 cycles
            // Generate random inputs for A and B
            A = $random % (1 << N);
            B = $random % (1 << N);
            
            // Apply inputs to the comparator
            #1; // Wait for one time unit for combinational logic to settle
            
            // Display inputs and outputs
            $display("%b, %b", A, B);
            $display("equal: %b, A_greater_than_B: %b, B_greater_than_A: %b", equal, A_greater_than_B, B_greater_than_A);
        end
        $finish; // End simulation after stimulus generation
    end
    
initial begin 
    $dumpfile("tb_comp.vcd");
    $dumpvars(0, tb_Comparator);
end 


endmodule
