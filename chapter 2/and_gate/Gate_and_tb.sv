// Testbench for Gate_and module
module tb_Gate_and;
// Parameters
localparam n = 4;

// Signals
logic [n-1:0] A, B;
logic [n-1:0] F_expected, F_actual;

// Instantiate Gate_and module
Gate_and #(n) uut (
    .A(A),
    .B(B),
    .F(F_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    A = 4'b1010;
    B = 4'b0101;
    F_expected = A & B;
    #10 if (F_actual !== F_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    A = 4'b1100;
    B = 4'b1111;
    F_expected = A & B;
    #10 if (F_actual !== F_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    A = 4'b0000;
    B = 4'b1111;
    F_expected = A & B;
    #10 if (F_actual !== F_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end

initial begin 
    $dumpfile("tb_Gate_and.vcd");
    $dumpvars(0, tb_Gate_and);
end 
endmodule
