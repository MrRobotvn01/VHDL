quit -sim 
vlib work

vcom BT14.vhd
vcom BT14test.vhd

vsim BT14test 
add wave sim:/BT14test/*

run 1000 ns