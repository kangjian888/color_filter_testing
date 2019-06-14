-makelib ies_lib/xil_defaultlib -sv \
  "F:/xilinx2018.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "F:/xilinx2018.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../glb_clk_src/glb_clk_src_clk_wiz.v" \
  "../../../../glb_clk_src/glb_clk_src.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

