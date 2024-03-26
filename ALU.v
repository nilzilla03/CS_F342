`timescale 1ns / 1ps
//recieved operation control signal from ALUControl and performs operation
module ALU(input [31:0]in1, input [31:0]in2,input [2:0]control, output reg zero, output reg [31:0]result );
    wire [31:0] w1,w2,w3,w4;
    wire w5, w6;
    or_module f1(in1,in2,w1);
    sub_module f2(in1,in2,w2, w5);
    and_module f3(in1,in2,w3);
    add_module f4(in1,in2,w4, w6); 
    
    always@(*)
    begin
        case(control)
            3'b001: result = w1; //or 
            3'b110: result = w2; //sub
            3'b000: result = w3; //and
            3'b010: result = w4; //add
            3'b111: result = ( w2[31] ^ w5 ) ; //slt
        endcase
        
        if (result == 32'h00000000) 
            assign zero = 1;
        else
            assign zero = 0;
  end
endmodule

