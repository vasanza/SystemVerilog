//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chapter: 4
// 
// example number 3
//
//////////////////////////////////////////////////////////////////////////////////


module alumux #( parameter int N = 4)(
    input logic [N-1:0] a, b, c ,d,
    input logic [1:0]select,
    output logic [2*N-1:0] Q
);

    always_comb begin 
        case (select)
        2'b00: Q = a+b+c;
        2'b01: Q = c-b;
        2'b10: Q = a>>d;
        2'b11: Q = b<<d;
        default : Q = 0; 
        endcase 
    end

endmodule 