library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------
entity BT18test is
end BT18test;
------------------------------------
architecture test of BT18test is

component BT18 is
port(
     A     :   in  std_logic_vector(2 downto 0);
	 CH    :   out std_logic_vector(7 downto 0)
	 );
end component;
--Khai bao cac tin hieu vao va ra--
signal   A     :  std_logic_vector(2 downto 0)  :="110";
signal	CH     :  std_logic_vector(7 downto 0);

begin 
     DUT:   component BT18 
               port map(
					    A => A,  CH => CH     
								);
end test;								