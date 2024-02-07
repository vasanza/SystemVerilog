module segment7(
    input logic [3:0] A,
    output logic [6:0] Q
    );
     

    logic [6:0] temp ;

    always_comb begin  
        case (A)  //case statement
            0 : temp = 7'b0000001;
            1 : temp = 7'b1001111;
            2 : temp = 7'b0010010;
            3 : temp = 7'b0000110;
            4 : temp = 7'b1001100;
            5 : temp = 7'b0100100;
            6 : temp = 7'b0100000;
            7 : temp = 7'b0001111;
            8 : temp = 7'b0000000;
            9 : temp = 7'b0000100;
        //switch off 7 segment character when the bcd digit is not a decimal number.
            default : temp = 7'b1111111;        
        endcase
    end

    assign Q = temp;
    
endmodule