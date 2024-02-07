`timescale 1ns/1ns


module tb_7_segments;

logic [3:0]stim  = 3'b000;
logic [6:0]out ;


segment7 dec(
    .A(stim),
    .Q(out)
);

initial begin
repeat (9) begin 
    ++stim; 
    #1;
//    $display("%d, %d", A, Q);
end 
$finish;
end 

initial begin 
    $dumpfile("tb_sec_dec.vcd");
    $dumpvars(0, tb_7_segments);
end 



endmodule