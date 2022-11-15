library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------
entity BT6test is
end BT6test;
-----------------------------
architecture test of BT6test is
component BT6 is
port(
    J   : in  std_logic;
	K   : in  std_logic;
	clk : in  std_logic;
	clr : in  std_logic;
	set : in  std_logic;
	Q   : out std_logic;
	Qn  : out std_logic
	);
end component;
signal J   : std_logic;
signal K   : std_logic;
signal clk : std_logic;
signal clr : std_logic;
signal set : std_logic;
signal Q   : std_logic;
signal Qn  : std_logic;
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
        set <= '1';
        clr <= '0';
        wait for 50 ns;
        set <= '0';
        clr <= '1';
        wait for 50 ns;
        set <= '0';
        clr <= '0';
        wait;
    end process creat_data;
	
	creat_input : process 
	begin 
	    J <= '0';
		wait for 150 ns;
		K <= '1' ;
		wait for 100 ns;
		J <= '1';
        wait for 300 ns;
        K <= '0';
        wait for 250 ns;
    end process creat_input;		

    FF : component BT6 
            port map(
			        J    => J  ,  
					K  	 => K  ,
        	        clk  => clk,
                    clr  => clr,
                    set  => set,
                    Q    => Q  ,
                    Qn   => Qn );
end test;					