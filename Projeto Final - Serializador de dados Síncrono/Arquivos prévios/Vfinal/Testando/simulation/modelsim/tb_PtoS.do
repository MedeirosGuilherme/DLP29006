vcom -93 -work work {/home/guilherme.s17/Projeto Final/QAR/Parallel_to_Serial_converter.vhd}
vsim work.parallel_to_serial_converter


do PtoS_wave.do
force -freeze sim:/parallel_to_serial_converter/baudrate 1 0, 0 {12 ps} -r 25
force -freeze sim:/parallel_to_serial_converter/rst 1 0, 0 50
force -freeze sim:/parallel_to_serial_converter/ascii_in b 0
force -freeze sim:/parallel_to_serial_converter/sel_parity 0 0

run 1000


