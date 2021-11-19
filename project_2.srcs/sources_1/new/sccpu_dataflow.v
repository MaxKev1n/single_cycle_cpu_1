`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 22:30:07
// Design Name: 
// Module Name: sccpu_dataflow
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


module sccpu_dataflow(
    input [31:0] inst,
    input [31:0] mem,
    input clock,
    input resetn,
    output [31:0] pc,
    output [31:0] alu,
    output [31:0] data,
    output wmem
    );

    wire zero, wmem, wreg, regrt, m2reg, shift, aluimm, jal, sext;
    wire [31:0] p4, bpc, npc, adr, ra, alua, alub, res, alu_mem;
    wire [3:0] aluc;
    wire [4:0] reg_dest, wn;
    wire [1:0] pcsource;
    wire [31:0] sa = {27'b0, inst[10:6]};
    wire [31:0] offset = {imm[13:0], inst[15:0], 2'b00};
    sccu_dataflow cu(.op(inst[31:26]), .func(inst[5:0]), .z(zero), .wmem(wmem), .wreg(wreg), .regrt(regrt), .m2reg(m2reg), .aluc(aluc), .shift(shift), .aluimm(aluimm), .pcsource(pcsource), .jal(jal), .sext(sext));
    wire e = sext & inst[15];
    wire [15:0] imm = {16{e}};
    wire [31:0] immediate = {imm, inst[15:0]};
    dffe32 ip(.d(npc), .clk(clock), .clrn(resetn), .q(pc));
    cla32 pcplus4(.a(pc), .b(32'h4), .ci(1'b0), .s(p4));
    cla32 br_adr(.a(p4), .b(offset), .ci(1'b0), .s(adr));
    wire [31:0] jpc = {p4[31:28], inst[25:0], 2'b00};
    mux2x32 alu_b(.a0(data), .a1(immediate), .s(aluimm), .y(alub));
    mux2x32 alu_a(.a0(ra), .a1(sa), .s(shift), .y(alua));
    mux2x32 result(.a0(alu), .a1(mem), .s(m2reg), .y(alu_mem));
    mux2x32 link(.a0(alu_mem), .a1(p4), .s(jal), .y(res));
    mux2x5 reg_wn(.a0(inst[15:11]), .a1(inst[20:16]), .s(regrt), .y(reg_dest));
    assign wn = reg_dest | {5{jal}};
    mux4x32 nextpc(.a0(p4), .a1(adr), .a2(ra), .a3(jpc), .s(pcsource), .y(npc));
    regfile rf(.rna(inst[25:21]), .rnb(inst[20:16]), .wn(wn), .d(res), .we(wreg), .clk(clock), .clrn(resetn), .qa(ra), .qb(data));
    alu al_unit(.a(alua), .b(alub), .aluc(aluc), .r(alu), .z(zero));
endmodule
