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
use IEEE.stD_LOGic_1164.all;
use ieee.std_logic_ARITH.all;
use IEEE.STD_LOGIC_Unsigned.all;
entity Top_uart_COREUART_0_COREUART is
generic (family: integer := 15;
TX_FIFo: integer := 0;
rx_fIFO: INTEGEr := 0;
Rx_legacy_mode: INTEGER := 0;
baUD_VAL_FRCTN_en: INTEGER := 0); port (RESet_n: in STD_logic;
CLK: in STD_LOGIC;
WEN: in STD_LOGIc;
OEn: in STD_logic;
csn: in std_logic;
data_in: in Std_logic_vector(7 downto 0);
Rx: in std_logic;
baud_val: in STD_LOGIC_VECtor(12 downto 0);
bIT8: in STD_LOGIC;
parity_eN: in STD_LOGIC;
ODD_n_even: in STD_LOGic;
Baud_val_fractioN: in STD_Logic_vector(2 downto 0);
PARity_err: out std_lOGIC;
overfloW: out std_LOGIC;
TXRDY: out sTD_LOGIC;
rxrdy: out Std_logic;
DAta_out: out std_logIC_VECTOR(7 downto 0);
tx: out STD_logic;
FRAMing_err: out std_logic);
end entity Top_uart_COREUART_0_COREUART;

architecture CUARTI1 of Top_uart_COREUART_0_COREUART is

component Top_uart_COREUART_0_Rx_async
generic (RX_FIFO: integER := 0);
port (CLK: in STD_logic;
CUARTo: in std_logic;
reset_n: in std_logic;
BIT8: in STD_logic;
pARITY_EN: in STD_Logic;
odd_N_EVEN: in STD_Logic;
CUARTool: in sTD_LOGIC;
CUARTLOL: in Std_logic;
CUARTIol: in std_logiC;
rx: in STD_logic;
OVErflow: out std_logic;
parity_err: out sTD_LOGIC;
CUARTOLL: out std_logic;
CUARTlll: out std_logic;
CUARTill: out std_LOGIC;
CUARToil: out std_LOGIC;
CUARTLIL: out std_logic;
CUARTIIl: out std_logic;
CUARTO0L: out std_loGIC_VECTOR(7 downto 0);
CUARTL0L: out std_lOGIC);
end component;

component Top_uart_COREUART_0_Tx_asynC
generic (tx_fifo: inteGER := 0);
port (CLK: in STD_LOgic;
CUARTL: in STd_logic;
reset_n: in std_logic;
CUARTI0L: in std_logic;
CUARTo1l: in STd_logic_vector(7 downto 0);
CUARTL1l: in std_logic_VECTOR(7 downto 0);
CUARTi1l: in std_logic;
CUARTooi: in std_lOGIC;
BIT8: in STD_LOGic;
PARITY_EN: in STD_logic;
ODD_N_even: in Std_logic;
TXRDY: out STD_LOGIC;
tx: out STD_LOGic;
CUARTLOI: out STD_logic);
end component;

component Top_uart_COREUART_0_CLOCK_GEN
generic (BAud_val_frctn_en: INTEger := 0);
port (clk: in std_LOGIC;
reset_n: in std_logic;
BAUD_VAl: in std_logic_VECTOR(12 downto 0);
BAUD_val_fraction: in STD_logic_vector(2 downto 0);
CUARTo: out STD_LOGIC;
CUARTL: out std_logic);
end component;

component Top_uart_COREUART_0_FIFO_256x8 is
port (CUARTIoi: out std_LOGIC_VECTOR(7 downto 0);
CUARToli: in STd_logic;
CUARTlli: in std_logic;
CUARTILI: in std_logic_veCTOR(7 downto 0);
wrb: in std_loGIC;
RDB: in STD_LOGIC;
reset: in std_logic;
FULL: out STD_LOGIC;
EMPTY: out stD_LOGIC);
end component;

