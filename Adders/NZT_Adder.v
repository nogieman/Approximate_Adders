`timescale 1ns / 1ps

module Adder_1(
    input [15:0] a,b,
    output [16:0] s
    );
wire car;
imprecise p2(a[7:0], b[7:0], s[7:0], car);
precise  p1(a[15:8], b[15:8], car, s[16:8]);

endmodule

module imprecise(
    input [7:0] a,b,
    output [7:0] s,
    output cout
    );
    wire [2:0] ca;
assign s[0] = 1;
assign s[1] = 1;
assign s[2] = 1;
assign s[3] = 1;
FA_ f1(a[4], b[4], 1'b0, s[4], ca[0]);
FA_ f2(a[5], b[5], ca[0], s[5], ca[1]);
FA_ f3(a[6], b[6], ca[1], s[6], ca[2]);
assign s[7] = ca[2] | (a[7] ^ b[7]);
assign cout = a[7] & b[7];

endmodule

module precise(
    input [7:0] a,b,
    input cin,
    output [8:0]s
    );
wire [7:0] ca;
FA f1(a[0], b[0], cin, s[0], ca[0]);
FA f2(a[1], b[1], ca[0], s[1], ca[1]);
FA f3(a[2], b[2], ca[1], s[2], ca[2]);
FA f4(a[3], b[3], ca[2], s[3], ca[3]);
FA f5(a[4], b[4], ca[3], s[4], ca[4]);
FA f6(a[5], b[5], ca[4], s[5], ca[5]);
FA f7(a[6], b[6], ca[5], s[6], ca[6]);
FA f8(a[7], b[7], ca[6], s[7], ca[7]);
assign s[8] = ca[7];
endmodule

module FA_(
    input a,b,c,
    output s,ca);
assign s = a | b | c;
assign ca = a & b;

endmodule

module FA(
    input a,b,c,
    output s,ca);
assign s = a ^ b ^ c;
assign ca = a & b;

endmodule
