module Decoder #(parameter int N = 4) (
    input logic [N-1:0]A ,
    output logic [2**N-1:0]Q 
);

    assign Q = 1 << A;

endmodule
