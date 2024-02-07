`timescale 1ns/1ns

//N-bit single or gate
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Module
module Gate_or #(parameter n = 1) (
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n-1:0] F
);
    // Output assignment
    assign F = A | B;
endmodule
