`timescale 1ns / 1ps
`include "common.sv"
import common::*;
//////////////////////////////////////////////////////////////////////////////////
// Book: Mastering FPGA: Exploring Advanced Applications and Implementations
// Chaper: 3
// 
// example number 4 
// 
//
//////////////////////////////////////////////////////////////////////////////////


module example_02(
    input logic clk,rstN,A,B,C,[3:0] D,
    output logic [7:0]Q 
    );
    
    example_states state = S0, stateNext = S0;
/* sucuential logic for async reset */
  always_ff @(posedge clk or negedge rstN) begin
    if (!rstN) begin
      Q <= 3'b000;
      state <= S0;
    end
    else begin
      state <= stateNext;
    end
  end
  /* combinatorial logic for next state*/
  always_comb begin 
  
  case (state)
    S0:begin stateNext = A ? S1 : S0 ; end
    S1: begin
        if (D == 4'b0010) begin 
            stateNext = S2; 
        end else begin 
            stateNext = S1;
        end 
    end 
    S2: begin stateNext = A&B ? S3 : S2;end 
    S3:begin stateNext = (D == 4'b1000) ? S4 : S3;end 
    S4:begin stateNext = S0;end 
    default : begin stateNext = S0;end 
  endcase
  end 
  
  /* we can use a secondary combinatorial logic block for the output logic*/ 
  always_comb begin 
  case (state)
    S0:begin 
    if (A & B & C)begin Q = 8'h20;end 
    else begin Q = 8'h30; end
    end
    S1: begin
    if (A & C )begin Q = 8'h50;end 
    else begin Q = 8'h60; end
    end 
    S2: begin 
    if (A & B & C )begin Q = 8'hff;end 
    else begin Q = 8'h54; end
    end
    S3:begin 
    if (D>3'h03)begin Q = 8'h67;end 
    else begin Q = 3'8'h45; end
    end
    S4:begin 
    if (D>3'h02)begin Q = 3'b010;end 
    else begin Q = 3'b001; end
    end
    
    default : begin Q = 8'h00;end 
  
    
  endcase
  
  end
    
endmodule
