-- Tb_top.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;  


entity tb_top is 
end entity;
 


architecture Behavioral of tb_top is
component cmos_drvx
	 port(
            --System Signals
            SysClk			 :in     std_logic;  --66MHz
            SysRst_n			 :in	   std_logic;
				--PwrOnReset      :in     std_logic;
            --******************************************  
            --CMOS Sensor Signals
            --Pixel Array Timing
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
            --SPI
            spi_data        :out    std_logic;
            spi_load        :out    std_logic;
            spi_clock       :out    std_logic
            --******************************************
		);
end component;

signal      SysClk			 :     std_logic;  --66MHz
signal      SysRst_n		 :	   std_logic;
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
signal      ADC_66M_Clk     :    std_logic;
signal      adcclk          :    std_logic;
constant Clk_Period     :   time := 15 ns;
begin
    --DUT Used
    DUT: cmos_drvx port map( Sysrst_n => Sysrst_n,SysClk => SysClk,Spi_clock => Spi_clock,Spi_Data => Spi_Data,Spi_Load => Spi_Load,
                                reset => reset,Mem_Hl => Mem_Hl,Precharge => Precharge, Sample => Sample,
                                Reset_Ds => Reset_Ds,Sync_Y => Sync_Y,Clock_Y => Clock_Y,NoRowSel => NoRowSel,
                                Pre_Co => Pre_Co,Sh_Co => Sh_Co,VoltAvg => VoltAvg,Sync_X => Sync_X,adcclk => adcclk,
                                        Clock_X => Clock_X,Prebus1 => Prebus1,Prebus2 => Prebus2,ADC_66M_Clk => ADC_66M_Clk);
    ClockGen:process
    begin
        sysclk <= '1';
        ADC_66M_Clk <= '1';
        wait for Clk_Period/2;
        sysclk <= '0';
        ADC_66M_Clk <= '0';
        wait for Clk_Period/2;
    end process;
    TB:process
    begin
        wait for 20 ns;
        sysrst_n  <= '0';
        wait for 20 ns;
        sysrst_n  <= '1';
        wait;
    end process;
end;
        