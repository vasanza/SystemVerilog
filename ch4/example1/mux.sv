//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chapter: 4
// 
// example number 1 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps


module Mux 
(
    input logic  data_input, data_input2,select, // Select input
    output logic out // Output
);

    // Assign output based on select input
    assign out = select ? data_input2 : data_input; 

endmodule