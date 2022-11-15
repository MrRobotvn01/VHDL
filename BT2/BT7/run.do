quit -sim 
vlib work

vcom BT7.vhd
vcom BT7test.vhd

vsim BT7test 
add wave sim:/BT7test/*

run 10000 ns