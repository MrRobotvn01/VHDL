library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
------------------------------
entity test_adder4 is
end test_adder4;
------------------------------
architecture test of test_adder4 is
-- Tao signal
signal A: STD_LOGIC_VECTOR(3 downto 0):="0000";
signal B: STD_LOGIC_VECTOR(3 downto 0):="0000";
signal Cin: STD_LOGIC:='0';
signal S: STD_LOGIC_VECTOR(3 downto 0);
signal Cout: STD_LOGIC;
-- khoi adder4
component adder4 is
port(
		A: IN STD_LOGIC_VECTOR(3 downto 0);
		B: IN STD_LOGIC_VECTOR(3 downto 0);
		Cin: IN STD_LOGIC;
		S: OUT STD_LOGIC_VECTOR(3 downto 0);
		Cout: OUT STD_LOGIC
	);
end component adder4; 
begin
creat_data: process
	begin
		wait for 20 ns;
		A <= "1000";
		B <= "1001";
		Cin <= '1';
		wait for 100 ns;
		A <= "0011";
		B <= "1000";
		Cin <= '0';
		wait;
	end process creat_data;
DUT: component adder4
	port map(	 A => A,
				 B => B,
				 Cin => Cin,
				 S => S,
				 Cout => Cout
			);
end architecture test;