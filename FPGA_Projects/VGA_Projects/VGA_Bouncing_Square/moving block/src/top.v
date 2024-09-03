`timescale 1ns / 1ps

module top(
    input clk_100MHz,       // from Basys 3
    input reset,            // btnC on Basys 3
    output hsync,           // VGA port on Basys 3
    output vsync,           // VGA port on Basys 3
    output  r,      // to DAC, 3 bits to VGA port on Basys 3
    output g,
    output b
    );
    
    wire w_video_on, w_p_tick;
    wire [9:0] w_x, w_y;
    reg [11:0] rgb_reg;
    wire red,green,blue;
wire pll_clkout,clk_clkdiv;

    assign r=red;
    assign g=green;
    assign b=blue;
    
    vga_controller vc(.clk_100MHz(clk_clkdiv), .reset(reset), .video_on(w_video_on), .hsync(hsync), 
                      .vsync(vsync),  .x(w_x), .y(w_y));
    pixel_generation pg(.clk(clk_clkdiv), .reset(reset), .video_on(w_video_on), 
                        .x(w_x), .y(w_y), .r(red),.g(green),.b(blue));
    
    Gowin_rPLL pll(
.clkin(clk_100Mhz),
.clkout(pll_clkout)
);
  Gowin_CLKDIV clkdiv(
.hclkin(pll_clkout),
.resetn(reset),
.clkout(clk_clkdiv)
);

 
endmodule
