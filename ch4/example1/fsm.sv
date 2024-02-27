//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chapter: 4
// 
// example number 1 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`include "common.sv"
import common::*;

module fsm_01 (
    input logic clk,rstN,a,b, // Data inputs
    output logic select // Output
);

example_states state = S0, stateNext = S0;
/* secuential logic for async reset */
  always_ff @(posedge clk or negedge rstN) begin
    if (!rstN) begin
      select <= 1'b0;
      state <= S0;
    end
    else begin
      state <= stateNext;
    end
  end
  
  /* combinatorial logic for state and output */

  always_comb begin 
  
  case (state)
    S0:begin 
        select = 1'b0;
        if (a)
        stateNext =  S1 ;
        else
        stateNext =  S0 ;
        end
    S1: begin
        select = 1'b1;
        if (a) begin 
            stateNext = S1; 
        end else if (b) begin 
            stateNext = S0;
        end 
    end     
    default : begin
        select = 1'b0;
        stateNext = S0;
    end 
    
  endcase
  
  end 
  
endmodule
