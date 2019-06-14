onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib glb_clk_src_opt

do {wave.do}

view wave
view structure
view signals

do {glb_clk_src.udo}

run -all

quit -force
