-- Main_ctl4SD.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-------------------------------------------------
entity Main_ctl4SD is     
	port
		(
			Sysclk 		:in 	std_logic;
            sysrst_n	:in 	std_logic;
			SDramEn		:in		std_logic;  --有此信号产生对FIFO预读到adder的使能信号
			LVDS_en		:in		std_logic;
			Adc_en		:in		std_logic; --对应cmos_ctl的adc_rdEN
			LVDSRdOk	:in		std_logic;
			Data_fifoIN	:in		std_logic_vector(71 downto 0);
			Data_AccIn	:in		std_logic_vector(71 downto 0);
			Data2ACC	:out	std_logic_vector(71 downto 0);
			Data2Fifo	:out	std_logic_vector(71 downto 0);
			LVDS_data	:out	std_logic_vector(71 downto 0);
			fifo_rd		:out	std_logic;
			fifo_rst_n	:out	std_logic;	
			
			ByteRdEn	:out	std_logic;
			Fifo_wr		:out	std_logic
			--Rowcnt		:out	std_logic_vector(11 downto 0)
		);
end entity;

architecture behavioral of Main_ctl4SD is 
signal FifoRowRdOut			:	std_logic;
signal Data2accEn			: 	std_logic;
--signal Data2fifoEN			:	std_logic;
signal Data2frameEn			:	std_logic;
signal intData2acc			:	std_logic_vector(71 downto 0);
signal latch4acc			:	std_logic_vector(53 downto 0);
signal notfirstFrame		:	std_logic;
signal sdramENReg			:	std_logic;
signal latch_en				:	std_logic;
--signal latch_data			:	std_logic_vector(71 downto 0);
signal ChSel,addSel			:	std_logic_vector(1 downto 0);
--signal Rowrdout_reg			:	std_logic;
signal FifoRowRdOk			:	std_logic;
signal lvds_fifoRd			:	std_logic;
signal interFifo_rd			:	std_logic;
signal InterLVDSRdOk		:	std_logic;
signal lvdsFifoRowRdOut		:	std_logic;	
--signal rowcnt_reg			:	std_logic_vector(10 downto 0);
--signal	test_data			:	std_logic_vector(71 downto 0);
component WaveGenSingle is
		generic(
				Polarity		:std_logic	:= '0';
				DelayLen		:integer	:= 15;
				DelayCntWidth	:integer	:= 4;
				Phase1Len		:integer	:= 0;
				Phase1CntWidth	:integer	:= 1;
				Phase2Len		:integer	:= 0;
				Phase2CntWidth	:integer	:= 1;
				CycNum			:integer	:= 10;
				CycCntWidth		:integer	:= 4
				);	
		port(
				SysRst_n		:in  std_logic;
				SysClk			:in  std_logic;
				ClkEn			:in  std_logic;
				WaveGenEn		:in  std_logic;
				WFO				:out std_logic;	--WaveForm Output
				WaveRdy			:out std_logic
			);
end component;
begin
-- Data2ACC <= intData2acc when (notfirstFrame = '1' and FifoRowRdOut = '1') else
            -- (others  => '0') ;

fifo_rd <= lvds_fifoRd or interfifo_rd;

--LvdsRdOk <= InterLVDSRdOk;

