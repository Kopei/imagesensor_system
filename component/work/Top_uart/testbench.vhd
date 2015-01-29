----------------------------------------------------------------------
-- Created by Actel SmartDesign Thu Jun 19 09:57:04 2014
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

    component Top_uart
        -- ports
        port( 
            -- Inputs
            RX : in std_logic;
            RESET_N : in std_logic;
            CLK : in std_logic;
            ParaLoad : in std_logic;

            -- Outputs
            TX : out std_logic;
            Rdy1 : out std_logic;
            Rdy2 : out std_logic;
            P_CLkA : out std_logic;
            P_WEA : out std_logic;
            P_DataA : out std_logic_vector(7 downto 0);
            P_AddrA : out std_logic_vector(2 downto 0)

            -- Inouts

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

    -- Instantiate Unit Under Test:  Top_uart
    Top_uart_0 : Top_uart
        -- port map
        port map( 
            -- Inputs
            RX => '0',
            RESET_N => NSYSRESET,
            CLK => SYSCLK,
            ParaLoad => '0',

            -- Outputs
            TX =>  open,
            Rdy1 =>  open,
            Rdy2 =>  open,
            P_CLkA =>  open,
            P_WEA =>  open,
            P_DataA => open,
            P_AddrA => open

            -- Inouts

        );

end behavioral;

