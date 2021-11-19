`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 12:22:12
// Design Name: 
// Module Name: cla_8
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


module cla_8(
    input [7:0] a,
    input [7:0] b,
    input c_in,
    output g_out,
    output p_out,
    output [7:0] s
    );

    wire [1:0] g, p;
    wire c_out;

    cla_4 cla0(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .g_out(g[0]), .p_out(p[0]), .s(s[3:0]));
    cla_4 cla1(.a(a[7:4]), .b(b[7:4]), .c_in(c_out), .g_out(g[1]), .p_out(p[1]), .s(s[7:4]));
    g_p g_p0(.g(g), .p(p), .c_in(c_in), .g_out(g_out), .p_out(p_out), .c_out(c_out));

endmodule
