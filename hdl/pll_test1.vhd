-- pll_test1.vhd

library IEEE;
library proasic3;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use proasic3.all;

entity PLL_Test1 is
    port(
            I_66M_Clk       :in     std_logic;
            Sys_66M_Clk     :out    std_logic;
            ADC_66M_Clk     :out    std_logic;
			Sdram_clk		:out	std_logic;
            SysRst_O        :out    std_logic
        );  
end pll_test1;

architecture Behavioral of pll_test1 is

    component My_PLL is
        port(POWERDOWN, CLKA : in std_logic;  LOCK, GLA, GLB,GLC: out 
            std_logic) ;
    end component;

    component CLKINT is
        port(
                A   :in     std_logic;
                Y   :out    std_logic
            );        
    end component;


    signal PLL_Lock :std_logic;
    signal RstBuf   :std_logic_vector(1 downto 0);
    signal SysClk   :std_logic;

begin

    Module_my_pll    :my_pll
    port map
    (
        POWERDOWN   => '1',
        CLKA        => I_66M_Clk,
        LOCK        => PLL_Lock,
        GLA         => SysClk,
        GLB         => ADC_66M_Clk,
		GLC			=> Sdram_clk
    );
    
    Module_CLKINT   :CLKINT
    port map
    (
        A   => RstBuf(1),
        Y   => SysRst_O
    );

    process(PLL_Lock,SysClk)
    begin
        if PLL_Lock = '0' then
            RstBuf <= "00";
        elsif rising_edge(SysClk) then
            RstBuf <= RstBuf(0) & '1';
        end if;
    end process;

    Sys_66M_Clk <= SysClk;
                    
end Behavioral;