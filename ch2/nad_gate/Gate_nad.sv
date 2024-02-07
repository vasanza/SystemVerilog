`timescale 1ns/1ns

//N-bit single nad gate
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Module
module Gate_nad #(parameter n = 1) (
    input logic [n-1:0] A,B,
    output logic [n-1:0] F
);
    // Output assignment
    assign F = ~(A & B);
endmodule
