//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chapter: 4
// 
// example number 1 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps


module Mux #(
    parameter int N = 4 // Number of data inputs,
)(
    input logic [N-1:0] data_input, data_input2, // Data inputs
    input logic  select, // Select input
    output logic [N-1:0] out // Output
);

    // Assign output based on select input
    assign out = select ? data_input2 : data_input; 

endmodule
