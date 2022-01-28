`timescale 1ns / 1ps
module tb();
//reg a,b,c;
//wire c_out,s;

/*
//test_bench for FA_4
reg [3:0]  a,b;
reg        c_in, CLK;
wire [3:0] s;
wire       c_out;
FA_4 fa_4(a,b,c_in,c_out,s, CLK);

initial begin
    CLK = 0;
    c_in = 0;
    #11
    a = 4'b1111;
    b = 4'b1000;
    #30
    a = 4'b1111;
end
always #5 CLK = ~CLK;
*/


/*
//test_bench for MUX
reg     a,b,flag;
wire    out;
MUX mux_1(a,b,flag,out);
initial begin
    a = 1;
    b = 0;
    flag = 1;
    #5
    flag = 0;
    #5
    b = 1;
end
*/

/*
//test_bench for LSB_RCA
reg  [15:0]  a,b;
reg         c_in, CLK;
wire [15:0] s;
wire        c_out;
LSB_RCA lsb_rca(a,b,c_in,c_out,s, CLK);

initial begin
    CLK = 0;
    c_in = 0;
    #11
    a = 16'b1111111111111111;
    b = 16'b1000000000000000;
end

always #5 CLK = ~CLK;
*/

/*
//test_bench for MSB_RCA
reg  [15:0]  a,b;
reg         c_in,iso_en,ret_en, pse, CLK;
wire [15:0] s;
wire        c_out;
MSB_RCA msb_rca(a,b,c_in,iso_en,ret_en,pse,c_out,s, CLK);

initial begin
    CLK = 0;
    c_in = 0;
    #11
    a = 16'b1111111111111111;
    b = 16'b1000000000000000;
end
always #5 CLK = ~CLK;
*/


//test_bench for power_con
reg         p, CLK;
wire        iso_en, ret_en, pse;
power_con d(p, iso_en, ret_en, pse, CLK);

initial begin
    CLK = 0;
    p = 0;
    #60
    p = 1;
    #120
    p = 0;
    #460
    p = 1;

end
always #10 CLK = ~CLK;

/*
//test_bench for RCA_32 module
reg     [31:0]  A,B;
reg             flag, C_in, clk; 
wire    [15:0]  S_out;
wire            C_out;

initial begin
    clk = 0;
    A = 32'b0;
    B = 32'b0;
    C_in = 0;
    flag = 0;
    #5
    A = 32'b0110;
    #5
    flag = 1;
    #50
    B = 32'b01;
    #5
    A = 32'b11111111111111110000000000000;
    #5
    flag = 0;
    #5
    B = 32'b11111111111111110000000000000;
    #3 
    flag =1;

end

always #5 clk = ~clk;

RCA_32 RCA_32(A,B,C_in,flag,C_out,S_out, clk);
*/
endmodule
