quit -sim
vlib work

vcom BT20.vhd
vcom BT20test.vhd

vsim BT20test
add wave sim:/BT20test/*

run 1000 ns