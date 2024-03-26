`timescale 1ns / 1ps
module multi_cycle_processor(input wire clk, input wire reset);


    //Control Signals
    wire PCWriteCond;
    wire PCWrite;
    wire IorD;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire IRWrite;
    wire [1:0]PCSource;
    wire [1:0]ALUOp;
    wire [1:0]ALUSrcB;
    wire ALUSrcA;
    wire RegWrite;
    wire RegDst;
    
    //Connection wires
    wire [31:0] PC_Input;
    wire [31:0] PC_Out;
    wire [31:0] Memory_Address;
    wire [31:0] Memory_Data;
    wire [31:0] Instruction;
    wire [31:0] Memory_Data_Register_Out;
    wire RF_Read_Reg_1;
    wire RF_Read_Reg_2;
    wire [4:0]RF_Write_Register;
    wire [31:0] RF_Write_Data;
    wire [31:0] RF_Read_Data_1;
    wire [31:0] RF_Read_Data_2;
    wire [31:0] Reg_A_Out;
    wire [31:0] Reg_B_Out;
    wire [31:0] sign_extend_out;
    wire [31:0] sign_extend_shifted;
    wire [31:0] ALU_In_A;
    wire [31:0] ALU_In_B;
    wire [31:0] ALU_Result;
    wire ALU_Zero;
    wire [31:0] ALUOut_RegOut;
    wire [31:0] PC_Shifted;
    wire [31:0] Jump_Address;
    assign Jump_Address[27:0] = PC_Shifted[27:0];
    assign Jump_Address[31:28] = PC_Out[31:28];
    
    wire PC_Control ;
    
    assign PC_Control = PCWrite | ( PCWriteCond & ALU_Zero );
    
    wire [2:0] ALU_Control;
    
    ALUOut_Register ALU_OUT(ALU_Result, ALUOut_RegOut, clk);
    Instruction_Register IR(Instruction, Memory_Data, IRWrite, clk);
    IorD_MUX ID_MUX(PC_Out, ALUOut_RegOut ,IorD, Memory_Address);
    MUX_A MUX_A_dut(PC_Out, Reg_A_Out , ALUSrcA, ALU_In_A);
    MUX_B MUX_B_dut(sign_extend_out, Reg_B_Out, sign_extend_shifted, ALUSrcB, ALU_In_B);
    Memory MEMORY(
    clk,              // Clock signal
    Memory_Address,   // Input address from MUX
    MemRead,
    MemWrite,
    Reg_B_Out,
    Memory_Data
    );
    Memory_data_register MDR( Memory_Data , Memory_Data_Register_Out , clk);
    PC_In_MUX PC_MUX(PCSource, ALU_Result, ALUOut_RegOut, Jump_Address, PC_Input);
    PC_Register PCR(PC_Input, PC_Control, PC_Out, clk);
    
    Register_A REG_A(RF_Read_Data_1, Reg_A_Out, clk);
    Register_B REG_B(RF_Read_Data_2, Reg_B_Out, clk);
    Registers REGS(Instruction[25:21], Instruction[20:16], RF_Write_Register, RF_Write_Data, RegWrite, RF_Read_Data_1, RF_Read_Data_2 , clk);
    shift_left_2 SIGN_EXT_SHIFT(sign_extend_out, sign_extend_shifted);
    shift_left_2 PC_SHIFT(Instruction[25:0], PC_Shifted);
    sign_extend SE(Instruction[15:0], sign_extend_out);
    write_data_MUX WDM(ALUOut_RegOut, Memory_Data_Register_Out,MemtoReg, RF_Write_Data);
    write_register_MUX WR_MUX(Instruction[20:16], Instruction[15:11], RegDst, RF_Write_Register);
    
    ALU ALU_dut(ALU_In_A, ALU_In_B, ALU_Control , ALU_Zero, ALU_Result);
    ALU_Controller ALU_Controller_dut(ALUOp, Instruction[5:0], ALU_Control);
    control control_dut(Instruction[31:26], PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, PCSource, ALUOp, ALUSrcB, ALUSrcA, RegWrite, RegDst , clk);
endmodule
