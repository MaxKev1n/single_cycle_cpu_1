`timescale 1ns / 1ps

module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output [31:0] r,
    output z
);

    wire [31:0] do_and = a & b;
    wire [31:0] do_or = a | b;
    wire [31:0] do_xor = a ^ b;
    wire [31:0] do_lui = {b[15:0], 16'h0};
    wire [31:0] do_and_or = aluc[2] ? do_or : do_and;
    wire [31:0] do_xor_lui = aluc[2] ? do_lui : do_xor;
    wire [31:0] d_as, d_sh;

    addsub32 as32(.a(a), .b(b), .sub(aluc[2]), .s(d_as));
    mux4x32 select(.a0(d_as), .a1(do_and_or), .a2(do_xor_lui), .a3(d_sh), .s(aluc[1:0]), .y(r));
    shift shifter(.d(b), .sa(a[4:0]), .right(aluc[2]), .arith(aluc[3]), .sh(d_sh));

    assign z = ~|r;
endmodule