// Testbench for Buffer_3s module
module tb_Buffer_3s;
// Parameters
localparam int n = 4;

// Signals
logic [n-1:0] ent;
logic en;
logic [n-1:0] sal_expected, sal_actual;

// Instantiate Buffer_3s module
Buffer_3s #(n) uut (
    .ent(ent),
    .en(en),
    .sal(sal_actual)
);

// Initial stimulus
initial begin
    // Test case 1
    ent = 4'b0101;
    en = 1;
    sal_expected = ent;
    #10 if (sal_actual !== sal_expected) begin
        $display("Test Case 1 Failed");
        $finish;
    end

    // Test case 2
    ent = 4'b1100;
    en = 0;
    sal_expected = 'z; // Expected high impedance state
    #10 if (sal_actual !== sal_expected) begin
        $display("Test Case 2 Failed");
        $finish;
    end

    // Test case 3
    ent = 4'b0011;
    en = 1;
    sal_expected = ent;
    #10 if (sal_actual !== sal_expected) begin
        $display("Test Case 3 Failed");
        $finish;
    end

    // Add more test cases as needed

    $display("All test cases passed");
    $finish;
end
initial begin 
    $dumpfile("tb_Buffer.vcd");
    $dumpvars(0, tb_Buffer_3s);
end 
endmodule
