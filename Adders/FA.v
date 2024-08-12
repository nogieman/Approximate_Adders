`timescale 1ns / 1ps

module FA(
    input a,b,c,
    output s,ca
    );
    
    assign s = a^b^c;
    assign ca = a&b | c&(a^b);
endmodule
