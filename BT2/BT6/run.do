quit -sim 
vlib work

vcom BT6.vhd
vcom BT6test.vhd

vsim BT6test 
add wave sim:/BT6test/*

run 1000 ns