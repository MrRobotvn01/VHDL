quit -sim
vlib work
vcom adder4.vhd
vcom test_adder4.vhd
vsim test_adder4
add wave sim:/test_adder4/*
run 1000