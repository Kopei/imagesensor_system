----------------------------------------------------------------------
-- Created by Actel SmartDesign Mon Feb 24 20:20:15 2014
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

    component top_sdram
        -- ports
        port( 
            -- Inputs
            Sysclk : in std_logic;
            rst_n : in std_logic;
            Fifo_RAfull : in std_logic;
            Fifo_Wafull : in std_logic;
            LVDS_En : in std_logic;
            GLB : in std_logic;
            SDRAM_En : in std_logic;
            Sys_dataIn : in std_logic_vector(71 downto 0);
            RefEn : in std_logic;

            -- Outputs
            ras_n : out std_logic;
            cas_n : out std_logic;
            we_n : out std_logic;
            Sys_dataOut : out std_logic_vector(71 downto 0);
            SDoneFrameOk : out std_logic;
            cke : out std_logic_vector(1 downto 0);
            cs_n : out std_logic_vector(1 downto 0);
            SD_Clk : out std_logic_vector(1 downto 0);
            dqm : out std_logic_vector(7 downto 0);
            addr : out std_logic_vector(12 downto 0);
            ba : out std_logic_vector(1 downto 0);
            RFifo_we : out std_logic;
            WFifo_re : out std_logic;

            -- Inouts
            DQ : inout std_logic_vector(71 downto 0)

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

    -- Instantiate Unit Under Test:  top_sdram
    top_sdram_0 : top_sdram
        -- port map
        port map( 
            -- Inputs
            Sysclk => SYSCLK,
            rst_n => NSYSRESET,
            Fifo_RAfull => '0',
            Fifo_Wafull => '0',
            LVDS_En => '0',
            GLB => '0',
            SDRAM_En => '0',
            Sys_dataIn => (others=> '0'),
            RefEn => '0',

            -- Outputs
            ras_n =>  open,
            cas_n =>  open,
            we_n =>  open,
            Sys_dataOut => open,
            SDoneFrameOk =>  open,
            cke => open,
            cs_n => open,
            SD_Clk => open,
            dqm => open,
            addr => open,
            ba => open,
            RFifo_we =>  open,
            WFifo_re =>  open,

            -- Inouts
            DQ => open

        );

end behavioral;

