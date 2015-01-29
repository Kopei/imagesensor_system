-- TB_Smart_top.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
ENTITY TB_Smart_top IS
END TB_Smart_top;
 
ARCHITECTURE behavior OF TB_Smart_top IS 
component Smart_top is

    port( SD_we_n     : out   std_logic;
          SD_cas_n    : out   std_logic;
          SD_ras_n    : out   std_logic;
          NoRowSel    : out   std_logic;
          mem_HL      : out   std_logic;
          Cmos_reset  : out   std_logic;
          Sh_co       : out   std_logic;
          CMOS_sample : out   std_logic;
          VoltAvg     : out   std_logic;
          Clock_Y     : out   std_logic;
          Sync_X      : out   std_logic;
          Sync_Y      : out   std_logic;
          Pre_co      : out   std_logic;
          Prebus1     : out   std_logic;
          Prebus2     : out   std_logic;
          reset_ds    : out   std_logic;
          Clock_X     : out   std_logic;
          precharge   : out   std_logic;
          AdcClk      : out   std_logic;
          spi_data    : out   std_logic;
          spi_load    : out   std_logic;
          spi_clock   : out   std_logic;
          ExterCLk    : in    std_logic;
         -- tok         : out   std_logic;
          LVDS_O      : out   std_logic;
          SD_addr     : out   std_logic_vector(12 downto 0);
          SD_cs_n     : out   std_logic_vector(1 downto 0);
          SD_Clk      : out   std_logic_vector(1 downto 0);
          SD_dqm      : out   std_logic_vector(7 downto 0);
          SD_cke      : out   std_logic_vector(1 downto 0);
          SD_ba       : out   std_logic_vector(1 downto 0);
          SD_DQ       : inout std_logic_vector(71 downto 0) := (others => 'Z');
		  RX		  : in		std_logic;
		  TX		:	out		std_logic;
          ADCdataIn   : in    std_logic_vector(13 downto 0)
        );

end component;
signal		SD_we_n,RX,TX    :    std_logic;
signal		SD_cas_n    :    std_logic;
signal		SD_ras_n    :    std_logic;
signal		NoRowSel    :    std_logic;
signal		mem_HL      :    std_logic;
signal		Cmos_reset  :    std_logic;
signal		Sh_co       :    std_logic;
signal		CMOS_sample :    std_logic;
signal		VoltAvg     :    std_logic;
signal		Clock_Y     :    std_logic;
signal		Sync_X      :    std_logic;
signal		Sync_Y      :    std_logic;
signal		Pre_co      :    std_logic;
signal		Prebus1     :    std_logic;
signal		Prebus2     :    std_logic;
signal		reset_ds    :    std_logic;
signal		Clock_X     :    std_logic;
signal		precharge   :    std_logic;
signal		AdcClk      :    std_logic;
signal		spi_data    :    std_logic;
signal		spi_load    :    std_logic;
signal		spi_clock   :    std_logic;
signal		ExterCLk    :    std_logic;
--signal		tok         :    std_logic;
signal		LVDS_O      :    std_logic;
signal		SD_addr     :    std_logic_vector(12 downto 0);
signal		SD_cs_n     :    std_logic_vector(1 downto 0);
signal		SD_Clk      :    std_logic_vector(1 downto 0);
signal		SD_dqm      :    std_logic_vector(7 downto 0);
signal		SD_cke      :    std_logic_vector(1 downto 0);
signal		SD_ba       :    std_logic_vector(1 downto 0);
signal		SD_DQ       : 	 std_logic_vector(71 downto 0):= (others => 'Z');
signal		ADCdataIn   :    std_logic_vector(13 downto 0);
begin
UUT: Smart_top port map
(
		SD_we_n     =>	SD_we_n,
		SD_cas_n    =>	SD_cas_n,
		SD_ras_n    =>	SD_ras_n,
		NoRowSel    =>NoRowSel,
		mem_HL      =>mem_HL,
		Cmos_reset  =>Cmos_reset,
		Sh_co       =>Sh_co,
		CMOS_sample =>CMOS_sample,
		VoltAvg     =>VoltAvg,
		Clock_Y     =>Clock_Y,
		Sync_X      =>Sync_X,
		Sync_Y      =>Sync_Y,
		Pre_co      =>Pre_co,
		Prebus1     =>Prebus1,
		Prebus2     =>Prebus2,
		reset_ds    =>reset_ds,
		Clock_X     =>Clock_X,
		precharge   =>precharge,
		AdcClk      =>AdcClk,
		spi_data    =>spi_data,
		spi_load    =>spi_load,
		spi_clock   =>spi_clock,
		ExterCLk    =>ExterCLk,
		TX			 => TX,
		RX			 => RX,
		LVDS_O      =>LVDS_O,
		SD_addr     =>SD_addr,
		SD_cs_n     =>SD_cs_n,
		SD_Clk      =>SD_Clk,
		SD_dqm      =>SD_dqm,
		SD_cke      =>SD_cke,
		SD_ba       =>SD_ba,
		SD_DQ       =>SD_DQ,
		ADCdataIn   =>ADCdataIn
);
process
begin
	ExterCLk <= '0';
	wait for 15.15 ns /2;
	ExterCLk <= '1';
	wait for 15.15 ns /2;
end process;
process(SD_ras_n,SD_we_n,SD_cas_n)
begin
	-- SD_dq <= (others   => 'Z');
	if (SD_ras_n = '1' and SD_cas_n ='0' and SD_we_n ='1')then
		SD_dq <= (0 => '0', 71 => '0',others => '1') after 30 ns; 
	else 
		SD_dq <= (others  => 'Z');
	end if;	
end process;
	-- SD_dq <= (0 => '0', 71 => '0',others => '1') after 30 ns when (SD_ras_n = '1' and SD_cas_n ='0' and SD_we_n ='1')
	-- else (others  => 'Z');
	
end behavior;
		