process(sysclk,sysrst_n)
begin	
	if(sysrst_n = '0')then
		IntData2ACC  <= (others => '0');
		Data2Fifo <= (others => '0');
		fifo_rst_n <= '0';	
		LVDS_data <= (others  => '0');
		notfirstFrame <= '0';
		sdramENReg <= '0';
		--latch_data <= (others => '0');
		latch4acc <= (others => '0');
	--	rowcnt_reg <= (others => '0');
		Data2ACC <= (others  => '0');
	--	Test_data <= X"007727777777477278";
	elsif rising_edge(sysclk) then	
		fifo_rst_n <= '0';		
		if(SDramEn = '1')then
			fifo_rst_n <= '1';	
			sdramENReg <= SdramEN;
			if (Data2accEn = '1')then
				latch4acc <= Data_fifoIN(71 downto 18);--X"007727777777477278";	-
				intData2ACC(17 downto 0) <= Data_fifoIn(17 downto 0);	 ------		
			end if;
			-- if (Data2fifoEN = '1')then
				-- Data2Fifo <= latch_data;
			-- end if;
			if (notfirstFrame = '1' and FifoRowRdOut = '1') then	
				case addSel is
					when "00" =>
						Data2ACC(17 downto 0) <= intData2acc(17 downto 0);
						intData2ACC(35 downto 18) <= latch4acc(17 downto 0);--intData2ACC(17 downto 0) <= Data_fifoIn(17 downto 0);
					when "01" =>
						Data2ACC(35 downto 18) <= intData2acc(35 downto 18);
						intData2ACC(53 downto 36) <= latch4acc(35 downto 18);--"000000000000000101";--
					when "10" =>
						Data2ACC(53 downto 36) <= intData2acc(53 downto 36);
						intData2ACC(71 downto 54) <= latch4acc(53 downto 36);--"000000000000000110";--
					when "11" =>
						Data2ACC(71 downto 54) <= intData2acc(71 downto 54);--(71 downto 54);--"000000000000000111";--
					when others =>
						intData2ACC <= (others => '0');
						Data2ACC <= (others  => '0');
				end case;
			else 
				Data2ACC <= (others  => '0');
			end if;
			
			case ChSel is
				when "00" =>
					Data2Fifo(17 downto 0) <= Data_AccIn(17 downto 0);--"000000000000000100";
				when "01" =>
					Data2Fifo(35 downto 18) <= Data_accIn(35 downto 18);--"000000000000000101";
				when "10" =>
					Data2Fifo(53 downto 36) <= Data_accIn(53 downto 36);--"000000000000000110";
				when "11" =>
					Data2Fifo(71 downto 54) <= Data_accIn(71 downto 54);--latch_data(71 downto 54) <= Data_accIn(71 downto 54);
				when others =>
					Data2Fifo <= (others => '0');
			end case;
		else sdramENReg <= '0';
		end if;
		if(lvds_en ='1' )then
			fifo_rst_n <= '1';
			
			--Rowrdout_reg <= lvdsFifoRowRdOut;		
			if(Data2frameEn ='1')then	
				LVDS_data <= Data_fifoIN;--Test_data;----X"0000000000000000"&test_data;
				--Test_data <= not test_data ;----X"000000000000000002";--Data_fifoIN;
			end if;	
			-- if Rowrdout_reg = '1' and lvdsFifoRowRdOut = '0' then
				-- Rowcnt <= '0' & rowcnt_reg;
				-- rowcnt_reg  <= rowcnt_reg + 1;
			-- end if;	
		-- else 
			-- Rowcnt <= (others  =>  '0');
			-- rowcnt_reg <= (others => '0');
			-- Rowrdout_reg <= '0';
		end if;	
		if(sdramENReg = '1' and SDramEn ='0')then
			notfirstFrame  <= '1';
		end if;		
		if(LVDSRdOk = '1')then
			notfirstFrame  <= '0';
		end if;	
	end if;	
end process;	

process(Sysclk,sysrst_n)
	begin
		if(sysrst_n = '0') then
			ChSel <= "00";
			addSel <= "00";
		elsif rising_edge(sysclk) then
			if (latch_en = '0') then
				ChSel <= "00";
			else
				ChSel <= ChSel + 1;
			end if;
			if (ADC_en = '0') then
				addSel <= "00";
			else
				addSel <= addSel + 1;
			end if;
		end if;
	end process;

-- fifo_reGEn:process(Sysclk,sysrst_n)
		-- begin
			-- if(sysrst_n = '0') then
				-- Rdcyc <= "00";
				-- fifo_rd <= '0';
				-- FM_Rdcyc <= (others => '0');
			-- elsif rising_edge(sysclk) then
				-- if (SDramEn = '1' and adc_en = '1' and FifoRowRdOut = '0') then
					-- Rdcyc <= "00";
				-- elsif(SDramEn = '1' and adc_en = '1' and rdcyc = "00") then
					-- fifo_rd <= '1';
					-- Rdcyc <= Rdcyc + 1;
				-- else 
					-- fifo_rd <= '0';
					-- Rdcyc <= Rdcyc + 1;
				-- end if;
				-- if(lvds_en ='1'and frame_req ='1'and FifoRowRdOut = '0')then
					-- FM_Rdcyc <= (others => '0');
				-- elsif(lvds_en ='1'and frame_req ='1')then
					-- FM_Rdcyc <= FM_Rdcyc + 1;
					-- if(FM_Rdcyc ="100")then
						-- fifo_rd <= '1';
					-- else
						-- fifo_rd <= '0';
					-- end if;
				-- end if;	
			-- end if;	
				
		-- end process;
FifoRowRdOutGen: wavegensingle generic map --
	(
		Polarity  => '0',
		DelayLen => 16,		--原为15
		DelayCntWidth => 5, 
		Phase1Len	 => 2057,--2058
		Phase1CntWidth	 => 12, 
		Phase2Len		 => 16,  --15  --@2014/5/12 change to 16
		Phase2CntWidth	 => 5,
		CycNum			 => 2047, --2048
		CycCntWidth		 => 12
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> SDramEn,
		WFO			=> FifoRowRdOut,
		WaveRdy		=> open		
	);	
fifo_rdGen: wavegensingle generic map
	(
		Polarity  => '0',
		DelayLen => 0,		
		DelayCntWidth => 1, 
		Phase1Len	 => 0,
		Phase1CntWidth	 => 1, 
		Phase2Len		 => 2,
		Phase2CntWidth	 => 2,
		CycNum			 => 511, --512
		CycCntWidth		 => 10
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> FifoRowRdOut,
		WFO			=> interfifo_rd,
		WaveRdy		=> open		
	);
fifo_wrGen:	wavegensingle generic map
	(
		Polarity  => '0',
		DelayLen => 10,  --原11		
		DelayCntWidth => 4, 
		Phase1Len	 => 0	,
		Phase1CntWidth	 => 1, 
		Phase2Len		 => 2,
		Phase2CntWidth	 => 2,
		CycNum			 => 511,
		CycCntWidth		 => 10
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> FifoRowRdOut,
		WFO			=> fifo_wr,
		WaveRdy		=> FifoRowRdOk		
	);
