#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=F:/xilinx2018.3/SDK/2018.3/bin;F:/xilinx2018.3/Vivado/2018.3/ids_lite/ISE/bin/nt64;F:/xilinx2018.3/Vivado/2018.3/ids_lite/ISE/lib/nt64:F:/xilinx2018.3/Vivado/2018.3/bin
else
  PATH=F:/xilinx2018.3/SDK/2018.3/bin;F:/xilinx2018.3/Vivado/2018.3/ids_lite/ISE/bin/nt64;F:/xilinx2018.3/Vivado/2018.3/ids_lite/ISE/lib/nt64:F:/xilinx2018.3/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='C:/Users/KANG Jian/Desktop/color_filter_testing/proj/color_filter_testing/color_filter_testing.runs/glb_clk_src_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log glb_clk_src.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source glb_clk_src.tcl
