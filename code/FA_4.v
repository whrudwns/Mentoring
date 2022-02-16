`timescale 1ns / 1ps
module FA_4(a,b,c_in,c_out,s, CLK);
input  [3:0] a,b;
input        c_in, CLK;
output [3:0] s;
output       c_out;

wire  c1;
wire  c2;
wire  c3;

FA fa0 (.a(a[0]), .b(b[0]), .c_in(c_in), .c_out(c1), .s(s[0]), .CLK(CLK));
FA fa1 (.a(a[1]), .b(b[1]), .c_in(c1), .c_out(c2), .s(s[1]), .CLK(CLK));
FA fa2 (.a(a[2]), .b(b[2]), .c_in(c2), .c_out(c3), .s(s[2]), .CLK(CLK));
FA fa3 (.a(a[3]), .b(b[3]), .c_in(c3), .c_out(c_out), .s(s[3]), .CLK(CLK));


endmodule
