--BAI 2 THIET KE IC 74138
--KHAI BAO THU VIEN 
library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
------------------------
entity IC74138 is
port(
	X: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	E: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end entity IC74138;
----------------------
architecture bhv of IC74138 is

begin
	flow_in:process(X,E)
	begin
		if E(0) = '1' and E(2 downto 1) = "00" then
			case X is
				when "000" => Y <= "11111110";
				when "001" => Y <= "11111101";
				when "010" => Y <= "11011011";
				when "011" => Y <= "11110111";
				when "100" => Y <= "11101111";
				when "101" => Y <= "11011111";
				when "110" => Y <= "10111111";
				when "111" => Y <= "01111111";
				when others => Y <= "11111111";
			end case;
		else
			Y <= "11111111";
		end if;
	end process flow_in;
end architecture bhv;
				
			

			