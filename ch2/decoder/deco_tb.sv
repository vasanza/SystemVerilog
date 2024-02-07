`timescale 1ns/1ns

module tb_Decoder;

    // Parameters
    parameter int N = 3; // Number of input bits

    // Inputs
    logic [N-1:0] Ai; // Input vector
    
    // Outputs
    logic [2**N-1:0] Fo; // Output vector
    
    // Instantiate the Decoder module
    Decoder #(N) decoder (
        .A(Ai),
        .Q(Fo)
    );

    // Random stimulus generation
    initial begin
        $display("Stimulus: input");
        repeat (2**N) begin // Repeat for all possible input combinations
            // Set input to current iteration value
            Ai = $urandom_range(0, 2**N);
            
            // Apply input to the decoder
            #1; // Wait for one time unit for combinational logic to settle
            
            // Display input and output
            $display("%b", Ai);
            $display("Output: %b", Fo);
        end
        $finish; // End simulation after all possible input combinations
    end
initial begin 
    $dumpfile("tb_deco.vcd");
    $dumpvars(0, tb_Decoder);
end 

endmodule
