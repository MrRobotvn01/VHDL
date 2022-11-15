--
Library ieee;
	use ieee.std_logic_1164.all;
------------------------------------------------
Entity rx_uart is
	port(
		clk              : in std_logic;--xung clock 
		rst              : in std_logic;--reset input
		rx_en            : in std_logic;--enable input
		rx               : in std_logic;
		donerx  		 : out std_logic;-- bao nhan xong
		dout             : out std_logic_vector(7 downto 0));--byte nhan
end rx_uart;
--------------------------------------------------
Architecture bhv of rx_uart is
	type state_type is (idle,start_rx,shift_rx,stop_rx);
	signal rxfsm               : state_type;
	signal rxbitcnt,div_cnt    : integer;
	signal srx                 : std_logic;
	signal rx_reg              : std_logic_vector(7 downto 0);
begin
	rx_fsm: process (rst,clk,rx_en)
	begin
		if rst='1' then
			rx_reg <= (others => '0');
			rxbitcnt <= 0;
			div_cnt <= 0;
			rxfsm <= idle;
		elsif rx_en = '1' then
			if rising_edge(clk) then
				srx <= rx;
				case rxfsm is
					when idle     =>
					    donerx<='0';
						div_cnt <= 1;
						if rx = '0' and srx = '1' then
							rxfsm <= start_rx;
						end if;
					when start_rx  =>
						if div_cnt = 8 then
							if rx = '0' then
								rxbitcnt <= 0;
								div_cnt <= 1;
								rxfsm <= shift_rx;
								rx_reg <= (others => '0');
							else
								rxfsm <= idle;
							end if;
						else
							div_cnt <= div_cnt + 1;
						end if;
					when shift_rx =>
						if div_cnt = 16 then
							div_cnt <= 1;
							if rxbitcnt < 8 then
								rx_reg(rxbitcnt) <= rx; 
							elsif rxbitcnt = 8 then
								rxfsm <= stop_rx;	
								donerx<='1';
							end if;
							rxbitcnt <= rxbitcnt + 1;
						else
							div_cnt <= div_cnt + 1;
						end if;
					when stop_rx  =>								  							  
						rxfsm <= idle;
					when others   =>
						rxfsm <= idle;
				end case;
			end if;
		end if;
	end process rx_fsm;
	dout <= rx_reg;
end bhv;