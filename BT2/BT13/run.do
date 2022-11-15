quit -sim 
vlib work

vcom BT13.vhd
vcom BT13test.vhd

vsim BT13test 
add wave sim:/BT13test/*

run 10000 ns