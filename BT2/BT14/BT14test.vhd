library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
---------------------------
entity BT14test is
end BT14test;
---------------------------
architecture test of BT14test is
component BT14 is  
port(
    A  : in  std_logic_vector(7 downto 0);
	B  : out unsigned(2 downto 0)
	);
end component;
signal A : std_logic_vector(7 downto 0) := "00011100";
signal B : unsigned(2 downto 0);
begin
    PH : component BT14
	        port map(
			        A => A,
					B => B
					);
end test;					