@echo off

set DESIGN_FILE=Buffer_3s.sv
set TESTBENCH_FILE=Buffer_tb.sv
set VVP_FILE=my_design.vvp
set VCD_FILE=tb_Buffer.vcd

:: Compile the design and testbench
iverilog -g 2012 -o %VVP_FILE% %DESIGN_FILE% %TESTBENCH_FILE%

:: Run the simulation
vvp %VVP_FILE%

:: Open GTKWave with the generated VCD file
gtkwave %VCD_FILE%
