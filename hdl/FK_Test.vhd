-- FK_Test.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FK_Test is port
	(
		SysClk			:in		std_logic;
		SysRst_n        :in		std_logic;
		LVDS_en			:in		std_logic; --active high, enable FK_Test module
		ByteRdEn		:in		std_logic; --active high, dly one sysclk used as signal for fifo control WE 
		SDram2FK		:in		std_logic_vector(71 downto 0);
		PKGType			:in		std_logic_vector(2 downto 0);
		PKGCnt			:in		std_logic_vector(15 downto 0);
		FrameCnt		:in		std_logic_vector(8 downto 0);
		SubFrameMode	:in		std_logic_vector(1 downto 0);
		SubFrameMotor	:in		std_logic_vector(5 downto 0);
		BandNum			:in		std_logic_vector(3 downto 0);
		IntTime			:in		std_logic_vector(5 downto 0);
		AccNum			:in		std_logic_vector(5 downto 0);
		RowCnt			:in		std_logic_vector(11 downto 0);
		PKGDataLength	:in		std_logic_vector(15 downto 0);
		LVDS_O			:out	std_logic;
	--	tok				:out	std_logic;
		LVDS_ok			:out	std_logic  --answer LVDS_en
	);
end entity;
architecture behav of FK_Test is 
type state is (FK_idle, FK_SOF, FK_head, Fk_data, FK_CRC, FK_EOF, FK_wait, FK_OK);
signal Prstate, Nxstate : 		state;
type	FH_ARRAY	is 	array (0 to 9) of std_logic_vector(7 downto 0);
signal	FrameHead		:		FH_ARRAY;
signal 	ValiData		:		std_logic_vector(55 downto 0); --data 72 to 56 transfer register 
--signal 	AccSel			:		std_logic_vector(2 downto 0);--according to accnum select which 14 bits is valid data
signal	CRC_Reg			:		std_logic_vector(39 downto 0);--power of CRC32 plus 8 bits data
constant	CRC_POLY	:		std_logic_vector(31 downto 0) := X"04C11DB7";--CRC-32 generator 
signal 	ByteSel			:		std_logic_vector(2 downto 0);-- which 8 bits select signal 
signal  data_reg		:		std_logic_vector(7 downto 0);-- 8 bits register, fifo datain
signal	DataClkCnt		:		std_logic_vector(11 downto 0);--count data clk
constant Dataneedclk	:		std_logic_vector(11 downto 0) := "110111111111"; --7*512-1
signal 	DataOk			:		std_logic;-- valid data read out ok
signal	ClkDivCnt		:		std_logic_vector(3 downto 0);	--divide clk cnt
signal	ClkEn			:		std_logic;--6.6M clk
signal	Fifo_dout		:		std_logic_vector(7 downto 0);--fifo Fifo_dout
signal	WE,RE  			:		std_logic; --fifo control
signal	CRC_ResultAva	:		std_logic;-- crc result availible
signal	ByteDout		:		std_logic_vector(7 downto 0);--framemake data out
signal	TenbitDout		:		std_logic_vector(9 downto 0);--10 bit TenbitDout
signal	Shifter			:		std_logic_vector(9 downto 0);-- paraller to serial register
signal	PtS_En 			:		std_logic;--Parallel to Serial Enable
signal	DelayCnt		:		integer range 0 to 10;	
signal	Kin_Delay1		:		std_logic;
signal	Kin_Delay2		:		std_logic;
signal	Kin_Delay3		:		std_logic;
signal	Kin_Delay4		:		std_logic;
signal	StepCnt			:		std_logic_vector(3 downto 0);
signal	Din_Delay1		:		std_logic_vector(7 downto 0);
signal	Din_Delay2		:		std_logic_vector(7 downto 0);
signal	Din_Delay3		:		std_logic_vector(7 downto 0);
signal	Din_Delay4		:		std_logic_vector(7 downto 0);	
signal	Din_8b10b		:		std_logic_vector(7 downto 0);	
signal	Kin				:		std_logic;
signal	REen			:		std_logic;
signal	Bit_En			:		std_logic;
--signal  accnum			:		std_logic_vector(5 downto 0);
component ByteData is 
    port( DATA : in std_logic_vector(7 downto 0); Q : out 
        std_logic_vector(7 downto 0);WE, RE, CLK : in std_logic;  
        FULL, EMPTY : out std_logic;  RESET : in std_logic) ;
