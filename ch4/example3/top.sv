module top(
    input logic clk,rstN, // Data inputs
    input logic [3:0] a, b, c ,d ,
    output logic [7:0] Q1 // Output
);

logic [1:0] conn;

fsm_01 fsm (
    .clk(clk),
    .rstN(rstN), 
    .select(conn)
);

alumux mux(
    .a(a), 
    .b(b), 
    .c(c),
    .d(d),
    .select(conn),
    .Q(Q1)
);



endmodule