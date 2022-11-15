library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
------------------------------------
entity compare is
port(
    A         : in  std_logic;
	B         : in  std_logic;
	G         : in  std_logic;
	AlargerB  : out std_logic;
	AsmallerB : out std_logic;
	AequalB   : out std_logic
	);
end compare;
architecture Behavioral of compare is
begin
    AlargerB  <= G and A and (not(B));
    AsmallerB <= G and (not(A)) and B;
    AequalB   <= G and (not(A xor B));
end Behavioral;	