library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------
entity BT9test is
end BT9test;
-------------------------------
architecture test of BT9test is
component BT9 is
port(
	reset  : in  std_logic;
	clk    : in  std_logic;
	enable : in  std_logic;
	cnt    : out std_logic_vector(3 downto 0)
	);
end component;
signal reset  : std_logic;
signal clk    : std_logic;
signal enable : std_logic;
signal cnt    : std_logic_vector(3 downto 0);
begin
    creat_clock : process
	begin
	    clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end process creat_clock;
	
	creat_data : process
    begin 
        reset <= '0';
    	enable <= '1';
    	wait for 100 ns;
    	reset <= '1';
    	wait for 100 ns;
    	reset <= '0';
    	wait for 1000 ns;
    	enable <= '0';
    	wait for 1000 ns;
    	enable <= '1';
    	wait;
    end process creat_data;
	
	cnt_1 : component BT9
	            port map(
				        reset  => reset, 
                        clk    => clk   ,
                        enable => enable,
                        cnt    => cnt   );
end test;						