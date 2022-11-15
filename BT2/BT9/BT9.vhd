library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------
entity BT9 is
port(
	reset  : in  std_logic;
	clk    : in  std_logic;
	enable : in  std_logic;
	cnt    : out std_logic_vector(3 downto 0)
	);
end BT9;
architecture Behavioral of BT9 is
signal cnt_temp : std_logic_vector(3 downto 0) := "0000";
begin
    process(clk,reset,enable)
	begin
	    if(reset = '1') then
		    cnt_temp <= "0000";
		elsif(rising_edge(clk)) then
		    if(enable = '1') then
			    cnt_temp <= cnt_temp + 1;
			end if;
        end if;
    end process;
	cnt <= cnt_temp;
end Behavioral;	
	