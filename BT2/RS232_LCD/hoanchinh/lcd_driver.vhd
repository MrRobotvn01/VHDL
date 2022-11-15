-----------------------------------------------------------------------------
-- Company: BMKTVXL
-- Engineer: Trinh Quang Kien
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
Library XilinxCoreLib;

entity lcd_driver is
port (
      clk1Mhz  : in std_logic;
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
end lcd_driver;

architecture Behavioral of lcd_driver is
signal cnt           : std_logic_vector(5 downto 0);
signal cnt_reset     : std_logic;
signal cnt_enable     : std_logic;
signal lcd_state     : std_logic;

signal cnt_cmd_enable     : std_logic;

signal  rd_en    :  std_logic; -- Read enable
signal  data_out : std_logic_vector (9 downto 0); -- Data Output
signal  lcd_code : std_logic_vector (9 downto 0); -- Data Output
signal  empty    : std_logic; -- FIFO empty

constant LCD_IDLE         : std_logic := '0';
constant lcd_SEND_DATA    : std_logic := '1';


signal data_in1, data_in2 : std_logic_vector(9 downto 0);
signal wr_en1, wr_en2     : std_logic;
signal cnt_cmd      : std_logic_vector (17 downto 0):= "000000000000000000";



------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component fifo_16x10
	port (
	clk: IN std_logic;
	rst: IN std_logic;
	din: IN std_logic_VECTOR(9 downto 0);
	wr_en: IN std_logic;
	rd_en: IN std_logic;
	dout: OUT std_logic_VECTOR(9 downto 0);
	full: OUT std_logic;
	empty: OUT std_logic);
end component;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

begin  
    ff : fifo_16x10
    port map (
              clk => clk1Mhz,
              rst => reset,
              din => data_in2,
              wr_en => wr_en2,
              rd_en => rd_en,
              dout => data_out,
              full => full,
              empty => empty);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
    counter:
    process (clk1Mhz, cnt_reset, cnt_enable)
    begin
        if cnt_reset = '1' then
            cnt <= (others => '0');
        elsif rising_edge(clk1Mhz) then 
            if cnt_enable = '1' then
                cnt <= cnt +1;
            end if; 
        end if ;
    end process counter;
 
    process (clk1Mhz, reset, lcd_state, cnt)
    begin
        if reset = '1' then
            lcd_state <= lcd_idle;
            cnt_enable <= '0';
        elsif rising_edge(clk1Mhz) then
        case lcd_state is
        when lcd_idle => 
            cnt_reset <= '0';
            lcd_code <= "01" & x"00";
            if empty = '0' then -- existing query data in fifo
                cnt_reset <= '1';
                cnt_enable <= '1';
                lcd_state <= lcd_SEND_DATA;
                lcd_e <= '0';
                rd_en <= '1';
            end if;
       when lcd_SEND_DATA => 
           cnt_reset <= '0';
           lcd_code <= data_out;
           lcd_e <= cnt(5) xor cnt(4) ;
           rd_en <= '0';
           if cnt(5 downto 4) = "11" then
               cnt_reset <= '1';
               cnt_enable <= '0';
               lcd_e  <= '0';
               lcd_state <= lcd_idle;
           end if;
      when others =>
           lcd_state <= lcd_idle;
      end case;
 end if;
 end process;

lcd_data <= lcd_code(7 downto 0);
lcd_rs   <= lcd_code(9);
lcd_rw   <= lcd_code(8);

counter_cmd:
    process (clk1Mhz, reset, cnt_cmd_enable)
    begin
       if reset = '1' then
           cnt_cmd <= (others => '0');
           elsif rising_edge(clk1Mhz) then 
           if cnt_cmd_enable = '1' then
               cnt_cmd <= cnt_cmd +1;
           end if; 
	 end if ;
    end process counter_cmd;
	 
    process (cnt_cmd)
    begin
    case cnt_cmd(16 downto 0) is
       when "10000000000000001" => data_in1 <= "00"& x"38"; wr_en1 <= '1'; 
          -- 8bit 2line mode/display on
       when "10000000000000010" => data_in1 <= "00"& x"38";	wr_en1 <= '1';
          -- 8bit 2line mode/display on	  
       when "10000000000000011" => data_in1 <= "00"& x"38";	wr_en1 <= '1';
          -- 8bit 2line mode/display on/off
          -- delay minimum 39us
       when "10000000001000000" => data_in1 <= "00"& x"0c"; wr_en1 <= '1';
          -- display on	
          -- delay minimum 39us
       when "10000000010000000" => data_in1 <= "00"& x"01"; wr_en1 <= '1';
          -- clear display
          -- delay minimum 1530us
       when "10000100000000000" => data_in1 <= "00"& x"06"; wr_en1 <= '1'; 
          -- entry mode set incrementer/shiff off
          -- delay  1000us --
       when "10001000000000001" => data_in1 <= "10"& x"31"; wr_en1 <= '1'; --1
          -- write charater "1" for testing only;
		 when "10001010000000001" => data_in1 <= "10"& x"42"; wr_en1 <= '1'; --B
		 when "10001100000000001" => data_in1 <= "10"& x"4d"; wr_en1 <= '1'; --M
		 when "10001110000000001" => data_in1 <= "10"& x"a0"; wr_en1 <= '1'; --Space 
		 when "10010000000000001" => data_in1 <= "10"& x"4b"; wr_en1 <= '1'; --K
		 when "10010010000000001" => data_in1 <= "10"& x"54"; wr_en1 <= '1'; --T
		 when "10010100000000001" => data_in1 <= "10"& x"56"; wr_en1 <= '1'; --V
		 when "10010110000000001" => data_in1 <= "10"& x"58"; wr_en1 <= '1'; --X
		 when "10011000000000001" => data_in1 <= "10"& x"4c"; wr_en1 <= '1'; --L
		 when "10011100000000001" => data_in1 <= "10"& x"a0"; wr_en1 <= '1'; --Space
		 when "10100000000000001" => data_in1 <= "10"& x"48"; wr_en1 <= '1'; --H
		 when "10100010000000001" => data_in1 <= "10"& x"56"; wr_en1 <= '1'; --V 
		 when "10100100000000001" => data_in1 <= "10"& x"4b"; wr_en1 <= '1'; --K
		 when "10100110000000001" => data_in1 <= "10"& x"54"; wr_en1 <= '1'; --T
		 when "10101000000000001" => data_in1 <= "10"& x"51"; wr_en1 <= '1'; --Q
		 when "10101010000000001" => data_in1 <= "10"& x"53"; wr_en1 <= '1'; --S
		 when "10111010000011100" => data_in1 <= "00"& x"00"; wr_en1 <= '1'; 
          -- do nothing finished initialization process
      when  others    => data_in1 <= "00"& x"00"; wr_en1 <= '0';
    end case;

    if cnt_cmd(17)  = '1' then
        cnt_cmd_enable <= '0';
    else 
        cnt_cmd_enable <= '1';
    end if;
    end process;

    -- finished initialation process, set ready for new data
    ready <= not cnt_cmd_enable;
    --when ready, the fifo receives data from higer module
    --when not ready, the fifo receives data from this module for initizalation process
    process (data_in, data_in1, wr_en, wr_en1, cnt_cmd_enable)
    begin
    if cnt_cmd_enable = '0' then
         data_in2 <= data_in;
         wr_en2   <= wr_en;
    else
         data_in2 <= data_in1;
         wr_en2   <= wr_en1;
    end if;
    end process;

end Behavioral;
