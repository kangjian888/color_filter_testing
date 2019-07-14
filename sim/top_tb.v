// =============================================================================
// Filename: top_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module top_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD = 5;  // clock period: 5ns

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg clk_p, clk_n;
reg g_rst;
reg send_enable_button;

wire signal_output_p;
wire signal_output_n;

// ----------------------------------
// Instantiate the tested module
// ----------------------------------
 top top_inst(
	.SYSCLK_P(clk_p),
	.SYSCLK_N(clk_n),
	.G_RST(g_rst),//global reset
	.send_enable_button(send_enable_button),
	.signal_output_p(signal_output_p),
	.signal_output_n(signal_output_n)
);

// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  clk_p <= 1'b0;
  forever #(CLK_PERIOD/2.0) clk_p <= ~clk_p;
end
initial begin
  clk_n <= 1'b1;
  forever #(CLK_PERIOD/2.0) clk_n <= ~clk_n;
end
// ----------------------------------
// Input stimulus
// Generate the ad-hoc stimulus
//This is an example
//initial begin
  // Reset
  //rst         = 1'b1;
  //start       = 1'b0;
  //dividend    = 32'd0;
  //divisor     = 32'd0;
  //#(2*CLK_PERIOD) rst = 1'b0;
  //end
// ----------------------------------

initial
  begin
  //Add Your Code
  g_rst = 1'b1;
  send_enable_button = 1'b0;
  #(1000)
  g_rst = 1'b0;
  send_enable_button = 1'b1;
  end
// ----------------------------------
// Output monitor
//This is an example
//always @(posedge clk) begin
  //if (done) begin
    //("%0d / %0d: quotient = %0d, remainder = //%0d", dividend, divisor,
      //quotient, remainder);
  //end
// ----------------------------------
//Add Your Code

endmodule