end component;
component enc_8b10b is	
    port(
		RESET : in std_logic ;		-- Global asynchronous reset (active low) 
		SBYTECLK : in std_logic ;
		bit_en	:in std_logic;	-- Master synchronous send byte clock
		KI : in std_logic ;			-- Control (K) input(active high)
		AI, BI, CI, DI, EI, FI, GI, HI : in std_logic ;	-- Unencoded input data
		JO, HO, GO, FO, IO, EO, DO, CO, BO, AO : out std_logic 	-- Encoded out 
	    );
end component;
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
--accnum <= (others  => '0');
GenFIFO_Byte: ByteData port map 
		(
		DATA => data_reg, 
		Q => Fifo_dout, 
		WE => WE,
		RE => RE,
		Clk => SysClk, 
        FULL => open,
		EMPTY => open,
		RESET => Lvds_en		
		);
REGEN: wavegensingle generic map(
				Polarity	 =>  '0',
				DelayLen	 =>  94,
				DelayCntWidth	 => 7,
				Phase1Len		 => 0,
				Phase1CntWidth	 => 1,
				Phase2Len		 => 8,
				Phase2CntWidth	 => 4,
				CycNum			 => 3583,
				CycCntWidth		 => 12
				)
		port map(
				SysRst_n	 => SysRst_n,
				SysClk		 => SysClk,
				ClkEn		 => '1',
				WaveGenEn	 => REen,
				WFO			 => RE,
				WaveRdy		 => open
				);	
	--FrameHead
	FrameHead(0)(7 downto 5) <= PKGType;
	FrameHead(0)(4 downto 0) <= PKGCnt(15 downto 11);		
	FrameHead(1)(7 downto 0) <= PKGCnt(10 downto 3);
	FrameHead(2)(7 downto 5) <= PKGCnt(2 downto 0);
	FrameHead(2)(4 downto 0) <= FrameCnt(8 downto 4);
	FrameHead(3)(7 downto 4) <= FrameCnt(3 downto 0);
	FrameHead(3)(3 downto 2) <= SubFrameMode;
	FrameHead(3)(1 downto 0) <= SubFrameMotor(5 downto 4);
	FrameHead(4)(7 downto 4) <= SubFrameMotor(3 downto 0);
	FrameHead(4)(3 downto 0) <= BandNum;
	FrameHead(5)(7 downto 2) <= IntTime;
	FrameHead(5)(1 downto 0) <= AccNum(5 downto 4);
	FrameHead(6)(7 downto 4) <= AccNum(3 downto 0);
	FrameHead(6)(3 downto 0) <= RowCnt(11 downto 8);
	FrameHead(7) <= RowCnt(7 downto 0); 
	FrameHead(8) <= PKGDataLength(15 downto 8);
	FrameHead(9) <= PKGDataLength(7 downto 0);
