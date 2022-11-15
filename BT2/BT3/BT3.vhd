library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
---------------------------------------
entity BT3 is
generic(sl : BOOLEAN );
port(
    A    :  in  std_logic_vector(3 downto 0);
	B    :  in  std_logic_vector(3 downto 0);
	Cin  :  in  std_logic;
    Cout :  out std_logic;	
	S    :  out std_logic_vector(3 downto 0)
	);
end BT3;
architecture Behavioral of BT3 is
signal Cin_temp : std_logic;
signal B_temp   : std_logic_vector(3 downto 0);
component adder4 is
port(
    A    : in  std_logic_vector(3 downto 0);
	B    : in  std_logic_vector(3 downto 0);
	Cin  : in  std_logic;
	Cout : out std_logic;
	S    : out std_logic_vector(3 downto 0)
	);	
end component;
begin
    B_T : if sl = TRUE generate 
	        Cin_temp <= Cin;
			B_temp   <= B;
	end generate;
    B_T1: if sl = FALSE generate
            Cin_temp <= '1';
            B_temp   <= not B;
    end generate;
    
    DUT : component adder4
            port map(
			        A => A,
					B => B_temp,
					Cin => Cin_temp,
					Cout => Cout,
					S    => S
					);	
end Behavioral;	