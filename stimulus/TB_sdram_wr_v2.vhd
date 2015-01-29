-- TB_sdram_wr_v2.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_sdram_wr_v2 is
end entity;
     
architecture ARCH of  TB_sdram_wr_v2 is
component sdram_wr_v2 is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_wrEn		:in		std_logic;
			SD_wrOk		:out	std_logic;
			Wr_state	:out	std_logic_vector(2 downto 0)
		);
end component;

signal  Sysclk	:	std_logic;
signal	rst_n	:	std_logic;
signal	SD_wrEn:	std_logic;
signal	Wr_state:	std_logic_vector(2 downto 0);
signal  SD_wrOk :	std_logic;
begin
uut: 	sdram_wr_v2 port map
		(
		Sysclk => Sysclk, rst_n => rst_n, SD_wrEn => SD_wrEn, Wr_state => Wr_state,SD_wrOk => SD_wrOk
		);
process
	begin
		Sysclk <= '0';
		wait for  15.15 ns /2;
		Sysclk <= '1';
		wait for 15.15 ns /2;
   end process;		
   
process
   begin
		rst_n <= '0';
		wait for 0.6 us;
		rst_n <= '1';
		wait;
end process;		

process(SD_wrOk)
	begin
	
	
		SD_wrEn <= '1';
		case SD_wrOk is 
		when '1' => SD_wrEn <= '0' after 15 ns;
		when '0' => SD_wrEn <= '1' after 2 us;
		when others => SD_wrEn <= '0';
		end case;
end process;
		
		
end arch;		