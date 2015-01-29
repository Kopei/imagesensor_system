----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:06:32 11/06/2013 
-- Design Name: 
-- Module Name:    CMOS_DrvX - Behavioral 
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

entity CMOS_DrvX is
	 port(
            --System Signals
            SysClk			:in     std_logic;  --66MHz
            SysRst_n		:in	    std_logic;			
			ADC_66M_Clk     :in     std_logic;
            --******************************************  
            mem_HL          :out    std_logic;
            precharge       :out    std_logic;
            sample          :out    std_logic;
            reset           :out    std_logic;
            reset_ds        :out    std_logic;
            --X and Y Addressing
            Sync_Y          :out    std_logic;
            Clock_Y         :out    std_logic;
            NoRowSel        :out    std_logic;
            Pre_co          :out    std_logic;
            Sh_co           :out    std_logic;
            VoltAvg         :out    std_logic;  --Voltage Averaging
            Sync_X          :out    std_logic;
            Clock_X         :out    std_logic;
            Prebus1         :out    std_logic;
            Prebus2         :out    std_logic;
            AdcClk          :out    std_logic;
			SPI_setPara		:in		std_logic_vector(31 downto 0);
			ExposureT		:in		std_logic_vector(5 downto 0);
			ParaUpdata		:out	std_logic;
            spi_data        :out    std_logic;
            spi_load        :out    std_logic;
            spi_clock       :out    std_logic;
            --******************************************SDram interface
			AccNum			:in		std_logic_vector(5 downto 0);
			SDoneFrameOk	:in		std_logic;
			LVDSRdOk		:in		std_logic;
			cmos_start		:in		std_logic;
			AdcEn			:out	std_logic;
			LVDSen			:out	std_logic;
			SDramEn			:out	std_logic
			--ADC_Din			:in		std_logic_vector(13 downto 0);
			--SRAM_Addr		:out	std_logic_vector(18 downto 0);
			--SRAM_CE_n		:out	std_logic_vector(2 downto 0);
			--SRAM_WE_n		:out	std_logic;
			--SRAM_OE_n		:out	std_logic;
			--Sram_B_n		:out	std_logic_vector(3 downto 0);
			--SRAM_Data		:inout	std_logic_vector(31 downto 0);
			--Sclk			:out	std_logic;
			--Sdat			:out	std_logic;
			--Tok				:out	std_logic
		);
end CMOS_DrvX;

