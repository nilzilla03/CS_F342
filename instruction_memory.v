`timescale 1ns / 1ps

module Memory (
    input wire clk,              // Clock signal
    input wire [31:0] address,   // Input address from MUX
    input wire MemRead,
    input wire MemWrite,
    input wire [31:0] write_data,
    output reg [31:0] instruction 
);

reg [7:0] memory [0:49]; 

initial begin
    { memory[0] , memory[1] , memory[2] , memory[3] } = 32'b000000_00010_00011_00001_00000_101010 ;
    { memory[4] , memory[5] , memory[6] , memory[7] } = 32'b101011_00101_00100_0000000000000011 ;
end

always@(*)
begin
    if(MemRead == 1'b1)
        instruction <= { memory[address], memory[address+1] , memory[address+2] , memory[address+3]};
end
always @(posedge clk)
begin
    
    if(MemWrite == 1'b1)
    begin
        {memory[address] , memory[address+1] , memory[address+2] , memory[address+3] } = write_data;
    end
end

endmodule
