----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 23:53:27 09/10/2017
-- Design Name:
-- Module Name: triangular - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-----------------------------------------
entity triangular is
	port (	clk : in std_logic;
			reset :in std_logic;
			wave_out : out std_logic_vector(13 downto 0) -- max_value = 2^14 - 1 =11 1111 1111 1111 (b)
			--min_value = 0
	);
end triangular;
------------------------------------------
architecture Behavioral of triangular is
	signal count,count2 : integer := 0;
	--signal count_tmp=
	signal direction : std_logic := '0';
begin
process(clk,reset)
begin
if(reset = '1') then
	count <= 0;
	count2 <= 4096; --  wave_out = count2 = 01000000000000(b); 
elsif(rising_edge(clk)) then
--"direction" signal determines the direction of counting - up or down
	if(count = 8190) then -- 
		count <= 0;
		if(direction = '0') then
			direction <= '1';
			count2 <= 4095;
		else
			direction <= '0';
			count2 <= 4097;
		end if;
	else
		count <= count + 1638;
	end if;
	
	if(direction = '0') then
		if(count2 = 4095) then
			count2 <= 0;
		else
			count2 <= count2 + 1638; --up counts from 129 to 255 and then 0 to 127
		end if;
	else
		if(count2 = 4095) then
			count2 <= 0;
		else
			count2 <= count2 - 1638; --down counts from 126 to 0 and then 255 to 128
		end if;
	end if;
end if;
end process;
wave_out <= conv_std_logic_vector((count2),14);
end Behavioral;