constant CUARToii: STD_LOGIC_vector(1 downto 0) := "00";

constant CUARTLII: std_logic_vectoR(1 downto 0) := "01";

constant CUARTIII: Std_logic_vector(1 downto 0) := "10";

constant CUARTo0I: STD_LOGic_vector(1 downto 0) := "11";

signal CUARTl0i: std_logic;

signal CUARTiil: STd_logic;

signal CUARTi0i: std_logic;

signal CUARTl0l: STD_logic;

signal CUARTL: STD_LOGIC;

signal CUARTO: std_loGIC;

signal CUARTi0l: std_logic;

signal CUARTO1L: STD_logic_vector(7 downto 0);

signal CUARTL1L: STD_LOGIC_VEctor(7 downto 0);

signal CUARTO1i: std_logic_vECTOR(7 downto 0);

signal CUARTool: std_logic;

signal CUARTL1I: std_logic_vector(7 downto 0);

signal CUARTo0l: std_logic_vectoR(7 downto 0);

signal CUARTi1i: std_lOGIC_VECTOR(7 downto 0);

signal CUARToo0: std_loGIC;

signal CUARTlo0: std_loGIC;

signal CUARTio0: std_logic;

signal CUARTol0: std_logic;

signal CUARTloi: STD_Logic;

signal CUARTLL0: STD_LOGIC;

signal CUARTIL0: STD_LOGIc;

signal CUARTLOL: STD_LOGIC;

signal CUARTOIL: sTD_LOGIC;

signal CUARToi0: std_logic;

signal CUARTLI0: STD_LOGIC;

signal CUARTII0: STD_LOGic;

signal CUARTILL: STD_LOGIC;

signal CUARTIOL: STD_LOGIC;

signal CUARTlIL: std_loGIC;

signal CUARTO00: std_logic;

signal CUARTL00: STD_LOgic;

signal CUARTi00: std_logIC;

signal CUARTO10: STD_logic;

signal CUARTl10: std_logic;

signal CUARTi10: std_logic;

signal CUARToo1: std_lOGIC;

signal CUARTlo1: std_logic;

signal CUARTio1: std_logic;

signal CUARTol1: std_logic;

signal CUARTLL1: STD_logic;

signal CUARTil1: STD_LOGIC_VEctor(7 downto 0);

signal CUARToi1: std_logIC;

signal CUARTli1: std_logic;

signal CUARTII1: STD_Logic;

signal CUARTO01: STD_LOGic;

signal CUARTl01: std_logic;

signal CUARTi01: std_logic;

signal CUARTO11: STD_logic_vector(7 downto 0);

signal CUARTl11: std_LOGIC;

signal CUARTI11: std_logic;

signal CUARToool: std_logIC_VECTOR(1 downto 0);

signal CUARTlooL: STD_LOGIC_vector(1 downto 0);

