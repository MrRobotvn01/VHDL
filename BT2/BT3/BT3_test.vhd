library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------
entity BT3_test is
end BT3_test;
---------------------------------
architecture test of BT3_test is
component BT3 is
generic(sl : BOOLEAN );
port(
    A    :  in  std_logic_vector(3 downto 0);
	B    :  in  std_logic_vector(3 downto 0);
	Cin  :  in  std_logic;
    Cout :  out std_logic;	
	S    :  out std_logic_vector(3 downto 0)
	);
end component;
--input--
signal A    : std_logic_vector(3 downto 0) := "1001";
signal B    : std_logic_vector(3 downto 0) := "0101";
signal Cin  : std_logic                    := '0';
--output--
signal Cout : std_logic;
signal S    : std_logic_vector(3 downto 0);
begin
    DUT : component BT3
	        generic map(sl => FALSE)
			port map(
			        A   =>  A,
					B   =>  B,
					Cin =>  Cin,
					Cout=>  Cout,
					S   =>  S
					);
end test;			