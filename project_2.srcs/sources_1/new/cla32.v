`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 12:42:55
// Design Name: 
// Module Name: cla32
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


module cla32(
    input [31:0] a,
    input [31:0] b,
    input ci,
    output [31:0] s,
    output co
    );

    wire g_out, p_out;
    cla_32 cla(.a(a), .b(b), .c_in(ci), .g_out(g_out), .p_out(p_out), .s(s));
    assign co = g_out | p_out & ci;
endmodule