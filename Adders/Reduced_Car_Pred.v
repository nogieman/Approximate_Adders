// The approximate full adder structure is the same as the previous adder. (FA_)
module Adder_Red_carry(
    input [15:0] a,b,
    output [16:0] s
);
wire car;
imprecise_R p1(a[7:0], b[7:0], s[7:0], car);
precise p2(a[15:8], b[15:8], car, s[16:8]);

endmodule

module imprecise_R(
    input [7:0] a,b,
    output [7:0]s,
    output cout
    );
wire [4:0] ca;
wire [6:0] sb;
wire red_car, p, c;

FA_ f1(a[3], b[3], 0, sb[3], ca[0]);
FA_ f2(a[4], b[4], ca[0], sb[4], ca[1]);
FA_ f3(a[5], b[5], ca[1], sb[5], ca[2]);
FA_ f4(a[6], b[6], ca[2], sb[6], ca[3]);
xor (p, a[7], b[7]);

assign s[7] = ca[3] | p;

and a0(c, p, ca[3]);
not n1(red_car, c);  
assign s[0] = red_car;
assign s[1] = red_car;
assign s[2] = red_car;
and a1(s[3], sb[3], red_car);
and a2(s[4], sb[4], red_car);
and a3(s[5], sb[5], red_car);
and a4(s[6], sb[6], red_car);

assign cout = (a[7] & b[7]) | c;
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