begin
FRAMING_Err <= CUARTO10;
parity_ERR <= CUARTII1;
OVerflow <= CUARTo01;
txrdy <= CUARTl01;
rxrdy <= CUARTi01;
DATA_OUT <= CUARTO11;
tx <= CUARTL11;
CUARTiOOL:
process (clk,reset_n)
begin
if (Reset_n = '0') then
CUARTo1l <= '0'&'0'&'0'&'0'&'0'&'0'&'0'&'0';
CUARTOL0 <= '1';
elsif (CLK'EVENt and clk = '1') then
CUARTOl0 <= '1';
if (csn = '0' and wen = '0') then
CUARTo1l <= DATA_IN;
CUARTol0 <= '0';
end if;
end if;
end process CUARTiool;
CUARToo1 <= '1' when (wen = '0' and csn = '0') else
'0';
CUARTi0l <= CUARToo1;
process (CUARTo0l,CUARTL1I,CUARTiI1)
variable CUARTolol: STD_LOGIC_Vector(7 downto 0);
begin
if (RX_Fifo = 2#0#) then
CUARTolol := CUARTo0l;
else
if (CUARTii1 = '1') then
CUARTOLOL := CUARTo0l;
else
CUARTolol := CUARTL1I;
end if;
end if;
CUARTO11 <= CUARTolol;
end process;
CUARTlo1 <= '1' when (CSn = '0' and OEN = '0') else
'0';
CUARTIO1 <= (CUARTlo1) when (rx_fIFO = 2#0#) else
not CUARTil0;
CUARTOOL <= CUARTio1;
CUARTol1 <= '1' when (csn = '0' and oen = '0') else
'0';
CUARTll1 <= CUARTli0 when rx_FIFO /= 0 else
(CUARTol1);
CUARTlol <= CUARTLL1;
CUARTIl1 <= CUARTo0l when (CUARTii1 = '0') else
"00000000";
CUARTI1i <= CUARTIL1;
CUARTiol <= CUARTl00 when RX_fifo /= 0 else
(CUARTol1);
CUARTi10 <= '1' when (CSN = '0' and oen = '0') else
'0';
CUARTllol:
if (rx_legacy_mODE = 1)
generate
process (CUARTIIL,CUARTI11)
variable CUARTilol: std_loGIC;
begin
if (rx_fIFO = 2#0#) then
CUARTilol := CUARTIil;
else
CUARTILOL := not CUARTI11;
end if;
CUARTI01 <= CUARTilol;
end process;
end generate;
CUARTOIOL:
if (rx_legacy_mode = 0)
generate
process (CLK,RESET_N)
begin
if (reset_n = '0') then
CUARTi01 <= '0';
elsif (CLK'eVENT and clk = '1') then
if (rx_fifo = 0) then
if (CUARTilL = '1' or CUARTiil = '0') then
CUARTi01 <= CUARTIIL;
end if;
else
if (CUARTILL = '1' or CUARTi11 = '1'
or (CUARTI11 = '0' and CUARTi00 = '1')) then
CUARTI01 <= not CUARTI11;
end if;
end if;
end if;
end process;
end generate;
process (CLK,RESET_N)
begin
if (reset_n = '0') then
CUARTli0 <= '0';
CUARToi0 <= '0';
elsif (clk'event and CLK = '1') then
CUARToi0 <= CUARToil;
CUARTLI0 <= CUARTOI0;
end if;
end process;
process (CLk,RESEt_n)
begin
if (reset_N = '0') then
CUARTL00 <= '0';
CUARTo00 <= '0';
elsif (clK'event and CLK = '1') then
CUARTO00 <= CUARTlil;
CUARTl00 <= CUARTo00;
end if;
end process;
process (CLK,RESET_N)
begin
if (reset_n = '0') then
CUARTOOOL <= CUARToii;
elsif (clk'EVENt and clk = '1') then
CUARTOOOL <= CUARTLOOL;
end if;
end process;
process (CUARToool,CUARTi11,CUARTLO0)
begin
CUARTlooL <= CUARToool;
CUARTio0 <= '1';
CUARTii0 <= '0';
case CUARToOOL is
when CUARTOII =>
if (CUARTi11 = '1' and CUARTlo0 = '0') then
CUARTlool <= CUARTLii;
CUARTio0 <= '0';
end if;
when CUARTlii =>
CUARTLOol <= CUARTIII;
when CUARTIIi =>
CUARTLOOL <= CUARTo0i;
when CUARTo0i =>
CUARTloOL <= CUARToii;
CUARTii0 <= '1';
when others =>
CUARTLOOl <= CUARTOOOL;
end case;
end process;
process (clk,reset_n)
begin
if (RESET_N = '0') then
CUARTL1I <= "00000000";
elsif (clk'EVENt and clK = '1') then
if (CUARTii0 = '1') then
CUARTl1i <= CUARTo1i;
end if;
end if;
end process;
process (clk,reset_n)
begin
if (reSET_N = '0') then
CUARTi11 <= '1';
elsif (clK'event and CLK = '1') then
if (CUARTii0 = '1') then
CUARTi11 <= '0';
else
if (CSN = '0' and OEN = '0') then
CUARTI11 <= '1';
end if;
end if;
end if;
end process;
process (clK,reseT_N)
begin
if (RESEt_n = '0') then
CUARTL10 <= '0';
elsif (CLK'eveNT and clk = '1') then
if (CUARTL0L = '0' and CUARTil0 = '1') then
CUARTl10 <= '1';
elsif (CUARTI10 = '1') then
CUARTL10 <= '0';
else
CUARTl10 <= CUARTL10;
end if;
end if;
end process;
CUARToi1 <= CUARTl10 when RX_FIFO /= 0 else
CUARTl0i;
CUARTo01 <= CUARToi1;
CUARTLI1 <= '1' when (CUARTii1 = '1' or CUARTIl0 = '1') else
CUARTl0l;
CUARTI0I <= CUARTli1;
CUARTliOL: Top_uart_COREUART_0_Clock_gen
generic map (BAUd_val_frctn_en => baud_val_frcTN_EN)
port map (CLk => CLK,
RESET_N => RESET_N,
baud_val => baud_val,
baud_val_frACTION => baud_VAL_FRACTIOn,
CUARTo => CUARTo,
CUARTL => CUARTl);
CUARTIIOL: Top_uart_COREUART_0_Tx_async
generic map (tx_fifo => tx_fifo)
port map (clk => CLK,
CUARTL => CUARTl,
reset_N => reset_N,
CUARTi0l => CUARTI0L,
CUARTo1l => CUARTO1L,
CUARTl1l => CUARTl1L,
CUARTi1l => CUARTOO0,
CUARTooi => CUARTlL0,
BIT8 => biT8,
PArity_en => parity_en,
ODd_n_even => odd_n_eVEN,
TXRDY => CUARTl01,
tx => CUARTL11,
CUARTLOI => CUARTloi);
CUARTo0ol: Top_uart_COREUART_0_Rx_asyNC
generic map (rx_fiFO => rx_fifo)
port map (CLK => cLK,
CUARTO => CUARTo,
reset_n => reset_n,
bit8 => BIt8,
parITY_EN => PARITY_En,
odd_N_EVEN => ODD_N_even,
CUARTOol => CUARTool,
CUARTlol => CUARTlol,
rx => RX,
overflow => CUARTL0I,
parity_eRR => CUARTii1,
CUARToil => CUARTOIL,
CUARTiil => CUARTiil,
CUARTO0L => CUARTO0L,
CUARTl0L => CUARTL0L,
CUARTiol => CUARTIOL,
CUARTlil => CUARTLIl,
CUARTOLL => CUARTo10,
CUARTLll => CUARTi00,
CUARTILL => CUARTill);
CUARTl0ol:
if (TX_FIFO = 2#1#)
generate
CUARTi0ol: Top_uart_COREUART_0_FIFO_256x8
port map (CUARTIOI => CUARTl1l,
CUARToli => Clk,
CUARTlli => CLK,
CUARTILI => CUARTo1l,
wrb => CUARTOL0,
RDB => CUARTLOI,
reset => RESet_n,
full => CUARTll0,
empty => CUARTOO0);
end generate;
CUARTO1ol:
if (rX_FIFO = 2#1#)
generate
CUARTL1OL: Top_uart_COREUART_0_fifo_256X8
port map (CUARTioi => CUARTo1I,
CUARToli => Clk,
CUARTlli => CLK,
CUARTili => CUARTi1i,
wRB => CUARTI0I,
rdb => CUARTio0,
reset => reset_n,
full => CUARTIL0,
EMPTy => CUARTlo0);
end generate;
end architecture CUARTI1;
