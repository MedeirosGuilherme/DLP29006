onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /parallel_to_serial_converter/ascii_in
add wave -noupdate /parallel_to_serial_converter/baudrate
add wave -noupdate /parallel_to_serial_converter/rst
add wave -noupdate /parallel_to_serial_converter/sel_parity
add wave -noupdate /parallel_to_serial_converter/tx_led
add wave -noupdate /parallel_to_serial_converter/parity_led
add wave -noupdate /parallel_to_serial_converter/tx_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1447 ps}
