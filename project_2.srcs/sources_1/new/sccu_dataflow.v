`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/09 09:32:28
// Design Name: 
// Module Name: sccu_dataflow
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


module sccu_dataflow(
    input [5:0] op,
    input [5:0] func,
    input z,
    output wmem,
    output wreg,
    output  regrt,
    output m2reg,
    output [3:0] aluc,
    output shift,
    output aluimm,
    output [1:0] pcsource,
    output jal,
    output sext
    );

    wire r_type = ~| op;
    wire i_add = r_type & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];
    wire i_sub = r_type & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];
    wire i_and = r_type & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & ~func[0];
    wire i_or = r_type & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & func[0];
    wire i_xor = r_type & func[5] & ~func[4] & ~func[3] & func[2] & func[1] & ~func[0];
    wire i_sll = r_type & ~func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];
    wire i_srl = r_type & ~func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];
    wire i_sra = r_type & ~func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];
    wire i_jr = r_type & ~func[5] & ~func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];
    wire i_addi = ~op[5] & ~op[4] & op[3] & ~op[2] & ~op[1] & ~op[0];
    wire i_andi = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & ~op[0];
    wire i_ori = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & op[0];
    wire i_xori = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & ~op[0];
    wire i_lw = op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
    wire i_sw = op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];
    wire i_beq = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
    wire i_bne = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & op[0];
    wire i_lui = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & op[0];
    wire i_j = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & ~op[0];
    wire i_jal = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];

    assign wreg = i_add | i_sub | i_and | i_or | i_xor | i_sll | i_srl | i_sra | i_addi | i_andi | i_ori | i_xori | i_lw | i_lui | i_jal;
    assign regrt = i_addi | i_andi | i_ori | i_xori | i_lw | i_lui;
    assign jal = i_jal;
    assign m2reg = i_lw;
    assign shift = i_sll | i_srl | i_sra;
    assign aluimm = i_addi | i_andi | i_ori | i_xori | i_lw | i_lui | i_sw;
    assign sext = i_addi | i_lw | i_sw | i_beq | i_bne;
    assign aluc[3] = i_sra;
    assign aluc[2] = i_sub | i_or | i_srl | i_sra | i_ori | i_lui;
    assign aluc[1] = i_xor | i_sll | i_srl | i_sra | i_xori | i_beq | i_bne | i_lui;
    assign aluc[0] = i_and | i_or | i_sll | i_srl | i_sra | i_andi | i_ori;
    assign wmem = i_sw;
    assign pcsource[1] = i_jr | i_j | i_jal;
    assign pcsource[0] = i_beq & z | i_bne & ~z | i_j | i_jal;
endmodule
