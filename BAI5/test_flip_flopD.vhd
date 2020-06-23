library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
----------------
entity test_flip_flopD is
end test_flip_flopD;
---------------
architecture test of test_flip_flopD is
component flip_flopD is
port(
	D: in std_logic;
	CLK: in std_logic;
	SET: in std_logic;
	CLR: in std_logic;
	Q: out std_logic;
	Qnot: out std_logic
	);
end component flip_flopD;
signal D: std_logic;
signal CLK: std_logic;
signal SET: std_logic;
signal CLR: std_logic;
signal Q: std_logic;
signal Qnot: std_logic;

begin
create_clk:process
	begin
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
	end process create_clk;
create_data: process
	begin
		D <= '1';
		SET <= '0';
		CLR <= '0';
		wait for 100 ns;
		D <= '1';
		SET <= '0';
		CLR <= '1';
		wait for 100 ns;
		D <= '1';
		SET <= '1';
		CLR <= '0';
		wait;
	end process create_data;
		
DUT: component flip_flopD
	port map(
			D => D,
			CLK => CLK,
			SET => SET,
			CLR => CLR,
			Q => Q,
			Qnot => Qnot);
end architecture test;