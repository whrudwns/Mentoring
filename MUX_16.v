`timescale 1ns / 1ps
module MUX_16( a,b, flag, out);
input   [15:0]  a,b;
input           flag;
output  [15:0]  out;

assign out = flag ? a : b;

endmodule
