-- TB_LGLQD_440.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY TB_LGLQD_440 IS
END TB_LGLQD_440;
 
ARCHITECTURE behavior OF TB_LGLQD_440 IS 
component LGLQD_440 is port
	(
		Sysclk		:in		std_logic;
		Sysrst		:in		std_logic;
		CP			:out	std_logic
	);
end component;
signal sysclk	:   std_logic;
signal sysrst	:	std_logic;
signal	CP		:	std_logic;

begin
UUT: LGLQD_440 port map 
	(
		sysclk => sysclk,
		sysrst => sysrst,
		cp  =>  cp
	);
	
   process
   begin
		Sysclk <= '0';
		wait for 20 ns/2;
		Sysclk <= '1';
		wait for 20 ns/2;
   end process;
 
   --sysrst Gen
   process
   begin
		sysrst <= '1';
		wait for 0.1 us;
		sysrst <= '0';
		wait;
   end process;	
end behavior;