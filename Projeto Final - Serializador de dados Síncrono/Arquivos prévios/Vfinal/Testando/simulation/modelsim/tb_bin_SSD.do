vcom -93 -work work {/home/guilherme.s17/Projeto Final/QAR/bin_to_ssd.vhd}

vsim work.bin_to_ssd

do binSSD_wave.do
force -freeze sim:/bin_to_ssd/count_in 1 0, 2 50 ns, 3 100 ns, 4 150 ns, 5 200 ns, 6 250 ns, 7 300 ns, 8 350 ns, 9 400 ns, A 450 ns, b 500 ns, C 550 ns, d 600 ns, E 650 ns, F 700 ns, H 750 ns,  I 800 ns, J 850 ns, L 900 ns, P 950 ns, U 1000 ns, V 1500 ns
run 1600 ns



