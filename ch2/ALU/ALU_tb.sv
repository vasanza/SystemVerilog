// Testbench for ALU module
module tb_ALU;
// Parameters
localparam int n = 8;

// Signals
logic [n-1:0] A, B;
logic [2:0] sel;
logic en;
logic [n:0] Q_expected, Q_actual;

// Instantiate ALU module
ALU #(n) uut (
    .A(A),
    .B(B),
    .sel(sel),
    .en(en),
    .Q(Q_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    A = 8'b00101010;
    B = 8'b00001111;
    sel = 3'b000; // Addition
    en = 1;
    Q_expected = A + B;
    #10 if (Q_actual !== Q_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    A = 8'b10101111;
    B = 8'b01010101;
    sel = 3'b010; // Multiplication
    en = 1;
    Q_expected = A * B;
    #10 if (Q_actual !== Q_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    A = 8'b11110000;
    B = 8'b11001100;
    sel = 3'b100; // Bitwise AND
    en = 1;
    Q_expected = A & B;
    #10 if (Q_actual !== Q_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end

initial begin  
    $dumpfile("tb_ALU.vcd");
    $dumpvars(0, tb_ALU);
end
endmodule
