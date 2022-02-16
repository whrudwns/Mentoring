`timescale 1ns / 1ps
module MUX_1( a,b, flag, out);
input   a,b,flag;
output  out;

assign out = flag ? a : b;

endmodule