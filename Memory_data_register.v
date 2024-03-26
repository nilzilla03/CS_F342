`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:08:29
// Design Name: 
// Module Name: Memory_data_register
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


module Memory_data_register(
    input wire [31:0]mem_data , output reg [31:0]mem_data_out, input clk
    );
    always@(posedge clk)
        mem_data_out = mem_data;
    
endmodule
