vcom -93 -work work {/home/guilherme.s17/Projeto Final/QAR/data_in.vhd}
vsim work.data_in(teste)

do data_in_wave.do
force -freeze sim:/data_in/rst 1 0, 0 150 ns
force -freeze sim:/data_in/baud_data 1 0, 0 {25000 ps} -r {50 ns}
force -freeze sim:/data_in/selChar 00001 0, 01011 12000 ns
run 12000 ns


