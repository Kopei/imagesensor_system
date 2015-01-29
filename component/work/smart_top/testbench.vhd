----------------------------------------------------------------------
-- Created by Actel SmartDesign Thu Aug 14 14:30:05 2014
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavioral of testbench is

    constant SYSCLK_PERIOD : time := 100 ns;

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component smart_top
        -- ports
        port( 
            -- Inputs
            ExterCLk : in std_logic;
            RX : in std_logic;
            cmos_start : in std_logic;
            ADCdataIn : in std_logic_vector(13 downto 0);

            -- Outputs
            CMOS_sample : out std_logic;
            mem_HL : out std_logic;
            Sync_X : out std_logic;
            Clock_Y : out std_logic;
            spi_data : out std_logic;
            reset_ds : out std_logic;
            Clock_X : out std_logic;
            Prebus1 : out std_logic;
            Prebus2 : out std_logic;
            Sync_Y : out std_logic;
            spi_clock : out std_logic;
            Sh_co : out std_logic;
            precharge : out std_logic;
            AdcClk : out std_logic;
            VoltAvg : out std_logic;
            NoRowSel : out std_logic;
            CMOS_reset : out std_logic;
            Pre_co : out std_logic;
            spi_load : out std_logic;
            SD_ras_n : out std_logic;
            SD_cas_n : out std_logic;
            SD_we_n : out std_logic;
            LVDS_O : out std_logic;
            TX : out std_logic;
            SD_cke : out std_logic_vector(1 downto 0);
            SD_cs_n : out std_logic_vector(1 downto 0);
            SD_Clk : out std_logic_vector(1 downto 0);
            SD_dqm : out std_logic_vector(7 downto 0);
            SD_addr : out std_logic_vector(12 downto 0);
            SD_ba : out std_logic_vector(1 downto 0);

            -- Inouts
            Sd_DQ : inout std_logic_vector(71 downto 0)

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- 10MHz Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  smart_top
    smart_top_0 : smart_top
        -- port map
        port map( 
            -- Inputs
            ExterCLk => SYSCLK,
            RX => '0',
            cmos_start => '0',
            ADCdataIn => (others=> '0'),

            -- Outputs
            CMOS_sample =>  open,
            mem_HL =>  open,
            Sync_X =>  open,
            Clock_Y =>  open,
            spi_data =>  open,
            reset_ds =>  open,
            Clock_X =>  open,
            Prebus1 =>  open,
            Prebus2 =>  open,
            Sync_Y =>  open,
            spi_clock =>  open,
            Sh_co =>  open,
            precharge =>  open,
            AdcClk =>  open,
            VoltAvg =>  open,
            NoRowSel =>  open,
            CMOS_reset =>  open,
            Pre_co =>  open,
            spi_load =>  open,
            SD_ras_n =>  open,
            SD_cas_n =>  open,
            SD_we_n =>  open,
            LVDS_O =>  open,
            TX =>  open,
            SD_cke => open,
            SD_cs_n => open,
            SD_Clk => open,
            SD_dqm => open,
            SD_addr => open,
            SD_ba => open,

            -- Inouts
            Sd_DQ => open

        );

end behavioral;

