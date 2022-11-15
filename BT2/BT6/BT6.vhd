library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------
entity BT6 is
port(
    J   : in  std_logic;
	K   : in  std_logic;
	clk : in  std_logic;
	clr : in  std_logic;
	set : in  std_logic;
	Q   : out std_logic;
	Qn  : out std_logic
	);
end BT6;
architecture Behavioral of BT6 is
signal Q_temp : std_logic;
begin
    process(clk,clr,set,J,K)
	begin
	    if(set = '1') then
		    Q_temp <= '1';
		elsif(clr = '1') then
		    Q_temp <= '0';
		elsif(set = '0' and clr = '0') then
            if(falling_edge(clk)) then
                if(J = '0' and K = '0') then
                    Q_temp <= Q_temp;
                elsif(J = '0' and K = '1' )then
                    Q_temp <= '0';
                elsif(J = '1' and K = '0') then
                    Q_temp <= '1';
                else 
                    Q_temp <= not(Q_temp);
				end if;
            end if;
        end if;
    end process;
	Q <= Q_temp;
	Qn<= not(Q_temp);
end Behavioral;	
					