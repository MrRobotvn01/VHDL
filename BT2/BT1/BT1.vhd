library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
---------------------------------------
entity BT1 is
port(
    A     : in  std_logic_vector(3 downto 0);
	B     : in  std_logic_vector(3 downto 0);
	Cin   : in  std_logic;
	Cout  : out std_logic;
	S     : out std_logic_vector(3 downto 0)
	);
end BT1;
------------------------------------------
architecture Behavioral of BT1 is
signal A_temp : std_logic_vector(4 downto 0);
signal B_temp : std_logic_vector(4 downto 0);
signal S_temp : std_logic_vector(4 downto 0);
begin
    A_temp <= '0'& A;
    B_temp <= '0'& B;
    S_temp <= A_temp + B_temp + Cin;
    S      <= S_temp(3 downto 0);
    Cout   <= S_temp(4);
end Behavioral; 	