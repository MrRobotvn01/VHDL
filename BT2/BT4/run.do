quit -sim
vlib work

vcom compare.vhd
vcom BT4.vhd
vcom BT4test.vhd

vsim -novopt BT4test
add wave sim:/BT4test/*

run 1000 ns