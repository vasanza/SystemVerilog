// Testbench for ParamQueue module
module tb_ParamQueue;

// Parameters
localparam int WIDTH = 8;
localparam int DEPTH = 16;

// Signals
logic clk;
logic rst;
logic [WIDTH-1:0] data_in;
logic enqueue;
logic dequeue;
logic [WIDTH-1:0] data_out;
logic full;
logic empty;

// Instantiate ParamQueue module
ParamQueue #(WIDTH, DEPTH) uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .enqueue(enqueue),
    .dequeue(dequeue),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Initial stimulus
initial begin
    // Apply initial values
    rst = 1;
    enqueue = 0;
    dequeue = 0;
    data_in = 8'b01010101;

    // Monitor the queue status
    $monitor("Time=%0t, clk=%b, rst=%b, enqueue=%b, dequeue=%b, data_out=%h, full=%b, empty=%b",
            $time, clk, rst, enqueue, dequeue, data_out, full, empty);

    // Apply reset
    #10 rst = 0;

    // Enqueue some data
    #10 enqueue = 1;
    #10 enqueue = 1;
    #10 enqueue = 1;

    // Dequeue some data
    #10 dequeue = 1;
    #10 dequeue = 1;

    // Finish simulation
    #10 $finish;
end

initial begin 
    $dumpfile("tb_ParamQueue.vcd");
    $dumpvars(0, tb_ParamQueue);
end 
endmodule
