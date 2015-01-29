-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity adcclk_3P9 is 
    port(GL : out std_logic;  CLK : in std_logic) ;
end adcclk_3P9;


architecture DEF_ARCH of  adcclk_3P9 is

    component CLKDLY
        port(CLK : in std_logic := 'U'; GL : out std_logic;  
        DLYGL0, DLYGL1, DLYGL2, DLYGL3, DLYGL4 : in std_logic := 
        'U') ;
    end component;

    component VCC
        port( Y : out std_logic);
    end component;

    component GND
        port( Y : out std_logic);
    end component;

    signal VCC_1_net, GND_1_net : std_logic ;
    begin   

    VCC_2_net : VCC port map(Y => VCC_1_net);
    GND_2_net : GND port map(Y => GND_1_net);
    Inst1 : CLKDLY
      port map(CLK => CLK, GL => GL, DLYGL0 => VCC_1_net, 
        DLYGL1 => GND_1_net, DLYGL2 => GND_1_net, DLYGL3 => 
        GND_1_net, DLYGL4 => VCC_1_net);
end DEF_ARCH;

-- _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


-- _GEN_File_Contents_

-- Version:9.1.0.18
-- ACTGENU_CALL:1
-- BATCH:T
-- FAM:ProASIC3
-- OUTFORMAT:VHDL
-- LPMTYPE:LPM_PLL_CLKDLY
-- LPM_HINT:NONE
-- INSERT_PAD:NO
-- INSERT_IOREG:NO
-- GEN_BHV_VHDL_VAL:F
-- GEN_BHV_VERILOG_VAL:F
-- MGNTIMER:F
-- MGNCMPL:T
-- DESDIR:E:/Actelprj/backup/smart_top20140227_1058_1/smart_top20140227_1058_1_changeSHCOL_422ok/smart_top20140227_1058_1_changeSHCOL/smartgen\adcclk_3P9
-- GEN_BEHV_MODULE:T
-- SMARTGEN_DIE:M1IS8X8M2
-- SMARTGEN_PACKAGE:fg484
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- DLYGL:18
-- CLKASRC:0

-- _End_Comments_

