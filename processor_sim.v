`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 03:23:12 PM
// Design Name: 
// Module Name: processor_sim
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


module processor_sim(

    );
    reg clk; reg reset;
    
    multi_cycle_processor MCP(clk,reset);
    initial begin
        reset = 0 ;
        clk=0;#20;clk=1;#20; //IF
        clk=0;#20;clk=1;#20; //ID
        clk=0;#20;clk=1;#20; //EX
        clk=0;#20;clk=1;#20; //REG
        clk=0;#20;clk=1;#20; //IF
        clk=0;#20;clk=1;#20; //ID
        clk=0;#20;clk=1;#20; //EX
        clk=0;#20;clk=1;#20; //REG
        clk=0;#20;clk=1;#20; //IF
        clk=0;#20;clk=1;#20; //ID
        clk=0;#20;clk=1;#20; //EX
        clk=0;#20;clk=1;#20;
        
        $finish;
    end
    
    

endmodule