architecture Behavioral of CMOS_DrvX is
	-- component SRAM_Ctl is
    -- port(
            -- SysRst_n        :in     std_logic;
            -- SysClk          :in     std_logic;
          -- --  SRAM_CtlEn      :in     std_logic;  --SRAM_Ctl Module Enable
            -- SRAM_CtlOk      :out    std_logic;  --SRAM_Ctl Module Answer
            -- SRAM_WrEn       :in     std_logic;  --Equals to CMOS Read out period
            -- SRAM_RdEn       :in     std_logic;  --Start SRAM reading after SRAM writing
            -- ADC_RdEn        :in     std_logic;  --ADC Data Read Enable
            -- ADC_Din         :in     std_logic_vector(13 downto 0);
            -- SRAM_Addr       :out        std_logic_vector(18 downto 0);
            -- SRAM_CE_n       :out        std_logic_vector(2 downto 0);
            -- SRAM_WE_n       :out        std_logic;
            -- SRAM_OE_n       :out        std_logic;
            -- SRAM_B_n        :out        std_logic_vector(3 downto 0);   --Bd:Bit3;Bc:Bit2;Bb:Bit1;Ba:Bit0
            -- SRAM_Data       :inout      std_logic_vector(31 downto 0);
            -- Tok             :out        std_logic;
            -- Sclk            :out        std_logic;
            -- Sdat            :out        std_logic
			-- --CycNum			:in			std_logic_vector(10 downto 0)
        -- );
	-- end component;
	
	component CMOS_Ctl is
		port(
			SysRst_n	:in		std_logic;
			SysClk		:in		std_logic;
			Y_X_WaveOk	:in		std_logic;
		--	Sram_CtlOk	:in std_logic;
			SPI_Ok		:in		std_logic;			
			PAT_Ok		:in		std_logic;
			SDoneFrameOk:in		std_logic;
			LVDSRdOk	:in		std_logic;
			AccNum		:in		std_logic_vector(5 downto 0);
			Y_X_WaveEn	:out	std_logic;
			SPI_En		:out	std_logic;	--SPI Enable
			SPI_Din		:out	std_logic_vector(31 downto 0);
			InitTime	:out	std_logic_vector(17 downto 0);
			ImageOrQl	:out	std_logic;  --output for YX_addressing for clk_x cycle number selection
			PAT_En		:out	std_logic;	--Pixel Array Timing module Enalbe Signal			
			LVDSen		:out	std_logic;
			SPI_setPara	:in		std_logic_vector(31 downto 0);
			ExposureT	:in		std_logic_vector(5 downto 0);
			ParaUpdata	:out	std_logic;
			cmos_start	:in		std_logic;
			SDramEn		:out	std_logic
		--	Sram_CtlEn	:out	std_logic	
			);
	end component;
	
	component Y_X_Addressing is
		port(
			SysRst_n	:in	    std_logic;
			SysClk		:in	    std_logic;
            ADC_66M_Clk :in     std_logic;
			--dry			:in		std_logic;
			Y_X_WaveEn	:in	    std_logic;
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
			ImageOrQl	:in		std_logic;
			--DryforTest	:out	std_logic;
			Y_X_WaveOk	:out	std_logic;
			ADC_RdEN	:out	std_logic
			);
	end component;
	
	component SPI_Set is
		port(
				SysRst_n	:in	std_logic;
				SysClk		:in	std_logic;
				SPI_En		:in	std_logic;	--SPI Enable
				SPI_Din		:in	std_logic_vector(31 downto 0);
				SPI_Data	:out	std_logic;
				SPI_Load	:out	std_logic;
				SPI_Clock	:out	std_logic;
				SPI_Ok		:out	std_logic	--SPI Module Answer
			);
	end component;
	
	component PixelArrayTiming is
		port(
				SysRst_n	:in		std_logic;
				SysClk		:in		std_logic;
				InitTime	:in		std_logic_vector(17 downto 0);	--70ms max, 0.5us/step
				PAT_En		:in		std_logic;	--Pixel Array Timing module Enalbe Signal
				mem_HL		:out	std_logic;
				precharge	:out	std_logic;
				sample		:out	std_logic;
				reset		:out	std_logic;
				reset_ds	:out	std_logic;
				PAT_Ok		:out	std_logic	--Pixel Array Timing module Answer Signal
			);
	end component;	
	-- component DRY4Test is 
		-- port(GL : out std_logic;  CLK : in std_logic) ;
	-- end component;
	signal Y_X_WaveOk		:std_logic;
	signal SPI_Ok			:std_logic;			
	signal PAT_Ok			:std_logic;
	signal Y_X_WaveEn		:std_logic;
	signal SPI_En			:std_logic;
	signal SPI_Din			:std_logic_vector(31 downto 0);
	signal InitTime	    	:std_logic_vector(17 downto 0);
	signal PAT_En			:std_logic;	--Pixel Array Timing module Enalbe Signal	
	signal ImageOrQl		:std_logic;
	--signal accnum			:std_logic_vector(5 downto 0);
	--signal adcclk_inter		:std_logic;
--	signal SRAM_CtlEn		:std_logic;
--	signal	SRAM_CtlOk		:std_logic;
--	signal SRAM_WrEn		:std_logic;
--	signal	SRAM_RdEn		:std_logic;
--	signal ADC_RdEn			:std_logic;
	
