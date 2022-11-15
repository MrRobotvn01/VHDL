quit -sim
vlib work 

vcom temp.vhd
vcom BT3test.vhd
 
vsim BT3test

add wave sim:/BT3test/*
run 1000 ns 