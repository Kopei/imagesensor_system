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
library IEEE;
use IEEE.STD_logic_1164.all;
use ieeE.std_logIC_ARITH.all;
use Ieee.std_logic_unsigNED.all;
entity smart_top_COREUART_0_Rx_ASYNC is
generic (rx_fifo: inTEGER := 0); port (clk: in sTD_LOGIC;
CUARTo: in std_logic;
reset_N: in Std_logic;
bit8: in std_logic;
pARITY_EN: in STD_Logic;
ODD_n_even: in std_logic;
CUARTOOL: in std_logic;
CUARTlol: in std_logic;
CUARTioL: in STD_LOGIC;
RX: in STD_logic;
overflow: out std_loGIC;
pariTY_ERR: out STD_logic;
CUARToll: out std_logic;
CUARTlll: out std_loGIC;
CUARTILL: out STD_Logic;
CUARTlil: out STD_Logic;
CUARTOIL: out std_logic;
CUARTiil: out std_LOGIC;
CUARTo0L: out std_logic_VECTOR(7 downto 0);
CUARTl0L: out STD_LOGIC);
end entity smart_top_COREUART_0_Rx_async;

architecture CUARTi1 of smart_top_COREUART_0_RX_ASYNc is

type CUARToiii is (CUARTi00,CUARTliii,CUARTiiii);

signal CUARToool: CUARTOIII;

signal CUARTo0ii: STD_LOGIC_vector(3 downto 0);

signal CUARTl0ii: std_logiC;

signal CUARTi0ii: std_logic_vECTOR(8 downto 0);

signal CUARTO1II: STD_logic;

signal CUARTL1II: Std_logic_vector(3 downto 0);

signal CUARTi1ii: std_logic;

signal CUARToo0i: std_logiC_VECTOR(2 downto 0);

signal CUARTlo0i: sTD_LOGIC;

signal CUARTio0i: std_loGIC_VECTOR(1 downto 0);

signal CUARTol0I: STD_Logic_vector(1 downto 0);

signal CUARTLL0i: std_logic_vECTOR(3 downto 0);

signal CUARToo1: std_logic_vECTOR(3 downto 0);

signal CUARTil0i: std_lOGIC_VECTOR(3 downto 0);

signal CUARTOI0I: STD_logic_vector(3 downto 0);

signal CUARTli0i: std_loGIC;

signal CUARTii0i: std_logIC;

signal CUARTO00i: Std_logic;

signal CUARTL00I: STD_LOGic;

signal CUARTi00i: std_logic;

signal CUARTo10I: STD_LOGIC;

signal CUARTL10I: STD_LOGIC;

signal CUARTI10I: STD_logic;

signal CUARTOO1I: STd_logic_vector(7 downto 0);

signal CUARTLO1I: STD_LOGIC;

