quit -sim 
vlib work

vcom BT16.vhd
vcom BT16test.vhd

vsim BT16test 
add wave sim:/BT16test/*

run 1000 ns