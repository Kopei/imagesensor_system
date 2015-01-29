-- TB_Sdram_ini.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_Sdram_ini is
end entity;
     
architecture ARCH of  TB_Sdram_ini is
component Sdram_ini is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_iniEN	:in		std_logic;
			--Sd_iniOK	:out	std_logic;
            ini_state	:out	std_logic_vector(2 downto 0)
		);
end component;

signal  Sysclk	:	std_logic;
signal	rst_n	:	std_logic;
signal	SD_iniEN:	std_logic;
signal	ini_state:	std_logic_vector(2 downto 0);

begin
uut: 	Sdram_ini port map
		(
		Sysclk => Sysclk, rst_n => rst_n, SD_iniEN => SD_iniEN, ini_state => ini_state)
		;
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
		SD_iniEN <= '0';
		wait for 200 us;
		SD_iniEN <= '1';
		wait for 6000 ns;
		SD_iniEN <= '0';
		wait;
end process;
		
		
end arch;		
		
		
		
