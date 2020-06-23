--CHIA TAN
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------
entity chia_tan is
port(
		CLK_50HZ: IN STD_LOGIC;
		CLK_1HZ: INOUT STD_LOGIC
	);
end entity chia_tan;
---------------------------
architecture bhv of chia_tan is
signal cnt: std_logic_vector(4 downto 0):=(others => '0');
begin
	flow_clk:process(CLK_50HZ,cnt)
	begin
		if CLK_50HZ = '1' and CLK_50HZ'event then
				if cnt = "11000" then
					cnt <= (others => '0');
				else
					cnt <= cnt + 1;
				end if;
		end if;
	end process flow_clk;
	flow_cnt:process(CLK_1HZ,CLK_50HZ,cnt)
	begin
		if CLK_50HZ = '1' and CLK_50HZ'event then
				if cnt = "11000" then 
					CLK_1HZ <= not CLK_1HZ;
				else
					CLK_1HZ <= CLK_1HZ;
				end if;
		end if;
	end process flow_cnt;
end architecture bhv;
