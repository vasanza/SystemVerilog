module Comparator #(
    parameter int N = 4 // Number of bits
)(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    output logic equal,
    output logic A_greater_than_B,
    output logic B_greater_than_A
);

    // Wire declarations

    // Comparisons
    assign equal = (A==B) ? 1'b1 : 1'b0;  // A equals B if all bits of XOR are 1
    assign A_greater_than_B = (A>B) ? 1'b1 : 1'b0; // A is greater than B if AND is 0 and A is not equal to B
    assign B_greater_than_A = (A<B) ? 1'b1 : 1'b0; // B is greater than A if AND is 0 and A is not equal to B

endmodule
