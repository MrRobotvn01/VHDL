library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------
entity PEncoder is
port(
	i_vector: IN STD_LOGIC_VECTOR( 7 downto 0); --8 bit
	Pos_bit: OUT STD_LOGIC_VECTOR( 2 downto 0);
	Found_bit: OUT STD_LOGIC;
	);
end entity PEncoder;
architecture bhv of PEncoder is
begin
	process(i_vector)
		variable i: integer:= 0;
		variable dem: std_logic_vector(2 downto 0):="000";
		variable p_temp: std_logic :='0';
	for i in 0 to 7 loop
		if i_vector(i) = '1' then
			p_temp <= '1';
			dem <= std_logic_vector(to_unsigned(i,3));
		end if;
	end loop;
	Pos_bit <= dem;
	Found_bit <= p_temp;
	end process;
end architecture bhv;