#Global clock 
set_property PACKAGE_PIN R3 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_P]
set_property PACKAGE_PIN P3 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_N]

#global reset
set_property PACKAGE_PIN T5 [get_ports G_RST]
set_property IOSTANDARD SSTL15 [get_ports G_RST]
#the speed of generation signal control
set_property PACKAGE_PIN R8 [get_ports SPEEDCTR[0]]
set_property IOSTANDARD SSTL15 [get_ports SPEEDCTR[0]]
set_property PACKAGE_PIN P8 [get_ports SPEEDCTR[1]]
set_property IOSTANDARD SSTL15 [get_ports SPEEDCTR[1]]
set_property PACKAGE_PIN R7 [get_ports SPEEDCTR[2]]
set_property IOSTANDARD SSTL15 [get_ports SPEEDCTR[2]]
set_property PACKAGE_PIN R6 [get_ports SPEEDCTR[3]]
set_property IOSTANDARD SSTL15 [get_ports SPEEDCTR[3]]

#output testing signal
set_property PACKAGE_PIN T8 [get_ports signal_output_p]
set_property IOSTANDARD LVDS_25 [get_ports signal_output_p]
set_property PACKAGE_PIN T7 [get_ports signal_output_n]
set_property IOSTANDARD LVDS_25 [get_ports signal_output_n]