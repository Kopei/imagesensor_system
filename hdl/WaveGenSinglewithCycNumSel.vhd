----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:00 11/13/2012 
-- Design Name: 
-- Module Name:    WaveGenSinglewithCycNumSel - Behavioral 
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

entity WaveGenSinglewithCycNumSel is
	--Len => X (in fact X+1);
	--CntWidth => Y (Y-1 downto 0)	
	--CycNum => Z (in fact Z+1)
	generic(
			Polarity			:std_logic	:= '0';
			DelayLen			:integer	:= 15;
			DelayCntWidth	:integer	:= 4;
			Phase1Len		:integer	:= 0;
			Phase1CntWidth	:integer	:= 1;
			Phase2Len		:integer	:= 0;
			Phase2CntWidth	:integer	:= 1;
			CycNum1			:integer	:= 511;
			CycNum2			:integer	:= 1023;
			CycCntWidth		:integer	:= 10
			);	
	port(
			SysRst_n			:in  std_logic;
			SysClk			:in  std_logic;
			ClkEn				:in  std_logic;
			WaveGenEn		:in  std_logic;
			CycNumSel		:in  std_logic;
			WFO				:out std_logic;	--WaveForm Output
			WaveRdy			:out std_logic
		);
end WaveGenSinglewithCycNumSel;

architecture Behavioral of WaveGenSinglewithCycNumSel is
	signal	PrState,NxState	:std_logic_vector(2 downto 0);		
	constant	WGS_Idle				:std_logic_vector(2 downto 0) := "000";
	constant	WGS_Delay			:std_logic_vector(2 downto 0) := "001";
	constant	WGS_Phase1			:std_logic_vector(2 downto 0) := "010";
	constant	WGS_Phase2			:std_logic_vector(2 downto 0) := "011";
	constant	WGS_Ok				:std_logic_vector(2 downto 0) := "100";
	
	signal	DelayCnt		:std_logic_vector(DelayCntWidth -1 downto 0);
	signal	Phase1Cnt	:std_logic_vector(Phase1CntWidth -1 downto 0);
	signal	Phase2Cnt	:std_logic_vector(Phase2CntWidth -1 downto 0);
	signal	CycCnt		:std_logic_vector(CycCntWidth -1 downto 0);
	signal  cycnum		:integer range 0 to 1023; 
begin

-----------------------------------------------------
	--State Transition
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			PrState <= WGS_Idle;
		elsif rising_edge(SysClk) then
			if WaveGenEn = '0' then
				PrState <= WGS_Idle;
			elsif ClkEn = '1' then
				PrState <= NxState;
			end if;
		end if;
	end process;
	
	--State Jumping
	process(PrState,DelayCnt,Phase1Cnt,Phase2Cnt,CycCnt,cycnum) 
	begin
		case PrState is
			when WGS_Idle =>
				NxState <= WGS_Delay;
			when WGS_Delay =>
				if DelayCnt = DelayLen then
					NxState <= WGS_Phase1;
				else
					NxState <= WGS_Delay;
				end if;
			when WGS_Phase1 =>
				if Phase1Cnt = Phase1Len then
					NxState <= WGS_Phase2;
				else
					NxState <= WGS_Phase1;
				end if;
				
			when WGS_Phase2 =>
				if Phase2Cnt = Phase2Len then
					if CycCnt = CycNum then
						NxState <= WGS_Ok;
					else
						NxState <= WGS_Phase1;
					end if;
				else
					NxState <= WGS_Phase2;
				end if;			
			when WGS_Ok =>
				NxState <= WGS_Ok;
			when others =>
				NxState <= WGS_Idle;
		end case;
	end process;

	--State Output
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			WFO <= Polarity;
			WaveRdy <= '0';
			DelayCnt <= (others => '0');
			Phase1Cnt <= (others => '0');
			Phase2Cnt <= (others => '0');
			CycCnt <= (others => '0');
			Cycnum <= cycnum1;
		elsif rising_edge(SysClk) then			
			if ClkEn = '1' then
				WaveRdy <= '0';
				DelayCnt <= (others => '0');
				Phase1Cnt <= (others => '0');
				Phase2Cnt <= (others => '0');
				WFO <= Polarity;
				if CycNumSel='1' then
					Cycnum <= cycnum1;
				else cycnum <= cycnum2;
				end if;
				case PrState is
					when WGS_Idle =>
						CycCnt <= (others => '0');
					when WGS_Delay =>
						DelayCnt <= DelayCnt + 1; --if delaylen=0, still delaycnt will count 1, but will be initialize by above default set
					when WGS_Phase1 =>
						Phase1Cnt <= Phase1Cnt + 1;
						WFO <= not Polarity;
					when WGS_Phase2 =>
						Phase2Cnt <= Phase2Cnt + 1;
						if Phase2Cnt = Phase2Len then
							CycCnt <= CycCnt + 1;
						end if;
					when WGS_Ok =>
						WaveRdy <= '1';
					when others =>
						CycCnt <= (others => '0');
				end case;					
			end if;
		end if;
	end process;		
end Behavioral;