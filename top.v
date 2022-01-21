`timescale 1ns / 1ps
module top(A,B,C_in,flag,C_out,S_out, clk);
input   [31:0]  A,B;
input           C_in, flag, clk;
output  [15:0]  S_out;
output          C_out;

wire            iso_en, ret_en, pse;
wire    [15:0]  MSB_S_out, LSB_S_out;
wire            MSB_C_out, LSB_C_out;

power_con  Power_management(
                             .p_flag(flag), 
                             .iso_en(iso_en), 
                             .ret_en(ret_en), 
                             .pse(pse), 
                             .clk(clk));
MSB_RCA     Msb_Rca(
                    .A(A[31:16]),
                    .B(B[31:16]),
                    .C_in(LSB_C_out),
                    .iso_en(iso_en),
                    .ret_en(ret_en),
                    .pse(pse),
                    .C_out(MSB_C_out),
                    .S(MSB_S_out));
                    
LSB_RCA     Lsb_Rca(
                    .A(A[15:0]),
                    .B(B[15:0]),
                    .C_in(C_in),
                    .C_out(LSB_C_out),
                    .S(LSB_S_out));

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
