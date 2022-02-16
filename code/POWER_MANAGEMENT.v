`timescale 1ns / 1ps
module POWER_MANAGEMENT(p_flag,iso_en,ret_en,pse, CLK);
input       p_flag, CLK;
output  reg iso_en, ret_en, pse;

always @(posedge CLK) begin
    if (p_flag == 1) begin
          iso_en <= 1;
          ret_en <= iso_en;
          pse <= ~ret_en;
    end
    else if (p_flag == 0) begin
        pse <= 1;
        ret_en <= ~pse;
        iso_en <= ret_en;
    end
end

endmodule
