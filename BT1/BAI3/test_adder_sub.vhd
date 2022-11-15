library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;
---------------------

entity test_adder_sub is
end test_adder_sub;
------------------------
architecture test of test_adder_sub is
	component adder_sub is
	port(
		A: in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		Sub: in std_logic;
		S: out std_logic_vector(3 downto 0);
		Cout: out std_logic
		);
	end component adder_sub;
	---------------------------
	signal	A:  std_logic_vector(3 downto 0):="0001";
	signal	B:  std_logic_vector(3 downto 0):="0110";
	signal	Cin:  std_logic:='1';
	signal	Sub:  std_logic:='0';
	signal	S:  std_logic_vector(3 downto 0);
	signal	Cout: std_logic:='0';
begin

	DUT: component adder_sub
	port map(
		A => A,
		B => B,
		Cin => Cin,
		Sub => Sub,
		S => S,
		Cout => Cout
		);
	
end architecture test;