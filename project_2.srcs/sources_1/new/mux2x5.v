`timescale 1ns / 1ps

module mux2x5(
    input [4:0] a0,
    input [4:0] a1,
    input s,
    output [4:0] y
);
    assign y = s ? a1 : a0;
endmodule