Data2accEnGen:wavegensingle generic map
	(
		Polarity  => '0',
		DelayLen => 2,		
		DelayCntWidth => 2, 
		Phase1Len	 => 0	,
		Phase1CntWidth	 => 1, 
		Phase2Len		 => 2,
		Phase2CntWidth	 => 2,
		CycNum			 => 511,
		CycCntWidth		 => 10
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> FifoRowRdOut,
		WFO			=> Data2accEn,
		WaveRdy		=> open		
	);
-- Data2fifoENGen: wavegensingle generic map
	-- (
		-- Polarity  => '0',
		-- DelayLen => 10,		
		-- DelayCntWidth => 4, 
		-- Phase1Len	 => 0	,
		-- Phase1CntWidth	 => 1, 
		-- Phase2Len		 => 2,
		-- Phase2CntWidth	 => 2,
		-- CycNum			 => 511,
		-- CycCntWidth		 => 10
	-- )
	-- port map
	-- (
		-- SysRst_n	=> SysRst_n,
		-- SysClk		=> SysClk,
		-- ClkEn		=> '1',
		-- WaveGenEn	=> FifoRowRdOut,
		-- WFO			=> Data2fifoEN,
		-- WaveRdy		=> open		
	-- );	
-- Data2frameENGen:wavegensingle generic map
	-- (
		-- Polarity  => '0',
		-- DelayLen => 4,		
		-- DelayCntWidth => 3, 
		-- Phase1Len	 => 0	,
		-- Phase1CntWidth	 => 1, 
		-- Phase2Len		 => 6,
		-- Phase2CntWidth	 => 3,
		-- CycNum			 => 2048*2048,
		-- CycCntWidth		 => 24
	-- )
	-- port map
	-- (
		-- SysRst_n	=> SysRst_n,
		-- SysClk		=> SysClk,
		-- ClkEn		=> '1',
		-- WaveGenEn	=> FifoRowRdOut,
		-- WFO			=> Data2frameEn,
		-- WaveRdy		=> open		
	-- );	
latchGen: wavegensingle generic map --
	(
		Polarity  => '0',
		DelayLen => 6,		
		DelayCntWidth => 3, 
		Phase1Len	 => 2047,
		Phase1CntWidth	 => 12, 
		Phase2Len		 => 0,
		Phase2CntWidth	 => 1,
		CycNum			 => 0,
		CycCntWidth		 => 1
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> FifoRowRdOut,
		WFO			=> latch_en,
		WaveRdy		=> open		
	);	
-------------------------------------LVDS_part-----------------------------------
---------------------------------------------------------------------------------	
lvdsFifoRowRdOutEnGen: wavegensingle generic map --
	(
		Polarity  => '0',
		DelayLen => 0,		
		DelayCntWidth => 1, 
		Phase1Len	 => 3609,--3584+26 consider latency of ByteRdout
		Phase1CntWidth	 => 12, 
		Phase2Len		 => 32489,  --大约35840-3610+10head*10+8wait*10
		Phase2CntWidth	 => 16,
		CycNum			 => 2047, --2048
		CycCntWidth		 => 12
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> LVDS_En,
		WFO			=> lvdsFifoRowRdOut,
		WaveRdy		=> open		
	);		
lvds_fifoRdGen: wavegensingle generic map --
	(
		Polarity  => '0',
		DelayLen => 16,		
		DelayCntWidth => 5, 
		Phase1Len	 => 0,
		Phase1CntWidth	 => 1, 
		Phase2Len		 => 5,
		Phase2CntWidth	 => 3,
		CycNum			 => 511, 
		CycCntWidth		 => 10
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> lvdsFifoRowRdOut,
		WFO			=> lvds_fifoRd,
		WaveRdy		=> open		
	);	
data2lvdsENGen:wavegensingle generic map
	(
		Polarity  => '0',
		DelayLen => 18,		
		DelayCntWidth => 5, 
		Phase1Len	 => 0	,
		Phase1CntWidth	 => 1, 
		Phase2Len		 => 5,
		Phase2CntWidth	 => 3,
		CycNum			 => 511,
		CycCntWidth		 => 10
	)
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		ClkEn		=> '1',
		WaveGenEn	=> lvdsFifoRowRdOut,
		WFO			=> Data2frameEn,
		WaveRdy		=> InterLVDSRdOk	
	);	
byteRdEnGen: wavegensingle
		generic map(
				Polarity => '0',
				DelayLen => 19,
				DelayCntWidth => 5,
				Phase1Len => 3583,
				Phase1CntWidth => 12,
				Phase2Len => 0,
				Phase2CntWidth => 1,
				CycNum => 0,
				CycCntWidth => 1
				)
		port map(
				SysRst_n => Sysrst_n,
				SysClk	 => SYSclk,
				ClkEn	 => '1',
				WaveGenEn => lvdsFifoRowRdOut,
				WFO		 => ByteRdEn,--WaveForm Output
				WaveRdy	 => open
			);		
end behavioral;