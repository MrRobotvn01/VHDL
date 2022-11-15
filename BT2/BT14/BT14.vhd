library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-------------------------------
entity BT14 is  
port(
    A  : in  std_logic_vector(7 downto 0);
	B  : out unsigned(2 downto 0)
	);
end BT14;
architecture Behavioral of BT14 is
begin
    process(A)
	variable i   : INTEGER;
	variable dem : unsigned(2 downto 0) := "000";
	begin
	    i := 0;
	    while A(i) = '0' loop
		    dem := dem + 1;
			i := i+1;
		end loop;
		B <= dem;
    end process;		
end Behavioral;	
	    
    
