-- AddPll_Cmos_DrvX.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AddPll_Cmos_Drvx is
	 port(
            --System Signals
            ExternalCLK			 :in     std_logic;  --66MHz
      		--PwrOnReset      :in     std_logic;
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
			--DryforTest		:out	std_logic;
            --SPI
            spi_data        :out    std_logic;
            spi_load        :out    std_logic;
            spi_clock       :out    std_logic;
            --******************************************
			ADC_Din			:in		std_logic_vector(13 downto 0);
			SRAM_Addr		:out	std_logic_vector(18 downto 0);
			SRAM_CE_n		:out	std_logic_vector(2 downto 0);
			SRAM_WE_n		:out	std_logic;
			SRAM_OE_n		:out	std_logic;
			Sram_B_n		:out	std_logic_vector(3 downto 0);
			SRAM_Data		:inout	std_logic_vector(31 downto 0);
			Sclk			:out	std_logic;
			Sdat			:out	std_logic;
			Tok				:out	std_logic
            --******************************************
		);
end entity;

architecture Behavioral of AddPll_Cmos_Drvx is
    component PLL_Test1 is
    port(
            I_66M_Clk       :in     std_logic;
            Sys_66M_Clk     :out    std_logic;
            ADC_66M_Clk     :out    std_logic;
			--dry				:out		std_logic;
            SysRst_O        :out    std_logic
        );  
    end component;

    component cmos_drvX is 
    port(
            SysClk			:in     std_logic;  --66MHz
            SysRst_n		:in	    std_logic;			
            --******************************************  
            ADC_66M_Clk     :in     std_logic;
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
			--DryforTest		:out	std_logic;
            --SPI
            spi_data        :out    std_logic;
            spi_load        :out    std_logic;
            spi_clock       :out    std_logic;
            --******************************************
			ADC_Din			:in		std_logic_vector(13 downto 0);
			SRAM_Addr		:out	std_logic_vector(18 downto 0);
			SRAM_CE_n		:out	std_logic_vector(2 downto 0);
			SRAM_WE_n		:out	std_logic;
			SRAM_OE_n		:out	std_logic;
			Sram_B_n		:out	std_logic_vector(3 downto 0);
			SRAM_Data		:inout	std_logic_vector(31 downto 0);
			Sclk			:out	std_logic;
			Sdat			:out	std_logic;
			Tok				:out	std_logic
		);
    end component;

signal sysclk : std_logic;
signal adc_66m_clk : std_logic;
signal SysRst_n : std_logic;
--signal --dry		:std_logic;

begin
pll: pll_test1
    port map
    (   
    I_66M_Clk => ExternalClk,
    Sys_66M_Clk => Sysclk,
    ADC_66M_Clk => ADC_66M_Clk,
	--dry => --dry, 
    SysRst_O => SysRst_n
    );

cmos: cmos_drvx
    port map
    (
        SysClk => SysClk,
        SysRst_n => SysRst_n,
        mem_HL => mem_HL,
        precharge => precharge,
        sample => sample,
        reset => reset,
        reset_ds => reset_ds,
        Sync_Y => Sync_Y,
        Clock_Y => Clock_Y,
        NoRowSel => NoRowSel,
        Pre_co => Pre_co,
        Sh_co => Sh_co,
        VoltAvg => VoltAvg,
        Sync_X => Sync_X,
        Clock_X => Clock_X,
        Prebus1 => Prebus1,
        Prebus2 => Prebus2,
        spi_data => spi_data,
        spi_load => spi_load,
        spi_clock => spi_clock,
        AdcCLk   => AdcCLk,
        ADC_66M_Clk => ADC_66M_Clk,
		--***************************************
		ADC_Din	=>	ADC_Din,
		SRAM_Addr	=> SRAM_Addr,		
		SRAM_CE_n	=> SRAM_CE_n,		
		SRAM_WE_n	=> SRAM_WE_n,
		SRAM_OE_n	=> SRAM_OE_n,
		Sram_B_n	=> Sram_B_n,
		SRAM_Data	=> SRAM_Data,
		Sclk		=> Sclk,
		Sdat		=> Sdat,
		Tok			=> Tok
        );
end behavioral;        
        