quit -sim
vlib work

vcom BT19.vhd
vcom BT19test.vhd

vsim BT19test
add wave sim:/BT19test/*

run 1000 ns