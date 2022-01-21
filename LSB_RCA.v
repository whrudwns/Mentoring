`timescale 1ns / 1ps
module LSB_RCA(A,B,C_in,C_out,S);
input [15:0]    A,B;
input           C_in;
output[15:0]    S;
output          C_out;

wire  c1, c2, c3;

FA_4 fa_4_0(
            .a(A[3:0]),
            .b(B[3:0]),
            .c_in(C_in),
            .c_out(c1),
            .s(S[3:0]));

FA_4 fa_4_1(
            .a(A[7:4]),
            .b(B[7:4]),
            .c_in(c1),
            .c_out(c2),
            .s(S[7:4]));

FA_4 fa_4_2(
            .a(A[11:8]),
            .b(B[11:8]),
            .c_in(c2),
            .c_out(c3),
            .s(S[11:8]));
            
FA_4 fa_4_3(
            .a(A[15:12]),
            .b(B[15:12]),
            .c_in(c3),
            .c_out(C_out),
           .s(S[15:12]));

//assign {C_out, S} = A + B + C_in;  //같은 동작이긴 한데 RCA가 아닌듯? -> ㅇㅇ 아님
endmodule

