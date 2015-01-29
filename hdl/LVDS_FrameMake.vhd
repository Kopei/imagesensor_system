----------------------------------------------------------------------------------
-- Company: SITP
-- Engineer: LiJianwei
-- 
-- Create Date:    14:38:41 07/20/2012 
-- Design Name: 
-- Module Name:    LVDS_FrameMake - Behavioral 
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

entity LVDS_FrameMake is
    Port( 
            --test
--			ClkEnO				:out	std_logic;
--			PtS_EnO				:out	std_logic;
--			ClkDivCntO			:out	std_logic_vector(3 downto 0);	
--			ShifterO				:out	std_logic_vector(9 downto 0);
--			DelayCntO			:out	std_logic_vector(3 downto 0);
--			CRC_ResultAvaO		:out	std_logic;
--			PrStateO				:out	std_logic_vector(2 downto 0);
--			RAM_B_DataO			:out	std_logic_vector(7 downto 0);
--			RAM_B_ClkO			:out	std_logic;	
--			TIR_IniAddrO		:out	std_logic_vector(9 downto 0);
--			RamAddrCntO			:out	std_logic_vector(10 downto 0);
--			RamSelO				:out	std_logic_vector(1 downto 0);
--			Din_8b10bO			:out	std_logic_vector(7 downto 0);
--			Kin_Delay4O			:out	std_logic;
--			DoutO					:out	std_logic_vector(9 downto 0);
--			StepCntO				:out	std_logic_vector(3 downto 0);
			--------------------------------------------------------------
			SysRst_n          :in	std_logic;
            Sys_80M_Clk    :in	std_logic;
			VNIR_ImageRAM_PP	:in	std_logic;	--'0':initial address 27720; '1':initial address 0;
			SWIR_ImageRAM_PP	:in	std_logic;	--'0':initial address 1400;'1':initial address 0;
			TIR_ImageRAM_PP	:in	std_logic;	--'0':initial address 700;'1':initial address 0;
			FrameTxEn			:in	std_logic;	--LVDS_FrameMake Enable
			FrameTxOk			:out	std_logic;	--LVDS_FrameMake Answer
			AppID					:in	std_logic_vector(10 downto 0);
			PacketLength		:in	std_logic_vector(15 downto 0);			
			PacketMode			:in	std_logic_vector(1 downto 0);	--"00":VNIR; "01":SWIR; "10":TIR; "11" Acc;
			PacketFlag			:in	std_logic_vector(1 downto 0);	--"01":Start; "11":working; "10":End
			PacketCnt			:in	std_logic_vector(13 downto 0);
			ChNum					:in	std_logic_vector(3 downto 0);
			SubHead				:in	std_logic_vector(15 downto 0);
			--VNIR ImageRAM B port(Simple Dual Port RAM,27720x2x8bits)
			VNIR1_ImageRAM_B_Clk		:out	std_logic;
			VNIR1_ImageRAM_B_Addr	:out	std_logic_vector(15 downto 0);
			VNIR1_ImageRAM_B_Data	:in	std_logic_vector(7 downto 0);			
			VNIR2_ImageRAM_B_Clk		:out	std_logic;
			VNIR2_ImageRAM_B_Addr	:out	std_logic_vector(15 downto 0);	
			VNIR2_ImageRAM_B_Data	:in	std_logic_vector(7 downto 0);			
			VNIR3_ImageRAM_B_Clk		:out	std_logic;
			VNIR3_ImageRAM_B_Addr	:out	std_logic_vector(15 downto 0);
			VNIR3_ImageRAM_B_Data	:in	std_logic_vector(7 downto 0);						
			--SWIR ImageRAM B Port(Simple Dual Port RAM,1400x2x8bits);			
			SWIR1A_ImageRAM_B_Clk	:out 	std_logic;
			SWIR1A_ImageRAM_B_Addr	:out	std_logic_vector(11 downto 0);	
			SWIR1A_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);			
			SWIR2A_ImageRAM_B_Clk	:out 	std_logic;
			SWIR2A_ImageRAM_B_Addr	:out	std_logic_vector(11 downto 0);	
			SWIR2A_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);
			SWIR1B_ImageRAM_B_Clk	:out 	std_logic;
			SWIR1B_ImageRAM_B_Addr	:out	std_logic_vector(11 downto 0);	
			SWIR1B_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);
			SWIR2B_ImageRAM_B_Clk	:out 	std_logic;
			SWIR2B_ImageRAM_B_Addr	:out	std_logic_vector(11 downto 0);	
			SWIR2B_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);
			--TIR ImageRAM B Port(Simple Dual Port RAM,700x2x8bits);			
			TIR1A_ImageRAM_B_Clk		:out 	std_logic;
			TIR1A_ImageRAM_B_Addr	:out	std_logic_vector(10 downto 0);	
			TIR1A_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);			
			TIR2A_ImageRAM_B_Clk		:out 	std_logic;
			TIR2A_ImageRAM_B_Addr	:out	std_logic_vector(10 downto 0);	
			TIR2A_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);
			TIR1B_ImageRAM_B_Clk		:out 	std_logic;
			TIR1B_ImageRAM_B_Addr	:out	std_logic_vector(10 downto 0);	
			TIR1B_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);			
			TIR2B_ImageRAM_B_Clk		:out 	std_logic;
			TIR2B_ImageRAM_B_Addr	:out	std_logic_vector(10 downto 0);	
			TIR2B_ImageRAM_B_Data	:in 	std_logic_vector(7 downto 0);
			--Acc DataRAM Port
			AccDataRAM_B_Clk		:out	std_logic;
			AccDataRAM_B_Addr		:out	std_logic_vector(8 downto 0);
			AccDataRAM_B_Data		:in	std_logic_vector(7 downto 0);
			--LVDS			
			LVDS_1A					:out	std_logic;
			LVDS_1B					:out	std_logic;
			LVDS_2A					:out	std_logic;
			LVDS_2B					:out	std_logic
		);
