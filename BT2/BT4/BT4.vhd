library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------
entity BT4 is
port(
    A           : in  std_logic_vector(3 downto 0);
	B           : in  std_logic_vector(3 downto 0);
	Gin         : in  std_logic;
	AlargerB1   : in  std_logic;
	AsmallerB1  : in  std_logic;
	AequalB1    : in  std_logic;
	AlargerB4   : out std_logic;
	AsmallerB4  : out std_logic;
	AequalB4    : out std_logic
	);
end BT4;
architecture Behavioral of BT4 is
component compare is
port(
    A         : in  std_logic;
	B         : in  std_logic;
	G         : in  std_logic;
	AlargerB  : out std_logic;
	AsmallerB : out std_logic;
	AequalB   : out std_logic
	);
end component;
signal AlargerB,AsmallerB,AequalB : std_logic_vector(3 downto 0);
begin
    c1 : component compare
	        port map(
			        A => A(3),B => B(3), G => Gin, AlargerB => AlargerB(3),AsmallerB => AsmallerB(3),AequalB => AequalB(3)
					);
	c2 : component compare
            port map(
			        A => A(2),B => B(2), G => AequalB(3), AlargerB => AlargerB(2),AsmallerB => AsmallerB(2),AequalB => AequalB(2)
					);
    c3 : component compare
            port map(
			        A => A(1),B => B(1), G => AequalB(2), AlargerB => AlargerB(1),AsmallerB => AsmallerB(1),AequalB => AequalB(1)
					);	
	c4 : component compare
            port map(
			        A => A(0),B => B(0), G => AequalB(1), AlargerB => AlargerB(0),AsmallerB => AsmallerB(0),AequalB => AequalB(0)
					);	
	--------------------------------------
	process(AlargerB(0),AlargerB1,AsmallerB1,AequalB1,AlargerB,AsmallerB,AequalB)
	begin
	    if(AequalB(0) = '0') then
		    AlargerB4  <= AlargerB(3) or AlargerB(2) or AlargerB(1) or AlargerB(0) ;
	        AsmallerB4 <= AsmallerB(3) or AsmallerB(2) or AsmallerB(1) or AsmallerB(0);
            AequalB4   <= AequalB(0);	
	    else
		    if(AlargerB1 = '1') then
			   AlargerB4  <= '1';
			   AsmallerB4 <= '0';
			   AequalB4   <= '0'; 
            elsif(AsmallerB1 = '1') then
                AsmallerB4 <= '1';
				AlargerB4  <= '0';
				AequalB4   <= '0';
            elsif(AequalB1 = '1') then
                AequalB4  <= '1';
				AlargerB4 <= '0';
                AsmallerB4 <= '0';				
            end if;
        end if;
    end process;		
end Behavioral;	