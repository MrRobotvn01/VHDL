quit -sim 
vlib work

vcom BT12.vhd
vcom BT12test.vhd

vsim BT12test 
add wave sim:/BT12test/*

run 10000 ns