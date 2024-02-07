module Mux #(
    parameter int N = 4 // Number of data inputs,
)(
    input logic [N-1:0] data_input, data_input2, // Data inputs
    input logic  select, // Select input
    output logic [N-1:0] out // Output
);

    // Assign output based on select input
    assign out = select ? data_input2 : data_inputs; 

endmodule
