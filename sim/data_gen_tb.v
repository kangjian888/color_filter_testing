// =============================================================================
// Filename: data_gen_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module data_gen_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD = 5;  // clock period: 5ns

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg clk;
reg rst;
reg send_enable;

wire [9:0] data_out;

// ----------------------------------
// Instantiate the tested module
// ----------------------------------
data_gen #(
	.PRBS_LENGTH(20)

)
data_gen_inst
(
	.clk(clk),
	.rst(rst),
	.send_enable(send_enable), //begin to send a frame data
	.data_out(data_out)
);

// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  clk = 1'b0;
  forever #(CLK_PERIOD/2.0) clk = ~clk;
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
		rst = 1'b1;
		send_enable = 1'b0;
		#100
		rst = 1'b0;
		#50	
		send_enable = 1'b1;
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