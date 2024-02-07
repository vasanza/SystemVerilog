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
        Q = 3'b001;
        if (D == 4'b0001) begin 
            stateNext = S2; 
        end else begin 
            stateNext = S1;
        end 
    end 
    S2: begin
        Q = 3'b010;
        stateNext = A&B&C ? S3 : S2;
    end 
    
    S3:begin 
        Q = 3'b011;
        stateNext = (D == 4'b1111) ? S4 : S3;
    end 
    
    S4:begin 
        Q = 3'b100;
        stateNext = S0;
    end 
    
    default : begin
        Q = 3'b000;
        stateNext = S0;
    end 
    
  endcase
  
  end 
  
    
endmodule
