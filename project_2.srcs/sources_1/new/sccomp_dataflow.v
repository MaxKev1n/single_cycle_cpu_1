`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 00:11:46
// Design Name: 
// Module Name: sccomp_dataflow
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


module sccomp_dataflow(
    input clock,
    input resetn,
    input clka,
    output [31:0] inst,
    output [31:0] pc,
    output [31:0] aluout,
    output [31:0] memout,
    output [31:0] data
    );

    wire wmem;

    sccpu_dataflow s(.clock(clock), .resetn(resetn), .inst(inst), .mem(memout), .pc(pc), .wmem(wmem), .alu(aluout), .data(data));
    scinstmem imem(.a(pc), .inst(inst));
    scdatamem dmem(.clk(clka), .spo(memout), .d(data), .a({1'b0, aluout[6:2]}), .we(wmem));
endmodule
