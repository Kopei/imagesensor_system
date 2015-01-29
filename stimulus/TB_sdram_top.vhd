-- TB_sdram_top.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_sdram_top is
end entity;
     
architecture ARCH of  TB_sdram_top is
component Sdram_top is     
            port
			(
			sysclk		:in 	std_logic;
            Sysrst_n	:in 	std_logic;
			Sys_dataIn	:in		std_logic_vector(71 downto 0);
			Fifo_RAfull	:in		std_logic;
			Fifo_WAfull	:in		std_Logic;
			Sdram_en	:in		std_logic;
			LVDS_En		:in		std_logic;
			GLB			:in		std_logic;
			RX			:in		std_logic;
			TX			:out	std_logic;
			RFifo_we	:out	std_logic;
			WFifo_re	:out	std_logic;
            SD_clk		:out 	std_logic_vector(1 downto 0);
            DQ			:inout 	std_logic_vector(71 downto 0);
			Sys_dataOut	:out	std_logic_vector(71 downto 0);
            ras_n,cas_n,we_n:out std_logic;
            cke,cs_n	:out 	std_logic_vector(1 downto 0);
            dqm			:out 	std_logic_vector(7 downto 0);
            addr		:out 	std_logic_vector(12 downto 0);
            ba 			:out 	std_logic_vector(1 downto 0)
			);
end component;

signal  sysclk		:		std_logic;
signal	Sysrst_n	:		std_logic;
signal	Sys_dataIn	:		std_logic_vector(71 downto 0);
signal	Fifo_RAfull	:		std_logic;
signal	Fifo_WAfull	:		std_Logic;
signal	Sdram_en	:		std_logic;
signal	RFifo_we,RX,TX	:		std_logic;
signal	WFifo_re	:		std_logic;
signal  SD_clk		: 		std_logic_vector(1 downto 0);
signal  DQ			: 		std_logic_vector(71 downto 0);
signal	Sys_dataOut	:		std_logic_vector(71 downto 0);
signal  ras_n,cas_n,we_n: 	std_logic;
signal  cke,cs_n	: 		std_logic_vector(1 downto 0);
signal  dqm			: 		std_logic_vector(7 downto 0);
signal  addr		: 		std_logic_vector(12 downto 0);
signal  ba 			: 		std_logic_vector(1 downto 0);
signal  glb,lvds_en			:		std_logic;
begin
uut: 	SDRAM_top port map
		(
		sysclk => sysclk, sysrst_n  => sysrst_n,glb => glb,lvds_en => lvds_en,Sys_dataIn => Sys_dataIn, Fifo_RAfull => Fifo_RAfull,Fifo_WAfull => Fifo_WAfull,RX => RX,TX => TX,
		Sdram_en => Sdram_en, RFifo_we => RFifo_we, WFifo_re => WFifo_re, SD_clk => SD_clk, DQ => DQ, Sys_dataOut => Sys_dataOut,
		ras_n => ras_n,cas_n => cas_n, we_n => we_n, cke => cke, cs_n => cs_n, dqm => dqm, addr => addr, ba => ba		
		);
process

	begin
		sysclk <= '0';
		wait for  15.15 ns /2;
		sysclk <= '1';
		wait for 15.15 ns /2;
end process;		
   	
process
	begin
		Sysrst_n <= '0';
		wait for  0.6 us;
		Sysrst_n <= '1';
		wait;
end process;
	
   	

process
	begin
		SDram_EN <= '0';
		lvds_en <= '0';
		wait for 306 us;
		SDram_EN <= '1';
		wait for 60 ms;	
		SDram_EN <= '0';
		wait for 30 ns;
		lvds_en <= '1';
		wait for 60 ms;
		
end process;
process
	begin
		Fifo_RAfull <= '1';
		Fifo_WAfull <='0';
		wait for 306 us;
		Fifo_RAfull <= '0';
		wait for 300 ns ;
		Fifo_RAfull <= '1';
		wait for 15 ns * 20;
		Fifo_WAfull <='1';
		wait for 15 ns;
		Fifo_WAfull <='0';
		wait for 15*31 ns;
		Fifo_WAfull <='1';
		wait for 15 ns;
		Fifo_WAfull <='0';
		wait for 15.15 ns * 31;
		Fifo_WAfull <='1';
		wait for 15 ns;
		Fifo_WAfull <='0';
		wait for 15.15 ns * 31;
		Fifo_WAfull <='1';
		wait for 15 ns;
end process;
process
	begin
		Sys_dataIn <= (others => '0');
		wait for 306 us;
		Sys_dataIn <= (others => '1');
		wait for 306 us;
		Sys_dataIn <= (others => '0');		
end process;		
dqgen: process
begin
		dq <= (others => 'Z');
		wait for 306 us;
		wait for 100 ns;
		dq <= (0 => '1',2 => '1',others => '0');
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 150 ns;
		-- dq <= (others => 'Z');
		-- wait 430 ns;
		-- da <= (0 => '1',2 => '1',others => '1');
		-- wait for 150 ns;
	end process;	
end arch;		