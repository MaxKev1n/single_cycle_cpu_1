`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 21:33:34
// Design Name: 
// Module Name: regfile
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


module regfile(
    input [4:0] rna,
    input [4:0] rnb,
    input [4:0] wn,
    input [31:0] d,
    input we,
    input clk,
    input clrn,
    output [31:0] qa, qb
    );
    
    reg [31:0] register[1:31];

    assign qa = (rna == 0) ? 0 : register[rna];
    assign qb = (rnb == 0) ? 0 : register[rnb];

    always @(posedge clk or negedge clrn) begin
        if(clrn == 0) begin : my_block
            integer i;
            for(i = 1;i < 32;i = i + 1)
                register[i] <= 0;
        end
        else if((wn != 0) && we)
            register[wn] <= d;
    end
endmodule
