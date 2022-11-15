library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------
entity BT4test is
end BT4test;
----------------------------------
architecture test of BT4test is
component BT4 is
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
end component;
--input--
signal  A           :  std_logic_vector(3 downto 0) := "1001";
signal	B           :  std_logic_vector(3 downto 0) := "1001";
signal  Gin         :  std_logic := '1';
signal	AlargerB1   :  std_logic                    := '0';                            --A>B--
signal	AsmallerB1  :  std_logic                    := '0';                            --A<B--
signal 	AequalB1    :  std_logic                    := '0';                            --A=B--
--output--
signal	AlargerB4  :  std_logic;
signal	AsmallerB4 :  std_logic;
signal	AequalB4   :  std_logic;
begin
    ss : component BT4
			port map(
			        A => A,
					B => B,
					Gin => Gin,
					AlargerB1  => AlargerB1,
					AequalB1   => AequalB1,
					AsmallerB1 => AsmallerB1,
					AlargerB4  => AlargerB4 ,
					AsmallerB4 => AsmallerB4,
					AequalB4   => AequalB4  
					);
end test;					
