library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--------------------------------
entity adder4 is
port(
		A: IN STD_LOGIC_VECTOR(3 downto 0);
		B: IN STD_LOGIC_VECTOR(3 downto 0);
		Cin: IN STD_LOGIC;
		S: OUT STD_LOGIC_VECTOR(3 downto 0);
		Cout: OUT STD_LOGIC
	);
end entity adder4;	
architecture bhv of adder4 is
	signal A_temp: STD_LOGIC_VECTOR(4 downto 0);
	signal B_temp: STD_LOGIC_VECTOR(4 downto 0);
	signal Sum_temp: STD_LOGIC_VECTOR(4 downto 0);
begin
	A_temp <= '0'&A;
	B_temp <= '0'&B;
	Sum_temp <= A_temp + B_temp + Cin;
	S <= Sum_temp(3 downto 0);
	Cout <= Sum_temp(4);
end architecture bhv;