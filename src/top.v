// =============================================================================
// Filename: top.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: This module is used to send a sequence in different speed, 
// the speed can be changed from 50mhz~3.125mhz, the relationship between speedctr
// and the output frequency is f(mhz) = 50/(speedctr + 1)
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module top(
	input SYSCLK_P,
	input SYSCLK_N,
	input G_RST,//global reset
	input [3:0] SPEEDCTR,//four bit to decide the output speed.
	output signal_output_p,
	output signal_output_n//generation clock singal output to test eye diagram
);

wire clk_i;//inner clock wire whose frequency is 100MHz
wire dcm_locked;
wire reset_sync;//high active
wire [3:0] speedctr_i;
wire clk_gen_i;


syn_block syn_block_0(
	.clk(clk_i),
	.enable(1'b1),
	.data_in(SPEEDCTR[0]),
	.data_out(speedctr_i[0])
	);
syn_block syn_block_1(
	.clk(clk_i),
	.enable(1'b1),
	.data_in(SPEEDCTR[1]),
	.data_out(speedctr_i[1])
	);
syn_block syn_block_2(
	.clk(clk_i),
	.enable(1'b1),
	.data_in(SPEEDCTR[2]),
	.data_out(speedctr_i[2])
	);
syn_block syn_block_3(
	.clk(clk_i),
	.enable(1'b1),
	.data_in(SPEEDCTR[3]),
	.data_out(speedctr_i[3])
	);

 glb_clk_src glb_clk_src_inst(
   // Clock out ports
   .clk_out1(clk_i),     // output clk_out1
   // Status and control signals
   .reset(G_RST), // input reset
   .locked(dcm_locked),       // output locked
  // Clock in ports
   .clk_in1_p(SYSCLK_P),    // input clk_in1_p
   .clk_in1_n(SYSCLK_N));    // input clk_in1_n

reset reset_inst(
	.clk(clk_i),
	.dcm_locked(dcm_locked),
	.reset_sync(reset_sync)
	);

frediv frediv_inst(
	.clk(clk_i),
	.rst(reset_sync),
	.speedctr(speedctr_i),
	.clk_gen(clk_gen_i) //generation clock output
	);

OBUFDS #( 
.IOSTANDARD("LVDS_25") 
// 指名输出端口的电平标准 
) OBUFDS_inst ( 
.O(signal_output_p), // 差分正端输出，直接连接到顶层模块端口 
.OB(signal_output_n), // 差分负端输出，直接连接到顶层模块端口 
.I(clk_gen_i) // 缓冲器输入 
); 
endmodule