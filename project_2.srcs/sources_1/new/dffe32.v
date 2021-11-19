`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 21:33:34
// Design Name: 
// Module Name: dffe32
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


module dffe32(
    input [31:0] d,
    input clk,
    input clrn,
    output reg [31:0] q
    );

    always @(posedge clk or negedge clrn)
        if(clrn == 0) begin
            q <= 0;
        end
        else q <= d;
endmodule