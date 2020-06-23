library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------------
entity counter_thuan is
generic( N: natural)
port(
		CLK: IN STD_LOGIC;
		R: IN STD_LOGIC;
		E: IN STD_LOGIC;
		CNT: OUT STD_LOGIC_VECTOR( N -1 DOWNTO 0)
	);
end entity counter_thuan;
---------------------------------------
architecture bhv of counter_thuan is
signal CNT_temp: STD_LOGIC_VECTOR(N-1 DOWNTO 0):=(others =>'0');
process(CLK,R,E)
begin
	if R = '1' then
		CNT_temp <= (others => '0');
	elsif CLK = '1' and CLK'event then
		if E = '1' then
			CNT_temp <= CNT_temp + 1;
		else
			CNT_temp <= CNT_temp;
		end if;
	end if;
	CNT <= CNT_temp;
end process;
end architecture;