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


/*
//test_bench for POWER_MANAGEMENT
reg         p, CLK;
wire        iso_en, ret_en, pse;
POWER_MANAGEMENT d(p, iso_en, ret_en, pse, CLK);

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
*/


//test_bench for RCA_32 module
reg     [31:0]  A,B;
reg             flag, C_in, clk; 
wire    [31:0]  S_out;
wire            C_out;

RCA_32 RCA_32(A,B,C_in,flag,C_out,S_out, clk);

initial begin
    clk = 0;
    flag = 0;
    C_in = 0;
    #40
    A = 32'b11111111111111111111111111111111;
    B = 32'b10000000000000000000000000000000;
    flag = 0;
    #800
    flag = 1;
    #120
    flag = 0;

end

always #10 clk = ~clk;

endmodule
