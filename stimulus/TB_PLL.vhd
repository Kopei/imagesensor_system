-- TB_PLL.vhd
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

entity TB_PLL is
end entity;

ARCHITECTURE behavior OF TB_PLL IS 
    
	component pll_test1 
	port(
            I_66M_Clk       :in     std_logic;
            Sys_66M_Clk     :out    std_logic;
            ADC_66M_Clk     :out    std_logic;
			--dry				:out	std_logic;
            SysRst_O        :out    std_logic
        );  
	end	component; 
	signal 	I_66M_Clk       :std_logic;
    signal  Sys_66M_Clk     :std_logic;
    signal	 ADC_66M_Clk     :std_logic;
	signal --dry				:std_logic;
    signal  SysRst_O		:std_logic;
	
begin	
		uut:pll_test1 port map
		(
		 I_66M_Clk   => I_66M_Clk,
            Sys_66M_Clk    => Sys_66M_Clk,
            ADC_66M_Clk    => ADC_66M_Clk,
			--dry			=> --dry,
            SysRst_O    => SysRst_O
			);
			 --SysClk
   process
   begin
		I_66M_Clk <= '0';
		wait for  15.15 ns /2;
		I_66M_Clk <= '1';
		wait for 15.15 ns /2;
   end process;

		
		
		
end ;