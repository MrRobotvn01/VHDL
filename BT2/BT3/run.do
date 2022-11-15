quit -sim 
vlib work

vcom adder4.vhd
vcom BT3.vhd
vcom BT3_test.vhd

vsim BT3_test 
add wave sim:/BT3_test/*

run 1000 ns