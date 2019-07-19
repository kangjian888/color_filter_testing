# file: simcmds.tcl

# create the simulation script
vcd dumpfile isim.vcd
vcd dumpvars -m /glb_clk_src_tb -l 0
wave add /
run 50000ns
quit

