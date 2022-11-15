quit -sim
vlib work

vcom BT24.vhd
vcom BT24test.vhd

vsim BT24test
add wave sim:/BT24test/*

run 1000 ns