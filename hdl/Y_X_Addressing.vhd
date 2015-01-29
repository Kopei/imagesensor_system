----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:03 11/04/2013 
-- Design Name: 
-- Module Name:    Y_X_Addressing - Behavioral 
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

entity Y_X_Addressing is
	port(
			--test
--			RowCntO			:out	std_logic_vector(10 downto 0);
--			LineReadOutOkO	:out	std_logic;
--			RowReadOutEnO	:out	std_logic;
--			PrStateO			:out	std_logic_vector(2 downto 0);			
			--**************************
			SysRst_n	:in	    std_logic;
			SysClk		:in	    std_logic;
            ADC_66M_Clk :in     std_logic;
			Y_X_WaveEn	:in	    std_logic;
			ImageOrQL	:in		std_logic;	--'0':Image; '1':QuitLatch
			--dry			:in		std_logic;
			Sync_Y		:out	std_logic;
			Clock_Y		:out	std_logic;
			NoRowSel	:out	std_logic;
			Pre_co		:out	std_logic;
			Sh_co		:out	std_logic;
			VoltAvg		:out	std_logic;
			Sync_X		:out	std_logic;
			Clock_X		:out	std_logic;
			Prebus1		:out	std_logic;
			Prebus2		:out	std_logic;
            AdcClk      :out    std_logic;
			--DryforTest	:out	std_logic;
			ADC_RdEN	:out	std_logic; --for mux acc_din enable
			Y_X_WaveOk	:out	std_logic
			--RowNumOut	:out	std_logic_vector(10 downto 0)
		);
end Y_X_Addressing;

architecture Behavioral of Y_X_Addressing is
	component WaveGenSingle is
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
				CycNum			:integer	:= 10;
				CycCntWidth		:integer	:= 4
				);	
		port(
				SysRst_n			:in  std_logic;
				SysClk			:in  std_logic;
				ClkEn				:in  std_logic;
				WaveGenEn		:in  std_logic;
				WFO				:out std_logic;	--WaveForm Output
				WaveRdy			:out std_logic
			);
	end component;
	
	component WaveGenSinglewithCycNumSel is
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
	end component;
	
	component SampleEN_DLY is 
    port(GL : out std_logic;  CLK : in std_logic) ;
	end component;
	
	component ADcEN_DLY is 
    port(GL : out std_logic;  CLK : in std_logic) ;
	end component;
	
	signal	PrState,NxState	:std_logic_vector(2 downto 0);		
	constant	YXA_Idle			:std_logic_vector(2 downto 0) := "000";
	constant	YXA_RowReadOut		:std_logic_vector(2 downto 0) := "001";
	constant	YXA_Wait			:std_logic_vector(2 downto 0) := "010";
	constant	YXA_Judge			:std_logic_vector(2 downto 0) := "011";
	constant	YXA_Ok				:std_logic_vector(2 downto 0) := "100";
	--constant RowNum				:std_logic_vector(10 downto 0) := "11111111111";	--in fact (7+1) Rows --11/8 row 2048
	signal	RowCnt				:std_logic_vector(10 downto 0);
	signal	LineReadOutOk		:std_logic;
	signal	RowReadOutEn		:std_logic;
	signal  AdcCLkEn            :std_logic;
	signal  AdcCLKEn_DLY		:std_logic;
	--signal	GL,CLK_DLY 			:std_logic;
	signal  RowNum				:std_logic_vector(10 downto 0);
	--signal DlyCnt				:integer;
	signal	Adc_RdEn_inter,AdcRdEn_DLY		:std_logic;
begin
	--test
