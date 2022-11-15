quit -sim
vlib work

vcom BT22.vhd
vcom BT22test.vhd

vsim BT22test
add wave sim:/BT22test/*

run 1000 ns