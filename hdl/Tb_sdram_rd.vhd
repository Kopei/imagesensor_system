-- Tb_sdram_rd.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity Tb_sdram_rd is
end entity;
     
architecture ARCH of  Tb_sdram_rd is
component SDram_rd is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_rdEN		:in		std_logic;
			SD_rdEN_noact:in	std_logic;
			SD_RdOK		:out	std_logic;
			rd_state	:out	std_logic_vector(2 downto 0)
		);
end component;

signal  Sysclk	:	std_logic;
signal	rst_n	:	std_logic;
signal	sd_rden:	std_logic;
signal	rd_state:	std_logic_vector(2 downto 0);
signal  sd_rdok :	std_logic;
signal	SD_rdEN_noact : std_logic;
begin
uut: 	sdram_rd port map
		(
		Sysclk => Sysclk, rst_n => rst_n, sd_rden => sd_rden, rd_state => rd_state,sd_rdok => sd_rdok,SD_rdEN_noact => SD_rdEN_noact
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

process
	begin
		SD_rdEN_noact <= '0';
		Sd_rdEn <= '0';
		wait for 1 us;
		Sd_rdEn <= '1';
		wait for 300 ns;
		Sd_rdEn <= '0';
		SD_rdEN_noact <= '1';
end process;
		
		
end arch;		