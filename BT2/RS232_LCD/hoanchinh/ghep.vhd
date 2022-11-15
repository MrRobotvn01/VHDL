library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library UNISIM;
use UNISIM.VComponents.all;
Library XilinxCoreLib;
Entity hethong is
	port (
		reg 			: out std_logic_vector(7 downto 0);
		Rx				: in std_logic;
		Tx  			: out std_logic;
		clk    		: in std_logic;
		Reset  		: in std_logic;
		En				: in std_logic;
		wchar       : in std_logic;
		lcd_rs   	: out   std_logic;
		lcd_rw   	: out   std_logic;
		lcd_e    	: out   std_logic;
		lcd_data 	: inout std_logic_vector(7 downto 0)
		);
end entity;
architecture at of hethong is
component lcd_driver is
port (
      clk1Mhz  : in  std_logic;
      reset    : in  std_logic;
      lcd_rs   : out std_logic;
      lcd_rw   : out std_logic;
      lcd_e    : out std_logic;
      data_in  : in  std_logic_vector (9 downto 0); -- Data input
      wr_en    : in  std_logic; -- Write Enable FIFO
      full     : out std_logic; -- FIFO full
      ready    : out std_logic; -- LCD ready
      lcd_data : out std_logic_vector (7 downto 0)
      );
end component;
component clk_div is
		generic(baud		:std_logic_vector(7 downto 0):="01000001");
		port (	clk		:in std_logic;
			clk16				:out std_logic
			);
end component;
component UART is
	port (
		reg 			: out std_logic_vector(7 downto 0);
		Rx				: in std_logic;
		Tx  			: out std_logic;
		clk    		: in std_logic;
		Reset  		: in std_logic;
		En				: in std_logic	
		);
end component ;
signal nreset    : std_logic;
signal clk1Mhz   : std_logic;
signal ready     : std_logic;         
signal data_in   : std_logic_vector (9 downto 0); -- Data input
signal wr_en     : std_logic;                     -- Write Enable
signal full      : std_logic;                     -- FIFO full

signal wchar_reg : std_logic;
signal wchar_sig : std_logic;
signal counter20 : std_logic_vector (19 downto 0);
signal second    : std_logic_vector (3 downto 0);
signal lcd_char  : std_logic_vector (7 downto 0);
signal we_sig    : std_logic; 
signal we_sig1   : std_logic;	
signal lcd_char1  : std_logic_vector (7 downto 0);
signal reg1  		: std_logic_vector (7 downto 0);
---------------------------------------
begin
u: component uart
   port map (reg1,rx,tx,clk,reset,en);
cd : component clk_div
    generic map ("00011000")  -- 48Mhz/24/2 = 1Mhz
     port map (clk, clk1Mhz);
     
lcd_x : component lcd_driver 
       port map (clk1Mhz, nreset, lcd_rs, lcd_rw, lcd_e, data_in, wr_en, full, ready, lcd_data=> lcd_data);

     
    nreset <= not reset;
     
    buttin:
    process (clk1Mhz, en)
    begin
         
         if rising_edge(clk1Mhz) then 
              wchar_reg <= wchar;
                counter20 <= counter20 + 1;
                if (counter20 = x"fffff") then
                   we_sig   <= '1';
                   if second = x"9" then
                        second <= x"0";
                    else
                        second <= second + 1;
                    end if;
                else 
                   we_sig   <= '0';
                    second <= second; 
                end if;
                we_sig1 <= we_sig; 
                -- tin hieu we_sig1 tre so voi we 1 xung nhip de thuc hien 2 lenh tren LCD
         end if;
    end process buttin;
     
     wr_en <= (we_sig1 or we_sig or wchar_sig)  and ready and (not full);
     
     wchar_sig <= (not wchar) and wchar_reg;    
     
     process (we_sig1, we_sig, lcd_char)
         begin
         if we_sig = '1' then 
              data_in <= "00" & x"c0"; -- dua con tro ve dau dong 2
         elsif we_sig1 = '1' then 
              data_in <= "10" & lcd_char;
         else 
              data_in <= "01" & x"ff";
         end if;
     end process;
	lcd_char1<=reg1;
     convert_to_lcd_char: process (second,lcd_char1)
     begin
     case (second) is
        when x"0"  =>  lcd_char <= lcd_char1;
        when x"1"  =>  lcd_char <= lcd_char1;
        when x"2"  =>  lcd_char <= lcd_char1;
        when x"3"  =>  lcd_char <= lcd_char1;
        when x"4"  =>  lcd_char <= lcd_char1;
        when x"5"  =>  lcd_char <= lcd_char1;
        when x"6"  =>  lcd_char <= lcd_char1;
        when x"7"  =>  lcd_char <= lcd_char1;
        when x"8"  =>  lcd_char <= lcd_char1;
        when x"9"  =>  lcd_char <= lcd_char1;
        when others => lcd_char <= lcd_char1;
     end case;
     end process convert_to_lcd_char;   
reg<=lcd_char1;
end at;


