vcom -93 -work work {/home/aluno/Downloads/versao4_restored/baud_gen.vhd}
Vsim work.baud_gen

do baud_wave.do
force -freeze sim:/baud_gen/sel_baud 00 0, 01 350 ns
force -freeze sim:/baud_gen/rst 1 0, 0 100 ns
force -freeze sim:/baud_gen/clk_in 1 0, 0 {12500 ps} -r {25 ns}
force -freeze sim:/baud_gen/rst 0 0
force -freeze sim:/baud_gen/sel_baud 01 0
run 750 ns


