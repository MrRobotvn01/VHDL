library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------
entity BT23test is
end BT23test;
-----------------------------
architecture test of BT23test is
component BT23 is
port(
    sh_in  : in  std_logic_vector(7 downto 0);
	sh_val : in  std_logic_vector(2 downto 0);
	sh_out : out std_logic_vector(7 downto 0)
	);
end component;
signal sh_in  : std_logic_vector(7 downto 0) := "01010111";
signal sh_val : std_logic_vector(2 downto 0) := "100";
signal sh_out : std_logic_vector(7 downto 0);
begin
    sh : component BT23
	        port map(
			        sh_in => sh_in,
					sh_val => sh_val,
					sh_out => sh_out
					);
end test;					