library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
---------------------------
entity BT15test is
end BT15test;
---------------------------
architecture test of BT15test is
component BT15 is  
port(
    A  : in  std_logic_vector(7 downto 0);
	B  : out unsigned(2 downto 0)
	);
end component;
signal A : std_logic_vector(7 downto 0) := "11011111";
signal B : unsigned(2 downto 0);
begin
    PH : component BT15
	        port map(
			        A => A,
					B => B
					);
end test;					