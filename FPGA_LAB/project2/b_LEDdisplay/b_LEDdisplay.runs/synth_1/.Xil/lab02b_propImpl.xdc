set_property SRC_FILE_INFO {cfile:C:/Users/User/OneDrive/Desktop/FPGA_LAB/FPGA_LAB/project2/b_LEDdisplay/lab02b.xdc rfile:../../../lab02b.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_14 Sch=gclk
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A17   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #IO_L12N_T1_MRCC_16 Sch=led[1]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #IO_L13P_T2_MRCC_16 Sch=led[2]
