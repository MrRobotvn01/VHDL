quit -sim 
vlib work

vcom BT8.vhd
vcom BT8test.vhd

vsim BT8test 
add wave sim:/BT8test/*

run 10000 ns