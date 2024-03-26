`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:09:31
// Design Name: 
// Module Name: write_register_MUX
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


module write_register_MUX(input [4:0] Rt, input [4:0] Rd, input RegDst, output reg [4:0] Write_Register);

always@(*)
begin
    if(RegDst)
        Write_Register <= Rd;
    else
        Write_Register <= Rt;
end
endmodule
