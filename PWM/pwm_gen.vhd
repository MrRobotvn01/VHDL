library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
------------------------------
entity pwm_gen is
port(
	clk: in std_logic;
	width: in std_logic_vector(7 downto 0);
	rst: in std_logic;
	pwm: out std_logic
	);
end entity pwm_gen;
------------------------------
architecture bhv of pwm_gen is
signal cnt: std_logic_vector(7 downto 0);
signal pwm_temp: std_logic:='1';
begin
flow_clk:process(clk,cnt,rst)
	begin
		if rst = '1' then
			cnt <= (others => '0');
		elsif clk = '1' and clk'event then
			if cnt = "11111111" then
				cnt <= (others =>'0');
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process flow_clk;
flow_cnt:process(clk,width,rst,cnt)
	begin
		if clk = '1' and clk'event then
			if cnt = "11111111" or cnt = width then
				pwm_temp <= not pwm_temp;
			else
				pwm_temp <= pwm_temp;
			end if;
		end if;
		pwm <= pwm_temp;
	end process flow_cnt;
end architecture bhv;