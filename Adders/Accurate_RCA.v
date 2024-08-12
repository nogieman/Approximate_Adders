`timescale 1ns / 1ps

module Accurate_RCA(
    input [15:0] a,b,
    output [16:0] s
    );
wire [15:0] ca;
    FA f1(a[0], b[0], 1'b0, s[0], ca[0]);
    FA f2(a[1], b[1], ca[0], s[1], ca[1]);
    FA f3(a[2], b[2], ca[1], s[2], ca[2]);
    FA f4(a[3], b[3], ca[2], s[3], ca[3]);
    FA f5(a[4], b[4], ca[3], s[4], ca[4]);
    FA f6(a[5], b[5], ca[4], s[5], ca[5]);
    FA f7(a[6], b[6], ca[5], s[6], ca[6]);
    FA f8(a[7], b[7], ca[6], s[7], ca[7]);
    FA f9(a[8], b[8], ca[7], s[8], ca[8]);
    FA f10(a[9], b[9], ca[8], s[9], ca[9]);
    FA f11(a[10], b[10], ca[9], s[10], ca[10]);
    FA f12(a[11], b[11], ca[10], s[11], ca[11]);
    FA f13(a[12], b[12], ca[11], s[12], ca[12]);
    FA f14(a[13], b[13], ca[12], s[13], ca[13]);
    FA f15(a[14], b[14], ca[13], s[14], ca[14]);
    FA f16(a[15], b[15], ca[14], s[15], ca[15]);
    assign s[16] = ca[15];

endmodule

module FA(
    input a,b,c,
    output s,ca
    );
    
    assign s = a^b^c;
    assign ca = a&b | c&(a^b);
endmodule