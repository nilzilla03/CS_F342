`timescale 1ns / 1ps

module Register_B(input [31:0] Read_data_2, output reg [31:0] Output_B, input clk);
    always@(posedge clk)
    begin
     Output_B = Read_data_2;
    end
endmodule