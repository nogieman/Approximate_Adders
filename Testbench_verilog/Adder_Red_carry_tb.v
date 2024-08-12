`timescale 1ns / 1ps


module Adder_Red_carry_tb;
reg [15:0]a,b;
wire [16:0] s;
integer i=0;
Adder_Red_carry Adderr_(a,b,s);

initial begin
a = 16'b1111111111111111;
b=16'b0000000000000000;
for(i=0; i<2000; i=i+1) #5 b=i;
$finish;
end

endmodule
