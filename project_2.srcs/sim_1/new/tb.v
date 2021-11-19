`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 00:06:50
// Design Name: 
// Module Name: tb
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


module tb(

    );
    
    reg clka;
    reg clk;
    reg resetn;
    wire [31:0] inst;
    wire [31:0] pc;
    wire [31:0] aluout;
    wire [31:0] memout;
    wire [31:0] data;

    sccomp_dataflow sc(.clock(clk), .clka(clka), .resetn(resetn), .inst(inst), .pc(pc), .aluout(aluout), .memout(memout), .data(data));

    initial begin
        clk = 1;
        resetn = 0;
        clka = 0;
    end

    always begin
        #50 clk = 0;
        #50 clk = 1;
    end
    always begin
        #10 resetn = 1;
        #100000 resetn = 0;
    end
    always begin
        #25 clka = 1;
        #25 clka = 0;
    end

endmodule
