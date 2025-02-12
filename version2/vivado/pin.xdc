##CLK
set_property PACKAGE_PIN K18 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

##SW
set_property PACKAGE_PIN E16 [get_ports RSTn]
set_property IOSTANDARD LVCMOS33 [get_ports RSTn]

##DEBUGGER
set_property PACKAGE_PIN W19 [get_ports SWDIO]
set_property IOSTANDARD LVCMOS33 [get_ports SWDIO]
set_property PACKAGE_PIN V20 [get_ports SWCLK]
set_property IOSTANDARD LVCMOS33 [get_ports SWCLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets SWCLK]

##keyboard
set_property PACKAGE_PIN AA10 [get_ports {row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}]
set_property PACKAGE_PIN V10 [get_ports {row[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}]
set_property PACKAGE_PIN W10 [get_ports {row[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}]
set_property PACKAGE_PIN AA9 [get_ports {row[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}]
set_property PACKAGE_PIN AB10 [get_ports {col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[3]}]
set_property PACKAGE_PIN W11 [get_ports {col[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[2]}]
set_property PACKAGE_PIN AA11 [get_ports {col[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[1]}]
set_property PACKAGE_PIN T14 [get_ports {col[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {col[0]}]

##BUZZER
set_property PACKAGE_PIN Y11 [get_ports {beep}]
set_property IOSTANDARD LVCMOS33 [get_ports {beep}]

# ##DIGITRON
# set_property PACKAGE_PIN AA16 [get_ports {seg_led[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[0]}]
# set_property PACKAGE_PIN AB15 [get_ports {seg_led[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[1]}]
# set_property PACKAGE_PIN AB16 [get_ports {seg_led[2]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[2]}]
# set_property PACKAGE_PIN AB17 [get_ports {seg_led[3]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[3]}]
# set_property PACKAGE_PIN W14 [get_ports {seg_led[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[4]}]
# set_property PACKAGE_PIN Y17 [get_ports {seg_led[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[5]}]
# set_property PACKAGE_PIN AA15 [get_ports {seg_led[6]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[6]}]
# set_property PACKAGE_PIN Y16 [get_ports {seg_led[7]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_led[7]}]
# set_property PACKAGE_PIN Y14 [get_ports {seg_sel[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[0]}]
# set_property PACKAGE_PIN AB13 [get_ports {seg_sel[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[1]}]
# set_property PACKAGE_PIN AA13 [get_ports {seg_sel[2]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[2]}]
# set_property PACKAGE_PIN Y13 [get_ports {seg_sel[3]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[3]}]
# set_property PACKAGE_PIN AB11 [get_ports {seg_sel[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[4]}]
# set_property PACKAGE_PIN AA14 [get_ports {seg_sel[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[5]}]


# ##LED
set_property PACKAGE_PIN AA21 [get_ports {led}]
set_property IOSTANDARD LVCMOS33 [get_ports {led}]
# set_property PACKAGE_PIN P19 [get_ports {led[1]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
# set_property PACKAGE_PIN P20 [get_ports {led[2]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
# set_property PACKAGE_PIN R19 [get_ports {led[3]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
# set_property PACKAGE_PIN T20 [get_ports {led[4]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
# set_property PACKAGE_PIN T21 [get_ports {led[5]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
# set_property PACKAGE_PIN U21 [get_ports {led[6]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
# set_property PACKAGE_PIN U22 [get_ports {led[7]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
# set_property PACKAGE_PIN W22 [get_ports {led[8]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
# set_property PACKAGE_PIN W21 [get_ports {led[9]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
# set_property PACKAGE_PIN V22 [get_ports {led[10]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
# set_property PACKAGE_PIN AA20 [get_ports {led[11]}]
# set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]

