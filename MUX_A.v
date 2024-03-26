`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:16:13
// Design Name: 
// Module Name: MUX_A
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


module MUX_A(input [31:0] PC, input [31:0] Register_A, input ALUSrcA, output reg [31:0] ALU_Input_A);

always@( ALUSrcA )
begin
    if(ALUSrcA)
       ALU_Input_A <= Register_A;
    else
        ALU_Input_A <= PC; 
end
endmodule
