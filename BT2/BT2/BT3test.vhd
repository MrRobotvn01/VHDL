library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------------
entity BT3test is
end BT3test;
-------------------------------
architecture test of BT3test is
component temp is
port(
    A      :  in  std_logic_vector(2 downto 0);
	enable :  in  std_logic_vector(2 downto 0);
	Y      :  out std_logic_vector(7 downto 0)
	);
end component;
--input--
signal A       : std_logic_vector(2 downto 0) := "011";
signal enable  : std_logic_vector(2 downto 0) := "001";
--output--
signal Y       : std_logic_vector(7 downto 0);

begin 
    DUT : component temp 
            port map(
			        A      => A,
					enable => enable,
					Y      => Y
					);	
end test;			