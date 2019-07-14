// =============================================================================
// Filename: top_test.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module top_test;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD = 5;  // clock period: 5ns

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg clk_p;
reg clk_n;
reg g_rst;
reg [3:0] SPEEDCTR;
wire signal_output_p;
wire signal_output_n;

// ----------------------------------
// Instantiate the tested module
// ----------------------------------
top top_inst(
	.SYSCLK_P(clk_p),
	.SYSCLK_N(clk_n),
	.G_RST(g_rst),//global reset
	.SPEEDCTR(SPEEDCTR),//four bit to decide the output speed.
	.signal_output_p(signal_output_p),//generation clock singal output to test eye diagram
  .signal_output_n(signal_output_n)
);

// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  clk_p = 1'b0;
  forever #(CLK_PERIOD/2.0) clk_p = ~clk_p;
end
initial begin
  clk_n = 1'b1;
  forever #(CLK_PERIOD/2.0) clk_n = ~clk_n;
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
		SPEEDCTR <= 4'd5;
		g_rst <= 1'b1;
		#1000
		g_rst <= 1'b0;	
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