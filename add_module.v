`timescale 1ns / 1ps
module add_module(input [31:0]s1, [31:0]s2, output [31:0]t1, output carry);
       assign {carry , t1} = s1 + s2;
endmodule
