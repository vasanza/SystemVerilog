`timescale 1ns/1ns

// Testbench for CLOCK_DIV_10_MHz module  
module tb_CLOCK_DIV_10_MHz;

// Signals
logic CLOCK_10MHz;
logic CLOCK_1MHz, CLOCK_100KHz, CLOCK_10KHz, CLOCK_1KHz;
logic CLOCK_100Hz, CLOCK_10Hz, CLOCK_1Hz;

// Instantiate CLOCK_DIV_10_MHz module
CLOCK_DIV_10_MHz uut (
    .CLOCK_10MHz(CLOCK_10MHz),
    .CLOCK_1MHz(CLOCK_1MHz),
    .CLOCK_100KHz(CLOCK_100KHz),
    .CLOCK_10KHz(CLOCK_10KHz),
    .CLOCK_1KHz(CLOCK_1KHz),
    .CLOCK_100Hz(CLOCK_100Hz),
    .CLOCK_10Hz(CLOCK_10Hz),
    .CLOCK_1Hz(CLOCK_1Hz)
);

// Initial stimulus
initial begin
    // Apply clock signal
    CLOCK_10MHz = 0;

    // Monitor the divided clocks
    $monitor("Time=%0t, 10MHz=%b, 1MHz=%b, 100KHz=%b, 10KHz=%b, 1KHz=%b, 100Hz=%b, 10Hz=%b, 1Hz=%b",
            $time, CLOCK_10MHz, CLOCK_1MHz, CLOCK_100KHz, CLOCK_10KHz, CLOCK_1KHz, CLOCK_100Hz, CLOCK_10Hz, CLOCK_1Hz);

    // Toggle 10MHz clock at regular intervals
    forever #5 CLOCK_10MHz = ~CLOCK_10MHz;
end

initial begin 
    $dumpfile("tb_CLOCK_DIV_10_MHz.vcd");
    $dumpvars(0, tb_CLOCK_DIV_10_MHz);
    #2000000 $finish;
end 

endmodule