------------------------------------------------------------------------	
--judge which 14bits to be select for transfer,72to56bits	
------------------------------------------------------------------------
	-- process(Sysclk, Sysrst_n)
	-- begin
		-- if SysRst_n = '0' then
			-- AccSel  <=  (others => '1');
		-- elsif rising_edge(SysClk) then
				-- if accnum(0) = '0' then   -- accnum should only be 000000,000001,000011,000111, 001111 
					-- AccSel  <=  "000"; --fourteen;
				-- elsif accnum(1) = '0' then
					-- AccSel  <=  "001"; --fifteen;
				-- elsif accnum(2) = '0' then
					-- AccSel  <=  "010";--sixteen;
				-- elsif accnum(3) = '0' then
					-- AccSel  <=  "011";--seventeen;
				-- elsif accnum(4) = '0' then
					-- AccSel  <=  "100";--eighteen;
				-- else 	
					-- null;
				-- end if;
		-- end if;
	-- end process;
	process(accnum,SDram2FK)
	begin
		case accnum(3 downto 0) is 
		when "0000" => ValiData(13 downto 0) <= SDram2FK(13 downto 0);
						 ValiData(27 downto 14) <= Sdram2Fk(31 downto 18);
						 ValiData(41 downto 28) <= SDram2Fk(49 downto 36);
						 ValiData(55 downto 42) <= SDram2Fk(67 downto 54);	
		when "0001" => ValiData(13 downto 0) <= Sdram2Fk(14 downto 1);
						 ValiData(27 downto 14) <= Sdram2Fk(32 downto 19);
						 ValiData(41 downto 28) <= SDram2Fk(50 downto 37);
						 ValiData(55 downto 42) <= SDram2Fk(68 downto 55);	
		when "0011" => ValiData(13 downto 0) <= Sdram2Fk(15 downto 2);
						 ValiData(27 downto 14) <= Sdram2Fk(33 downto 20);
						 ValiData(41 downto 28) <= SDram2Fk(51 downto 38);
						 ValiData(55 downto 42) <= SDram2Fk(69 downto 56);		
		when "0111" => ValiData(13 downto 0) <= Sdram2Fk(16 downto 3);
						 ValiData(27 downto 14) <= Sdram2Fk(34 downto 21);
						 ValiData(41 downto 28) <= SDram2Fk(52 downto 39);
						 ValiData(55 downto 42) <= SDram2Fk(70 downto 57);	
		when "1111" => ValiData(13 downto 0) <= Sdram2Fk(17 downto 4);
						 ValiData(27 downto 14) <= Sdram2Fk(35 downto 22);
						 ValiData(41 downto 28) <= SDram2Fk(53 downto 40);
						 ValiData(55 downto 42) <= SDram2Fk(71 downto 58);	
		when others => 	 ValiData(13 downto 0) <= SDram2FK(13 downto 0);
						 ValiData(27 downto 14) <= Sdram2Fk(31 downto 18);
						 ValiData(41 downto 28) <= SDram2Fk(49 downto 36);
						 ValiData(55 downto 42) <= SDram2Fk(67 downto 54);	
		end case;				
		
	end process;	
-----------------------------------------------------------------
--56to8 bits
-----------------------------------------------------------------	
	process(Sysclk, Sysrst_n)
	begin
		if SysRst_n = '0' then
			data_reg <= (others => '0');
		elsif rising_edge(SysClk) then
			-- case AccSel is
			-- when "000" =>	ValiData(13 downto 0) <= SDram2FK(13 downto 0);
							-- ValiData(27 downto 14) <= Sdram2Fk(31 downto 18);
							-- ValiData(41 downto 28) <= SDram2Fk(49 downto 36);
							-- ValiData(55 downto 42) <= SDram2Fk(67 downto 54);									
			-- when "001" => 	ValiData(13 downto 0) <= Sdram2Fk(14 downto 1);
							-- ValiData(27 downto 14) <= Sdram2Fk(32 downto 19);
							-- ValiData(41 downto 28) <= SDram2Fk(50 downto 37);
							-- ValiData(55 downto 42) <= SDram2Fk(68 downto 55);
			-- when "010" => 	ValiData(13 downto 0) <= Sdram2Fk(15 downto 2);
							-- ValiData(27 downto 14) <= Sdram2Fk(33 downto 20);
							-- ValiData(41 downto 28) <= SDram2Fk(51 downto 38);
							-- ValiData(55 downto 42) <= SDram2Fk(69 downto 56);
			-- when "011" => 	ValiData(13 downto 0) <= Sdram2Fk(16 downto 3);
							-- ValiData(27 downto 14) <= Sdram2Fk(34 downto 21);
							-- ValiData(41 downto 28) <= SDram2Fk(52 downto 39);
							-- ValiData(55 downto 42) <= SDram2Fk(70 downto 57);		
			-- when "100" => 	ValiData(13 downto 0) <= Sdram2Fk(17 downto 4);
							-- ValiData(27 downto 14) <= Sdram2Fk(35 downto 22);
							-- ValiData(41 downto 28) <= SDram2Fk(53 downto 40);
							-- ValiData(55 downto 42) <= SDram2Fk(71 downto 58);	
			-- when others => 	ValiData <= (others => '0');			
			-- end case;
			case ByteSel is
				when "000" =>
					data_reg <= ValiData(7 downto 0);
				when "001" =>
					data_reg <= ValiData(15 downto 8);
				when "010" =>
					data_reg <= ValiData(23 downto 16);
				when "011" =>
					data_reg <= ValiData(31 downto 24);
				when "100" => 
					data_reg <= ValiData(39 downto 32);
				when "101" => 
					data_reg <= ValiData(47 downto 40);	
				when "110" => 
					data_reg <= ValiData(55 downto 48);		
				when others =>
					data_reg <= (others => '0');
			end case;	
		end if;	
	end process;	
