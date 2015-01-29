-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity Uart_ram is 
    port( WD : in std_logic_vector(7 downto 0); RD : out 
        std_logic_vector(7 downto 0);WE, RE : in std_logic; WADDR : 
        in std_logic_vector(2 downto 0); RADDR : in 
        std_logic_vector(2 downto 0);WCLK, RCLK, RESETN : in 
        std_logic) ;
end Uart_ram;


architecture DEF_ARCH of  Uart_ram is

    component RAM4K9
    generic (MEMORYFILE:string := "");

        port(ADDRA11, ADDRA10, ADDRA9, ADDRA8, ADDRA7, ADDRA6, 
        ADDRA5, ADDRA4, ADDRA3, ADDRA2, ADDRA1, ADDRA0, ADDRB11, 
        ADDRB10, ADDRB9, ADDRB8, ADDRB7, ADDRB6, ADDRB5, ADDRB4, 
        ADDRB3, ADDRB2, ADDRB1, ADDRB0, DINA8, DINA7, DINA6, 
        DINA5, DINA4, DINA3, DINA2, DINA1, DINA0, DINB8, DINB7, 
        DINB6, DINB5, DINB4, DINB3, DINB2, DINB1, DINB0, WIDTHA0, 
        WIDTHA1, WIDTHB0, WIDTHB1, PIPEA, PIPEB, WMODEA, WMODEB, 
        BLKA, BLKB, WENA, WENB, CLKA, CLKB, RESET : in std_logic := 
        'U'; DOUTA8, DOUTA7, DOUTA6, DOUTA5, DOUTA4, DOUTA3, 
        DOUTA2, DOUTA1, DOUTA0, DOUTB8, DOUTB7, DOUTB6, DOUTB5, 
        DOUTB4, DOUTB3, DOUTB2, DOUTB1, DOUTB0 : out std_logic) ;
    end component;

    component INV
        port(A : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component VCC
        port( Y : out std_logic);
    end component;

    component GND
        port( Y : out std_logic);
    end component;

    signal WEAP, WEBP, VCC_1_net, GND_1_net : std_logic ;
    begin   

    VCC_2_net : VCC port map(Y => VCC_1_net);
    GND_2_net : GND port map(Y => GND_1_net);
    Uart_ram_R0C0 : RAM4K9
      port map(ADDRA11 => GND_1_net, ADDRA10 => GND_1_net, 
        ADDRA9 => GND_1_net, ADDRA8 => GND_1_net, ADDRA7 => 
        GND_1_net, ADDRA6 => GND_1_net, ADDRA5 => GND_1_net, 
        ADDRA4 => GND_1_net, ADDRA3 => GND_1_net, ADDRA2 => 
        WADDR(2), ADDRA1 => WADDR(1), ADDRA0 => WADDR(0), 
        ADDRB11 => GND_1_net, ADDRB10 => GND_1_net, ADDRB9 => 
        GND_1_net, ADDRB8 => GND_1_net, ADDRB7 => GND_1_net, 
        ADDRB6 => GND_1_net, ADDRB5 => GND_1_net, ADDRB4 => 
        GND_1_net, ADDRB3 => GND_1_net, ADDRB2 => RADDR(2), 
        ADDRB1 => RADDR(1), ADDRB0 => RADDR(0), DINA8 => 
        GND_1_net, DINA7 => WD(7), DINA6 => WD(6), DINA5 => WD(5), 
        DINA4 => WD(4), DINA3 => WD(3), DINA2 => WD(2), DINA1 => 
        WD(1), DINA0 => WD(0), DINB8 => GND_1_net, DINB7 => 
        GND_1_net, DINB6 => GND_1_net, DINB5 => GND_1_net, 
        DINB4 => GND_1_net, DINB3 => GND_1_net, DINB2 => 
        GND_1_net, DINB1 => GND_1_net, DINB0 => GND_1_net, 
        WIDTHA0 => VCC_1_net, WIDTHA1 => VCC_1_net, WIDTHB0 => 
        VCC_1_net, WIDTHB1 => VCC_1_net, PIPEA => GND_1_net, 
        PIPEB => GND_1_net, WMODEA => GND_1_net, WMODEB => 
        GND_1_net, BLKA => WEAP, BLKB => WEBP, WENA => GND_1_net, 
        WENB => VCC_1_net, CLKA => WCLK, CLKB => RCLK, RESET => 
        RESETN, DOUTA8 => OPEN , DOUTA7 => OPEN , DOUTA6 => OPEN , 
        DOUTA5 => OPEN , DOUTA4 => OPEN , DOUTA3 => OPEN , 
        DOUTA2 => OPEN , DOUTA1 => OPEN , DOUTA0 => OPEN , 
        DOUTB8 => OPEN , DOUTB7 => RD(7), DOUTB6 => RD(6), 
        DOUTB5 => RD(5), DOUTB4 => RD(4), DOUTB3 => RD(3), 
        DOUTB2 => RD(2), DOUTB1 => RD(1), DOUTB0 => RD(0));
    WEBUBBLEB : INV
      port map(A => RE, Y => WEBP);
    WEBUBBLEA : INV
      port map(A => WE, Y => WEAP);
end DEF_ARCH;

-- _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


-- _GEN_File_Contents_

-- Version:9.1.0.18
-- ACTGENU_CALL:1
-- BATCH:T
-- FAM:ProASIC3
-- OUTFORMAT:VHDL
-- LPMTYPE:LPM_RAM
-- LPM_HINT:TWO
-- INSERT_PAD:NO
-- INSERT_IOREG:NO
-- GEN_BHV_VHDL_VAL:F
-- GEN_BHV_VERILOG_VAL:F
-- MGNTIMER:F
-- MGNCMPL:T
-- DESDIR:E:/Actelprj/backup/smart_top20140227_1058_1/smartgen\Uart_ram
-- GEN_BEHV_MODULE:T
-- SMARTGEN_DIE:M1IS8X8M2
-- SMARTGEN_PACKAGE:fg484
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- WWIDTH:8
-- WDEPTH:8
-- RWIDTH:8
-- RDEPTH:8
-- CLKS:2
-- RESET_PN:RESETN
-- RESET_POLARITY:0
-- INIT_RAM:F
-- DEFAULT_WORD:0x00
-- CASCADE:0
-- WCLK_EDGE:RISE
-- RCLK_EDGE:RISE
-- WCLOCK_PN:WCLK
-- RCLOCK_PN:RCLK
-- PMODE2:0
-- DATA_IN_PN:WD
-- WADDRESS_PN:WADDR
-- WE_PN:WE
-- DATA_OUT_PN:RD
-- RADDRESS_PN:RADDR
-- RE_PN:RE
-- WE_POLARITY:1
-- RE_POLARITY:1
-- PTYPE:1

-- _End_Comments_

