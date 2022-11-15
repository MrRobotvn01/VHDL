library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
---------------------------
entity flip_flopD is
port(
	D: in std_logic;
	CLK: in std_logic;
	SET: in std_logic;
	CLR: in std_logic;
	Q: out std_logic;
	Qnot: out std_logic
	);
end entity flip_flopD;
architecture bhv of flip_flopD is
signal Q_temp: std_logic;
begin
	Q <= Q_temp;
	Qnot <= not Q_temp;
	process(D,CLK,SET,CLR)
	begin
		if CLR = '1' then 
			Q_temp <= '0';
		elsif SET = '1' then
			Q_temp <= '1';
		elsif CLK = '1' and CLK'event then
			Q_temp <= D;
		end if;
	end process;
end architecture bhv;