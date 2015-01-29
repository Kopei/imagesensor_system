-- TB_sdram_ref.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_sdram_ref is
end entity;
     
architecture ARCH of  TB_sdram_ref is
component SDRAM_Ref is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_refEN	:in		std_logic;
			SD_refOK	:out	std_logic;
			Ref_state	:out	std_logic_vector(2 downto 0)
		);
end component;

signal  Sysclk	:	std_logic;
signal	rst_n	:	std_logic;
signal	SD_refEN:	std_logic;
signal	Ref_state:	std_logic_vector(2 downto 0);
signal  SD_refOK :	std_logic;
begin
uut: 	SDRAM_Ref port map
		(
		Sysclk => Sysclk, rst_n => rst_n, SD_refEN => SD_refEN, Ref_state => Ref_state,SD_refOK => SD_refOK)
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
		SD_refEN <= '0';
		wait for 1 us;
		SD_refEN <= '1';
		wait for 30 ns;
		SD_refEN <= '0';	
		wait for 15 ns;
		SD_refEN <= '1';
		wait for 300 ns;
		SD_refEN <= '0';	
		
		-- case SD_refOK is 
		-- when '1' => SD_refEN <= '0' after 1 us;
		-- when '0' => SD_refEn <= '1' after 2 us;
		-- when others => SD_refEn <= '0';
		-- end case;
end process;
		
		
end arch;		