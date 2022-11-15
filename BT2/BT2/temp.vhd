library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--------------------------------
entity temp is 
port(
    A      : in  std_logic_vector(2 downto 0);--The input consists of only 3 element
	enable : in  std_logic_vector(2 downto 0);-- enable operation
	Y      : out std_logic_vector(7 downto 0)-- The output consists of only 8 element
	);
end temp;
--------------------------------
architecture dataflow of temp is
signal Y_temp   : std_logic_vector(7 downto 0);
signal enable_t : std_logic;
begin 
    enable_t <= not(enable(2)) and not(enable(1)) and enable(0);
    Y_temp(0) <=  not(A(2)) and not(A(1)) and not(A(0));
	Y_temp(1) <=  not(A(2)) and not(A(1)) and A(0);
    Y_temp(2) <=  not(A(2)) and A(2) and not(A(0));
	Y_temp(3) <=  not(A(2)) and A(1) and A(0);
	Y_temp(4) <=  A(2) and not(A(1)) and not(A(0));
	Y_temp(5) <=  A(2) and not(A(0)) and A(0);
	Y_temp(6) <=  A(2) and A(1) and not(A(0));
	Y_temp(7) <=  A(2) and A(1) and A(0);
	--------------------------------------------
	process(enable_t,Y_temp) begin
	for i in 0 to 7 loop 
	    Y(i) <= not(enable_t and Y_temp(i));
	end loop;	
	end process;
end dataflow;	