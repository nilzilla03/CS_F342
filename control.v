`timescale 1ns / 1ps

module control(input [5:0] op,  output reg PCWriteCond,
    output reg PCWrite,
    output reg IorD,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg IRWrite,
    output reg [1:0]PCSource,
    output reg [1:0]ALUOp,
    output reg [1:0]ALUSrcB,
    output reg ALUSrcA,
    output reg RegWrite,
    output reg RegDst,
    input wire clk);
    
    reg [3:0]State;
    
    initial
    begin
        State = 0;
         ALUOp = 00;
        
    end
    
    always @(posedge clk )
    begin
        case(State)
            // IF : Instruction Fetch
            0: 
            begin
                State = 1 ;
            end
            
            // ID : Instruction Decode
            1:
            begin
                case(op)
                    6'b000000:
                        State = 6;
                    6'b101011:
                        State = 2;
                endcase
             end   
             
             2:
             begin
                case(op)
                    6'b100011:State = 3;//LW 
                    6'b101011:State = 5;//SW
                endcase
             end
             
             5:
             begin
                State = 0;
             end
             
             // Execution : R-Type
             6:
             begin
                State = 7;
             end
             
             // R-Type completion
             7:
             begin
                State = 0;
             end
            endcase
    end
    
    always @(*)
    begin
        case(State)
            // IF : Instruction Fetch
            0: 
            begin
                MemRead = 1;
                ALUSrcA = 0;
                IorD = 0;
                IRWrite = 1;
                ALUSrcB = 01;
                ALUOp = 00;
                PCWrite = 1;
                PCSource = 00;
                
                
                RegWrite = 0 ;
                MemWrite = 0 ;
            end
            
            // ID : Instruction Decode
            1:
            begin
                MemRead = 0 ;
                PCWrite  = 0;
                ALUSrcA = 0 ;
                ALUSrcB = 3 ;
                ALUOp = 0 ;
                
             end   
             
             2:
             begin
                IRWrite <= 0;
                ALUSrcA<=1;
                ALUSrcB<=2;
                ALUOp <= 00;
             end
             
             5:
             begin
                MemWrite <= 1;
                IorD <= 1;
             end
             
             // Execution : R-Type
             6:
             begin
                ALUSrcA <= 1;
                ALUSrcB <= 00 ;
                ALUOp <= 10;
             end
             
             // R-Type completion
             7:
             begin
                RegDst <= 1 ;
                RegWrite <= 1;
                MemtoReg <= 0 ;
             end
            endcase
               
    end
endmodule
