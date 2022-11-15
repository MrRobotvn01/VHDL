library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------
entity BT19 is
port(
    sh_in  : in  std_logic_vector(7 downto 0);
	sh_val : in  std_logic_vector(2 downto 0);
	sh_out : out std_logic_vector(7 downto 0)
	);
end BT19;
architecture Behavioral of BT19 is
signal sh_in4 : std_logic_vector(7 downto 0);
signal sh_in2 : std_logic_vector(7 downto 0);
begin
    with sh_val(2) select
	    sh_in4 <= sh_in(3 downto 0)&sh_in(7 downto 4) when '1',
		          sh_in when others;
	with sh_val(1) select 
        sh_in2 <= sh_in4(1 downto 0)&sh_in4(7 downto 2) when '1',
		          sh_in4 when others;
    with sh_val(0) select
        sh_out <= sh_in2(0)&sh_in2(7 downto 1) when '1',
		          sh_in2 when others;
end Behavioral;	