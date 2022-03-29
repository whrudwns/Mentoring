`timescale 1ns / 1ps
module RCA_32(A,B,C_in,flag,C_out,S_out, CLK);
input   [31:0]  A,B;
input           C_in, flag, CLK;
output  [31:0]  S_out;
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

assign S_out = {MSB_S_out, LSB_S_out};
assign C_out = MSB_C_out;
                 
endmodule