end LVDS_FrameMake;

architecture Behavioral of LVDS_FrameMake is
	type		FH_ARRAY		is array (0 to 7) of std_logic_vector(7 downto 0);
	signal	FrameHead		:FH_ARRAY;
	signal	ClkEn			:std_logic;
	signal	PtS_En		:std_logic;	--Parallel to Serial Enable
	signal	ClkDivCnt	:std_logic_vector(3 downto 0);	
	signal	Shifter		:std_logic_vector(9 downto 0);
	signal	DelayCnt		:integer range 0 to 8;		--used 0 to 7;
	signal	RAM_B_Data	:std_logic_vector(7 downto 0);
	signal	RAM_B_Clk	:std_logic;
	signal	Din			:std_logic_vector(7 downto 0);
	signal	Din_Delay1	:std_logic_vector(7 downto 0);
	signal	Din_Delay2	:std_logic_vector(7 downto 0);
	signal	Din_Delay3	:std_logic_vector(7 downto 0);
	signal	Din_Delay4	:std_logic_vector(7 downto 0);
	signal	Din_8b10b	:std_logic_vector(7 downto 0);
	signal	Kin			:std_logic;
	signal	Kin_Delay1	:std_logic;
	signal	Kin_Delay2	:std_logic;
	signal	Kin_Delay3	:std_logic;
	signal	Kin_Delay4	:std_logic;
	signal	Dout			:std_logic_vector(9 downto 0);
	signal	VNIR_IniAddr	:std_logic_vector(15 downto 0);
	signal	SWIR_IniAddr	:std_logic_vector(10 downto 0);
	signal	TIR_IniAddr		:std_logic_vector(9 downto 0);	
	signal	RamAddrCntSet	:std_logic_vector(10 downto 0);
	signal	RamAddrCnt	:std_logic_vector(10 downto 0);
	constant	CRC_POLY		:std_logic_vector(31 downto 0) := X"04C11DB7";
	signal	StepCnt		:std_logic_vector(3 downto 0);
	signal	CRC_Reg		:std_logic_vector(39 downto 0);--39-8 is result, 7-0 is shifter;
	signal	CRC_ResultAva	:std_logic;
	signal	PrState,NxState	:std_logic_vector(2 downto 0);		
	constant	LFM_IDLE		:std_logic_vector(2 downto 0) := "000";
	constant	LFM_SOF		:std_logic_vector(2 downto 0) := "001";	--1 bytes of X"FD"(K29.7)
	constant	LFM_HEAD		:std_logic_vector(2 downto 0) := "010";	--8 bytes
	constant	LFM_DATA		:std_logic_vector(2 downto 0) := "011";	--VNIR:5544 bytes; SWIR:2800 bytes; TIR:1400 bytes; Acc:504 bytes;
	constant	LFM_CRC		:std_logic_vector(2 downto 0) := "100";	--4 bytes
	constant	LFM_EOF		:std_logic_vector(2 downto 0) := "101";	--1 bytes of X"FB"(K27.7)
	constant	LFM_Wait		:std_logic_vector(2 downto 0) := "110";	--8 bytes of X"BC"(K28.5);
	constant	LFM_Ok		:std_logic_vector(2 downto 0) := "111";
	signal	RamSelSet	:std_logic_vector(1 downto 0);
	signal	RamSel		:std_logic_vector(1 downto 0);
	
	component Encoder_8Bto10B
	port(
			din	:in  std_logic_vector(7 downto 0);
			kin	:in  std_logic;
			clk	:in  std_logic;
			dout	:out std_logic_vector(9 downto 0);
			ce		:in  std_logic
		);
	end component;
	