begin
--accnum <= (others  => '0');--accnum <= (others  => '0');-- ----accnum <= (others => '0');-- ----
-- DryforTest <= 
-- Module_DryforTest: DRY4Test port map
		-- (GL  => 
		 -- CLK : in std_logic) ;
	-- Module_sram_ctl: Sram_ctl
	-- port map
	-- (
		-- SysRst_n	=> SysRst_n,
        -- SysClk		=> SysClk,
       -- -- SRAM_CtlEn  => SRAM_CtlEn,
        -- SRAM_CtlOk  => SRAM_CtlOk,
        -- SRAM_WrEn   => SRAM_WrEn,
        -- SRAM_RdEn   => SRAM_RdEn,
        -- ADC_RdEn    => ADC_RdEN,
        -- ADC_Din     => ADC_din,
        -- SRAM_Addr   => Sram_Addr,
        -- SRAM_CE_n   => SRAM_CE_n,
        -- SRAM_WE_n   => SRAM_WE_n,
        -- SRAM_OE_n   => SRAM_OE_n,
        -- SRAM_B_n    => Sram_B_n,
        -- SRAM_Data   => Sram_Data,
        -- Tok         => Tok,
        -- Sclk        => Sclk,
        -- Sdat        => Sdat
	-- );	
	Module_CMOS_Ctl: CMOS_Ctl
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		Y_X_WaveOk	=> Y_X_WaveOk,
		SPI_Ok		=> SPI_Ok,
		PAT_Ok		=> PAT_Ok,
		Y_X_WaveEn	=> Y_X_WaveEn,
		SPI_En		=> SPI_En,
		SPI_Din		=> SPI_Din,
		InitTime	=> InitTime,
		ImageOrQl	=> ImageOrQl,
		PAT_En		=> PAT_En,
		cmos_start	=> Cmos_start, 
      --  SRAM_CtlOk  => SRAM_CtlOk,
		LVDSen		=> 	LVDSen,
		SDramEn		=> 	SDramEn,
   	    SDoneFrameOk => SDoneFrameOk,
   	    AccNum		=> AccNum,	
		SPI_setPara	=> SPI_setPara,
		ExposureT	=> ExposureT,
		ParaUpdata	=> ParaUpdata,
		LVDSRdOk	=> LVDSRdOk	
	   
	);

	Module_Y_X_Addressing: Y_X_Addressing
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		--dry			=> --dry,
		--CmosRowRd	=> CmosRowRd,
		Y_X_WaveEn	=> Y_X_WaveEn,
		Sync_Y		=> Sync_Y,
		Clock_Y		=> Clock_Y,
		NoRowSel	=> NoRowSel,
		Pre_co		=> Pre_co,
		Sh_co		=> Sh_co,
		VoltAvg		=> VoltAvg,
		Sync_X		=> Sync_X,
		Clock_X		=> Clock_X,
		Prebus1		=> Prebus1,
		Prebus2		=> Prebus2,
		Y_X_WaveOk	=> Y_X_WaveOk,
		ImageOrQl	=> ImageOrQl,
        ADC_66M_Clk => ADC_66M_Clk,
        AdcCLk      => AdcClk,
		ADC_RdEn    => AdcEn

	);

	Module_SPI_Set: SPI_Set
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,		
		SPI_En		=> SPI_En,
		SPI_Din		=> SPI_Din,
		SPI_Data	=> SPI_Data,
		SPI_Load	=> SPI_Load,
		SPI_Clock	=> SPI_Clock,
		SPI_Ok		=> SPI_Ok
	);

	Module_PixelArrayTiming :PixelArrayTiming
	port map
	(
		SysRst_n	=> SysRst_n,
		SysClk		=> SysClk,
		InitTime	=> InitTime,
		PAT_En		=> PAT_En,
		mem_HL		=> mem_HL,
		precharge	=> precharge,
		sample		=> sample,
		reset		=> reset,
		reset_ds	=> reset_ds,
		PAT_Ok		=> PAT_Ok
	);

end Behavioral;