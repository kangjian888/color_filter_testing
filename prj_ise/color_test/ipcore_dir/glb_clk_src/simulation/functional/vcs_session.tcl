gui_open_window Wave
gui_sg_create glb_clk_src_group
gui_list_add_group -id Wave.1 {glb_clk_src_group}
gui_sg_addsignal -group glb_clk_src_group {glb_clk_src_tb.test_phase}
gui_set_radix -radix {ascii} -signals {glb_clk_src_tb.test_phase}
gui_sg_addsignal -group glb_clk_src_group {{Input_clocks}} -divider
gui_sg_addsignal -group glb_clk_src_group {glb_clk_src_tb.CLK_IN1}
gui_sg_addsignal -group glb_clk_src_group {{Output_clocks}} -divider
gui_sg_addsignal -group glb_clk_src_group {glb_clk_src_tb.dut.clk}
gui_list_expand -id Wave.1 glb_clk_src_tb.dut.clk
gui_sg_addsignal -group glb_clk_src_group {{Status_control}} -divider
gui_sg_addsignal -group glb_clk_src_group {glb_clk_src_tb.RESET}
gui_sg_addsignal -group glb_clk_src_group {glb_clk_src_tb.LOCKED}
gui_sg_addsignal -group glb_clk_src_group {{Counters}} -divider
gui_sg_addsignal -group glb_clk_src_group {glb_clk_src_tb.COUNT}
gui_sg_addsignal -group glb_clk_src_group {glb_clk_src_tb.dut.counter}
gui_list_expand -id Wave.1 glb_clk_src_tb.dut.counter
gui_zoom -window Wave.1 -full
