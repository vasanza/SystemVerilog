`timescale 1ns / 1ps
`include "common.sv"
import common::*;
//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chaper: 3
// 
// example number 3 
//
//
//
//////////////////////////////////////////////////////////////////////////////////




module example_03(
    input logic clk,rstN,A,B,C,[3:0] D,
    output logic [2:0]Q 
    );
    
    example_states state = S0, stateNext = S0;
/* secuential logic for async reset */
  always_ff @(posedge clk or negedge rstN) begin
    if (!rstN) begin
      Q <= 3'b000;
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
        Q = 3'b000;
        stateNext = A ? S1 : S0 ; 
        end
    S1: begin
        Q = 3'b011;
        if (D == 4'b0100) begin 
            stateNext = S2; 
        end else begin 
            stateNext = S1;
        end 
    end 
    S2: begin
        Q = 3'b100;
        stateNext = A&B ? S3 : S2;
    end 
    
    S3:begin 
        Q = 3'b000;
        stateNext = (D == 4'b1000) ? S4 : S3;
    end 
    
    S4:begin 
        Q = 3'b111;
        stateNext = S0;
    end 
    
    default : begin
        Q = 3'b000;
        stateNext = S0;
    end 
    
  endcase
  
  end 
  
    
endmodule
