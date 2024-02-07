@echo off

set DESIGN_FILE=Gate_xor.sv
set TESTBENCH_FILE=Gate_xor_tb.sv
set VVP_FILE=my_design.vvp
set VCD_FILE=tb_Gate_xor.vcd

:: Compile the design xor testbench
iverilog -g 2012 -o %VVP_FILE% %DESIGN_FILE% %TESTBENCH_FILE%

:: Run the simulation
vvp %VVP_FILE%

:: Open GTKWave with the generated VCD file
gtkwave %VCD_FILE%
