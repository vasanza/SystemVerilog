`timescale 1ns/1ns

module tb_Mux;

    // Parameters
    parameter int N = 4; // Number of data inputs

    // Inputs
    logic [N-1:0] data_input, data_input2; // Data inputs
    logic select; // Select input
    
    // Output
    logic [N-1:0] out; // Output
    
    // Instantiate the Mux module
    Mux #(N) mux (
        .data_input(data_input),
        .data_input2(data_input2),
        .select(select),
        .out(out)
    );

    // Random stimulus generation
    initial begin
        $display("Stimulus: data_input, data_input2, select");
        repeat (10) begin // Repeat for 10 cycles
            // Generate random inputs for data_input and data_input2
            data_input = $random % (1 << N); // Random value within range of N bits
            data_input2 = $random % (1 << N); // Random value within range of N bits
            
            // Generate random input for select
            select = $random % 2; // Random value (0 or 1)
            
            // Apply inputs to the mux
            #1; // Wait for one time unit for combinational logic to settle
            
            // Display inputs and output
            $display("%b, %b, %b", data_input, data_input2, select);
            $display("Output: %b", out);
        end
        $finish; // End simulation after stimulus generation
    end

initial begin 
    $dumpfile("tb_mult.vcd");
    $dumpvars(0, tb_Mux);
end 
    
endmodule
