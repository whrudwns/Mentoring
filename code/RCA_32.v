`timescale 1ns / 1ps
module RCA_32(A,B,C_in,flag,C_out,S_out, CLK);
input   [31:0]  A,B;
input           C_in, flag, CLK;
output  [15:0]  S_out;
output          C_out;

wire            iso_en, ret_en, pse;
wire    [15:0]  MSB_S_out, LSB_S_out;
wire            MSB_C_out, LSB_C_out;

POWER_MANAGEMENT  Power_management(
                             .p_flag(flag),
                             .iso_en(iso_en),
                             .ret_en(ret_en),
                             .pse(pse),
                             .CLK(CLK));
MSB_RCA     Msb_Rca(
                    .A(A[31:16]),
                    .B(B[31:16]),
                    .C_in(LSB_C_out),
                    .C_out(MSB_C_out),
                    .S(MSB_S_out),
                    .CLK(CLK));

LSB_RCA     Lsb_Rca(
                    .A(A[15:0]),
                    .B(B[15:0]),
                    .C_in(C_in),
                    .C_out(LSB_C_out),
                    .S(LSB_S_out),
                    .CLK(CLK));

MUX_1         C_mux(
                 .a(LSB_C_out),
                 .b(MSB_C_out),
                 .flag(flag),
                 .out(C_out));

MUX_16         S_mux(
                 .a(LSB_S_out),
                 .b(MSB_S_out),
                 .flag(flag),
                 .out(S_out));

endmodule