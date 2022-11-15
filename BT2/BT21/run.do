quit -sim
vlib work

vcom BT21.vhd
vcom BT21test.vhd

vsim BT21test
add wave sim:/BT21test/*

run 1000 ns