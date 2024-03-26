`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:09:55
// Design Name: 
// Module Name: write_data_MUX
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


module write_data_MUX(input [31:0] ALUOut, input [31:0] Memory_data_register, input MemtoReg, output reg [31:0] Write_Data);

always@(*)
begin
    if(MemtoReg)
        Write_Data <= Memory_data_register;
    else
        Write_Data <= ALUOut;
end
endmodule
