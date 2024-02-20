`timescale 1ns / 1ps
`include "common.sv"
import common::*;
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2024 07:59:36 PM
// Design Name: 
// Module Name: example_01
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module example_02(
    input logic clk,rstN,A,B,C,
    input logic [3:0] D,
    output logic [2:0]Q 
    );
    
example_states state = S0, stateNext = S0;
/* sucuential logic for async reset */
  always_ff @(posedge clk or negedge rstN) begin
    if (!rstN) begin
      state <= S0;
    end
    else begin
      state <= stateNext;
    end
  end
  /* combinatorial logic for next state*/
  always_comb begin 
  
  case (state)
    S0:begin 
    if (A)
      stateNext = S1; 
    else 
      stateNext = S0; 
    end
    
    S1: begin
    if (D == 4'b0001) begin 
      stateNext = S2; 
    end else begin 
      stateNext = S1;
    end 
    end 
    S2: begin 
    if (A&B&C)
      stateNext =  S3;
    else 
      stateNext = S2;
    end 
    S3:begin
    if  (D == 4'b1111)
      stateNext =  S4 ;
    else 
      stateNext =  S3 ;
    end 
    S4:begin stateNext = S0;end 
    default : begin stateNext = S0;end 
  endcase
  end 
  
  /* we can use a secondary combinatorial logic block for the output logic*/ 
  always_comb begin 
  if (!rstN) begin
      Q = 3'b000;
  end
  else  begin
  case (state)
    S0:begin 
    if (A & B )begin Q = 3'b001;end 
    else begin Q = 3'b000; end
    end
    S1: begin
    if (A & C )begin Q = 3'b011;end 
    else begin Q = 3'b010; end
    end 
    S2: begin 
    if (A & B & C ) begin Q = 3'b101; end 
    else begin Q = 3'b100; end
    end
    S3:begin 
    if (D>4'h1) begin Q = 3'b000; end 
    else begin Q = 3'b111; end
    end
    S4:begin 
    if (D>4'h2)begin Q = 3'b010;end 
    else begin Q = 3'b001; end
    end
    default : begin Q = 4'h0 ; end 

  endcase
  end
  end
    
endmodule
