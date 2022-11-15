quit -sim 
vlib work

vcom BT11.vhd
vcom BT11test.vhd

vsim BT11test 
add wave sim:/BT11test/*

run 10000 ns