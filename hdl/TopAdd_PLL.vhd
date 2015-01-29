-- TopAdd_PLL.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library proasic3;
use proasic3.all;
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopAdd_PLL is
	 port(
            --System Signals
            SysClk  			 :in     std_logic;  --66MHz
            SysRst_n			 :in	 std_logic;
            
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
            Dlyed_Clock_X         :out    std_logic; ----------------add pll
            Prebus1         :out    std_logic;
            Prebus2         :out    std_logic;
            --SPI
            spi_data        :out    std_logic;
            spi_load        :out    std_logic;
            spi_clock       :out    std_logic
            --******************************************
		);
end entity;

architecture Behavioral of TopAdd_PLL is
    component PLL4ClockX is
        port(POWERDOWN, CLKA : in std_logic;  LOCK, GLA : out 
        std_logic) ;
    end component;

    component CMOS_DrvX is
	    port(
            --System Signals
            SysClk			     :in     std_logic;  --66MHz
            SysRst_n			 :in	   std_logic;
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
            --SPI
            spi_data        :out    std_logic;
            spi_load        :out    std_logic;
            spi_clock       :out    std_logic
            --******************************************
		);
    end component;
    
signal Clock_X_Link: std_logic;

begin 

pllmap: PLL4ClockX
        port map 
        (
        POWERDOWN => '1',
        CLKA => clock_x_link,
        LOCK => open,
        GLA => dlyed_clock_x 
         );

restpart: Cmos_drvX
        port map
        (   SysClk => SysCLk,
            SysRst_n => SysRst_n,
				--PwrOnReset      :in     std_logic;
            --******************************************  
            --CMOS Sensor Signals
            --Pixel Array Timing
            mem_HL => mem_HL,
            precharge => precharge,
            sample => sample,
            reset => reset,
            reset_ds => reset_ds,
            --X and Y Addressing
            Sync_Y => Sync_Y,
            Clock_Y => Clock_Y,
            NoRowSel => NoRowSel,
            Pre_co => Pre_co,
            Sh_co => sh_co,
            VoltAvg => VoltAvg,  --Voltage Averaging
            Sync_X => Sync_X,
            Clock_X => Clock_x_link,
            Prebus1 => Prebus1,
            Prebus2 => Prebus2,
            --SPI
            spi_data => spi_data,
            spi_load => spi_load,
            spi_clock => spi_clock
            );

end Behavioral;


