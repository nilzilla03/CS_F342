`timescale 1ns / 1ps
module IF(input wire clk, input wire reset, input wire [31:0] PC, output reg [31:0] instruction_register);

wire [31:0] address;
wire [31:0] instruction_temp;

IorD_MUX mux1(.PC(PC), .clk(clk), .ALUOut(ALUOut), .IorD(IorD), .address(address)); //ALUOut hasn't been created yet
Memory mem1(.clk(clk), .address(address), .MemRead(MemRead), .MemWrite(MemWrite), .write_data(write_data), .instruction(instruction_temp));
//memread, memwrite, write_data not created yet

always @(posedge clk or posedge reset)
begin
    if (reset)
        instruction_register <= 32'h0000_0000; // Reset instruction to 0 during reset
end

endmodule
