library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------
entity BT5test is
end BT5test;
------------------------------
architecture test of BT5test is
component BT5 is
port(
    D     : in  std_logic;
	clk   : in  std_logic;
	set   : in  std_logic;
	clr   : in  std_logic;
	Q     : out std_logic;
	Qn    : out std_logic
	);
end component;
signal D     : std_logic := '0';
signal clk   : std_logic := '0';
signal set   : std_logic := '0';
signal clr   : std_logic := '0';
signal Q     : std_logic;
signal Qn    : std_logic;
begin
    creat_input : process
	begin
	    wait for 100 ns;
		D <= '1';
		wait for 500 ns;
	end process creat_input;
    
	creat_clock : process
	begin
	    wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end process creat_clock;

    creat_data : process
    begin
	    wait for 100 ns;
        set <= '0';
        clr <= '1';
        wait for 100 ns;
        set <= '1';
        clr <= '0';
        wait;
    end process creat_data;

    FF : component BT5
            port map(D   => D , 
    	             clk => clk,
                     set => set,
                     clr => clr,
                     Q   => Q  ,
                     Qn  => Qn 
					 );
end test;
					 