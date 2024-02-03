// Testbench for Cnt_Ld module
module tb_Cnt_Ld;

// Parameters
localparam int n = 4;

// Signals
logic Clk;
logic resetn;
logic en;
logic ld;
logic [n-1:0] D;
logic [n-1:0] q;

// Instantiate Cnt_Ld module
Cnt_Ld #(n) uut (
    .Clk(Clk),
    .resetn(resetn),
    .en(en),
    .ld(ld),
    .D(D),
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
    ld = 0;
    D = 4'b0000;

    // Monitor the counter output
    $monitor("Time=%0t, Clk=%b, resetn=%b, en=%b, ld=%b, D=%h, q=%h", $time, Clk, resetn, en, ld, D, q);

    // Apply reset
    #10 resetn = 1;

    // Enable counter
    #10 en = 1;

    // Wait for a few clock cycles
    #50;

    // Load new value
    #10 D = 4'b1101;
    #10 ld = 1;

    // Wait for a few clock cycles
    #50;

    // Disable counter
    #10 en = 0;

    // Finish simulation
    #10 $finish;
end

initial begin 
    $dumpfile("tb_Cnt_Ld.vcd");
    $dumpvars(0, tb_Cnt_Ld);
end 

endmodule
