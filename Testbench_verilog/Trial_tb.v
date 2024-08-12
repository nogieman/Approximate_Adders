`timescale 1ns / 1ps


module Trial_tb;
reg [15:0] a,b;
wire [16:0] s;
Adder_1 a1(a,b,s);
integer i=0;
initial begin
#10
{a,b}=32'b00001111000011110000111100001111;
#10
$finish;
end
endmodule
