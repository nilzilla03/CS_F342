`timescale 1ns / 1ps

module IorD_MUX(input wire [31:0] PC, input wire [31:0] ALUOut, input wire IorD, output reg [31:0] address);

always@(*)
begin
    if(IorD == 0)
        address <= PC;
    else if (IorD == 1)
        address <= ALUOut;
end
endmodule
