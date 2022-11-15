quit -sim
vlib work

vcom BT18.vhd
vcom BT18test.vhd

vsim BT18test
add wave sim:/BT18test/*

run 1000 ns