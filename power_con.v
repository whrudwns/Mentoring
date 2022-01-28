`timescale 1ns / 1ps
`define S0 3'b000
`define S1 3'b001
`define S2 3'b010
`define S3 3'b011
`define S4 3'b100
`define S5 3'b101
`define S6 3'b110

module power_con(p_flag,iso_en,ret_en,pse, CLK);
input       p_flag, CLK;
output  reg iso_en, ret_en, pse;

reg [2:0] state;
reg [2:0] next_state;

always @(state,  p_flag) begin
    case (state)
        `S0: begin
            if(p_flag) begin
                #10 {iso_en, ret_en, pse} = 3'b001;
                next_state = `S1;
            end
            else begin
                #10 {iso_en, ret_en, pse} = 3'b001;
                next_state = `S0;
            end
        end
        `S1: begin
             #10 {iso_en, ret_en, pse} = 3'b101;
             next_state = `S2;
        end
        `S2: begin
             #10 {iso_en, ret_en, pse} = 3'b111;
             next_state = `S3;
        end
        `S3: begin
            #10 {iso_en, ret_en, pse} = 3'b110;
            if(p_flag == 0)
                next_state = `S4;
        end
        `S4: begin
            #10 {iso_en, ret_en, pse} = 3'b111;
            next_state = `S5;
        end
        `S5: begin
            #10 {iso_en, ret_en, pse} = 3'b101;
            next_state = `S0;
        end
        //`S6: begin
        //    #10 {iso_en, ret_en, pse} = 3'b001;
        //    next_state = `S0;
        //end             
    endcase
end

always @(posedge CLK) begin
    if(iso_en || ret_en || pse)
        state <= next_state;
    else
        state <= `S0;
end


endmodule