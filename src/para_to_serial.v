`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/11 20:34:14
// Design Name: 
// Module Name: para_to_serial
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// MSB is firstly transmitted in this model
//////////////////////////////////////////////////////////////////////////////////


module para_to_serial(
	input clk,
	input rst,
	input[9:0] para_in,
	output serial_out
    );

reg [3:0] counter;
reg [9:0] para_reg;

always @ (posedge clk)
	begin
		if (rst) 
		    begin
				counter <= 4'd0;
				para_reg <= 10'd0;
			end
		else 
			begin
				if (counter ==  4'd9) 
				    begin
						counter <= 4'd0;
						para_reg <= para_in;
					end
				else 
					begin
						counter <= counter + 1'b1;
						para_reg <= para_reg << 1'b1;
					end
			end
	end

assign serial_out = para_reg[9];

endmodule
