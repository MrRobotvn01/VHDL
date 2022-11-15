library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------
entity BT8test is
end BT8test;
----------------------------
architecture test of BT8test is
component BT8 is
generic(N : natural);
port(
    SR     : in  std_logic;
	reset  : in  std_logic;
	clk    : in  std_logic;
	enable : in  std_logic;
	Dout   : out std_logic_vector(N-1 downto 0)
	);
end component;
signal SR     : std_logic;
signal reset  : std_logic;
signal clk    : std_logic;
signal enable : std_logic;
signal Dout   : std_logic_vector(31 downto 0);
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
	
	creat_input : process
	begin
	    SR <= '1';
		wait for 100 ns;
		SR <= '0';
		wait for 300 ns;
	end process creat_input;

    shifter : component BT8 
                generic map (N => 32)
                port map(
				        SR     => SR  ,  
						reset  => reset,          				
                        clk    => clk   ,
                        enable => enable,
                        Dout   => Dout  );
end test;						