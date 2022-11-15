--Thiet ke khoi bien doi tu ma nhi phan sang thermometer--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 	
----------------------------------
entity BT18 is
port(
    A     :   in  std_logic_vector(2 downto 0);
	CH    :   out std_logic_vector(7 downto 0)
	 );
end BT18;
---------------------------------
architecture Behavioral of BT18 is
begin
    CH(7) <= '0';
	CH(6) <= A(2) and A(1) and A(0);
	CH(5) <= A(2) and A(1);
	CH(4) <= A(2) and (A(1) or A(0));
	CH(3) <= A(2);
	CH(2) <= A(2) or (A(1)and A(0));
	CH(1) <= A(2) or A(1);
	CH(0) <= A(2) or A(1) or A(0);
end Behavioral;	  
       	  