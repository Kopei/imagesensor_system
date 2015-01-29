library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CMOS_Ctl is
	port(
			--test
			--**************************
			SysRst_n	:in		std_logic;
			SysClk		:in		std_logic;
			Y_X_WaveOk	:in		std_logic;
		--	Sram_CtlOk	:in std_logic;
			SPI_Ok		:in		std_logic;			
			PAT_Ok		:in		std_logic;
			SDoneFrameOk:in		std_logic;
			LVDSRdOk	:in		std_logic;
			Accnum		:in		std_logic_vector(5 downto 0);
			Y_X_WaveEn	:out	std_logic;
			SPI_En		:out	std_logic;	--SPI Enable
			SPI_Din		:out	std_logic_vector(31 downto 0);
			InitTime	:out	std_logic_vector(17 downto 0);
			ImageOrQl	:out	std_logic;  --output for YX_addressing for clk_x cycle number selection
			PAT_En		:out	std_logic;	--Pixel Array Timing module Enalbe Signal			
			LVDSen		:out	std_logic;
			SPI_setPara	:in		std_logic_vector(31 downto 0);
			ExposureT	:in		std_logic_vector(5 downto 0);
			Cmos_start	:in		std_logic;
			ParaUpdata	:out	std_logic;
			--Paraload	:out	std_logic;
			--Para_rdy	:in		std_logic;
			SDramEn		:out	std_logic
			--Sram_CtlEn	:out	std_logic
		);
end CMOS_Ctl;

architecture Behavioral of CMOS_Ctl is
	signal	PrState,NxState	:std_logic_vector(3 downto 0);		
	constant	Ctl_Idle			:std_logic_vector(3 downto 0) := "0000";
	constant	Ctl_QuitLatch		:std_logic_vector(3 downto 0) := "0001";
	constant	Ctl_SPI_Set			:std_logic_vector(3 downto 0) := "0010";
	constant	Ctl_Init			:std_logic_vector(3 downto 0) := "0011";
	constant	Ctl_ReadOut			:std_logic_vector(3 downto 0) := "0100";
	constant	Ctl_Sdram			:std_logic_vector(3 downto 0) := "0101";
	constant	Ctl_JudgeACCNum		:std_logic_vector(3 downto 0) := "0110";	
	constant	Ctl_LVDS			:std_logic_vector(3 downto 0) := "0111";
	constant	Ctl_ParaSet			:std_logic_vector(3 downto 0) := "1000";
	constant	Ctl_Start			:std_logic_vector(3 downto 0) := "1001";	
	signal		ACCcnt				:std_logic_vector(5 downto 0);	
	signal		ParaUpdt			:std_logic;
	signal		Cmos_start_sig		:std_logic;
	signal		Cnt_13				:std_logic_vector(3 downto 0);
