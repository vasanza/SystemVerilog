module test_b();

parameter CLK_PERIOD = 10; // Clock period in ns

// Declare signals for the testbench
logic clk , rstN, FA, FB;
logic [3:0] A , B , Q1; 


initial begin
    clk = 0;
    rstN = 1; 
    A = 0; 
    B = 0; 
    FA = 4'b0000;
    FB = 4'b0000; 
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
    always #5 FA = ~FA;
    always #7 FB = ~FB;

    initial begin 
        A = 4'b0000 ;
        B = 4'b0100 ;
        #10 ;
        A = 4'b1111 ;
        B = 4'b0101 ;
        #10 ;
        A = 4'b0000 ;
        B = 1'b1100 ;
        #20 ;
        $finish;
    end 

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, test_b);
      end
endmodule 