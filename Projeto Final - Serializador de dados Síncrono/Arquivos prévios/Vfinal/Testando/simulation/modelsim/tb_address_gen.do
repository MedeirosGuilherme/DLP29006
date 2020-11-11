vcom -93 -work work {/home/aluno/Downloads/versao4_restored/address_gen.vhd}

do address_gen_wave.do

force -freeze sim:/address_gen/init 0 0, 1 100 ns, 0 450 ns
force -freeze sim:/address_gen/clk_in 1 0, 0 {12500 ps} -r {25 ns}
force -freeze sim:/address_gen/rst 0 0, 1 400 ns
force -freeze sim:/address_gen/next_address 0 0, 1 200ns, 0 400 ns
force -freeze sim:/address_gen/next_address 1 0, 0 {37500 ps} -r {75 ns}
force -freeze sim:/address_gen/next_address 1 0, 0 {25 ps} -r 50
run 550


