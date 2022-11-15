library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-------------------------------
entity BT12test is
end BT12test;
-------------------------------
architecture test of BT12test is
component BT12 is
port(
    cnt    : out std_logic_vector(1 downto 0);
	clk    : in  std_logic;
	reset  : in  std_logic;
	enable : in  std_logic
	);
end component;
signal reset  : std_logic;
signal clk    : std_logic;
signal enable : std_logic;
signal cnt    : std_logic_vector(1 downto 0);
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
	
	cnt_1 : component BT12
	            port map(
				        reset  => reset, 
                        clk    => clk   ,
                        enable => enable,
                        cnt    => cnt   );
end test;						