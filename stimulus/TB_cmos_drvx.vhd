-- TB_cmos_drvx.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
USE ieee.numeric_std.ALL;
ENTITY TB_cmos_drvx IS
END TB_cmos_drvx;
 
ARCHITECTURE behavior OF TB_cmos_drvx IS 
component CMOS_DrvX is
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
			AdcEn			:out	std_logic;
			LVDSen			:out	std_logic;
			SDramEn			:out	std_logic
		);
end component;
signal			SysClk			:   std_logic;  --66MHz
signal           SysRst_n		:   std_logic;			
signal			ADC_66M_Clk     :   std_logic;
signal           mem_HL          :   std_logic;
signal           precharge       :   std_logic;
signal           sample          :   std_logic;
signal           reset           :   std_logic;
signal           reset_ds        :   std_logic;
signal           Sync_Y          :   std_logic;
signal           Clock_Y         :   std_logic;
signal           NoRowSel        :   std_logic;
signal           Pre_co          :   std_logic;
signal           Sh_co           :   std_logic;
signal           VoltAvg         :   std_logic;  --Voltage Averaging
signal           Sync_X          :   std_logic;
signal           Clock_X         :   std_logic;
signal           Prebus1         :   std_logic;
signal           Prebus2         :   std_logic;
signal           AdcClk          :   std_logic;
signal           spi_data        :   std_logic;
signal           spi_load        :   std_logic;
signal           spi_clock       :   std_logic;
signal			SDoneFrameOk	:	std_logic;
signal			LVDSRdOk		:	std_logic;
signal			AdcEn			:	std_logic;
signal			LVDSen			:	std_logic;
signal			SDramEn			:	std_logic;
signal			AccNum			:	std_logic_vector(5 downto 0);
signal			SPI_setPara		:	std_logic_vector(31 downto 0);
signal			ExposureT		:	std_logic_vector(5 downto 0);
signal			ParaUpdata		:	std_logic;


begin
Umap:cmos_drvx port map
	(		
		  SysClk	=>SysClk,
          SysRst_n	=>SysRst_n,
		  ADC_66M_Clk  =>ADC_66M_Clk,
          mem_HL    =>mem_HL,
          precharge   =>precharge,
          sample    =>sample,
          reset    =>reset,
		  AccNum 	 => AccNum,
          reset_ds =>  reset_ds ,  
		  Sync_Y    =>Sync_Y,
          Clock_Y  =>Clock_Y,
		  SPI_setPara => SPI_setPara,
		  ExposureT => ExposureT,
		  ParaUpdata => ParaUpdata,
          NoRowSel =>NoRowSel,
          Pre_co  =>Pre_co,
          Sh_co   =>Sh_co,
          VoltAvg =>VoltAvg,--Voltage Averaging
          Sync_X   =>Sync_X,
          Clock_X =>Clock_X,
          Prebus1 =>Prebus1,
          Prebus2 =>Prebus2,
          AdcClk   =>AdcClk,
          spi_data =>spi_data,
          spi_load  =>spi_load,
          spi_clock  =>spi_clock,
		  SDoneFrameOk=>SDoneFrameOk,
		  LVDSRdOk=>LVDSRdOk,
		  AdcEn	=>AdcEn,
		  LVDSen	=>LVDSen,
		  SDramEn	=>SDramEn
	);
process
begin	
		SysClk  <=  '0';
		ADC_66M_Clk <= SysClk'DELAYED(2 ns);
		wait for 15.15 ns/2 ;
		SysClk  <=  '1';
		ADC_66M_Clk <= SysClk'DELAYED(2 ns);
		wait for 15.15 ns/2 ;
		
end process;
process
begin	
		SPI_setPara <= "00101110000000000000000000000001";
		SysRst_n   <=  '0';
		wait for 100 ns;
		SysRst_n  <=  '1';
		wait;
end process;		

process
begin
	accnum <= (others => '0');
	LVDSRdOk  <=  '0';
	SDoneFrameOk <= '0';
    wait for 128804400 ns;
	SDoneFrameOk <= '1';
	wait for 100 ns;
	SDoneFrameOk <= '0';
	LVDSRdOk  <=  '1';
	wait for 100 ns;
end process;
	
end behavior;		   