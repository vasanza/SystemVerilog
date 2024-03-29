@echo off

set DESIGN_FILE= mux.sv fsm.sv top.sv
set TESTBENCH_FILE=tb.sv
set VVP_FILE=my_design.vvp
set VCD_FILE=tb.vcd

:: Compile the design and testbench
iverilog -g 2012 -o %VVP_FILE% %DESIGN_FILE% %TESTBENCH_FILE%

:: Run the simulation
vvp %VVP_FILE%

:: Open GTKWave with the generated VCD file
gtkwave %VCD_FILE%
