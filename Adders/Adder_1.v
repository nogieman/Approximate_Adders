`timescale 1ns / 1ps

module Adder_1(
    input [15:0] a,b,
    output [16:0] s
    );
wire car;
imprecise p2(a[7:0], b[7:0], s[7:0], car);
precise  p1(a[15:8], b[15:8], car, s[16:8]);

endmodule


