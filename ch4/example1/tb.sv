module test_b();

parameter CLK_PERIOD = 10; // Clock period in ns

// Declare signals for the testbench
logic clk , rstN, A, B,FA, FB, Q1;

initial begin
    clk = 0;
    rstN = 1; 
    A = 0; 
    B = 0; 
    FA = 0;
    FB = 0; 
end 

    top uut (
        .a(A),
        .b(B),
        .fa(FA),
        .fb(FB),
        .clk(clk),
        .rstN(rstN),
        .Q1(Q1)
    );
    always #((CLK_PERIOD / 2)) clk = ~clk;
    always #5 A = ~A;
    always #7 B = ~B;

    initial begin 
        FA = 1 ;
        FB = 1 ;
        #10 ;
        FA = 1 ;
        FB = 0 ;
        #10 ;
        FA = 0 ;
        FB = 1 ;
        #10 ;
        $finish;
    end 

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, test_b);
      end
endmodule 