quit -sim 
vlib work

vcom BT10.vhd
vcom BT10test.vhd

vsim BT10test 
add wave sim:/BT10test/*

run 10000 ns