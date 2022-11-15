quit -sim 
vlib work

vcom BT17.vhd
vcom BT17test.vhd

vsim BT17test 
add wave sim:/BT17test/*

run 1000 ns