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
library Ieee;
use ieee.std_logiC_1164.all;
use ieee.std_logic_ARITH.all;
use IEEE.STD_LOgic_unsigned.all;
entity Top_uart_COREUART_0_fifo_256X8 is
port (CUARTioi: out std_logic_VECTOR(7 downto 0);
CUARTOLI: in std_logic;
CUARTlli: in std_logIC;
CUARTIli: in std_logic_veCTOR(7 downto 0);
WRB: in STd_logic;
RDB: in STD_LOGIC;
RESET: in std_loGIC;
full: out STd_logic;
EMPTY: out STD_LOGIC);
end entity Top_uart_COREUART_0_fIFO_256X8;

architecture CUARTI1 of Top_uart_COREUART_0_fifo_256X8 is

component Top_uart_COREUART_0_fIFO_CTRL_256 is
generic (CUARTL0IL: iNTEGER := 16;
CUARTi0il: INTEGER := 4;
CUARTO1IL: integer := 8);
port (CUARTl1il: in std_logic;
RESet_n: in std_logic;
DAta_in: in stD_LOGIC_VECTor(CUARTo1il-1 downto 0);
CUARTI1IL: in std_logic;
CUARToo0l: in STD_LOGIC;
CUARTlo0l: in STD_LOGIC_Vector(7 downto 0);
DATA_OUT: out std_lOGIC_VECTOR(CUARTo1il-1 downto 0);
FULL: out STD_LOgic;
eMPTY: out STD_LOGIC;
CUARTio0L: out STD_LOGIC);
end component;

constant CUARTlo0l: sTD_LOGIC_VECtor(7 downto 0) := "01000000";

signal CUARTOL0L: std_logic_VECTOR(7 downto 0);

signal CUARTll0L: STD_LOGIC;

signal CUARTil0l: std_loGIC;

signal CUARToi0l: std_LOGIC;

signal CUARTLI0l: Std_logic;

begin
CUARTioi <= CUARTol0l;
fuLL <= CUARTll0l;
eMPTY <= CUARTil0l;
CUARTii0l: Top_uart_COREUART_0_fifo_ctrl_256
port map (data_in => CUARTili,
datA_OUT => CUARTol0l,
CUARTOO0L => wrB,
CUARTi1il => rdb,
CUARTL1IL => CUARTlli,
fulL => CUARTLL0L,
empty => CUARTIL0L,
CUARTio0l => CUARTLi0l,
resET_N => reseT,
CUARTLO0L => CUARTlo0l);
end architecture CUARTi1;

library ieee;
use iEEE.STd_logic_1164.all;
use ieeE.STD_logic_arith.all;
use ieee.STD_logic_unsigned.all;
entity Top_uart_COREUART_0_fifO_CTRL_256 is
generic (CUARTl0il: inteGER := 16;
CUARTi0il: integer := 4;
CUARTO1IL: integer := 8); port (CUARTL1il: in std_lOGIC;
reset_n: in stD_LOGIC;
data_in: in STD_LOGIC_vector(CUARTo1il-1 downto 0);
CUARTi1il: in STD_LOGIC;
CUARToo0l: in std_loGIC;
CUARTlo0l: in std_logic_VECTOR(7 downto 0);
DATA_OUT: out std_lOGIC_VECTOR(CUARTo1il-1 downto 0);
full: out STD_LOGIC;
empty: out std_logic;
CUARTIO0L: out STD_LOGIc);
end entity Top_uart_COREUART_0_fifo_ctrl_256;

architecture CUARTi1 of Top_uart_COREUART_0_FIfo_ctrl_256 is

component Top_uart_COREUART_0_rAM16X8 is
generic (CUARTO00L: integer := 8;
CUARTL00l: integer := 16;
CUARTi00l: integeR := 4);
port (clk: in STD_LOGIc;
DATA_in: in STD_LOGIC_VECtor(CUARTo00l-1 downto 0);
CUARTO10l: in STD_LOGIC_vector(CUARTi00l-1 downto 0);
CUARTL10L: in std_LOGIC_VECTOR(CUARTI00L-1 downto 0);
CUARTOO0l: in std_logic;
CUARTi1IL: in STD_LOGIC;
DATA_out: out STD_LOGIC_Vector(CUARTo00l-1 downto 0));
end component;

signal CUARTi10l: STD_LOGIC_Vector(CUARTo1il-1 downto 0);

signal CUARTOO1L: Std_logic;

signal CUARTlo1l: STD_LOGIC_Vector(CUARTi0il-1 downto 0);

signal CUARTio1l: STD_LOGIC_vector(CUARTI0IL-1 downto 0);

signal CUARTol1l: sTD_LOGIC_VECTor(CUARTI0IL-1 downto 0);

signal CUARTLL1l: std_logic;

signal CUARTIl1l: std_logic;

signal CUARToo1: STD_Logic;

signal CUARToi1l: STD_LOGIC_VECtor(CUARTO1Il-1 downto 0);

signal CUARTll0l: std_logic;

signal CUARTIL0l: STD_LOgic;

