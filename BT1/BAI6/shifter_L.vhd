library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------
entity shifter_L is
port(
	SL: in std_logic;
	CLK: in std_logic;
	R: in std_logic;
	E: in std_logic;
	DOUT: out std_logic_vector(3 downto 0)
	);
end entity shifter_L;
---------------------------
architecture bhv of shifter_L is
signal D_temp std_logic_vector(3 downto 0):="0000";
process(SL,CLK,R,E)
begin
	if R = '1' then
		D_temp <= "0000";
	elsif CLK = '1' and CLK'event then
		if E = '1' then
			D_temp <= D_temp(2 downto 0)&SL;
		else
			D_temp <= D_temp;
		end if;
	end if;
	DOUT <= D_temp;
end process;
end architecture bhv;

	
	