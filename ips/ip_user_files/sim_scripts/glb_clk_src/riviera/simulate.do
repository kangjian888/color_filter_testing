onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+glb_clk_src -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.glb_clk_src xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {glb_clk_src.udo}

run -all

endsim

quit -force