signal CUARTli1L: STD_LOGIC;

begin
DATA_Out <= CUARToi1l;
fulL <= CUARTll0l;
EMPTY <= CUARTil0L;
CUARTIo0l <= CUARTLI1L;
CUARTLL1L <= '1' when (CUARTlO1L = conv_std_logic_VECTOR(CUARTl0il-1,
4)) else
'0';
CUARTll0l <= CUARTll1l;
CUARTIl1l <= '1' when (CUARTLO1L = "0000") else
'0';
CUARTIL0L <= CUARTIL1L;
CUARTOO1 <= '1' when (CUARTlo1l >= CUARTlo0l) else
'0';
CUARTli1l <= CUARToo1;
process (CUARTL1il,reset_n)
begin
if (not RESET_N = '1') then
CUARTio1l <= ( others => '0');
CUARTol1l <= ( others => '0');
CUARTlO1L <= ( others => '0');
elsif (CUARTl1il'evenT and CUARTl1iL = '1') then
if (not CUARTI1Il = '1') then
if (CUARTOO0L = '1') then
CUARTlo1l <= CUARTLO1l-"0001";
end if;
if (CUARTIO1L = CONV_STD_logic_vector(CUARTL0IL-1,
4)) then
CUARTio1L <= ( others => '0');
else
CUARTIO1L <= CUARTio1l+"0001";
end if;
end if;
if (not CUARToo0l = '1') then
if (CUARTI1IL = '1') then
CUARTLO1L <= CUARTlo1l+"0001";
end if;
if (CUARTol1l = conv_std_logIC_VECTOR(CUARTl0il-1,
4)) then
CUARTol1L <= ( others => '0');
else
CUARTol1l <= CUARTOL1L+"0001";
end if;
end if;
end if;
end process;
process (CUARTL1IL,RESet_n)
begin
if (not reset_n = '1') then
CUARToo1l <= '0';
elsif (CUARTl1il'event and CUARTL1IL = '1') then
CUARTOO1L <= CUARTI1il;
if (CUARToo1l = '0') then
CUARToi1l <= CUARTI10L;
else
CUARTOI1l <= CUARTOI1L;
end if;
end if;
end process;
CUARTii1l: Top_uart_COREUART_0_ram16X8
port map (clk => CUARTl1il,
data_in => data_in,
DATA_OUT => CUARTi10l,
CUARTl10l => CUARTOL1L,
CUARTo10l => CUARTio1L,
CUARToo0l => CUARToo0l,
CUARTI1IL => CUARTI1il);
end architecture CUARTi1;

library IEEE;
use IEEE.std_logIC_1164.all;
use IEEE.std_logic_ARITH.all;
use IEEE.std_LOGIC_UNSIGNEd.all;
entity Top_uart_COREUART_0_RAM16X8 is
generic (CUARTO00L: integer := 8;
CUARTl00l: inTEGER := 16;
CUARTi00l: integer := 4); port (clk: in STD_LOGic;
data_in: in STD_LOGIc_vector(CUARTo00l-1 downto 0);
CUARTO10L: in std_LOGIC_VECTOR(CUARTi00l-1 downto 0);
CUARTL10l: in std_logiC_VECTOR(CUARTi00l-1 downto 0);
CUARTOO0l: in std_logic;
CUARTi1il: in std_LOGIC;
DATA_OUT: out std_lOGIC_VECTOR(CUARTo00l-1 downto 0));
end entity Top_uart_COREUART_0_RAM16X8;

architecture CUARTi1 of Top_uart_COREUART_0_RAM16X8 is

type CUARTo01l is array (CUARTl00l-1 downto 0) of STD_LOGIC_VEctor(CUARTo00l-1 downto 0);

signal CUARTl01l: CUARTo01l;

signal CUARToI1L: STD_LOGIC_Vector(CUARTO00L-1 downto 0);

function TO_INTEGER(val: STD_LOGIC_VEctor)
return integer is
constant CUARTi01l: STD_LOGIC_VECtor(val'high-val'low downto 0) := Val;
variable CUARTo11l: integer := 0;
begin
for CUARTl11l in CUARTI01l'range
loop
if (CUARTI01l(CUARTL11L) = '1') then
CUARTO11L := CUARTO11l+(2**CUARTL11l);
end if;
end loop;
return (CUARTo11l);
end to_iNTEGER;

begin
data_out <= CUARToi1l;
process (cLK)
variable CUARTi11l: CUARTo01L;
begin
if (CLK'EVENT and clk = '1') then
if (CUARTOO0l = '0') then
CUARTi11l(to_intEGER(CUARTL10L)) := data_in;
end if;
end if;
CUARTl01l <= CUARTI11L;
end process;
process (clk)
variable CUARToooi: stD_LOGIC_VECTor(CUARTO00L-1 downto 0);
begin
if (CLK'EVENT and clk = '1') then
if (CUARTi1il = '0') then
CUARToooi := CUARTl01l(tO_INTEGER(CUARTO10L));
end if;
end if;
CUARTOI1L <= CUARTOooi;
end process;
end architecture CUARTi1;
