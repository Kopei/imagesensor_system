-- Actel Corporation Proprietary and Confidential
--  Copyright 2008 Actel Corporation.  All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--  Revision Information:
-- Jun09    Revision 4.1
-- Aug10    Revision 4.2
-- SVN Revision Information:
-- SVN $Revision: 8508 $
-- SVN $Date: 2009-06-15 16:49:49 -0700 (Mon, 15 Jun 2009) $
library ieee;
use ieeE.STD_logic_1164.all;
library PROASIC3;
entity smart_top_COREUART_0_FIFO_256x8 is
port (CUARTIOI: out std_logic_vectoR(7 downto 0);
CUARTOLI: in std_lOGIC;
CUARTLLI: in STD_LOGIC;
CUARTili: in STD_LOgic_vector(7 downto 0);
WRB: in sTD_LOGIC;
rDB: in std_logic;
REset: in STD_LOGic;
FULL: out STD_LOgic;
EMPTY: out STD_LOGIC);
end entity smart_top_COREUART_0_FIFO_256X8;

architecture CUARTI1 of smart_top_COREUART_0_fifo_256X8 is

component smart_top_COREUART_0_fifo_256x8_PA3
port (CUARTIIOI: in std_logic_veCTOR(7 downto 0);
CUARTo0oi: out STD_LOGIC_Vector(7 downto 0);
CUARTo1oi: in std_logIC;
re: in Std_logic;
CUARTLLI: in STD_logic;
CUARTOLI: in STD_logic;
FULL: out std_LOGIC;
empty: out std_logic;
RESET: in STD_LOGic;
AEMPTY: out STD_LOGIC;
aFULL: out STD_LOGIC;
CUARTlo0l: in std_LOGIC_VECTOR(7 downto 0));
end component;

constant CUARTLO0L: STd_logic_vector(7 downto 0) := "11111111";

signal AEMPTy: STD_LOgic;

signal afull: std_logic;

signal CUARTiooi: std_logic_vECTOR(7 downto 0);

signal CUARTOL0L: STD_LOGIc_vector(7 downto 0);

signal CUARTLL0L: STD_LOgic;

signal CUARTIL0L: STD_LOGIc;

signal CUARTOI0l: STD_LOGic;

signal CUARTli0l: STd_logic;

