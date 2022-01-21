`timescale 1ns / 1ps
module tb();
//reg a,b,c;
//wire c_out,s;
/*
reg [3:0]  a,b;
reg        c_in;
wire [3:0] s;
wire       c_out;
*/

//FA fa(a,b,c,c_out,s);
//FA_4 fa_4(a,b,c_in,c_out,s);

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


//test_bench for LSB_RCA
reg  [15:0]  a,b;
reg         c_in;
wire [15:0] s;
wire        c_out;
LSB_RCA lsb_rca(a,b,c_in,c_out,s);

initial begin
    a = 16'b0;
    b = 16'b0;
    c_in = 0;
    //#5
    //a = 16'b11111111101001;
    //#5
    //a = 0;
    //#5;
end


/*
//test_bench for power_con
reg         p, clk;
wire        iso_en, ret_en, pse;
power_con d(p, iso_en, ret_en, pse, clk);
always #50 clk = ~clk;

initial begin
   clk = 0;
    p = 0;
    #50
    p = 1;
    #500
    p = 0;
    #450
    p = 1;
    
end
*/

/*
//test_bench for top module
reg     [31:0]  A,B;
reg             flag, C_in, clk; 
wire    [15:0]  S_out;
wire            C_out;

top TOP(A,B,C_in,flag,C_out,S_out, clk);
*/
endmodule
