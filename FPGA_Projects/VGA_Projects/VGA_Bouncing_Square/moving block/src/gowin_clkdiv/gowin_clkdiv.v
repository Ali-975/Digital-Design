//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.9.03 Education
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Tue Sep  3 15:50:59 2024

module Gowin_CLKDIV (clkout, hclkin, resetn);

output clkout;
input hclkin;
input resetn;

wire gw_gnd;

assign gw_gnd = 1'b0;

CLKDIV clkdiv_inst (
    .CLKOUT(clkout),
    .HCLKIN(hclkin),
    .RESETN(resetn),
    .CALIB(gw_gnd)
);

defparam clkdiv_inst.DIV_MODE = "4";
defparam clkdiv_inst.GSREN = "false";

endmodule //Gowin_CLKDIV
