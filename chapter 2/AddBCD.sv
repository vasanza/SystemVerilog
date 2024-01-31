// 2-number adder BCD
// Repository: 
// https://github.com/vasanza/SystemVerilog
// Read more: 
// https://vasanza.blogspot.com

// Library
`include "sv_stdlib.sv" // Assuming sv_stdlib.sv contains standard libraries

// Module
module AddBCD (
    input logic [3:0] A, B,
    output logic [3:0] D, U // Tens, Units
);
    // Signals, Constants, Variables
    logic [7:0] temp, temp2;

    // Combinational logic for BCD addition
    always_comb begin
        temp = (8'b0000, A) + (8'b0000, B);
        temp2 = (temp > 9) ? (temp + 8'b00000110) : temp;
        D = temp2[7:4]; // Tens
        U = temp2[3:0]; // Units
    end

endmodule