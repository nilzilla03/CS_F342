`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:16:31
// Design Name: 
// Module Name: MUX_B
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


module MUX_B(input [31:0] data_sign_extended, input [31:0] Register_B, input [31:0] data_shifted, input [1:0]ALUSrcB, output reg [31:0] ALU_Input_B);
always@(ALUSrcB)
begin
    case(ALUSrcB)
    0: begin 
      ALU_Input_B <= Register_B;
      end
    1: begin
      ALU_Input_B <= 32'b100;
      end
    2: begin  
      ALU_Input_B <= data_sign_extended;
      end
    3: begin
      ALU_Input_B <= data_shifted;
      end
    endcase
end
endmodule
