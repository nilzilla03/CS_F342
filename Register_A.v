`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:13:57
// Design Name: 
// Module Name: Register_A
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


module Register_A(input [31:0] Read_data_1, output reg [31:0] Output_A, input clk);
    always@(posedge clk)
    begin
     Output_A = Read_data_1;
    end
endmodule
