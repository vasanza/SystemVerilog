module tb(); 

parameter CLK_PERIOD = 10; // Clock period in ns
logic clk,rstN;
logic [3:0] a, b, c ,d ;
logic [7:0] Q1;

always #((CLK_PERIOD / 2)) clk = ~clk;


initial begin
    clk = 0;
    rstN = 1; 
    a = 4'b0001; 
    b = 4'b0010; 
    c = 4'b0100;
    d = 4'b0010; 
end 

top uut (
    .clk(clk),
    .rstN(rstN),
    .a(a), 
    .b(b),
    .c(c),
    .d(d), 
    .Q1(Q1)
);

initial begin 
    #40 ;
    $finish;
end 



initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
  end


endmodule