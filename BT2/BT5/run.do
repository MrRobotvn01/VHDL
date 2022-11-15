quit -sim
vlib work

vcom BT5.vhd
vcom BT5test.vhd

vsim BT5test 
add wave sim:/BT5test/*

run 1000 ns