// =============================================================================
// Filename: reset.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module reset(
	input clk,//the global clock input
	input dcm_locked,
	output reg reset_sync//high active	
);

wire dcm_locked_sync;
reg dcm_locked_sync_pre;
syn_block syn_block_0(
	.clk(clk),
	.enable(1'b1),
	.data_in(dcm_locked),
	.data_out(dcm_locked_sync)
	);

always @ (posedge clk)
    begin
    	dcm_locked_sync_pre <= dcm_locked_sync;
    end

always @ (posedge clk)
    begin
        if(!dcm_locked_sync_pre && dcm_locked_sync)
        	begin
        		reset_sync <= 1'b1;
        	end
        else
        	begin
        		reset_sync <= 1'b0;
        	end
    end

endmodule