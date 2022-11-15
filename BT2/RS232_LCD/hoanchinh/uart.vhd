
-------------------------------------------
Library ieee;
	use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
	use IEEE.STD_LOGIC_ARITH.all;
-------------------------------------------------	
Entity UART is
	port (
		reg 		: out std_logic_vector(7 downto 0);
		Rx			: in std_logic;
		Tx  		: out std_logic;
		clk    		: in std_logic;
		Reset  		: in std_logic;
		En			: in std_logic	
		);
end entity;
--------------------------------------------
Architecture atk of UART is
	signal s8bit       : std_logic_vector(7 downto 0);
	signal clk16       : std_logic;
	signal nreset      : std_logic;
	signal entx        :std_logic:='0';
	signal donetx      :std_logic:='0';
	signal donetx1     :std_logic:='0';
	signal donerx      :std_logic:='0';
	signal cnt         :integer:=0;
	signal cnt1        :integer:=0;
--------------------------------------
	component clk_div is
		generic(baud	:std_logic_vector(7 downto 0):="01000001");
		port (	clk		:in std_logic;
			clk16	:out std_logic
			);
	end component;
	component Tx_uart is
	port(
		clk     : in std_logic;--xung clock
		rst     : in std_logic;--reset
		tx_en   : in std_logic;--chophep
		tx      : out std_logic;-- dau ra
		donetx  : out std_logic;-- truyen xong
		din     : in std_logic_vector(7 downto  0));--byte truyen
	end component;
	component Rx_uart is
	port(
		clk              : in std_logic;--xung clock 
		rst              : in std_logic;--reset input
		rx_en            : in std_logic;--enable input
		rx               : in std_logic;
		donerx           : out std_logic;--nhan xong
		dout             : out std_logic_vector(7 downto 0));--byte nhan
	end component;
begin
	cTX_uart : Tx_uart port map(clk16,nreset,entx,tx,donetx,s8bit);
	cRx_uart : Rx_uart port map(clk16,nreset,en,rx,donerx,s8bit);
	
	U6 :component clk_div
		generic map(x"02")
		port map(clk,clk16);	
nreset<=(not reset) or donetx1;
	c:process(clk16,donerx)
		begin
			if rising_edge(clk16) then
				if donerx='1' or cnt>0 then
					cnt<=cnt+1;
					if cnt<195 then
						entx<='1';
					else  cnt<=0;
						entx<='0';
					end if;
				end if;
			end if;
	end process;
	d:  process(clk16,donetx)
		begin
			if rising_edge(clk16) then
				if donetx='1' or cnt1>0 then
					cnt1<=cnt1+1;
					if cnt1<10 then
						donetx1<='1';
					else 
						donetx1<='0';
						cnt1<=0;
					end if;
				end if;
			end if;
	end process;
	q:process(reset,clk16,donerx)
		begin
			if reset='0' then
				reg<=(others=>'0');
			elsif rising_edge(clk16) then
					if donerx='1' then
						reg <= s8bit;
					end if;
			end if;
	end process;
end atk;