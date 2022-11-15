
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--------------------------------------
entity clk_div is
	generic(baud	:std_logic_vector(7 downto 0):="01000001");
	port (	clk		:in std_logic;
			clk16	:out std_logic
		);
end entity;
--------------------------------------
architecture behavioral of clk_div is
signal cnt	:std_logic_vector(7 downto 0):=x"00";
signal clk_temp:std_logic:='0';
BEGIN
	process(clk,cnt)
		begin
			if rising_edge(clk) then
				if cnt = baud then 
					cnt <= x"00";
				else 
					cnt <= cnt + 1;
				end if;
			end if;
	end process;
	process(clk,cnt,clk_temp)
		begin
			if rising_edge(clk) then
				if cnt = baud then
					clk_temp <= not clk_temp;
				else 
					clk_temp <= clk_temp;
				end if;
			end if;
	end process;
clk16<=clk_temp;	
END architecture;