--	PrStateO <= PrState;
--	RowCntO <= RowCnt;
--	LineReadOutOkO <= LineReadOutOk;
--	RowReadOutEnO <= RowReadOutEn;	
	rownum <= "11111111111" when imageorql = '1' else "11111111111";
	--RowNumOut <= rownum;
	--State Transition
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			PrState <= YXA_Idle;
		elsif rising_edge(SysClk) then
			if Y_X_WaveEn = '0' then
				PrState <= YXA_Idle;
			else
				PrState <= NxState;
			end if;
		end if;
	end process;
	
	--State Jumping
	process(PrState,LineReadOutOk,RowCnt,Rownum) 
	begin
		case PrState is
			when YXA_Idle =>
				NxState <= YXA_RowReadOut;
			when YXA_RowReadOut =>
				if LineReadOutOk = '1' then
					NxState <= YXA_Wait;
				else
					NxState <= YXA_RowReadOut;
				end if;
			when YXA_Wait =>
				if LineReadOutOk = '0' then
					NxState <= YXA_Judge;
				else
					NxState <= YXA_Wait;
				end if;
			when YXA_Judge =>
				if RowCnt = RowNum then
					NxState <= YXA_Ok;
				else
					NxState <= YXA_RowReadOut;
				end if;
			when YXA_Ok =>
				NxState <= YXA_Ok;
			when others =>
				NxState <= YXA_Idle;
		end case;
	end process;

	--State Output
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			RowCnt <= (others => '0');
			RowReadOutEn <= '0';
			Y_X_WaveOk <= '0';
		elsif rising_edge(SysClk) then			
			RowReadOutEn <= '0';
			Y_X_WaveOk <= '0';			
			case PrState is
				when YXA_Idle =>
					RowCnt <= (others => '0');
				when YXA_RowReadOut =>
					RowReadOutEn <= '1';
				when YXA_Wait =>
					null;
				when YXA_Judge =>
					RowCnt <= RowCnt + 1;
				when YXA_Ok =>
					Y_X_WaveOk <= '1';
				when others =>
					RowCnt <= (others => '0');
			end case;					
		end if;
	end process;
	
	VoltAvg <= '0';
	Prebus1 <= '0';
	Prebus2 <= '0';
	Adc_RdEN <= AdcRdEn_DLY when imageorql = '0' else '0'; --adc_EN should not enable when quit latch up 
    AdcClk  <= AdcCLKEn_DLY and ADC_66M_Clk;
	
	-- ADC_rdEN delay for 3 sysclk
	-- process(Sysclk,SysRst_n)	
	-- begin
		-- if SysRst_n = '0' then
			-- Adc_RdEn <= '0';
		-- elsif rising_edge(SysClk) then
			-- if(AdcCLKEn_DLY='1')then
				-- if DlyCnt =2 then
					-- Adc_RdEn <= '1';
				-- else DlyCnt <=DlyCnt +1;
					-- Adc_RdEn <= '0';
				-- end if;
			-- else DlyCnt <=0;
			-- end if;	
		-- end if;
	-- end process;
	
	
	ADCCLKDlYEn: SampleEN_DLY 
	port map
	(
		CLk => AdcCLkEn,
		GL => AdcCLKEn_DLY
		);
		
	ADCrdDlYEn: AdcEN_DLY 
	port map
	(
		CLk => Adc_RdEn_inter,
		GL => AdcRdEn_DLY
		);
	
	Wave_Sync_Y: WaveGenSingle
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '0',
		DelayLen			=> 0,		--(0+1)+(1 Idle)=2(delay)
		DelayCntWidth	=> 1,		
		Phase1Len		=> 4,		--Phase1:(4+1)=5
		Phase1CntWidth	=> 4,		
		Phase2Len		=> 0,		--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum			=> 0,		--0	
		CycCntWidth		=> 1		
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> Y_X_WaveEn,
		WFO			=> Sync_Y,
		WaveRdy		=> open		
	);

	
	 Wave_Clock_Y: WaveGenSingle
	-- -- --Len => N (in fact N+1);
	-- -- --CntWidth => N (N-1 downto 0)	
	 generic map
	 (
		 Polarity			=> '0',
		 DelayLen			=> 0,		--(0+1)+(1 Idle)=2(delay)
		 DelayCntWidth	=> 1,		
		 Phase1Len		=> 1,		--Phase1:(1+1)=2
		 Phase1CntWidth	=> 1,		
		 Phase2Len		=> 0,		--Phase2:(0+1)=1
		 Phase2CntWidth	=> 1,		
		 CycNum			=> 0,		--0	
		 CycCntWidth		=> 1		
	 )
	 port map
	 (
		 SysRst_n		=> SysRst_n,
		 SysClk		=> SysClk,
		 ClkEn			=> '1',
		 WaveGenEn	=> RowReadOutEn,
		 WFO			=> Clock_Y,
		 WaveRdy		=> open		
	 );
	-- Wave_Clock_Y: WaveGenSinglewithCycNumSel
	-- --Len => N (in fact N+1);
	-- --CntWidth => N (N-1 downto 0)	
	-- generic map
	-- (
		-- Polarity			=> '0',
		-- DelayLen			=> 0,--(15+1)+(1 Idle)=16(delay)
		-- DelayCntWidth	=> 1,		
		-- Phase1Len		=> 1,	--Phase1:(0+1)=1
		-- Phase1CntWidth	=> 1,		
		-- Phase2Len		=> 0,	--Phase2:(0+1)=1
		-- Phase2CntWidth	=> 1,		
		-- CycNum1			=> 1023,
		-- CycNum2			=> 1023,		--
		-- CycCntWidth		=> 10
	-- )
	-- port map
	-- (
		-- SysRst_n		=> SysRst_n,
		-- SysClk		=> SysClk,
		-- ClkEn			=> '1',
		-- WaveGenEn	=> RowReadOutEn,
		-- WFO			=> Clock_X,
		-- CycNumSel	=> ImageOrQl,
		-- WaveRdy		=> LineReadOutOk		
	-- );
	
	Wave_NoRowSel: WaveGenSingle
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '0',
		DelayLen			=> 0,		--(0+1)+(1 Idle)=2(delay)
		DelayCntWidth	=> 1,		
		Phase1Len		=> 3,		--Phase1:(3+1)=4
		Phase1CntWidth	=> 2,		
		Phase2Len		=> 0,		--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum			=> 0,		--0	
		CycCntWidth		=> 1		
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> RowReadOutEn,
		WFO			=> NoRowSel,
		WaveRdy		=> open		
	);	

	Wave_Pre_co: WaveGenSingle
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '1',
		DelayLen			=> 0,		--(0+1)+(1 Idle)=2(delay)
		DelayCntWidth	=> 1,		
		Phase1Len		=> 3,		--Phase1:(3+1)=4
		Phase1CntWidth	=> 2,		
		Phase2Len		=> 0,		--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum			=> 0,		--0	
		CycCntWidth		=> 1		
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> RowReadOutEn,
		WFO			=> Pre_co,
		WaveRdy		=> open		
	);

	Wave_Sh_co: WaveGenSingle
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '1',
		DelayLen			=> 0,		--(0+1)+(1 Idle)=2(delay)
		DelayCntWidth	=> 1,		
		Phase1Len		=> 15,	--Phase1:(13+1)=14
		Phase1CntWidth	=> 5,		
		Phase2Len		=> 0,		--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum			=> 0,		--0	
		CycCntWidth		=> 1		
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> RowReadOutEn,
		WFO			=> Sh_co,
		WaveRdy		=> open		
	);

	Wave_Sync_X: WaveGenSingle
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '0',
		DelayLen			=> 16,	--(14+1)+(1 Idle)=16(delay)
		DelayCntWidth	=> 5,		
		Phase1Len		=> 1,		--Phase1:(1+1)=2
		Phase1CntWidth	=> 1,		
		Phase2Len		=> 0,		--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum			=> 0,		--0	
		CycCntWidth		=> 1		
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> RowReadOutEn,
		WFO			=> Sync_X,
		WaveRdy		=> open		
	);

	Wave_Clock_X: WaveGenSinglewithCycNumSel
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '0',
		DelayLen			=> 17,--(15+1)+(1 Idle)=16(delay)-- @2014/5/8 add 2 dlys
		DelayCntWidth	=> 5,		
		Phase1Len		=> 0,	--Phase1:(0+1)=1
		Phase1CntWidth	=> 1,		
		Phase2Len		=> 0,	--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum1			=> 1023,
		CycNum2			=> 1023,		--
		CycCntWidth		=> 10
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> RowReadOutEn,
		WFO			=> Clock_X,
		CycNumSel	=> ImageOrQl,
		WaveRdy		=> LineReadOutOk		
	);
    ADC_Clock_EN: WaveGenSingle
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '0',
		DelayLen			=> 16,--(15+1)+(1 Idle)=16(delay) --15 modified @11/13 18:19 --@2014/5/8 add 2 dlys
		DelayCntWidth	=> 5,		
		Phase1Len		=> 2052,	
		Phase1CntWidth	=> 12,		
		Phase2Len		=> 0,	--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum			=> 0,	
		CycCntWidth		=> 1
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> RowReadOutEn,
		WFO			=> AdcCLkEn,
		WaveRdy		=> open		
	);
    ADC_RdENGen: WaveGenSingle
	--Len => N (in fact N+1);
	--CntWidth => N (N-1 downto 0)	
	generic map
	(
		Polarity			=> '0',
		DelayLen			=> 21,--@2014/5/8 add 2 dlys
		DelayCntWidth	=> 5,		
		Phase1Len		=> 2047,	--Phase1:2047 modified @11/14 
		Phase1CntWidth	=> 12,		
		Phase2Len		=> 0,	--Phase2:(0+1)=1
		Phase2CntWidth	=> 1,		
		CycNum			=> 0,	
		CycCntWidth		=> 1
	)
	port map
	(
		SysRst_n		=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn			=> '1',
		WaveGenEn	=> RowReadOutEn,
		WFO			=> Adc_RdEn_inter,
		WaveRdy		=> open		
	);
end Behavioral;