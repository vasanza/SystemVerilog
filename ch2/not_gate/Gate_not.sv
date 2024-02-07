`timescale 1ns/1ns

//N-bit single not gate
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Module
module Gate_not #(parameter n = 1) (
    input logic [n-1:0] A,
    output logic [n-1:0] F
);
    // Output assignment
    assign F = ~A ;
endmodule
