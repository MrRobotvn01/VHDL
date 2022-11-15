library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------
entity test_IC74138 is
end entity test_IC74138;
----------------------------
architecture test of test_IC74138 is
component IC74138 is
port(
	X: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	E: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component IC74138;
---------------------------
signal X: STD_LOGIC_VECTOR(2 DOWNTO 0):="011";
signal E: STD_LOGIC_VECTOR(2 DOWNTO 0):="001";
signal Y: STD_LOGIC_VECTOR(7 DOWNTO 0);

begin
DUT: component IC74138 
	port map( X => X, E => E, Y => Y);
end architecture test;
			