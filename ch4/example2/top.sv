//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chapter: 4
// 
// example number 1 
//
//////////////////////////////////////////////////////////////////////////////////

module top(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic fa,fb,clk,rstN, 
    output logic [3:0] Q1 
);

    logic icon;

    fsm_01 fsm01(
        .clk(clk),
        .rstN(rstN),
        .a(fa),
        .b(fb),
        .select(icon)
    );

    Mux #4 mux01(
        .data_input(a),
        .data_input2(b),
        .select(icon),
        .out(Q1)
    );



endmodule