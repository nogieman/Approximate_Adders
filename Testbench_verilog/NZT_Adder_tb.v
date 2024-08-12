
`timescale 1ns / 1ps


module Adder_1_tb;
reg [15:0] a,b;
wire [16:0] s;
Adder_1 a1(a,b,s);
integer i=0;
initial begin
$dumpfile("Adder_1_tb.vcd");
$dumpvars(0,Adder_1_tb);
{a,b}=0;
for(i=0; i<200000; i=i+1) #5 {a,b}=i;
$finish;
end
endmodule
