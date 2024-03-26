`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2024 19:13:16
// Design Name: 
// Module Name: Registers
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


module Registers(input [4:0] Read_register_1, input [4:0] Read_register_2, input [4:0] Write_register, input [31:0] Write_data, input RegWrite,
    output reg [31:0] Read_data_1, output reg [31:0] Read_data_2, input clk);
    
    reg [31:0] register_file [31:0];
    
    initial begin
    // NEED TO ADD VALUES TO REGISTERS AS MENTIONED IN QUESTION
        register_file[2][31:0] = 'h35A4;
        register_file[3][31:0] = 'h11AB0;
        register_file[4][31:0] = 'h2B124E;
        register_file[5][31:0] = 'h10;
        
        
    end
    
    always@(posedge clk )
    begin
        if(RegWrite)
            register_file[Write_register] = Write_data;
    end
    
    always@(*)
    begin
        Read_data_1 = register_file[Read_register_1];
        Read_data_2 = register_file[Read_register_2];
    end
    
endmodule
