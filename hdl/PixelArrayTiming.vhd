----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:09:02 11/06/2013 
-- Design Name: 
-- Module Name:    PixelArrayTiming - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PixelArrayTiming is
	port(
			--test
--			DivCntO		:out	std_logic_vector(6 downto 0);
--			ClkEnO		:out	std_logic;
--			InitCntO		:out	std_logic_vector(17 downto 0);
			--**************************
			SysRst_n		:in	std_logic;
			SysClk		:in	std_logic;
			InitTime		:in	std_logic_vector(17 downto 0);	--70ms max, 0.5us/step
			PAT_En		:in	std_logic;	--Pixel Array Timing module Enalbe Signal
			mem_HL		:out	std_logic;
			precharge	:out	std_logic;
			sample		:out	std_logic;
			reset			:out	std_logic;
			reset_ds		:out	std_logic;
			PAT_Ok		:out	std_logic	--Pixel Array Timing module Answer Signal
		);
end PixelArrayTiming;

architecture Behavioral of PixelArrayTiming is
	--to generate 0.5us ClkEn
	signal	DivCnt	:std_logic_vector(6 downto 0);	--0.5us
	signal	ClkEn		:std_logic;	
	--InitCnt
	signal	InitCnt	:std_logic_vector(17 downto 0);
	
begin
	--test
--	DivCntO <= DivCnt;
--	ClkEnO <= ClkEn;
--	InitCntO <= InitCnt;
	
	--0.5us ClkEn Gen
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			DivCnt <= (others => '0');
			ClkEn <= '0';
		elsif rising_edge(SysClk) then
			if PAT_En = '0' then
				DivCnt <= (others => '0');
				ClkEn <= '0';
			else
				if DivCnt = 65 then		--count from 0 to 65 @66MHz
					DivCnt <= (others => '0');
					ClkEn <= '1';
				else
					DivCnt <= DivCnt + 1;
					ClkEn <= '0';
				end if;
			end if;
		end if;
	end process;
	
	
	--Main Timer
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			InitCnt <= (others => '0');
			PAT_Ok <= '0';
		elsif rising_edge(SysClk) then
			if PAT_En = '0' then
				InitCnt <= InitTime;
				PAT_Ok <= '0';
			elsif ClkEn = '1' then
				if InitCnt = 0 then
					PAT_Ok <= '1';
				else
					InitCnt <= InitCnt - 1;
				end if;
			end if;
		end if;
	end process;
	
	--mem_HL
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			mem_HL <= '1';
		elsif rising_edge(SysClk) then
			if ClkEn = '1' then
				if InitCnt < 19 and InitCnt > 2 then
					mem_HL <= '0';
				else
					mem_HL <= '1';
				end if;
			end if;
		end if;
	end process;

	--precharge
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			precharge <= '1';
		elsif rising_edge(SysClk) then
			if ClkEn = '1' then
				if InitCnt < 18 and InitCnt > 9 then
					precharge <= '0';
				else
					precharge <= '1';
				end if;
			end if;
		end if;
	end process;
	
	--sample
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			sample <= '1';
		elsif rising_edge(SysClk) then
			if ClkEn = '1' then
				if InitCnt < 18 and InitCnt > 3 then
					sample <= '0';
				else
					sample <= '1';
				end if;
			end if;
		end if;
	end process;
	
	--reset
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			reset <= '1';
		elsif rising_edge(SysClk) then
			if PAT_En = '0' then
				reset <= '1';
			elsif ClkEn = '1' then
				if InitCnt > 1 then
					reset <= '0';
				else
					reset <= '1';
				end if;
			end if;
		end if;
	end process;
	
	--reset_ds
	reset_ds <= '0';
	
end Behavioral;