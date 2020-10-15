library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_triangular is
end tb_triangular;

architecture Behavioral of tb_triangular is

component triangular is
	port (	clk : in std_logic;
			reset :in std_logic;
			wave_out : out std_logic_vector(13 downto 0) -- max_value = 2^14 - 1 =11 1111 1111 1111 (b)
			--min_value = 0
	);
end component triangular;

signal clk,reset : std_logic := '0';
signal wave_out : std_logic_vector(13 downto 0);

begin

uut : triangular port map(Clk,reset,wave_out);

Clk <= not Clk after 5 ns;

process
begin
reset <= '1';
wait for 100 ns;
reset <= '0';
wait;
end process;

end Behavioral;
