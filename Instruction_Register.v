`timescale 1ns / 1ps

module Instruction_Register(output reg [31:0] Instruction, input [31:0] Instruction_In, input IR_Write, input clk);

always@(posedge clk)
begin
    if(IR_Write)
        Instruction <= Instruction_In;
end
endmodule
