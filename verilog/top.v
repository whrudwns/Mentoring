`timescale 1ns / 1ps
module top(A,B,C_in,FLAG,C_out,S_out, CLK);
input   [31:0]  A,B;
input           C_in, FLAG, CLK;
output  [31:0]  S_out;
output          C_out;

reg    [31:0]	reg_A,reg_B;
reg           	reg_C_in, reg_FLAG;
reg    [31:0]   reg_S_out;
reg     		reg_C_out;


wire    [31:0]   wire_A,wire_B;
wire             wire_C_in, wire_FLAG;
wire    [31:0]   wire_S_out;
wire             wire_C_out;

always @(posedge CLK) begin
    reg_A <= A;
    reg_B <= B;
    reg_C_in <= C_in;
    reg_FLAG <= FLAG;
end

assign wire_A = reg_A;
assign wire_B = reg_B;
assign wire_C_in = reg_C_in;
assign wire_FLAG = reg_FLAG;

RCA_32 Rca (
              .A(wire_A),
              .B(wire_B),
              .C_in(wire_C_in),
              .flag(wire_FLAG),
              .C_out(wire_C_out),
              .S_out(wire_S_out),
              .CLK(CLK));

always @(posedge CLK) begin
    reg_C_out <= wire_C_out;
    reg_S_out <= wire_S_out;
end

assign C_out = reg_C_out;
assign S_out = reg_S_out;

endmodule
