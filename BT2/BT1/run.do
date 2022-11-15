quit -sim
vlib work

vcom BT1.vhd 
vcom BT1test.vhd

vsim BT1test

add wave sim:/BT1test/*

run 1000 ns