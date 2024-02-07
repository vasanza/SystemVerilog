`timescale 1ns/1ns

// Testbench for Gate_and module
module tb_Gate_not;
// Parameters
localparam n = 4;

// Signals
logic [n-1:0] A;
logic [n-1:0] F_expected, F_actual;

// Instantiate Gate_not module
Gate_not #(n) uut (
    .A(A),
    .F(F_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    A = 4'b1010;
    F_expected = ~A;
    #10 if (F_actual !== F_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    A = 4'b1100;
    F_expected = ~A;
    #10 if (F_actual !== F_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    A = 4'b0000;
    F_expected = ~A;
    #10 if (F_actual !== F_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end

initial begin 
    $dumpfile("tb_Gate_not.vcd");
    $dumpvars(0, tb_Gate_not);
end 
endmodule