begin
	ParaUpdata <= ParaUpdt;
	process(sysclk,sysrst_n)
	begin
	if SysRst_n = '0' then
		InitTime <=  "000000000001100100";
		SPI_Din <= "00101110000000000000000000000001";
		cmos_start_sig <= '1';
	elsif rising_edge(SysClk) then
		if ParaUpdt = '1'then  
			SPI_Din <= SPI_setPara;
			case ExposureT is 
			when "000000" => 
				InitTime <= "000000000001100100";
			when "000001" => 
				InitTime <= "000000001111101000";
			when "000010" => 
				InitTime <= "000010011100010000";
			when "000011" => 
				InitTime <= "000100111000100000";
			when "000100" => 
				InitTime <= "000111010100110000";
			when "000101" => 
				InitTime <= "001001110001000000";
			when "000110" => 
				InitTime <= "001100001101010000";
			when "000111" => 
				InitTime <= "001110101001100000";
			when "001000" => 
				InitTime <= "010001000101110000";
			when "001001" => 
				InitTime <= "010011100010000000";
			when "001010" => 
				InitTime <= "010101111110010000";
			when "001011" => 
				InitTime <= "011000011010100000";
			when "001100" => 
				InitTime <= "011010110110110000";
			when "001101" => 
				InitTime <= "011101010011000000";
			when "001110" => 
				InitTime <= "011111101111010000";
			when "001111" => 
				InitTime <= "100010001011100000";
			when "010000" => 
				InitTime <= "100100100111110000";
			when "010001" => 
				InitTime <= "100111000100000000";
			when "010010" => 
				InitTime <= "101001100000010000";
			when "010011" => 
				InitTime <= "101011111100100000";
			when "010100" => 
				InitTime <= "101110011000110000";
			when "010101" => 
				InitTime <= "110000110101000000";
			WHEN "010110" => 
				InitTime <= "001010111111001000"; --45MS
			when others => 
				InitTime <=	"000000000001100100";
				 --"000000010010001001";  10ms/0.5us/step=20000
			end case;
		end if;
		if cmos_start = '0' then 
			if Cnt_13 >= 12 then 
			--	Cnt_13 <= (others  => '0');
				cmos_start_sig  <=  '0';
			else
				cmos_start_sig  <=  '1';
				Cnt_13  <=  Cnt_13 + 1;
			end if;	
		else
			Cnt_13  <= (others => '0');
			cmos_start_sig  <=  '1';
		end if;
	end if;
	end process;
	--State Transition
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			PrState <= Ctl_Idle;
		elsif rising_edge(SysClk) then
			PrState <= NxState;
		end if;
	end process;
	
	--State Jumping
	process(PrState,Y_X_WaveOk,SPI_Ok,PAT_Ok,SDoneFrameOk,ACCcnt,LVDSRdOk,Accnum,Cmos_start_sig)
	begin
		case PrState is
			when Ctl_Idle =>
				NxState <= Ctl_QuitLatch;
			when Ctl_QuitLatch =>
				if Y_X_WaveOk = '1' then
					NxState <= ctl_Start;
				else
					NxState <= Ctl_QuitLatch;
				end if;
			when ctl_Start => 
				if cmos_start_sig = '0' then
					Nxstate <= ctl_Paraset;
				else
					Nxstate <= ctl_start;
				end if;	
			when Ctl_ParaSet => 
				Nxstate <= Ctl_SPI_Set;
			when Ctl_SPI_Set =>
				if SPI_Ok = '1' then
					NxState <= Ctl_Init;
				else
					NxState <= Ctl_SPI_Set;
				end if;
			when Ctl_Init =>
				if PAT_Ok = '1' then
					NxState <= Ctl_ReadOut;					
				else
					NxState <= Ctl_Init;
				end if;
			when Ctl_ReadOut =>
				if Y_X_WaveOk = '1' then
					NxState <= Ctl_Sdram;
				else
					NxState <= Ctl_ReadOut;
				end if;
			when Ctl_Sdram =>
				if SDoneFrameOk = '1' then
					NxState <= Ctl_JudgeACCNum;
				else 
					NxState <= Ctl_Sdram;
				end if;
			when Ctl_JudgeACCnum => 
				if ACCcnt = Accnum then-- if 16 times accumulation accnum=001111
					Nxstate <= Ctl_lvds;
				else
					Nxstate <= Ctl_Init;
				end if;
			when Ctl_LVDS => 
				if LVDSRdOk = '1' then
					Nxstate  <= Ctl_ParaSet;
				else 
					Nxstate <= Ctl_LVDS;
				end if;	
			when others =>
				NxState <= Ctl_Idle;
		end case;
	end process;

	--State Output
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			Y_X_WaveEn <= '0';
			SPI_En <= '0';
			PAT_En <= '0';
			ImageOrQl <= '1';
			ParaUpdt <= '0';
			Acccnt <= (others => '0');
			SDramEn <= '0';
			--Paraload <= '0';
			LVDSEn <='0';
		elsif rising_edge(SysClk) then			
			LVDSEn <='0';
			Y_X_WaveEn <= '0';
			SPI_En <= '0';
			PAT_En <= '0';	
			ImageOrQl <= '0';	
		--	SRAM_CtlEn <= '0';
			ParaUpdt <= '0';
			SDramEn <= '0';
			--Paraload <= '0';
			case PrState is
				when Ctl_Idle =>
					null;
				when Ctl_QuitLatch =>
					Y_X_WaveEn <= '1';
					ImageOrQl <= '1'; 	--QuitLatch is '1'
				when ctl_Start => 
					null;
				when Ctl_SPI_Set =>
					SPI_En <= '1';
				when Ctl_Init =>
					PAT_En <= '1';
				when Ctl_ReadOut =>
					Y_X_WaveEn <= '1';
					SDramEn <= '1';
				when Ctl_Sdram =>
					SDramEn <= '1';
				when Ctl_JudgeACCnum => 
					Acccnt <= Acccnt + 1;
				when Ctl_LVDS =>
					LVDSEn <='1';
					Acccnt <= (others => '0');
					--Paraload <= '1';
				when Ctl_ParaSet => 
					ParaUpdt <= '1';
				when others =>
					null;
			end case;					
		end if;
	end process;

end Behavioral;