begin
CUARTIOI <= CUARTOL0L;
full <= CUARTll0l;
emPTY <= CUARTil0l;
process (CUARTolI)
begin
if (CUARTOLI'EVENt and CUARTOLI = '1') then
CUARTOL0L <= CUARTiooi;
end if;
end process;
CUARTO0LI: smart_top_COREUART_0_fifo_256X8_PA3
port map (CUARTIIOI => CUARTILI,
CUARTO0OI => CUARTIOOI,
CUARTo1oi => WRB,
RE => rdb,
CUARTlli => CUARTlli,
CUARToli => CUARToli,
aempty => aEMPTY,
AFULl => CUARTli0l,
full => CUARTll0l,
empTY => CUARTIL0L,
REset => RESET,
CUARTlo0l => CUARTlo0l);
end architecture CUARTi1;

library IEEE;
use IEEE.std_logic_1164.all;
library proasic3;
entity smart_top_COREUART_0_fifo_256x8_PA3 is
port (CUARTIIOI: in std_logIC_VECTOR(7 downto 0);
CUARTo0oi: out STD_LOGIC_VECtor(7 downto 0);
CUARTo1oi: in std_logic;
RE: in STD_LOGIC;
CUARTLLI: in STD_LOGIC;
CUARTolI: in std_LOGIC;
full: out Std_logic;
EMPTY: out STD_LOGic;
RESET: in sTD_LOGIC;
aempTY: out STD_LOGIC;
afull: out std_logic;
CUARTlo0l: in std_LOGIC_VECTOR(7 downto 0));
end entity smart_top_COREUART_0_fifo_256x8_pa3;

architecture CUARTi1 of smart_top_COREUART_0_fifo_256x8_pa3 is

component INV
port (a: in STD_LOGIC := 'U';
y: out std_logic);
end component;

component fifO4K18
port (AEVAl11,aEVAL10,AEval9,aeval8,aeval7,aevaL6,AEVAL5,AEval4,aeval3,aeVAL2,AEVAL1,AEVAL0,afval11,afval10,AFVAL9,afval8,afval7,afvaL6,AFVAL5,afval4,afval3,afval2,afVAL1,AFVAL0,WD17,WD16,WD15,WD14,WD13,WD12,wd11,wd10,WD9,WD8,wd7,wd6,WD5,wD4,wd3,WD2,WD1,wd0,ww0,WW1,ww2,RW0,rW1,RW2,rPIPE,wen,REN,wblk,RBLK,wclk,RCLK,reset,ESTOP,fstoP: in stD_LOGIC := 'U';
RD17,rd16,Rd15,RD14,rd13,RD12,rd11,rd10,RD9,rd8,RD7,rd6,rd5,RD4,rd3,RD2,rd1,rD0,FULL,afull,EMPTY,aempty: out STD_LOGIC);
end component;

component VCC
port (Y: out std_logic);
end component;

component GND
port (Y: out std_logiC);
end component;

signal CUARTL0li: STD_Logic;

signal CUARTloLI: std_logiC;

signal CUARTIOLI: STD_LOGIC;

signal CUARTolli: std_logic_vECTOR(7 downto 0);

signal CUARTll0l: STd_logic;

signal CUARTIL0L: STD_LOGIC;

signal CUARTI0LI: std_LOGIC;

signal CUARTo1li: std_logic;

begin
CUARTo0oi <= CUARTolli;
full <= CUARTLL0l;
empty <= CUARTIl0l;
aempty <= CUARTi0li;
afull <= CUARTO1li;
CUARTLLLI: VCC
port map (y => CUARTLOLI);
CUARTilli: Gnd
port map (y => CUARTIOLI);
CUARTL1li: INV
port map (a => re,
Y => CUARTL0LI);
CUARTi1li: fifo4K18
port map (AEval11 => CUARTioli,
aeval10 => CUARTioli,
AEVAL9 => CUARTIOLi,
AEVAL8 => CUARTioli,
AEVAL7 => CUARTioli,
AEVAl6 => CUARTioLI,
AEVAL5 => CUARTioli,
aeval4 => CUARTioli,
AEVAL3 => CUARTLOLi,
AEVAl2 => CUARTioLI,
aeval1 => CUARTIOLI,
aEVAL0 => CUARTIOLI,
AFVAL11 => CUARTIOLI,
afval10 => CUARTlo0l(7),
afval9 => CUARTlo0l(6),
AFVAL8 => CUARTLO0L(5),
afval7 => CUARTlo0l(4),
afVAL6 => CUARTlo0l(3),
afval5 => CUARTLO0L(2),
AFVAL4 => CUARTlo0l(1),
afval3 => CUARTlo0L(0),
afval2 => CUARTIOLI,
Afval1 => CUARTioli,
AFVAL0 => CUARTIOLI,
wd17 => CUARTioli,
WD16 => CUARTIOLI,
WD15 => CUARTioli,
wd14 => CUARTiOLI,
WD13 => CUARTIOLI,
wd12 => CUARTioli,
wd11 => CUARTioli,
WD10 => CUARTioli,
wd9 => CUARTioli,
WD8 => CUARTioLI,
wd7 => CUARTiioi(7),
WD6 => CUARTIIOI(6),
Wd5 => CUARTIIoi(5),
Wd4 => CUARTIioi(4),
WD3 => CUARTIIOI(3),
WD2 => CUARTiioI(2),
wd1 => CUARTIIOI(1),
wd0 => CUARTIIoi(0),
Ww0 => CUARTloli,
ww1 => CUARTloli,
WW2 => CUARTIOli,
RW0 => CUARTLOLi,
RW1 => CUARTLOLi,
RW2 => CUARTioli,
RPIPE => CUARTioli,
WEN => CUARTO1OI,
rEN => CUARTl0lI,
wblk => CUARTioli,
RBlk => CUARTIOli,
WCLK => CUARTLLI,
rCLK => CUARTolI,
reset => reset,
ESTOP => CUARTLoli,
FStop => CUARTLoli,
RD17 => open ,
RD16 => open ,
rd15 => open ,
rd14 => open ,
RD13 => open ,
RD12 => open ,
rd11 => open ,
RD10 => open ,
RD9 => open ,
RD8 => open ,
rd7 => CUARTolli(7),
rd6 => CUARTolli(6),
RD5 => CUARTolli(5),
rD4 => CUARTolli(4),
RD3 => CUARTolli(3),
rd2 => CUARTOLLI(2),
Rd1 => CUARTolli(1),
RD0 => CUARTOlli(0),
FULL => open ,
AFULl => CUARTll0l,
empTY => CUARTIL0L,
aempty => CUARTI0LI);
end architecture CUARTi1;
