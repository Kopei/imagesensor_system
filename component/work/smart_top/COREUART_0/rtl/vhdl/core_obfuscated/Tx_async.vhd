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
use ieee.STd_logic_1164.all;
use IEEE.sTD_LOGIC_Arith.all;
use ieee.std_logic_unsigNED.all;
entity smart_top_COREUART_0_TX_ASync is
generic (tx_FIFO: intEGER := 0); port (clk: in sTD_LOGIC;
CUARTL: in Std_logic;
RESET_n: in Std_logic;
CUARTI0L: in STD_LOGic;
CUARTO1L: in stD_LOGIC_VECTOr(7 downto 0);
CUARTL1L: in Std_logic_vector(7 downto 0);
CUARTI1L: in STD_Logic;
CUARTooi: in std_logic;
BIT8: in STD_LOGIc;
PARITY_en: in STD_logic;
Odd_n_even: in std_logic;
TXRDy: out STD_LOgic;
TX: out std_logic;
CUARTloi: out std_logic);
end entity smart_top_COREUART_0_Tx_asYNC;

architecture CUARTi1 of smart_top_COREUART_0_Tx_async is

constant CUARTi01i: integer := 0;

constant CUARTO11i: Integer := 1;

constant CUARTl11I: inteGER := 2;

constant CUARTi11i: integer := 3;

constant CUARToOO0: INTEGER := 4;

constant CUARTloo0: integer := 5;

constant CUARTioo0: integer := 6;

signal CUARTolo0: integeR;

signal CUARTllo0: std_logic;

signal CUARTilo0: std_LOGIC_VECTOR(7 downto 0);

signal CUARToio0: STD_LOGic_vector(3 downto 0);

signal CUARTlio0: std_loGIC;

signal CUARTIIO0: STD_logic;

signal CUARTo0o0: std_logic;

signal CUARTl0o0: std_logIC;

function TO_INTEGER(val: STD_LOGIc_vector)
return inteGER is
constant CUARTi01l: STD_LOGIc_vector(VAL'HIGH-VAL'LOW downto 0) := VAL;
variable CUARTO11l: INTEGEr := 0;
begin
for CUARTL11L in CUARTi01l'range
loop
if (CUARTi01L(CUARTl11l) = '1') then
CUARTO11L := CUARTO11L+(2**CUARTL11L);
end if;
end loop;
return (CUARTo11l);
end TO_INTEGER;

begin
txrdy <= CUARTo0o0;
tx <= CUARTL0O0;
CUARTI0O0:
process (clk,resET_N)
begin
if (not reset_n = '1') then
CUARTllo0 <= '1';
elsif (cLK'evenT and CLk = '1') then
if (Tx_fifo = 2#0#) then
if (CUARTl = '1') then
if (CUARTOLO0 = CUARTL11i) then
CUARTLLO0 <= '1';
end if;
end if;
if (CUARTi0l = '1') then
CUARTLLO0 <= '0';
end if;
else
CUARTllo0 <= not CUARToOI;
end if;
end if;
end process CUARTI0o0;
CUARTO1O0:
process (clK,reset_N)
begin
if (not RESet_n = '1') then
CUARTolo0 <= CUARTi01i;
CUARTilo0 <= "00000000";
CUARTiio0 <= '1';
elsif (CLK'event and CLK = '1') then
if (CUARTl = '1' or CUARTolo0 = CUARTI01i
or CUARTolo0 = CUARTioo0
or CUARTolo0 = CUARTo11i) then
CUARTiio0 <= '1';
case CUARTOLo0 is
when CUARTI01i =>
if (TX_FIFO = 2#0#) then
if (not CUARTLLO0 = '1') then
CUARTolo0 <= CUARTo11i;
else
CUARTolo0 <= CUARTi01i;
end if;
else
if (CUARTi1l = '0') then
CUARTiio0 <= '0';
CUARTOLO0 <= CUARTIOo0;
else
CUARTOLO0 <= CUARTI01I;
CUARTIIO0 <= '1';
end if;
end if;
when CUARTO11I =>
CUARTolo0 <= CUARTl11i;
when CUARTL11i =>
if (tx_fifo = 2#0#) then
CUARTILO0 <= CUARTo1l;
else
CUARTilo0 <= CUARTl1l;
end if;
CUARTOLO0 <= CUARTI11I;
when CUARTi11i =>
if (bit8 = '1') then
if (CUARTOIO0 = "0111") then
if (PARITY_EN = '1') then
CUARTolo0 <= CUARTooo0;
else
CUARTolo0 <= CUARTloo0;
end if;
else
CUARTolo0 <= CUARTi11i;
end if;
else
if (CUARTOio0 = "0110") then
if (PARITY_en = '1') then
CUARTOLO0 <= CUARTOOO0;
else
CUARTolo0 <= CUARTLoo0;
end if;
else
CUARTolo0 <= CUARTi11i;
end if;
end if;
when CUARTOoo0 =>
CUARTolo0 <= CUARTloo0;
when CUARTLOo0 =>
CUARTOLO0 <= CUARTi01I;
when CUARTioo0 =>
CUARTolo0 <= CUARTo11i;
when others =>
CUARTOLO0 <= CUARTi01i;
end case;
end if;
end if;
end process CUARTo1o0;
CUARTLOI <= CUARTIIO0;
CUARTl1o0:
process (CLK,RESET_N)
begin
if (not reset_n = '1') then
CUARTOIO0 <= "0000";
elsif (CLK'EVENT and clk = '1') then
if (CUARTL = '1') then
if (CUARTolo0 /= CUARTi11i) then
CUARToio0 <= "0000";
else
CUARToio0 <= CUARTOIO0+"0001";
end if;
end if;
end if;
end process CUARTl1o0;
CUARTi1O0:
process (CLK,RESET_n)
begin
if (not resET_N = '1') then
CUARTl0O0 <= '1';
elsif (CLK'Event and cLK = '1') then
if (CUARTl = '1' or CUARTolo0 = CUARTi01i
or CUARTolo0 = CUARTioo0
or CUARTolo0 = CUARTO11i) then
case CUARTOLO0 is
when CUARTI01I =>
CUARTl0o0 <= '1';
when CUARTo11i =>
CUARTL0O0 <= '1';
when CUARTl11i =>
CUARTL0O0 <= '0';
when CUARTI11I =>
CUARTL0o0 <= CUARTilo0(to_integer(CUARToio0));
when CUARTOOO0 =>
CUARTl0o0 <= ODD_N_EVEN xor CUARTlio0;
when CUARTloo0 =>
CUARTL0O0 <= '1';
when others =>
CUARTl0o0 <= '1';
end case;
end if;
end if;
end process CUARTI1O0;
CUARTOOL0:
process (clk,reset_n)
begin
if (not RESET_N = '1') then
CUARTlio0 <= '0';
elsif (CLK'evenT and CLK = '1') then
if ((CUARTl and PARITY_en) = '1') then
if (CUARTolo0 = CUARTi11i) then
CUARTLIO0 <= CUARTlio0 xor CUARTilO0(TO_INTEGER(CUARTOIO0));
else
CUARTlio0 <= CUARTLIO0;
end if;
end if;
if (CUARTolO0 = CUARTlOO0) then
CUARTlio0 <= '0';
end if;
end if;
end process CUARTool0;
CUARTo0o0 <= CUARTllo0;
end architecture CUARTI1;
