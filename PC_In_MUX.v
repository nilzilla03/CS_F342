`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:17:50
// Design Name: 
// Module Name: PC_In_MUX
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


module PC_In_MUX(input [1:0]PCSource, input [31:0] ALU_Result, input [31:0] ALUOut, input [31:0] PC_appended, output reg [31:0] PC_in);
    always@(*)
    begin
        case(PCSource)
        
        0: begin
            PC_in = ALU_Result;
            end
        1: begin
            PC_in = ALUOut;
            end
        2: begin
            PC_in = PC_appended;
            end
       endcase
    end
endmodule
