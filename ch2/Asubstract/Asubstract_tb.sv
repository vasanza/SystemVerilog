// Testbench for AsubtractB module
module tb_AsubtractB;
// Parameters
localparam int n = 4;

// Signals
logic [n-1:0] A, B;
logic [n:0] S_expected, S_actual;

// Instantiate AsubtractB module
AsubtractB #(n) uut (
    .A(A),
    .B(B),
    .S(S_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    A = 4'b0101;
    B = 4'b0010;
    S_expected = A - B;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    A = 4'b1111;
    B = 4'b0110;
    S_expected = A - B;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    A = 4'b0000;
    B = 4'b0000;
    S_expected = A - B;
    #10 if (S_actual !== S_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end

initial begin 
    $dumpfile("tb_Asubstract.vcd");
    $dumpvars(0, tb_AsubtractB);
end 
endmodule
