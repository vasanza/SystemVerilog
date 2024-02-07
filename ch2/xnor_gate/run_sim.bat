@echo off

set DESIGN_FILE=Gate_xnor.sv
set TESTBENCH_FILE=Gate_xnor_tb.sv
set VVP_FILE=my_design.vvp
set VCD_FILE=tb_Gate_xnor.vcd

:: Compile the design xnor testbench
iverilog -g 2012 -o %VVP_FILE% %DESIGN_FILE% %TESTBENCH_FILE%

:: Run the simulation
vvp %VVP_FILE%

:: Open GTKWave with the generated VCD file
gtkwave %VCD_FILE%