-----------------------------------------------------------------
--wr2fifo
-----------------------------------------------------------------	
	process(Sysclk, Sysrst_n)
	begin
		if SysRst_n = '0' then
			ByteSel <= "000";
			WE <= '0';
		elsif rising_edge(SysClk) then
			if (ByteRdEn = '0') then
				ByteSel <= "000";
				WE <= '0';
			else
				WE <= '1';
				ByteSel <= ByteSel + 1;
				if (ByteSel = "110")then
					ByteSel <= (others => '0');
				end if;
			end if;
		end if;	
	end process;
---------------------------------------------------------------------	
--66M/10 = 6.6M	
---------------------------------------------------------------------
	process(SysRst_n,Sysclk)
	begin
		if SysRst_n = '0' then
			ClkEn <= '0';
			ClkDivCnt <= (others => '0');
			PtS_En <= '0';
			Bit_En <= '0';
		elsif rising_edge(Sysclk) then
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
			if ClkDivCnt = 5 then
				Bit_En <= '1';
			else
				Bit_En <= '0';
			end if;		
		end if;
	end process;
	
	--State Transition
	process(SysClk,SysRst_n) 
	begin
		if SysRst_n = '0' then
			PrState <= FK_idle;
		elsif rising_edge(SysClk) then
			if Lvds_en = '0' then
				PrState <= FK_idle;
			elsif clken ='1'then
				PrState <= NxState;
			end if;
		end if;
	end process;

	--State Jumping
	process(PrState,DelayCnt,DataOk) 
	begin
		case PrState is
			when FK_idle =>
				NxState <= FK_SOF;
			when FK_SOF =>
				NxState <= FK_Head;
			when FK_Head =>
				if DelayCnt = 9 then
					NxState <= FK_Data;
				else
					NxState <= FK_Head;
				end if;
			when FK_Data =>
				if DataOk = '1' then
					NxState <= FK_CRC;
				else
					NxState <= FK_Data;
				end if;
			when FK_CRC =>
				if DelayCnt = 3 then
					NxState <= FK_EOF;
				else
					NxState <= FK_CRC;
				end if;
			when FK_EOF =>
				NxState <= FK_wait;
			when FK_wait =>
				if DelayCnt = 7 then
					NxState <= FK_OK;
				else
					NxState <= FK_wait;
				end if;
			when FK_OK =>
				NxState <= FK_idle;
			when others =>
				NxState <= FK_idle;
		end case;
	end process;

	--State Output
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			DelayCnt <= 0;
			DataCLkCnt <= (others => '0');
			DataOk <= '0';
			CRC_ResultAva <= '0';
			LVDS_OK <= '0';
			REen <= '0';
			ByteDout <= X"BC";	
			Kin <=	'1';
			--tok <= '0';
		elsif rising_edge(SysClk) then
			
			if ClkEn = '1' then
				DataOk <= '0';
				DataCLkCnt <= (others => '0');
				DelayCnt <= 0;
				LVDS_OK <= '0';
				Kin <=	'1';
				--tok <= '0';
			case PrState is
				when FK_idle =>
					REen <= '0';
					CRC_ResultAva <= '0';
				when FK_SOF =>
					ByteDout <= X"FD" ;	
				--	tok <= '1';
				when FK_Head =>
					DelayCnt <= DelayCnt + 1;
					REen <= '1';
					ByteDout <= FrameHead(DelayCnt); 	
					Kin <=	'0';
				when FK_Data =>
					if DataCLkCnt = DataneedClk then --10*3584clk
						DataOk <= '1';
					else
						DataCLkCnt <= DataCLkCnt + 1;
					end if;
					ByteDout <= Fifo_dout;
					Kin <=	'0';
				when FK_CRC =>
					REen <= '0';
					ByteDout <= X"00";
					DelayCnt <= DelayCnt + 1;
					if DelayCnt = 3 then
						CRC_ResultAva <= '1';
					end if;
					Kin <=	'0';
				when FK_EOF =>
					ByteDout <= X"FB";
				when FK_Wait =>
					ByteDout <= X"BC";	
					DelayCnt <= DelayCnt + 1;
					if DelayCnt = 2 then
						CRC_ResultAva <= '0';
					end if;
				when FK_OK =>
					ByteDout <= X"BC";	
					if RowCnt >= "011111111111"then
						LVDS_OK <= '1';  --should feed back to cmos_ctl
					end if;	
				when others =>
					CRC_ResultAva <= '0';
					ByteDout <= X"BC";	
			end case;
			end if;
		end if;
	end process;	
	--CRC-32;
	process(Sysclk,SysRst_n) 
	begin
		if SysRst_n = '0' then
			StepCnt <= "1000";	--8;
			CRC_Reg <= (others => '0');
		elsif rising_edge(Sysclk) then
			if LVDS_en = '0' then
				StepCnt <= "1000";	--8;
				CRC_Reg <= (others => '0');				
			else
				if ClkEn = '1' then
					if PrState = FK_Head or PrState = FK_Data or PrState = FK_CRC then
						StepCnt <= "0000";
						CRC_Reg(7 downto 0) <= ByteDout;
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
	--8bits out
	-- ByteDout <= X"FD" 				when PrState = FK_SOF else		--K29.7
				-- FrameHead(DelayCnt)	when PrState = FK_HEAD else
				-- Fifo_dout 			when PrState = FK_DATA else
				-- X"00"				when PrState = FK_CRC else		--to add 32bits of '0' at the end of Data;
				-- X"FB"				when PrState = Fk_EOF else		--K27.7
				-- X"BC";												--K28.5
	-- Kin
	-- Kin <=	'0'	when (PrState = FK_HEAD or PrState = FK_DATA or PrState = FK_CRC) else
			-- '1';	
			
