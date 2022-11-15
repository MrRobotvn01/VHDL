Library ieee;
	use ieee.std_logic_1164.all;
------------------------------------------------
Entity tx_uart is
	port(
		clk     : in std_logic;--xung clock
		rst     : in std_logic;--reset
		tx_en   : in std_logic;--cho phep
		tx      : out std_logic;-- dau ra
		donetx  : out std_logic;--truyen xong 
		din     : in std_logic_vector(7 downto  0));--byte truyen
end tx_uart;
--------------------------------------------------
Architecture bhv of tx_uart is
	type state_type is (idle,load_tx,shift_tx,stop_tx);
	signal txfsm      : state_type;
	signal regdin     : std_logic_vector(7 downto 0);
	signal txbitcnt   : integer;
	signal cnt_div    : integer;
	signal tx_reg     : std_logic_vector(12 downto 0);
	
begin
	tx <= tx_reg(0);
	
	tx_fsm: process(rst,clk,tx_en,din)
	begin
		if rst = '1' then
			tx_reg <= (others=>'1');
			txbitcnt <= 0;
			cnt_div <= 0;
			txfsm <= idle;
			regdin <= (others=>'0');
			donetx<='0';
		elsif tx_en = '1'  then
		    if rising_edge(clk) then
				case txfsm is
					when idle  =>
					   donetx<='0';
						regdin <= din;
						txfsm <= load_tx;
					when load_tx  =>
						txfsm <= shift_tx;
						txbitcnt <= 12;
						cnt_div <= 0;
						tx_reg <= "1111" & regdin & '0';
					when shift_tx =>
						if cnt_div = 15 then
							txbitcnt <= txbitcnt - 1;
							tx_reg <= '1' & tx_reg(tx_reg'high downto 1);
							cnt_div <= 0;
							if txbitcnt=1 then
							tx_reg <= '1' & tx_reg(tx_reg'high downto 1);
							txfsm <= stop_tx;
							donetx<='1';
							end if;
						else
							cnt_div <= cnt_div +1;
						end if;	
					when stop_tx  =>
						txfsm<=idle;
					when others   =>
						txfsm <= idle;
			end case;
			end if;
		end if;
	end process tx_fsm;
end bhv;