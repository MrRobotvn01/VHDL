library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;
---------------------
entity adder_sub is
port(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	Cin: in std_logic;
	Sub: in std_logic;
	S: out std_logic_vector(3 downto 0);
	Cout: out std_logic
	);
end entity adder_sub;
------------------------
architecture bhv of adder_sub is
	component adder4 is
	port(
			A: IN STD_LOGIC_VECTOR(3 downto 0);
			B: IN STD_LOGIC_VECTOR(3 downto 0);
			Cin: IN STD_LOGIC;
			S: OUT STD_LOGIC_VECTOR(3 downto 0);
			Cout: OUT STD_LOGIC
		);
	end component adder4;
	signal B_temp: std_logic_vector(3 downto 0);
	signal S_temp: std_logic_vector(4 downto 0):=(others => '0');
	signal Cin_temp: std_logic;
	begin
		Cin_temp <= Cin or Sub;
		MUX: process(B_temp,Sub)
		begin
			if Sub = '1' then
				B_temp <= not B;
			else
				B_temp <= B;
			end if;
		end process MUX;
	add: component adder4
	port map(
				A => A,
				B => B_temp,
				Cin => Cin_temp,
				S => S,
				Cout => Cout
			);
end architecture bhv;