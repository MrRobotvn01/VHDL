library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------
entity BT5 is
port(
    D     : in  std_logic;
	clk   : in  std_logic;
	set   : in  std_logic;
	clr   : in  std_logic;
	Q     : out std_logic;
	Qn    : out std_logic
	);
end BT5;
architecture Behavioral of BT5 is
signal Q0 : std_logic;
begin
    process(D,clk,set,clr) 
    begin
        if(set = '1') then
            Q0 <= '1';
        elsif(clr = '1') then
		    Q0 <= '0';
		elsif(set = '0' and clr = '0') then
		    if(rising_edge(clk)) then
			    Q0 <= D;
            end if;
        end if;
    end process;
	Q <= Q0;
	Qn <= not Q0;
end Behavioral;	
            		