begin
	--test
--	ClkEnO <= ClkEn;
--	PtS_EnO <= PtS_En;
--	ShifterO <= Shifter;
--	DelayCntO <= CONV_STD_LOGIC_VECTOR(DelayCnt,4);
--	CRC_ResultAvaO <= CRC_ResultAva;
--	PrStateO <= PrState;
--	RAM_B_DataO <= RAM_B_Data;
--	RAM_B_ClkO <= RAM_B_Clk;
--	ClkDivCntO <= ClkDivCnt;
--	TIR_IniAddrO <= TIR_IniAddr;
--	RamAddrCntO <= RamAddrCnt;
--	RamSelO <= RamSel;
--	Din_8b10bO <= Din_8b10b;
--	Kin_Delay4O <= Kin_Delay4;
--	DoutO <= Dout;
--	StepCntO <= StepCnt;
----------------------------------------------------------------	
	--FrameHead
	FrameHead(0)(7 downto 3) <= "00001";	
	FrameHead(0)(2 downto 0) <= AppID(10 downto 8);	
	FrameHead(1) <= AppID(7 downto 0);
	FrameHead(2)(7 downto 6) <= PacketFlag;
	FrameHead(2)(5 downto 0) <= PacketCnt(13 downto 8);
	FrameHead(3) <= PacketCnt(7 downto 0);
	FrameHead(4) <= PacketLength(15 downto 8);
	FrameHead(5) <= PacketLength(7 downto 0);	
	FrameHead(6) <= SubHead(15 downto 8);
	FrameHead(7) <= SubHead(7 downto 0);

	--RamSelSet
	RamSelSet <= "10" when	PacketMode = "00" else	--VNIR:0-2
				 "01" when	PacketMode = "01" or PacketMode = "10" else	--SWIR & TIR:0-1
				 "00";	--Acc:0				 
	--RamAddrCntSet
	RamAddrCntSet <= "11100110111" when PacketMode = "00" else	--VNIR	1056*14/8 =1848(0-1847)
					 "10101110111" when PacketMode = "01" else	--SWIR	800*14/8=1400(0-1399)
					 "01010111011" when PacketMode = "10" else	--TIR	400*14/8=700 (0-699)
					 "00111110111";								--Acc	504(0-503)	   
	--Initial Addr
	VNIR_IniAddr	<=	"0000000000000000" when (ChNum = 1 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch1 Initial Address 0(VNIR_ImageRAM_PP = '1')
						"0110110001001000" when (ChNum = 1 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch1 Initial Address 27720 (VNIR_ImageRAM_PP = '0')
						"0000011100111000" when (ChNum = 2 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch2 Initial Address 1848 (VNIR_ImageRAM_PP = '1')
						"0111001110000000" when (ChNum = 2 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch2 Initial Address 1848+27220=29568 (VNIR_ImageRAM_PP = '0')
						"0000111001110000" when (ChNum = 3 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch3 Initial Address 1848x2=3696(VNIR_ImageRAM_PP = '1')
						"0111101010111000" when (ChNum = 3 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch3 Initial Address 1848x2+27720=31416(VNIR_ImageRAM_PP = '0')
						"0001010110101000" when (ChNum = 4 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch4 Initial Address 1848x3=5544(VNIR_ImageRAM_PP = '1')
						"1000000111110000" when (ChNum = 4 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch4 Initial Address 1848x3+27720=33264(VNIR_ImageRAM_PP = '0')
						"0001110011100000" when (ChNum = 5 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch5 Initial Address 1848x4=7392(VNIR_ImageRAM_PP = '1')
						"1000100100101000" when (ChNum = 5 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch5 Initial Address 1848x4+27720=35112(VNIR_ImageRAM_PP = '0')
						"0010010000011000" when (ChNum = 6 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch6 Initial Address 1848x5=9240(VNIR_ImageRAM_PP = '1')
						"1001000001100000" when (ChNum = 6 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch6 Initial Address 1848x5+27720=36960(VNIR_ImageRAM_PP = '1')
						"0010101101010000" when (ChNum = 7 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch7 Initial Address 1848x6=11088(VNIR_ImageRAM_PP = '1')
						"1001011110011000" when (ChNum = 7 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch7 Initial Address 1848x6+27720=38808(VNIR_ImageRAM_PP = '0')
						"0011001010001000" when (ChNum = 8 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch8 Initial Address 1848x7=12936(VNIR_ImageRAM_PP = '1')
						"1001111011010000" when (ChNum = 8 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch8 Initial Address 1848x7+27720=40656(VNIR_ImageRAM_PP = '0')
						"0011100111000000" when (ChNum = 9 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch9 Initial Address 1848x8=14784(VNIR_ImageRAM_PP = '1')
						"1010011000001000" when (ChNum = 9 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch9 Initial Address 1848x8+27720=42504(VNIR_ImageRAM_PP = '0')
						"0100000011111000" when (ChNum = 10 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch10 Initial Address 1848x9=16632(VNIR_ImageRAM_PP = '1')
						"1010110101000000" when (ChNum = 10 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch10 Initial Address 1848x9+27720=44352(VNIR_ImageRAM_PP = '0')
						"0100100000110000" when (ChNum = 11 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch11 Initial Address 1848x10=18480(VNIR_ImageRAM_PP = '1')
						"1011010001111000" when (ChNum = 11 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch11 Initial Address 1848x10+27720=46200(VNIR_ImageRAM_PP = '0')
						"0100111101101000" when (ChNum = 12 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch12 Initial Address 1848x11=20328(VNIR_ImageRAM_PP = '1')
						"1011101110110000" when (ChNum = 12 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch12 Initial Address 1848x11+27720=48048(VNIR_ImageRAM_PP = '0')
						"0101011010100000" when (ChNum = 13 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch13 Initial Address 1848x12=22176(VNIR_ImageRAM_PP = '1')
						"1100001011101000" when (ChNum = 13 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch13 Initial Address 1848x12+27720=49896(VNIR_ImageRAM_PP = '0')
						"0101110111011000" when (ChNum = 14 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch14 Initial Address 1848x13=24024(VNIR_ImageRAM_PP = '1')
						"1100101000100000" when (ChNum = 14 and VNIR_ImageRAM_PP = '0') else	--VNIR Ch14 Initial Address 1848x13+27720=51744(VNIR_ImageRAM_PP = '0')
						"0110010100010000" when (ChNum = 15 and VNIR_ImageRAM_PP = '1') else	--VNIR Ch15 Initial Address 1848x14=25872(VNIR_ImageRAM_PP = '1')
						"1101000101011000";														--VNIR Ch15 Initial Address 1848x14+27720=53592(VNIR_ImageRAM_PP = '0')						
	SWIR_IniAddr	<=	"10101111000" when SWIR_ImageRAM_PP = '0' else (others => '0');	--SWIR_ImageRAM_PP = '0',Initial Address 1400
	TIR_IniAddr		<=	"1010111100" when TIR_ImageRAM_PP = '0' else (others => '0');	--TIR_ImageRAM_PP = '0',Initial Address 700

-----------------------------------------------------
--80M -> 8M
	process(SysRst_n,Sys_80M_Clk)
	begin
		if SysRst_n = '0' then
			ClkEn <= '0';
			ClkDivCnt <= (others => '0');
			PtS_En <= '0';
		elsif rising_edge(Sys_80M_Clk) then
			if ClkDivCnt = 9 then
				ClkDivCnt <= (others => '0');
			else
				ClkDivCnt <= ClkDivCnt + 1;
			end if;
			if ClkDivCnt = 0 then
				ClkEn <= '1';
			else
				ClkEn <= '0';
			end if;
			if ClkDivCnt = 2 then
				PtS_En <= '1';
			else
				PtS_En <= '0';
			end if;			
		end if;
	end process;
-----------------------------------------------------

-----------------------------------------------------
--LFM State Machine
	--State Transition
	process(SysRst_n,Sys_80M_Clk) 
	begin
		if SysRst_n = '0' then
			PrState <= LFM_IDLE;
		elsif rising_edge(Sys_80M_Clk) then
			if FrameTxEn = '0' then
				PrState <= LFM_IDLE;
			else
				if ClkEn = '1' then
					PrState <= NxState;
				end if;
			end if;
		end if;
	end process;

	--State Jumping
	process(PrState,DelayCnt,RamAddrCnt,RamAddrCntSet,RamSel,RamSelSet) 
	begin
		case PrState is
			when LFM_IDLE =>
				NxState <= LFM_SOF;
			when LFM_SOF =>
				NxState <= LFM_HEAD;
			when LFM_HEAD =>
				if DelayCnt = 7 then
					NxState <= LFM_DATA;
				else
					NxState <= LFM_HEAD;
				end if;
			when LFM_DATA =>
				if RamAddrCnt = RamAddrCntSet and RamSel = RamSelSet then
					NxState <= LFM_CRC;
				else
					NxState <= LFM_DATA;
				end if;
			when LFM_CRC =>
				if DelayCnt = 3 then
					NxState <= LFM_EOF;
				else
					NxState <= LFM_CRC;
				end if;
			when LFM_EOF =>
				NxState <= LFM_Wait;
			when LFM_Wait =>
				if DelayCnt = 7 then
					NxState <= LFM_Ok;
				else
					NxState <= LFM_Wait;
				end if;
			when LFM_Ok =>
				NxState <= LFM_Ok;
			when others =>
				NxState <= LFM_IDLE;
		end case;
	end process;

	--State Output
	process(SysRst_n,Sys_80M_Clk) 
	begin
		if SysRst_n = '0' then
			DelayCnt <= 0;
			RAM_B_Clk <= '0';
			RamAddrCnt <= (others => '0');
			RamSel <= "00";
			CRC_ResultAva <= '0';	--'1' after LFM_CRC State for 4 bytes
			FrameTxOk <= '0';		
		elsif rising_edge(Sys_80M_Clk) then
			if PrState = LFM_DATA then
				if ClkDivCnt = 6 then
					RAM_B_Clk <= '1';
				else
					RAM_B_Clk <= '0';
				end if;
			end if;
			if ClkEn = '1' then
				DelayCnt <= 0;
				RamAddrCnt <= (others => '0');
				FrameTxOk <= '0';
				case PrState is
					when LFM_IDLE =>
						CRC_ResultAva <= '0';
						RamSel <= "00";
					when LFM_SOF =>
						null;
					when LFM_HEAD =>
						DelayCnt <= DelayCnt + 1;
					when LFM_DATA =>
						if RamAddrCnt = RamAddrCntSet then
							if RamSel = RamSelSet then
								RamSel <= "00";
							else
								RamSel <= RamSel + 1;
							end if;
							RamAddrCnt <= (others => '0');
						else
							RamAddrCnt <= RamAddrCnt + 1;
						end if;											
					when LFM_CRC =>
						DelayCnt <= DelayCnt + 1;
						if DelayCnt = 3 then
							CRC_ResultAva <= '1';
						end if;
					when LFM_EOF =>
						null;
					when LFM_Wait =>
						DelayCnt <= DelayCnt + 1;
						if DelayCnt = 2 then
							CRC_ResultAva <= '0';
						end if;
					when LFM_Ok =>
						FrameTxOk <= '1';
					when others =>
						CRC_ResultAva <= '0';
						RamSel <= "00";
				end case;
			end if;
		end if;
	end process;

	--RAM_B_Addr
	VNIR1_ImageRAM_B_Addr	<=	(VNIR_IniAddr + ("00000" & RamAddrCnt))	when (PacketMode = "00" and RamSel = 0) else (others => '0');
	VNIR2_ImageRAM_B_Addr	<=	(VNIR_IniAddr + ("00000" & RamAddrCnt))	when (PacketMode = "00" and RamSel = 1) else (others => '0');
	VNIR3_ImageRAM_B_Addr	<=	(VNIR_IniAddr + ("00000" & RamAddrCnt))	when (PacketMode = "00" and RamSel = 2) else (others => '0');
	SWIR1A_ImageRAM_B_Addr	<=	(('0' & SWIR_IniAddr) + ('0' & RamAddrCnt))	when (PacketMode = "01" and RamSel = 0 and ChNum = 1) else (others => '0');
	SWIR2A_ImageRAM_B_Addr	<=	(('0' & SWIR_IniAddr) + ('0' & RamAddrCnt))	when (PacketMode = "01" and RamSel = 1 and ChNum = 1) else (others => '0');
	SWIR1B_ImageRAM_B_Addr	<=	(('0' & SWIR_IniAddr) + ('0' & RamAddrCnt))	when (PacketMode = "01" and RamSel = 0 and ChNum = 2) else (others => '0');
	SWIR2B_ImageRAM_B_Addr	<=	(('0' & SWIR_IniAddr) + ('0' & RamAddrCnt))	when (PacketMode = "01" and RamSel = 1 and ChNum = 2) else (others => '0');
	TIR1A_ImageRAM_B_Addr	<=	(('0' & TIR_IniAddr) + RamAddrCnt)	when (PacketMode = "10" and RamSel = 0 and ChNum = 1) else (others => '0');
	TIR2A_ImageRAM_B_Addr	<=	(('0' & TIR_IniAddr) + RamAddrCnt)	when (PacketMode = "10" and RamSel = 1 and ChNum = 1) else (others => '0');
	TIR1B_ImageRAM_B_Addr	<=	(('0' & TIR_IniAddr) + RamAddrCnt)	when (PacketMode = "10" and RamSel = 0 and ChNum = 2) else (others => '0');
	TIR2B_ImageRAM_B_Addr	<=	(('0' & TIR_IniAddr) + RamAddrCnt)	when (PacketMode = "10" and RamSel = 1 and ChNum = 2) else (others => '0');	
	AccDataRAM_B_Addr	<=	RamAddrCnt(8 downto 0) when PacketMode = "11" else (others => '0');		
	--RAM_B_Clk
	VNIR1_ImageRAM_B_Clk	<=	RAM_B_Clk	when (PacketMode = "00" and RamSel = 0) else '0';
	VNIR2_ImageRAM_B_Clk	<=	RAM_B_Clk	when (PacketMode = "00" and RamSel = 1) else '0';
	VNIR3_ImageRAM_B_Clk	<=	RAM_B_Clk	when (PacketMode = "00" and RamSel = 2) else '0';
	SWIR1A_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "01" and RamSel = 0 and ChNum = 1) else '0';
	SWIR2A_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "01" and RamSel = 1 and ChNum = 1) else '0';
	SWIR1B_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "01" and RamSel = 0 and ChNum = 2) else '0';
	SWIR2B_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "01" and RamSel = 1 and ChNum = 2) else '0';
	TIR1A_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "10" and RamSel = 0 and ChNum = 1) else '0';
	TIR2A_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "10" and RamSel = 1 and ChNum = 1) else '0';
	TIR1B_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "10" and RamSel = 0 and ChNum = 2) else '0';
	TIR2B_ImageRAM_B_Clk	<= 	RAM_B_Clk	when (PacketMode = "10" and RamSel = 1 and ChNum = 2) else '0';
	AccDataRAM_B_Clk		<=	RAM_B_Clk	when PacketMode = "11" else '0';						
	--RAM_B_Data
	RAM_B_Data	<=	VNIR1_ImageRAM_B_Data	when (PacketMode = "00" and RamSel = 0) else
					VNIR2_ImageRAM_B_Data	when (PacketMode = "00" and RamSel = 1) else
					VNIR3_ImageRAM_B_Data	when (PacketMode = "00" and RamSel = 2) else
					SWIR1A_ImageRAM_B_Data	when (PacketMode = "01" and RamSel = 0 and ChNum = 1) else
					SWIR2A_ImageRAM_B_Data	when (PacketMode = "01" and RamSel = 1 and ChNum = 1) else
					SWIR1B_ImageRAM_B_Data	when (PacketMode = "01" and RamSel = 0 and ChNum = 2) else
					SWIR2B_ImageRAM_B_Data	when (PacketMode = "01" and RamSel = 1 and ChNum = 2) else
					TIR1A_ImageRAM_B_Data	when (PacketMode = "10" and RamSel = 0 and ChNum = 1) else
					TIR2A_ImageRAM_B_Data	when (PacketMode = "10" and RamSel = 1 and ChNum = 1) else
					TIR1B_ImageRAM_B_Data	when (PacketMode = "10" and RamSel = 0 and ChNum = 2) else
					TIR2B_ImageRAM_B_Data	when (PacketMode = "10" and RamSel = 1 and ChNum = 2) else
					AccDataRAM_B_Data;
	
	--Din
	Din	<= X"FD" 				when PrState = LFM_SOF else		--K29.7
		   FrameHead(DelayCnt)	when PrState = LFM_HEAD else
		   RAM_B_Data			when PrState = LFM_DATA else
		   X"00"				when PrState = LFM_CRC else		--to add 32bits of '0' at the end of Data;
		   X"FB"				when PrState = LFM_EOF else		--K27.7
		   X"BC";												--K28.5
	--Kin
	Kin <=	'0'	when (PrState = LFM_HEAD or PrState = LFM_DATA or PrState = LFM_CRC) else
			'1';
----------------------------------------------------------

----------------------------------------------------------
	--CRC-32;
	process(SysRst_n,Sys_80M_Clk) 
	begin
		if SysRst_n = '0' then
			StepCnt <= "1000";	--8;
			CRC_Reg <= (others => '0');
		elsif rising_edge(Sys_80M_Clk) then
			if FrameTxEn = '0' then
				StepCnt <= "1000";	--8;
				CRC_Reg <= (others => '0');				
			else
				if ClkEn = '1' then
					if PrState = LFM_HEAD or PrState = LFM_DATA or PrState = LFM_CRC then
						StepCnt <= "0000";
						CRC_Reg(7 downto 0) <= Din;
					end if;
					if CRC_ResultAva = '1' then
						CRC_Reg <= CRC_Reg(31 downto 0) & "00000000";
					end if;
				else
					if StepCnt < 8 then
						StepCnt <= StepCnt + 1;
						CRC_Reg(39 downto 1) <= CRC_Reg(38 downto 0);
						if CRC_Reg(39) = '1' then
							CRC_Reg(39 downto 8) <= CRC_Reg(38 downto 7) xor CRC_POLY;
						end if;
					end if;
				end if;
			end if;			
		end if;
	end process;

----------------------------------------------------------
--Delay 4 Bytes
----------------------------------------------------------
	process(SysRst_n,Sys_80M_Clk) 
	begin
		if SysRst_n = '0' then
			Kin_Delay1 <= '1';
			Kin_Delay2 <= '1';
			Kin_Delay3 <= '1';
			Kin_Delay4 <= '1';
			Din_Delay1 <= X"BC";
			Din_Delay2 <= X"BC";
			Din_Delay3 <= X"BC";
			Din_Delay4 <= X"BC";
		elsif rising_edge(Sys_80M_Clk) then
			if ClkEn = '1' then
				Kin_Delay1 <= Kin;
				Kin_Delay2 <= Kin_Delay1;
				Kin_Delay3 <= Kin_Delay2;
				Kin_Delay4 <= Kin_Delay3;
				Din_Delay1 <= Din;
				Din_Delay2 <= Din_Delay1;
				Din_Delay3 <= Din_Delay2;
				Din_Delay4 <= Din_Delay3;
			end if;
		end if;
	end process;	
----------------------------------------------------------

----------------------------------------------------------
	--8B/10B and LVDS output;
	Encoder_8Bto10B_inst:	Encoder_8Bto10B
	port map
	(
		din		=> Din_8b10b,
		kin		=> Kin_Delay4,
		clk		=> Sys_80M_Clk,
		dout	=> Dout,
		ce		=> ClkEn
	);
	Din_8b10b <= Din_Delay4 when CRC_ResultAva = '0' else
				 CRC_Reg(39 downto 32);
	
	process(SysRst_n,Sys_80M_Clk) 
	begin
		if SysRst_n = '0' then
			Shifter <= (others => '0');
			LVDS_1A <= '0';
			LVDS_1B <= '0';
			LVDS_2A <= '0';
			LVDS_2B <= '0';
		elsif rising_edge(Sys_80M_Clk) then
			if PtS_En = '1' then
				Shifter <= Dout;
			else
				Shifter(8 downto 0) <= Shifter(9 downto 1);
			end if;
			LVDS_1A <= Shifter(0);
			LVDS_1B <= Shifter(0);
			LVDS_2A <= Shifter(0);
			LVDS_2B <= Shifter(0);			
		end if;
	end process;
----------------------------------------------------------	
end Behavioral;