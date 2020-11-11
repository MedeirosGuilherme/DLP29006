onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /baud_gen/sel_baud
add wave -noupdate /baud_gen/rst
add wave -noupdate /baud_gen/clk_in
add wave -noupdate /baud_gen/baud_out
add wave -noupdate /baud_gen/baud_led
add wave -noupdate /baud_gen/clk_t
add wave -noupdate /baud_gen/MAX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {656081 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {997500 ps}
