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
	input SYSCLK_N,
	input SYSCLK_P,
	input G_RST,//global reset
	input send_enable_button,
	output voltage_test,
	output signal_output
	//output signal_output_p,
	//output signal_output_n
);

wire clk_10mhz;//inner clock wire whose frequency is 10MHz
wire clk_100mhz;
wire dcm_locked;
wire reset_sync;//high active
wire send_enable_pulse;
wire [9:0] data_parallel;
wire serial_out_i;

glb_clk_src glb_clk_src_inst
 (
  // Clock out ports
  .clk_out1(clk_10mhz),     // output clk_out1
  .clk_out2(clk_100mhz),     // output clk_out2
  // Status and control signals
  .reset(G_RST), // input reset
  .locked(dcm_locked),       // output locked
 // Clock in ports
  .clk_in1_p(SYSCLK_P),    // input clk_in1_p
  .clk_in1_n(SYSCLK_N));    // input clk_in1_n

reset reset_inst(
	.clk(clk_10mhz),
	.dcm_locked(dcm_locked),
	.reset_sync(reset_sync));

debounce #(
	.CLK_PERIOD(100)//1000/100 = 10Mhz, this is data in this application
)
debounce_inst_send_enable
(
	.clk(clk_10mhz),
	.key(send_enable_button),//input key signal
	.key_pulse(send_enable_pulse)//generated pulse		
);

data_gen #
(
	.PRBS_LENGTH(2000),
	.INV_PATTERN(1),
	.POLY_LENGHT(9),
	.POLY_TAP(5)//these parameter decide the PRBS PATTERN
)
data_gen_inst
(
	.clk(clk_10mhz),
	.rst(reset_sync),
	.send_enable(send_enable_pulse), //begin to send a frame data
	.data_out(data_parallel)
);

para_to_serial para_to_serial_inst(
	.clk(clk_100mhz),
	.rst(reset_sync),
	.para_in(data_parallel),
	.serial_out(serial_out_i)
    );

assign signal_output = serial_out_i;
assign voltage_test = 1'b1;
//OBUFDS #( 
//.IOSTANDARD("LVDS_25") 
//// 指名输出端口的电平标�
//) OBUFDS_inst ( 
//.O(signal_output_p), // 差分正端输出，直接连接到顶层模块端口 
//.OB(signal_output_n), // 差分负端输出，直接连接到顶层模块端口 
//.I(serial_out_i) // 缓冲器输�
//); 
endmodule