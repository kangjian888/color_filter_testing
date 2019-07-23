set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_P]
set_property PACKAGE_PIN R3 [get_ports SYSCLK_P]
set_property PACKAGE_PIN P3 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS_25 [get_ports SYSCLK_N]

set_property PACKAGE_PIN U6 [get_ports G_RST]
set_property IOSTANDARD SSTL15 [get_ports G_RST]

set_property PACKAGE_PIN T5 [get_ports send_enable_button]
set_property IOSTANDARD SSTL15 [get_ports send_enable_button]

#set_property IOSTANDARD LVDS_25 [get_ports signal_output_p]
#set_property PACKAGE_PIN T8 [get_ports signal_output_p]
#set_property PACKAGE_PIN T7 [get_ports signal_output_n]
#set_property IOSTANDARD LVDS_25 [get_ports signal_output_n]

set_property IOSTANDARD LVCMOS33 [get_ports signal_output]
set_property PACKAGE_PIN T8 [get_ports signal_output]

set_property PACKAGE_PIN P26 [get_ports voltage_test]
set_property IOSTANDARD LVCMOS33 [get_ports voltage_test]

set_property SLEW FAST [get_ports signal_output]
set_property SLEW FAST [get_ports voltage_test]
set_property DRIVE 16 [get_ports voltage_test]


set_property DRIVE 16 [get_ports signal_output]
set_property OFFCHIP_TERM NONE [get_ports voltage_test]
set_property PULLDOWN true [get_ports signal_output]
