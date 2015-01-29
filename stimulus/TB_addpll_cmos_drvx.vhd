-- TB_addpll_cmos_drvx.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;  


entity TB_addpll_cmos_drvx is 
end entity;
 


architecture Behavioral of TB_addpll_cmos_drvx is
component addpll_cmos_drvx
	 port(
            --System Signals
            ExternalCLK			 :in     std_logic;  --66MHz
            
				--PwrOnReset      :in     std_logic;
            --******************************************  
            --CMOS Sensor Signals
            --Pixel Array Timing
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
			--DryforTest			:out	std_logic;
            --SPI
            spi_data        :out    std_logic;
            spi_load        :out    std_logic;
            spi_clock       :out    std_logic;
            --******************************************
			ADC_Din			:in		std_logic_vector(13 downto 0);
			SRAM_Data		:inout	std_logic_vector(31 downto 0);
			SRAM_CE_n		:out	std_logic_vector(2 downto 0);
			SRAM_Addr		:out	std_logic_vector(18 downto 0);
			Sram_B_n		:out	std_logic_vector(3 downto 0);
			SRAM_WE_n		:out	std_logic;
			SRAM_OE_n		:out	std_logic;
			Sclk			:out	std_logic;
			Sdat			:out	std_logic;
			Tok				:out	std_logic
		);
end component;

signal      ExternalCLK			 :     std_logic;  --66MHz

            --PwrOnReset      :in     std_logic;
            --******************************************  
            --CMOS Sensor Signals
            --Pixel Array Timing
signal      mem_HL          :    std_logic;
signal      precharge       :    std_logic;
signal      sample          :    std_logic;
signal      reset           :    std_logic;
signal      reset_ds        :    std_logic;
            --X and Y Addressing
signal      Sync_Y          :    std_logic;
signal      Clock_Y         :    std_logic;
signal      NoRowSel        :    std_logic;
signal      Pre_co          :    std_logic;
signal      Sh_co           :    std_logic;
signal      VoltAvg         :    std_logic;  --Voltage Averaging
signal      Sync_X          :    std_logic;
signal      Clock_X         :    std_logic;
signal      Prebus1         :    std_logic;
signal      Prebus2         :    std_logic;
            --SPI
signal      spi_data        :    std_logic;
signal      spi_load        :    std_logic;
signal      spi_clock       :    std_logic;
signal      adcCLk          :    std_logic;
signal		 ADC_Din		:		std_logic_vector(13 downto 0);
signal		SRAM_Data		:		std_logic_vector(31 downto 0);
signal		SRAM_CE_n		:		std_logic_vector(2 downto 0);
signal		SRAM_Addr		:		std_logic_vector(18 downto 0);
signal		Sram_B_n		:		std_logic_vector(3 downto 0);
signal		SRAM_WE_n		:		std_logic;
signal		SRAM_OE_n		:		std_logic;
signal		Sclk			:		std_logic;
signal		Sdat			:		std_logic;
signal		Tok				:		std_logic;



		--DryforTest			:	 std_logic;   
constant Clk_Period     :   time := 15 ns;
begin
    --DUT Used
    DUT: addpll_cmos_drvx port map( ExternalCLK => ExternalCLK,Spi_clock => Spi_clock,Spi_Data => Spi_Data,Spi_Load => Spi_Load,
                                reset => reset,Mem_Hl => Mem_Hl,Precharge => Precharge, Sample => Sample,
                                Reset_Ds => Reset_Ds,Sync_Y => Sync_Y,Clock_Y => Clock_Y,NoRowSel => NoRowSel,adcCLk => adcCLk,
                                Pre_Co => Pre_Co,Sh_Co => Sh_Co,VoltAvg => VoltAvg,Sync_X => Sync_X,
                                Clock_X => Clock_X,Prebus1 => Prebus1,Prebus2 => Prebus2, ADC_Din => ADC_Din,SRAM_Data=> SRAM_Data,
								SRAM_CE_n => SRAM_CE_n,SRAM_Addr => SRAM_Addr,Sram_B_n=>Sram_B_n,SRAM_WE_n=>SRAM_WE_n,SRAM_OE_n=>SRAM_OE_n,
								Sclk=>Sclk,Sdat=> Sdat,tok=>tok);
					
    ClockGen:process
    begin
        ExternalCLK <= '1';
        wait for Clk_Period/2;
        ExternalCLK <= '0';
        wait for Clk_Period/2;
    end process;
   
   	process
	begin
		Adc_din <= (0 => '1',others => '0');
		wait for 30 ns;
		Adc_din <= (others => '1');
		wait for 30 ns;
	end process;	
	
	process
	begin
		sram_data <= (others => 'Z');
		wait for 81009600 ns;
		sram_data <= "10101010101010101010101010111111";
		wait for 2000ns;
		sram_data <= (others => 'Z');
	end process;	
		
end;
        