
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
library proasic3;
use proasic3.all;
 
ENTITY TB_top_uart IS
END TB_top_uart;

ARCHITECTURE behavioral OF TB_top_uart IS 
component Top_uart is

    port( RX       : in    std_logic;
          RESET_N  : in    std_logic;
          CLK      : in    std_logic;
          TX       : out   std_logic;
          ParaLoad : in    std_logic;
          Rdy1     : out   std_logic;
          Rdy2     : out   std_logic;
          P_CLkA   : out   std_logic;
          P_DataA  : out   std_logic_vector(7 downto 0);
          P_AddrA  : out   std_logic_vector(2 downto 0);
          P_WEA    : out   std_logic
        );

end component;

signal		RX       :    std_logic;
signal		RESET_N  :    std_logic;
signal		CLK      :    std_logic;
signal		TX       :    std_logic;
signal		ParaLoad :    std_logic;
signal		Rdy1     :    std_logic;
signal		Rdy2     :    std_logic;
signal		P_CLkA   :    std_logic;
signal		P_DataA  :    std_logic_vector(7 downto 0);
signal		P_AddrA  :    std_logic_vector(2 downto 0);
signal		P_WEA    :    std_logic;

begin
U1: top_uart port map
		(
			tx => tx,
			rx => rx,
			CLK => CLK,
			P_WEA => P_WEA,
			P_AddrA => P_AddrA,
			P_DataA => P_DataA,
			RESET_N => RESET_N,
			ParaLoad => ParaLoad,
			Rdy1 => Rdy1,
			Rdy2 => Rdy2,
			P_CLkA => P_CLkA
		);
process
begin
	clk <= '0';
	wait for  15.15 ns /2;
	clk <= '1';
	wait for 15.15 ns /2;
end process;	

   process
   begin
		RESET_N <= '0';
		wait for 0.6 us;
		RESET_N <= '1';
		wait;
   end process;

process
begin
	rx <= '1';
	wait for 1 us;
	rx <= '0';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68 us;
	rx <= '1';
	wait for 8.68*6 us;
	rx <= '0';
	wait for 8.68 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68*7 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68 us;
	rx <= '1';
	wait for 8.68*2 us;
	rx <= '0';
	wait for 8.68*6 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68*9 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68*8 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68*8 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68*2 us;
	rx <= '1';
	wait for 8.68 us;
	rx <= '0';
	wait for 8.68*6 us;
	rx <= '1';
	wait for 10 ms;
end process;

end behavioral;	