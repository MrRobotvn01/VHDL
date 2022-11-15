library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------
entity BT12 is
port(
    cnt    : out std_logic_vector(1 downto 0);
	clk    : in  std_logic;
	reset  : in  std_logic;
	enable : in  std_logic
	);
end BT12;
architecture Behavioral of BT12 is
signal cnt_temp : std_logic_vector(1 downto 0) := "11";
begin
    process(reset,clk,enable)
    begin
        if(reset = '1')then
            cnt_temp <= "11";
        elsif(rising_edge(clk))	then
            if(enable = '1') then 
                cnt_temp <= cnt_temp - 1;
            end if;
        end if;
    end process;
    cnt(1) <= cnt_temp(1);
    cnt(0) <= cnt_temp(1) xor cnt_temp(0);
end Behavioral; 	