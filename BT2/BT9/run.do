quit -sim 
vlib work

vcom BT9.vhd
vcom BT9test.vhd

vsim BT9test 
add wave sim:/BT9test/*

run 10000 ns