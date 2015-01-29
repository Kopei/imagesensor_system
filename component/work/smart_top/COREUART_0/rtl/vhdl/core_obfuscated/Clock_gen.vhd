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
use ieeE.stD_LOGIc_1164.all;
use ieee.STD_LOgic_arith.all;
use Ieee.STD_LOGIC_unsigned.all;
entity smart_top_COREUART_0_Clock_GEN is
generic (baud_val_frctN_EN: integer := 0); port (Clk: in std_logiC;
RESEt_n: in std_logic;
BAUd_val: in STD_LOGIC_VECtor(12 downto 0);
bAUD_VAL_FRACtion: in Std_logic_vector(2 downto 0);
CUARTo: out std_logiC;
CUARTl: out STD_LOGIC);
end entity smart_top_COREUART_0_ClOCK_GEN;

architecture CUARTI of smart_top_COREUART_0_CLOCK_gen is

signal CUARTol: STd_logic_vector(12 downto 0);

signal CUARTLL: STD_LOGIC;

signal CUARTIL: STD_LOGIc;

signal CUARToi: std_logiC_VECTOR(3 downto 0);

signal CUARTli: std_LOGIC;

begin
CUARTii:
if (baud_val_frctn_EN = 1)
generate
CUARTo0:
process (CLK,RESET_n)
begin
if (Reset_n = '0') then
CUARTli <= '0';
elsif (CLK'EVENT and clk = '1') then
if (CUARTol = "0000000000001") then
CUARTLI <= '1';
else
CUARTli <= '0';
end if;
end if;
end process CUARTO0;
CUARTl0:
process (clk,reset_n)
begin
if (resET_N = '0') then
CUARTOL <= "0000000000000";
CUARTLl <= '0';
elsif (clk'EVEnt and clk = '1') then
case BAUD_val_fraction is
when "000" =>
if (CUARTol = "0000000000000") then
CUARTOl <= BAUD_VAL;
CUARTLL <= '1';
else
CUARTol <= CUARTOL-'1';
CUARTll <= '0';
end if;
when "001" =>
if (CUARTOL = "0000000000000") then
if (CUARToI(2 downto 0) = "111" and CUARTli = '1') then
CUARTol <= CUARTol;
CUARTLL <= '0';
else
CUARTol <= BAUD_val;
CUARTLL <= '1';
end if;
else
CUARTOL <= CUARTOL-'1';
CUARTLL <= '0';
end if;
when "010" =>
if (CUARTOL = "0000000000000") then
if (CUARToi(1 downto 0) = "11" and CUARTli = '1') then
CUARTol <= CUARTol;
CUARTLL <= '0';
else
CUARTol <= BAud_val;
CUARTLL <= '1';
end if;
else
CUARTOL <= CUARTol-'1';
CUARTll <= '0';
end if;
when "011" =>
if (CUARTol = "0000000000000") then
if ((((CUARToi(2) = '1') or (CUARTOI(1) = '1')) and CUARTOI(0) = '1') and (CUARTLI = '1')) then
CUARTOL <= CUARTOL;
CUARTll <= '0';
else
CUARTol <= BAUD_VAl;
CUARTLL <= '1';
end if;
else
CUARTol <= CUARTol-'1';
CUARTll <= '0';
end if;
when "100" =>
if (CUARTol = "0000000000000") then
if (CUARTOI(0) = '1' and CUARTLI = '1') then
CUARTol <= CUARTol;
CUARTLL <= '0';
else
CUARTol <= BAUD_Val;
CUARTLL <= '1';
end if;
else
CUARTOL <= CUARTol-'1';
CUARTll <= '0';
end if;
when "101" =>
if (CUARTol = "0000000000000") then
if (((CUARTOI(2) = '1' and CUARToi(1) = '1') or CUARToI(0) = '1') and CUARTli = '1') then
CUARTol <= CUARTol;
CUARTLL <= '0';
else
CUARTol <= BAud_val;
CUARTLL <= '1';
end if;
else
CUARTol <= CUARTOL-'1';
CUARTLL <= '0';
end if;
when "110" =>
if (CUARTOL = "0000000000000") then
if ((CUARToi(1) = '1' or CUARTOI(0) = '1') and CUARTLI = '1') then
CUARTol <= CUARTol;
CUARTLL <= '0';
else
CUARTol <= BAUD_VAl;
CUARTlL <= '1';
end if;
else
CUARTOl <= CUARTOL-'1';
CUARTLL <= '0';
end if;
when "111" =>
if (CUARTOL = "0000000000000") then
if (((CUARTOI(1) = '1' or CUARTOI(0) = '1') or CUARTOI(2 downto 0) = "100") and CUARTLI = '1') then
CUARTol <= CUARTol;
CUARTLL <= '0';
else
CUARTol <= BAUD_val;
CUARTLL <= '1';
end if;
else
CUARTol <= CUARTol-'1';
CUARTll <= '0';
end if;
when others =>
if (CUARTol = "0000000000000") then
CUARTol <= BAUD_VAL;
CUARTll <= '1';
else
CUARTol <= CUARTol-'1';
CUARTLL <= '0';
end if;
end case;
end if;
end process CUARTl0;
end generate;
CUARTI0:
if (BAud_val_frctn_en = 0)
generate
CUARTO1:
process (CLK,RESET_N)
begin
if (reset_n = '0') then
CUARTol <= "0000000000000";
CUARTLL <= '0';
elsif (clk'event and clk = '1') then
if (CUARTol = "0000000000000") then
CUARTol <= BAUD_VAL;
CUARTll <= '1';
else
CUARTOl <= CUARTol-'1';
CUARTLL <= '0';
end if;
end if;
end process CUARTO1;
end generate;
CUARTL1:
process (CLK,RESET_N)
begin
if (RESET_N = '0') then
CUARToi <= "0000";
CUARTIl <= '0';
elsif (clk'event and CLK = '1') then
if (CUARTLL = '1') then
CUARTOI <= CUARToi+'1';
if (CUARToi = "1111") then
CUARTil <= '1';
else
CUARTIL <= '0';
end if;
end if;
end if;
end process;
CUARTL <= CUARTIL and CUARTLL;
CUARTo <= CUARTll;
end CUARTI;