begin
CUARTill <= CUARTi00i;
CUARToll <= CUARTo00i;
OVERFLOW <= CUARTLI0I;
PARITY_ERR <= CUARTii0i;
CUARToil <= CUARTo10i;
CUARTiil <= CUARTi10I;
CUARTo0l <= CUARToo1i;
CUARTL0l <= CUARTLO1i;
CUARTLLl <= '1' when (CUARTOOOl = CUARTI00) else
'0';
CUARTLIL <= CUARTl10i;
CUARTio1i:
process (clk,reset_n)
begin
if (RESet_n = '0') then
CUARTOO0i <= "000";
elsif (CLK'EVENT and clk = '1') then
if (CUARTo = '1') then
CUARToo0i(1 downto 0) <= CUARToo0i(2 downto 1);
CUARToo0i(2) <= RX;
end if;
end if;
end process CUARTIo1i;
process (CUARTOO0i)
begin
case CUARToo0i is
when "000" =>
CUARTl0ii <= '0';
when "001" =>
CUARTL0II <= '0';
when "010" =>
CUARTl0ii <= '0';
when "011" =>
CUARTL0II <= '1';
when "100" =>
CUARTl0ii <= '0';
when "101" =>
CUARTL0II <= '1';
when "110" =>
CUARTl0ii <= '1';
when others =>
CUARTL0ii <= '1';
end case;
end process;
CUARTOL1I:
process (clk,reset_n)
begin
if (RESEt_n = '0') then
CUARTo0ii <= "0000";
elsif (clk'EVent and CLK = '1') then
if (CUARTO = '1') then
if (CUARToool = CUARTi00 and (CUARTL0Ii = '1' or CUARTO0ii = "1000")) then
CUARTo0ii <= "0000";
else
CUARTO0II <= CUARTo0II+"0001";
end if;
end if;
end if;
end process CUARTOL1I;
CUARTll1i:
process (CLK,RESET_N)
begin
if (rESET_N = '0') then
CUARTLI0I <= '0';
elsif (clk'event and clK = '1') then
if (CUARTo = '1') then
if (CUARTlo0i = '1') then
CUARTli0i <= '1';
end if;
end if;
if (CUARTool = '1') then
CUARTli0i <= '0';
end if;
end if;
end process CUARTll1i;
CUARTil1i:
process (CLK,RESET_n)
begin
if (RESET_N = '0') then
CUARTo00I <= '0';
elsif (clk'EVEnt and clk = '1') then
if (CUARTIOL = '1') then
CUARTo00i <= '0';
elsif (CUARTo = '1') then
if (CUARTL00I = '1') then
CUARTo00i <= '1';
end if;
else
CUARTo00i <= CUARTO00i;
end if;
end if;
end process CUARTIL1I;
CUARTOO1 <= "1000" when (BIT8 = '1' and parity_en = '0') else
"1001";
CUARTil0i <= "1000" when (biT8 = '0' and Parity_en = '1') else
CUARTOO1;
CUARToi0i <= "0111" when (bit8 = '0' and PARITY_EN = '0') else
CUARTil0i;
CUARTll0i <= CUARToi0i;
CUARToi1i:
process (CLK,RESET_N)
begin
if (RESET_N = '0') then
CUARToool <= CUARTI00;
CUARToo1i <= "00000000";
CUARTLO0I <= '0';
CUARTl00i <= '0';
CUARTi00i <= '0';
elsif (CLK'EVENT and clk = '1') then
if (CUARTo = '1') then
CUARTLO0i <= '0';
CUARTl00i <= '0';
CUARTi00i <= '0';
case CUARTOOOL is
when CUARTi00 =>
if (CUARTo0ii = "1000") then
CUARToool <= CUARTliii;
else
CUARToool <= CUARTi00;
end if;
when CUARTliii =>
if (CUARTl1ii = CUARTll0i) then
CUARToool <= CUARTIiii;
CUARTLO0I <= CUARTI1ii;
if (CUARTI1Ii = '0') then
CUARToo1i <= (BIT8 and CUARTI0II(7))&CUARTi0ii(6 downto 0);
end if;
else
CUARTOOOL <= CUARTliii;
end if;
when CUARTiiiI =>
if (CUARTO0II = "1110") then
if (CUARTl0II = '0') then
CUARTl00i <= '1';
end if;
elsif (CUARTo0ii = "1111") then
CUARTi00i <= '1';
CUARToool <= CUARTi00;
else
CUARTOOOl <= CUARTIiii;
end if;
when others =>
CUARTOOol <= CUARTi00;
end case;
end if;
end if;
end process CUARToi1I;
CUARTio0i <= BIT8&PARITY_en;
CUARTLI1I:
process (clk,reset_n)
begin
if (reset_n = '0') then
CUARTi0II(8 downto 0) <= "000000000";
CUARTL1ii <= "0000";
elsif (CLK'EVENT and clk = '1') then
if (CUARTo = '1') then
if (CUARTOOOL = CUARTI00) then
CUARTI0ii(8 downto 0) <= "000000000";
CUARTL1ii <= "0000";
else
if (CUARTo0ii = "1111") then
CUARTL1II <= CUARTL1II+"0001";
case CUARTIO0i is
when "00" =>
CUARTi0ii(5 downto 0) <= CUARTi0II(6 downto 1);
CUARTI0II(6) <= CUARTL0ii;
when "11" =>
CUARTi0iI(7 downto 0) <= CUARTi0ii(8 downto 1);
CUARTI0II(8) <= CUARTl0ii;
when others =>
CUARTi0ii(6 downto 0) <= CUARTI0II(7 downto 1);
CUARTi0ii(7) <= CUARTL0II;
end case;
end if;
end if;
end if;
end if;
end process CUARTli1I;
CUARTii1i:
process (CLK,RESET_n)
begin
if (RESET_N = '0') then
CUARTo1ii <= '0';
elsif (clk'event and CLK = '1') then
if (CUARTO = '1') then
if (CUARTO0II = "1111" and PARity_en = '1') then
CUARTo1ii <= CUARTo1iI xor CUARTl0II;
end if;
if (CUARToool = CUARTiiii) then
CUARTo1ii <= '0';
end if;
end if;
end if;
end process CUARTii1i;
CUARTOL0I <= biT8&odd_n_EVEN;
CUARTO01i:
process (clk,reset_n)
begin
if (RESet_n = '0') then
CUARTiI0I <= '0';
elsif (clk'event and clk = '1') then
if ((CUARTo = '1' and parity_EN = '1') and CUARTO0II = "1111") then
case CUARTol0i is
when "00" =>
if (CUARTl1ii = "0111") then
CUARTii0I <= CUARTo1ii xor CUARTL0II;
end if;
when "01" =>
if (CUARTL1ii = "0111") then
CUARTii0i <= not (CUARTO1II xor CUARTl0ii);
end if;
when "10" =>
if (CUARTL1II = "1000") then
CUARTii0i <= CUARTO1II xor CUARTl0ii;
end if;
when "11" =>
if (CUARTl1ii = "1000") then
CUARTII0I <= not (CUARTo1ii xor CUARTl0II);
end if;
when others =>
CUARTii0i <= '0';
end case;
end if;
if (CUARTlol = '1') then
CUARTii0i <= '0';
end if;
end if;
end process CUARTo01i;
CUARTL01I:
process (clK,reseT_N)
begin
if (reset_n = '0') then
CUARTi1II <= '0';
CUARTLO1I <= '1';
CUARTo10i <= '0';
CUARTL10i <= '0';
elsif (CLK'EVENT and clk = '1') then
CUARTLO1i <= '1';
CUARTo10i <= '0';
CUARTL10I <= '0';
if (CUARTo = '1') then
if (bit8 = '1') then
if (parity_en = '1') then
if (CUARTL1II = "1001" and CUARToool = CUARTLIIi) then
CUARTlo1i <= '0';
CUARTo10i <= '1';
CUARTL10I <= '1';
if (RX_FIFO = 2#0#) then
CUARTi1II <= '1';
end if;
end if;
else
if (CUARTL1II = "1000" and CUARToool = CUARTliii) then
CUARTLO1I <= '0';
CUARTo10i <= '1';
CUARTl10i <= '1';
if (rx_fiFO = 2#0#) then
CUARTi1ii <= '1';
end if;
end if;
end if;
else
if (parity_en = '1') then
if (CUARTl1ii = "1000" and CUARTOOol = CUARTliii) then
CUARTlo1I <= '0';
CUARTO10I <= '1';
CUARTl10i <= '1';
if (rx_fifo = 2#0#) then
CUARTI1II <= '1';
end if;
end if;
else
if (CUARTl1ii = "0111" and CUARToooL = CUARTLIII) then
CUARTLO1i <= '0';
CUARTo10i <= '1';
CUARTl10i <= '1';
if (rx_fifo = 2#0#) then
CUARTI1II <= '1';
end if;
end if;
end if;
end if;
end if;
if (CUARTOOL = '1') then
CUARTi1ii <= '0';
end if;
end if;
end process CUARTL01I;
CUARTi10i <= CUARTi1iI;
end architecture CUARTi1;
