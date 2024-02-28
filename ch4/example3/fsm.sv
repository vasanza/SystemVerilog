//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chapter: 4
// 
// example number 3
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`include "common.sv"
import common::*;

module fsm_01 (
    input logic clk,rstN, // Data inputs
    output logic [1:0]select // Output
);

example_states state = S0, stateNext = S0;
/* secuential logic for async reset */
  always_ff @(posedge clk or negedge rstN) begin
    if (!rstN) begin
      select <= 2'b00;
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
        select = 2'b00;
        stateNext = S1;
        end
    S1: begin
        select = 2'b01;
        stateNext = S2;
    end     
    S2: begin
        select = 2'b10;
        stateNext = S3;
    end     
    S3: begin
        select = 2'b11;
        stateNext = S0;
    end     

    default : begin
        select = 2'b00;
        stateNext = S0;
    end 
    
  endcase
  end 
endmodule