----------------------------------------------------------
--Delay 4 Bytes
----------------------------------------------------------
	process(SysRst_n,Sysclk) 
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
		elsif rising_edge(Sysclk) then
			if ClkEn = '1' then
				Kin_Delay1 <= Kin;
				Kin_Delay2 <= Kin_Delay1;
				Kin_Delay3 <= Kin_Delay2;
				Kin_Delay4 <= Kin_Delay3;
				Din_Delay1 <= ByteDout;
				Din_Delay2 <= Din_Delay1;
				Din_Delay3 <= Din_Delay2;
				Din_Delay4 <= Din_Delay3;
			end if;
		end if;
	end process;	
-------------------------------------------------------------------
--8b10b
-------------------------------------------------------------------	
Com_8b10b: enc_8b10b port map	
		(
		RESET => Sysrst_n,		 
		SBYTECLK => sysclk,
		Bit_en  => Bit_en,	
		KI => Kin_Delay4,			-- Control (K) input(active high)
		AI => Din_8b10b(0), BI => Din_8b10b(1), CI => Din_8b10b(2),
		DI => Din_8b10b(3), EI => Din_8b10b(4), FI => Din_8b10b(5),
		GI => Din_8b10b(6), HI => Din_8b10b(7),	-- Unencoded input data
		JO => TenbitDout(9), HO => TenbitDout(8), GO => TenbitDout(7), FO => TenbitDout(6),
		IO => TenbitDout(5), EO => TenbitDout(4), DO => TenbitDout(3), CO => TenbitDout(2),
		BO => TenbitDout(1), AO => TenbitDout(0)  
	    );	
		Din_8b10b <= Din_Delay4 when CRC_ResultAva = '0' else
					CRC_Reg(39 downto 32);
------------------------------------------------------------------
--LVDS
------------------------------------------------------------------					
	process(Sysclk,SysRst_n) 
	begin
		if SysRst_n = '0' then
			Shifter <= (others => '0');
			LVDS_O <= '0';
			--tok <= '0';
		elsif rising_edge(Sysclk) then
			if PtS_En = '1' then
				Shifter <= TenbitDout;
--tok				
				-- if PrState = FK_SOF then
					-- tok <= '1';
				-- else 
					-- tok <= '0';	
				-- end if;	
			else
				Shifter(8 downto 0) <= Shifter(9 downto 1);
			end if;
			LVDS_O <= Shifter(0);
		end if;
	end process;					
end behav;	