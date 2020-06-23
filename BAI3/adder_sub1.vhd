library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;
---------------------
entity adder_sub is
port(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	Cin: in std_logic;
	Sub: in std_logic;
	S: out std_logic_vector(3 downto 0);
	Cout: out std_logic
	);
end entity adder_sub;
------------------------
architecture bhv of adder_sub is
	signal A_temp: std_logic_vector(4 downto 0);
	signal B_temp: std_logic_vector(4 downto 0);
	signal S_temp: std_logic_vector(4 downto 0):=(others => '0');
begin
	
	flow_sub: process(A,B,Cin,Sub)
	begin 	
		A_temp <= '0'&A;
		B_temp <= '0'&B;
			if Sub = '0' then
				S_temp <= A_temp + B_temp + Cin;
				S <= S_temp(3 downto 0);
		        Cout <= S_temp(4);
			else--Sub = 1
				S_temp <= A_temp + not B_temp + 1;
				S <= S_temp(3 downto 0);
		        Cout <= S_temp(4);
			end if;		
		
		
	end process flow_sub;
end architecture bhv;