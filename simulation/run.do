quietly set ACTELLIBNAME proasic3
quietly set PROJECT_DIR "E:/Actelprj/backup/smart_top20140227_1058_1/smart_top20140227_1058_1_changeSHCOL"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   vlib presynth
}
vmap presynth presynth
vmap proasic3 "F:/Actel/Libero_v9.1/Designer/lib/modelsim/precompiled/vhdl/proasic3"
if {[file exists COREUART_LIB/_info]} {
   echo "INFO: Simulation library COREUART_LIB already exists"
} else {
   vlib COREUART_LIB
}
vmap COREUART_LIB "COREUART_LIB"

vcom -93 -explicit -work COREUART_LIB "${PROJECT_DIR}/component/work/Top_uart/COREUART_0/rtl/vhdl/core_obfuscated/Clock_gen.vhd"
vcom -93 -explicit -work COREUART_LIB "${PROJECT_DIR}/component/work/Top_uart/COREUART_0/rtl/vhdl/core_obfuscated/Tx_async.vhd"
vcom -93 -explicit -work COREUART_LIB "${PROJECT_DIR}/component/work/Top_uart/COREUART_0/rtl/vhdl/core_obfuscated/Rx_async.vhd"
vcom -93 -explicit -work COREUART_LIB "${PROJECT_DIR}/component/work/Top_uart/COREUART_0/rtl/vhdl/core_obfuscated/fifo_256x8.vhd"
vcom -93 -explicit -work COREUART_LIB "${PROJECT_DIR}/component/work/Top_uart/COREUART_0/rtl/vhdl/core_obfuscated/CoreUART.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/hdl/Uart_ctl.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/component/work/Top_uart/Top_uart.vhd"
vcom -93 -explicit -work COREUART_LIB "${PROJECT_DIR}/component/work/smart_top/COREUART_0/rtl/vhdl/core_obfuscated/components.vhd"
vcom -93 -explicit -work COREUART_LIB "${PROJECT_DIR}/component/work/Top_uart/COREUART_0/rtl/vhdl/core_obfuscated/components.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/stimulus/Tb_top_uart.vhd"

vsim -L proasic3 -L presynth -L COREUART_LIB  -t 1ps presynth.Tb_top_uart
add wave /Tb_top_uart/*
run 100 ms
