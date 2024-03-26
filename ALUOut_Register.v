`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:17:17
// Design Name: 
// Module Name: ALUOut_Register
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


module ALUOut_Register(input [31:0] ALU_Result, output reg [31:0] ALUOut, input clk);
    always@(posedge clk)
    begin
        ALUOut = ALU_Result;
    end
endmodule
