`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 16:54:22
// Design Name: 
// Module Name: g_p
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


module g_p(
    input [1:0] g,
    input [1:0] p,
    input c_in,
    output g_out,
    output p_out,
    output c_out
    );
    assign g_out = g[1] | p[1] & g[0];
    assign p_out = p[1] & p[0];
    assign c_out = g[0] | p[0] & c_in;
endmodule
