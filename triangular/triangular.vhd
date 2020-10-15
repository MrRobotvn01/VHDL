library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity triangular is
port (clk : in std_logic; 
      wave_out : out std_logic_vector(7 downto 0);
      reset :in std_logic
     );
end triangular;

architecture Behavioral of triangular is

signal count,count2 : integer := 0;
signal direction : std_logic := '0';

begin

process(clk,reset)
begin
if(reset = '1') then
    count <= 0;
    count2 <= 129;
elsif(rising_edge(clk)) then
    --"direction" signal determines the direction of counting - up or down
    if(count = 253) then
        count <= 0;
        if(direction = '0') then
            direction <= '1';
            count2 <= 126;
        else
            direction <= '0';
            count2 <= 129;
        end if; 
    else
        count <= count + 1;
    end if;
    if(direction = '0') then
        if(count2 = 255) then
            count2 <= 0;
        else
            count2 <= count2 + 1; --up counts from 129 to 255 and then 0 to 127
        end if;
    else
        if(count2 = 255) then
            count2 <= 0;
        else
            count2 <= count2 - 1; --down counts from 126 to 0 and then 255 to 128
        end if;
    end if;
        
end if;
end process;

wave_out <= conv_std_logic_vector(count2,8);

end Behavioral;
