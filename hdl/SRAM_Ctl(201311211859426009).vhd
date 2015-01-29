library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SRAM_Ctl is
	port(
			SysRst_n			:in		std_logic;
			SysClk			:in		std_logic;
			SRAM_WrEn		:in		std_logic;	--Equals to CMOS Read out period
			SRAM_RdEn		:in		std_logic;	--Start SRAM reading after SRAM writing
			ADC_RdEn			:in		std_logic;	--ADC Data Read Enable
			ADC_Din			:in		std_logic_vector(13 downto 0);
			SRAM_CtlOk		:out		std_logic;	--SRAM_Ctl Module Answer
			SRAM_Addr		:out		std_logic_vector(18 downto 0);			
			SRAM_CE_n		:out		std_logic_vector(2 downto 0);
			SRAM_WE_n		:out		std_logic;					
			SRAM_OE_n		:out		std_logic;
			SRAM_B_n			:out		std_logic_vector(3 downto 0);	--Bd:Bit3;Bc:Bit2;Bb:Bit1;Ba:Bit0
			SRAM_Data		:inout	std_logic_vector(31 downto 0);
			Tok				:out		std_logic;
			Sclk				:out		std_logic;
			Sdat				:out		std_logic			
		);
end SRAM_Ctl;

architecture Behavioral of SRAM_Ctl is
	signal	SRAM_WrAddr		:std_logic_vector(19 downto 0);
	signal	SRAM_RdAddr		:std_logic_vector(18 downto 0);
	signal	SRAM_DataOut	:std_logic_vector(31 downto 0);
	signal	SRAM_RdCnt		:std_logic_vector(5 downto 0);
	signal	SRAM_RdAddrCP	:std_logic;
	constant	SRAM_RdAddrSet	:std_logic_vector(19 downto 0) := "00000000000000001111";	--(N+1)*2
	signal	Shifter			:std_logic_vector(26 downto 0);
	
begin
	
	--
	process(SysRst_n,SysClk) 
	begin
		if SysRst_n = '0' then
			SRAM_CtlOk <= '0';
			SRAM_Addr <= (others => '0');
			SRAM_CE_n <= (others => '1');
			SRAM_WE_n <= '1';
			SRAM_OE_n <= '1';
			SRAM_B_n <= (others => '1');
			SRAM_DataOut <= (others => '0');
			Tok <= '0';
			Sclk <= '0';
			Sdat <= '0';
			--signals
			SRAM_WrAddr <= (others => '0');
			SRAM_RdAddr <= (others => '0');
			SRAM_RdAddrCP <= '0';
			Shifter <= (others => '0');
		elsif rising_edge(SysClk) then
			--******************************************************
			--SRAM Write
			--SRAM_WrAddr SRAM_DataOut SRAM_WE_n
			if SRAM_WrEn = '0' then
				SRAM_WrAddr <= (others => '0');
				SRAM_DataOut <= (others => '0');
				SRAM_WE_n <= '1';
			elsif ADC_RdEn = '1' then
				SRAM_WrAddr <= SRAM_WrAddr + 1;
				if SRAM_WrAddr(0) = '0' then
					--SRAM_DataOut(27 downto 14) <= ADC_Din;
					SRAM_DataOut(27 downto 14) <= "10011010011100";
				else
					SRAM_DataOut(13 downto 0) <= ADC_Din;
				end if;
				SRAM_WE_n <= not SRAM_WrAddr(0);
			else
				SRAM_WE_n <= '1';
			end if;
			
			--SRAM_CE_n SRAM_B_n
			if SRAM_WrEn = '0' and SRAM_RdEn = '0' then
				SRAM_CE_n <= (others => '1');
				SRAM_B_n <= (others => '1');
			else
				SRAM_CE_n <= (others => '0');
				SRAM_B_n <= (others => '0');
			end if;
			
			--******************************************************
			--SRAM Read
			--SRAM_RdCnt SRAM_RdAddrCP SRAM_CtlOk Sclk Shifter
			if SRAM_RdEn = '0' then
				SRAM_RdCnt <= (others => '0');
				SRAM_RdAddrCP <= '0';
				SRAM_RdAddr <= (others => '0');
				SRAM_CtlOk <= '0';
				Tok <= '0';
				Sclk <= '0';
				Shifter <= (others => '0');
				Sdat <= '0';
			else
				if SRAM_RdCnt = 55 then
					SRAM_RdCnt <= (others => '0');
					SRAM_RdAddrCP <= '1';
				else
					SRAM_RdCnt <= SRAM_RdCnt + 1;
					SRAM_RdAddrCP <= '0';
				end if;
				
				if SRAM_RdAddrCP = '1' and SRAM_RdAddr < SRAM_RdAddrSet then
					SRAM_RdAddr <= SRAM_RdAddr + 1;
				end if;
				
				if SRAM_RdAddrCP = '1' and SRAM_RdAddr = SRAM_RdAddrSet then
					SRAM_CtlOk <= '1';
				end if;
				
				if SRAM_RdAddrCP = '1' then
					if SRAM_RdAddr < SRAM_RdAddrSet then
						Tok <= '1';
					else
						Tok <= '0';
					end if;
				end if;

				if SRAM_RdAddr > 0 and SRAM_RdAddr <= SRAM_RdAddrSet then
					Sclk <= SRAM_RdCnt(0);
				else
					Sclk <= '0';
				end if;
				
				if SRAM_RdAddrCP = '1' and SRAM_RdAddr < SRAM_RdAddrSet then
					Shifter <= SRAM_Data(26 downto 0);
					Sdat <= SRAM_Data(27);
				elsif SRAM_RdAddr > 0 and SRAM_RdAddr <= SRAM_RdAddrSet then
					if SRAM_RdCnt(0) = '0' then
						Sdat <= Shifter(26);
						Shifter <= Shifter(25 downto 0) & '0';
					end if;
				end if;
			end if;
			--***************************************************************
			if SRAM_WrEn = '1' then
				SRAM_Addr <= SRAM_WrAddr(19 downto 1);
			else
				SRAM_Addr <= SRAM_RdAddr;
			end if;
		end if;
	end process;
	
	SRAM_Data <= SRAM_DataOut when SRAM_WrEn = '1' else (others => 'Z');
end Behavioral;