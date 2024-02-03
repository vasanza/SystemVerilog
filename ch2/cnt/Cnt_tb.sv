// Testbench for Cnt module
module tb_Cnt;

// Parameters
localparam integer n = 4;

// Signals
logic Clk;
logic resetn;
logic en;
logic [n-1:0] q;

// Instantiate Cnt module
Cnt #(n) uut (
    .Clk(Clk),
    .resetn(resetn),
    .en(en),
    .q(q)
);

// Clock generation
initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
end

// Initial stimulus
initial begin
    // Apply initial values
    resetn = 0;
    en = 0;

    // Monitor the counter output
    $monitor("Time=%0t, Clk=%b, resetn=%b, en=%b, q=%h", $time, Clk, resetn, en, q);

    // Apply reset
    #10 resetn = 1;

    // Enable counter
    #10 en = 1;

    // Wait for a few clock cycles
    #50;

    // Disable counter
    #10 en = 0;

    // Finish simulation
    #10 $finish;
end

initial begin 
    $dumpfile("tb_cnt.vcd");
    $dumpvars(0, tb_Cnt);
end 

endmodule
