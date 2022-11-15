quit -sim
vlib work

vcom BT23.vhd
vcom BT23test.vhd

vsim BT23test
add wave sim:/BT23test/*

run 1000 ns