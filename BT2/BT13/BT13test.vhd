library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------
entity BT13test is
end BT13test;
--------------------------
architecture test of BT13test is
component BT13 is
port(
    clk_out  :  out std_logic;
    clk_in   :  in  std_logic;
	reset    :  in  std_logic
	);
end component;
--Khai bao cac tin hieu vao va ra --
signal clk_out :  std_logic;
signal clk_in  :  std_logic;
signal reset   :  std_logic;
begin 
    --creat clock--
    creat_clock : process
    begin
        clk_in <= '0';
        wait for 10 ns;
        clk_in <= '1';
        wait for 10 ns;
    end process creat_clock;
    --craet input data--
    creat_data : process 
    begin 
        reset <= '0';
        wait for 10 ns;
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 10000 ns;
        wait;
    end process creat_data;

    DUT_BT13 : BT13
            port map(
			        clk_out => clk_out,
			        clk_in  => clk_in,
					reset   => reset
					);
end architecture;					