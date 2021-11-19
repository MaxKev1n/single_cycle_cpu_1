`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 17:04:13
// Design Name: 
// Module Name: cla_4
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

module cla_4(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output g_out,
    output p_out,
    output [3:0] s
    );

    wire [1:0] g;
    wire [1:0] p;
    wire c_out;
    cla_2 cla0(.a(a[1:0]), .b(b[1:0]), .c_in(c_in), .g_out(g[0]), .p_out(p[0]), .s(s[1:0]));
    cla_2 cla1(.a(a[3:2]), .b(b[3:2]), .c_in(c_out), .g_out(g[1]), .p_out(p[1]), .s(s[3:2]));
    g_p g_p0(.g(g), .p(p), .c_in(c_in), .g_out(g_out), .p_out(p_out), .c_out(c_out));
endmodule
