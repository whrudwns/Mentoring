`timescale 1ns / 1ps
module FA(a,b,c_in, c_out,s, CLK);
input a,b,c_in, CLK;
output reg c_out, s;

//assign  {c_out, s} = a + b + c_in;

always @(posedge CLK) begin
    s <= a ^ b ^ c_in;
    c_out <= (a & b) | (c_in & (a ^ b));
end



endmodule
