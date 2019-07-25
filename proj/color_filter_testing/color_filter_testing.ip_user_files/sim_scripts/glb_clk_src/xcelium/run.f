-makelib xcelium_lib/xil_defaultlib -sv \
  "F:/xilinx2018.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "F:/xilinx2018.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../../../ips/glb_clk_src/glb_clk_src_clk_wiz.v" \
  "../../../../../../ips/glb_clk_src/glb_clk_src.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

