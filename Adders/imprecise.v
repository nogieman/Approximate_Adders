`timescale 1ns / 1ps

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
FA_ f1_(a[4], b[4], 1'b0, s[4], ca[0]);
FA_ f2_(a[5], b[5], ca[0], s[5], ca[1]);
FA_ f3_(a[6], b[6], ca[1], s[6], ca[2]);
assign s[7] = ca[2] | (a[7] ^ b[7]);
assign cout = a[7] & b[7];

endmodule