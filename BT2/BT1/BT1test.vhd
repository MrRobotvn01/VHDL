library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------
entity BT1test is
end BT1test;
--------------------------------
architecture test of BT1test is
component BT1 is
port(
    A     : in  std_logic_vector(3 downto 0);
	B     : in  std_logic_vector(3 downto 0);
	Cin   : in  std_logic;
	Cout  : out std_logic;
	S     : out std_logic_vector(3 downto 0)
	);
end component;
--input--
signal A    : std_logic_vector(3 downto 0) := "1010";
signal B    : std_logic_vector(3 downto 0) := "0011";
signal Cin  : std_logic                    := '1'   ;
--output--
signal Cout : std_logic;
signal S    : std_logic_vector(3 downto 0);  
begin
    dut : component BT1
                port map(
				        A    => A,
						B    => B,
						Cin  => Cin,
                        Cout => Cout,
                        S    => S						
						);
end test;						