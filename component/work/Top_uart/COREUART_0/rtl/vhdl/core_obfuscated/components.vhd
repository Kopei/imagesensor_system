library IEee;
use IEEE.STD_logic_1164.all;
package Top_uart_COREUART_0_components is

component Top_uart_COREUART_0_CoREUARTAPB
generic (RX_legacy_mode: intEGER := 0;
family: INTEGER := 15;
tx_fifo: INTEGER := 0;
RX_Fifo: integer := 0;
BAUD_VALUE: INTeger := 0;
fixedmode: integer := 0;
prg_bit8: inteGER := 0;
PRG_PARity: integer := 0;
BAUD_VAL_FRCtn: integer := 0;
BAUD_VAL_frctn_en: INTEGER := 0);
port (pclk: in std_logIC;
presetn: in std_lOGIC;
paddr: in std_logic_vectOR(4 downto 0);
psel: in std_logic;
PENABLE: in STD_LOGic;
Pwrite: in std_logic;
PWDATA: in STD_logic_vector(7 downto 0);
PRDATA: out STD_logic_vector(7 downto 0);
pready: out sTD_LOGIC;
PSLVErr: out STD_logic;
TXRDY: out STD_LOGIc;
rxrdy: out std_logic;
FRAMING_ERr: out std_logic;
parity_err: out std_loGIC;
OVerflow: out STd_logic;
RX: in Std_logic;
TX: out std_logic);
end component;
end Top_uart_COREUART_0_coMPONENTS;
