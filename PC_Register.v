`timescale 1ns / 1ps

module PC_Register(input [31:0] PC_in, input PC_Write, output reg [31:0] PC, input clk);

initial begin
    PC = 0;
end
always@(posedge clk)
    begin
    if(PC_Write)
      PC = PC_in;
    end
endmodule
