`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 11:21:45 PM
// Design Name: 
// Module Name: Alu_Control
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


module ALU_Controller(input [1:0] ALUOp, input [5:0] func_bits, output reg [2:0] ALU_Control);

    always@(*)
    begin
        case(ALUOp)
            0: ALU_Control = 3'b010;
            1: ALU_Control = 3'b110;
            default:
            begin
                case(func_bits[3:0])
                0: ALU_Control = 3'b010;
                2: ALU_Control = 3'b110;
                4: ALU_Control = 3'b000;
                5: ALU_Control = 3'b001;
                10:ALU_Control = 3'b111;
                endcase
            end
        endcase    
    end

endmodule
