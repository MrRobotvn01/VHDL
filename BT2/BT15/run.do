quit -sim 
vlib work

vcom BT15.vhd
vcom BT15test.vhd

vsim BT15test 
add wave sim:/BT15test/*

run 1000 ns