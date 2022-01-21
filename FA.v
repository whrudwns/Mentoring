`timescale 1ns / 1ps
module FA(a,b,c_in, c_out,s);
input a,b,c_in;
output c_out, s;

//assign  {c_out, s} = a + b + c_in;

assign s =  a ^ b ^ c_in;
assign c_out = (a & b) | (c_in & (a ^ b));



endmodule
