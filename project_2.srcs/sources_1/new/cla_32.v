`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 12:38:30
// Design Name: 
// Module Name: cla_32
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


module cla_32(
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output g_out,
    output p_out,
    output [31:0] s
    );

    wire [1:0] g, p;
    wire c_out;

    cla_16 cla0(.a(a[15:0]), .b(b[15:0]), .c_in(c_in), .g_out(g[0]), .p_out(p[0]), .s(s[15:0]));
    cla_16 cla1(.a(a[31:16]), .b(b[31:16]), .c_in(c_out), .g_out(g[1]), .p_out(p[1]), .s(s[31:16]));
    g_p g_p0(.g(g), .p(p), .c_in(c_in), .g_out(g_out), .p_out(p_out), .c_out(c_out));
endmodule
