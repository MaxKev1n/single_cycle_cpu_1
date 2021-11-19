`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 16:57:47
// Design Name: 
// Module Name: cla_2
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



module cla_2(
    input [1:0] a,
    input [1:0] b,
    input c_in,
    output g_out,
    output p_out,
    output [1:0] s
    );
    wire [1:0] g;
    wire [1:0] p;
    wire c_out;

    add add0(.a(a[0]), .b(b[0]), .c(c_in), .g(g[0]), .p(p[0]), .s(s[0]));
    add add1(.a(a[1]), .b(b[1]), .c(c_out), .g(g[1]), .p(p[1]), .s(s[1]));
    g_p g_p0(.g(g), .p(p), .c_in(c_in), .g_out(g_out), .p_out(p_out), .c_out(c_out));
endmodule
