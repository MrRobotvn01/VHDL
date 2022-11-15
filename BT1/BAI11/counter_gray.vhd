library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--------------------------------
entity counter_gray is
port(
		CLK: IN STD_LOGIC;
		R: IN STD_LOGIC;
		E: IN STD_LOGIC;
		CNT: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	);
end entity counter_gray;
--------------------------------
architecture bhv of counter_gray is
signal cnt_temp: std_logic_vector(1 downto 0):="00";
begin
	dem: process(CLK,R,E)
	begin
		if R = '1' then cnt_temp <= "00";
		elsif CLK = '1' and CLK'event then
			if E = '1' then
				cnt_temp <= cnt_temp + 1;
			else
				cnt_temp <= cnt_temp;
			end if;
		end if;
	end process dem;
	CNT(1) <= cnt_temp(1);
	CNT(0) <= cnt_temp(1) xor cnt_temp(0);
end architecture bhv;
		
			