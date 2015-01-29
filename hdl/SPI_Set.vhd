library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SPI_Set is
	port(
			--test
--			DivCntO		:out	std_logic_vector(6 downto 0);
--			NumCntO		:out	std_logic_vector(5 downto 0);
--			CntEnO		:out	std_logic;
--			ClkEnO		:out	std_logic;
--			SPI_ShifterO	:out	std_logic_vector(31 downto 0);
--			EofO			:out	std_logic;
--			PrStateO		:out	std_logic_vector(1 downto 0);
			--**************************
			SysRst_n		:in	std_logic;
			SysClk		:in	std_logic;
			SPI_En		:in	std_logic;	--SPI Enable
			SPI_Din		:in	std_logic_vector(31 downto 0);
			SPI_Data		:out	std_logic;
			SPI_Load		:out	std_logic;
			SPI_Clock	:out	std_logic;
			SPI_Ok		:out	std_logic	--SPI Module Answer
		);
end SPI_Set;

architecture Behavioral of SPI_Set is
	signal	PrState,NxState	:std_logic_vector(1 downto 0);		
	constant	FSM_Idle				:std_logic_vector(1 downto 0) := "00";
	constant	FSM_ShiftOut		:std_logic_vector(1 downto 0) := "01";
	constant	FSM_Ok				:std_logic_vector(1 downto 0) := "10";
	signal	Eof					:std_logic;


	signal	DivCnt	:std_logic_vector(6 downto 0);
	signal	NumCnt	:std_logic_vector(5 downto 0);
	signal	CntEn		:std_logic;
	signal	ClkEn		:std_logic;
	signal	SPI_Shifter	:std_logic_vector(31 downto 0);
	
begin
	--test
--	DivCntO <= DivCnt;
--	NumCntO <= NumCnt;
--	CntEnO <= CntEn;
--	ClkEnO <= ClkEn;
--	SPI_ShifterO <= SPI_Shifter;
--	EofO <= Eof;
--	PrStateO <= PrState;
	
	--State Transition
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			PrState <= FSM_Idle;
		elsif rising_edge(SysClk) then
			if SPI_En = '0' then
				PrState <= FSM_Idle;
			else
				PrState <= NxState;
			end if;
		end if;
	end process;
	
	--State Jumping
	process(PrState,Eof) 
	begin
		case PrState is
			when FSM_Idle =>
				NxState <= FSM_ShiftOut;
			when FSM_ShiftOut =>
				if Eof = '1' then
					NxState <= FSM_Ok;
				else
					NxState <= FSM_ShiftOut;
				end if;
			when FSM_Ok =>
				NxState <= FSM_Ok;
			when others =>
				NxState <= FSM_Idle;
		end case;
	end process;

	--State Output
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			CntEn <= '0';
			SPI_Ok <= '0';
		elsif rising_edge(SysClk) then			
			CntEn <= '0';
			SPI_Ok <= '0';
			case PrState is
				when FSM_Idle =>
					null;
				when FSM_ShiftOut =>
					CntEn <= '1';
				when FSM_Ok =>
					SPI_Ok <= '1';
				when others =>
					null;
			end case;					
		end if;
	end process;

	--0.5us ClkEn Gen
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			DivCnt <= (others => '0');
			NumCnt <= (others => '0');
			ClkEn <= '0';
			Eof <= '0';
		elsif rising_edge(SysClk) then
			if SPI_En = '0' then
				DivCnt <= (others => '0');
				NumCnt <= (others => '0');
				ClkEn <= '0';
				Eof <= '0';
			else
				--DivCnt
				--NumCnt
				if CntEn = '0' then
					DivCnt <= (others => '0');
					NumCnt <= (others => '0');
					ClkEn <= '0';
					Eof <= '0';
				else
					--Counter Up
					if DivCnt = 65 then		--count from 0 to 65 @66MHz
						DivCnt <= (others => '0');
						NumCnt <= NumCnt + 1;
					else
						DivCnt <= DivCnt + 1;
					end if;
					
					--ClkEn
					if DivCnt = 1 then		--count from 0 to 65 @66MHz
						ClkEn <= '1';
					else
						ClkEn <= '0';
					end if;					
					
					--Eof
					if DivCnt = 65 and NumCnt = 63 then
						Eof <= '1';
					end if;
					
				end if;
			end if;
		end if;
	end process;
	
	--SPI_Clock SPI_Data SPI_Load
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			SPI_Shifter <= (others => '0');
			SPI_Data <= '0';
			SPI_Clock <= '0';
			SPI_Load <= '1';
		elsif rising_edge(SysClk) then
			--SPI_Data
			if SPI_En = '0' then
				SPI_Shifter <= SPI_Din;
				SPI_Data <= '0';
			elsif ClkEn = '1'  and NumCnt(0) = '0' then
				SPI_Data <= SPI_Shifter(0);
				SPI_Shifter <= '0' & SPI_Shifter(31 downto 1);
			end if;
			
			--SPI_Clock
			if SPI_En = '0' then
				SPI_Clock <= '0';
			elsif ClkEn = '1' then
				SPI_Clock <= NumCnt(0);
			end if;
			
			--SPI_Load
			if SPI_EN = '0' then
				SPI_Load <= '1';
			elsif ClkEn = '1' then
				if NumCnt = 63 then  --change to 63 11/11
					SPI_Load <= '0';
				else
					SPI_Load <= '1';
				end if;
			end if;
			
		end if;		
	end process;
	
end Behavioral;