`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 12:41:13
// Design Name: 
// Module Name: addsub32
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


module addsub32(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] s
    );
    
    cla32 as32(.a(a), .b(b^{32{sub}}), .ci(sub), .s(s));
endmodule
