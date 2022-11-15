library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
------------------------------------
entity BT13 is
port(
    clk_out : out std_logic;
	clk_in  : in  std_logic;
	reset   : in  std_logic
	);
end BT13;
architecture Behavioral of BT13 is
signal dem  : std_logic_vector(5 downto 0) := "000000";
signal temp : std_logic;
begin
    process(clk_in)
    begin
        if(rising_edge(clk_in)) then
            if(reset = '1') then
                dem  <= "000000";
                temp <= '0';
            else 
			    if(dem = "011000") then
				    dem  <= "000000";
					temp <= not(temp);
				else 
                    dem <= dem + 1;
                end if;
            end if;
        end if;
	end process;
	clk_out <= temp;
end Behavioral;	
                			