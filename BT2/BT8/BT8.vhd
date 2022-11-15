library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------
entity BT8 is
generic(N : natural);
port(
    SR     : in  std_logic;
	reset  : in  std_logic;
	clk    : in  std_logic;
	enable : in  std_logic;
	Dout   : out std_logic_vector(N-1 downto 0)
	);
end BT8;
architecture Behavioral of BT8 is
signal reg_out : std_logic_vector(N-1 downto 0);
begin
    process(reset, clk, enable)
	begin
		if(reset = '1') then
		 reg_out <= (others =>'0');
		elsif(rising_edge(clk)) then 
            if(enable = '1') then
                reg_out <= 	(SR&reg_out(N-1 downto 1));
            end if;
        end if;
    end process;
    Dout <= reg_out;
end Behavioral;	
			    