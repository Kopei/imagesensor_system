-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;
library COREUART_LIB;
use COREUART_LIB.all;

entity Top_uart is

    port( RX       : in    std_logic;
          RESET_N  : in    std_logic;
          CLK      : in    std_logic;
          TX       : out   std_logic;
          ParaLoad : in    std_logic;
          Rdy1     : out   std_logic;
          Rdy2     : out   std_logic;
          P_CLkA   : out   std_logic;
          P_WEA    : out   std_logic;
          P_DataA  : out   std_logic_vector(7 downto 0);
          P_AddrA  : out   std_logic_vector(2 downto 0)
        );

end Top_uart;

architecture DEF_ARCH of Top_uart is 

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component Top_uart_COREUART_0_COREUART
    generic (BAUD_VAL_FRCTN_EN:integer := 0; FAMILY:integer := 0; 
        RX_FIFO:integer := 0; RX_LEGACY_MODE:integer := 0; 
        TX_FIFO:integer := 0);

    port( BIT8              : in    std_logic := 'U';
          CLK               : in    std_logic := 'U';
          CSN               : in    std_logic := 'U';
          ODD_N_EVEN        : in    std_logic := 'U';
          OEN               : in    std_logic := 'U';
          OVERFLOW          : out   std_logic;
          PARITY_EN         : in    std_logic := 'U';
          PARITY_ERR        : out   std_logic;
          RESET_N           : in    std_logic := 'U';
          RX                : in    std_logic := 'U';
          RXRDY             : out   std_logic;
          TX                : out   std_logic;
          TXRDY             : out   std_logic;
          WEN               : in    std_logic := 'U';
          FRAMING_ERR       : out   std_logic;
          BAUD_VAL          : in    std_logic_vector(12 downto 0) := (others => 'U');
          DATA_IN           : in    std_logic_vector(7 downto 0) := (others => 'U');
          DATA_OUT          : out   std_logic_vector(7 downto 0);
          BAUD_VAL_FRACTION : in    std_logic_vector(2 downto 0) := (others => 'U')
        );
  end component;

    signal \COREUART_0_DATA_OUT_[7]\, \COREUART_0_DATA_OUT_[6]\, 
        \COREUART_0_DATA_OUT_[5]\, \COREUART_0_DATA_OUT_[4]\, 
        \COREUART_0_DATA_OUT_[3]\, \COREUART_0_DATA_OUT_[2]\, 
        \COREUART_0_DATA_OUT_[1]\, \COREUART_0_DATA_OUT_[0]\, 
        COREUART_0_RXRDY, COREUART_0_TXRDY, 
        \Uart_ctl_0_BaudValue_[12]\, \Uart_ctl_0_BaudValue_[11]\, 
        \Uart_ctl_0_BaudValue_[10]\, \Uart_ctl_0_BaudValue_[9]\, 
        \Uart_ctl_0_BaudValue_[8]\, \Uart_ctl_0_BaudValue_[7]\, 
        \Uart_ctl_0_BaudValue_[6]\, \Uart_ctl_0_BaudValue_[5]\, 
        \Uart_ctl_0_BaudValue_[4]\, \Uart_ctl_0_BaudValue_[3]\, 
        \Uart_ctl_0_BaudValue_[2]\, \Uart_ctl_0_BaudValue_[1]\, 
        \Uart_ctl_0_BaudValue_[0]\, Uart_ctl_0_OEn, 
        \Uart_ctl_0_TxData_[7]\, \Uart_ctl_0_TxData_[6]\, 
        \Uart_ctl_0_TxData_[5]\, \Uart_ctl_0_TxData_[4]\, 
        \Uart_ctl_0_TxData_[3]\, \Uart_ctl_0_TxData_[2]\, 
        \Uart_ctl_0_TxData_[1]\, \Uart_ctl_0_TxData_[0]\, 
        Uart_ctl_0_WEn, GND_net, VCC_net : std_logic;

begin 


    \VCC\ : VCC
      port map(Y => VCC_net);
    
    Uart_ctl_0 : entity work.Uart_ctl
      port map(SysRst_n => RESET_N, SysClk => CLK, RxRdy => 
        COREUART_0_RXRDY, TxRdy => COREUART_0_TXRDY, RxData(7)
         => \COREUART_0_DATA_OUT_[7]\, RxData(6) => 
        \COREUART_0_DATA_OUT_[6]\, RxData(5) => 
        \COREUART_0_DATA_OUT_[5]\, RxData(4) => 
        \COREUART_0_DATA_OUT_[4]\, RxData(3) => 
        \COREUART_0_DATA_OUT_[3]\, RxData(2) => 
        \COREUART_0_DATA_OUT_[2]\, RxData(1) => 
        \COREUART_0_DATA_OUT_[1]\, RxData(0) => 
        \COREUART_0_DATA_OUT_[0]\, TxData(7) => 
        \Uart_ctl_0_TxData_[7]\, TxData(6) => 
        \Uart_ctl_0_TxData_[6]\, TxData(5) => 
        \Uart_ctl_0_TxData_[5]\, TxData(4) => 
        \Uart_ctl_0_TxData_[4]\, TxData(3) => 
        \Uart_ctl_0_TxData_[3]\, TxData(2) => 
        \Uart_ctl_0_TxData_[2]\, TxData(1) => 
        \Uart_ctl_0_TxData_[1]\, TxData(0) => 
        \Uart_ctl_0_TxData_[0]\, OEn => Uart_ctl_0_OEn, WEn => 
        Uart_ctl_0_WEn, BaudValue(12) => 
        \Uart_ctl_0_BaudValue_[12]\, BaudValue(11) => 
        \Uart_ctl_0_BaudValue_[11]\, BaudValue(10) => 
        \Uart_ctl_0_BaudValue_[10]\, BaudValue(9) => 
        \Uart_ctl_0_BaudValue_[9]\, BaudValue(8) => 
        \Uart_ctl_0_BaudValue_[8]\, BaudValue(7) => 
        \Uart_ctl_0_BaudValue_[7]\, BaudValue(6) => 
        \Uart_ctl_0_BaudValue_[6]\, BaudValue(5) => 
        \Uart_ctl_0_BaudValue_[5]\, BaudValue(4) => 
        \Uart_ctl_0_BaudValue_[4]\, BaudValue(3) => 
        \Uart_ctl_0_BaudValue_[3]\, BaudValue(2) => 
        \Uart_ctl_0_BaudValue_[2]\, BaudValue(1) => 
        \Uart_ctl_0_BaudValue_[1]\, BaudValue(0) => 
        \Uart_ctl_0_BaudValue_[0]\, P_AddrA(2) => P_AddrA(2), 
        P_AddrA(1) => P_AddrA(1), P_AddrA(0) => P_AddrA(0), 
        P_DataA(7) => P_DataA(7), P_DataA(6) => P_DataA(6), 
        P_DataA(5) => P_DataA(5), P_DataA(4) => P_DataA(4), 
        P_DataA(3) => P_DataA(3), P_DataA(2) => P_DataA(2), 
        P_DataA(1) => P_DataA(1), P_DataA(0) => P_DataA(0), 
        P_CLkA => P_CLkA, P_WEA => P_WEA, Rdy1 => Rdy1, Rdy2 => 
        Rdy2, ParaLoad => ParaLoad);
    
    \GND\ : GND
      port map(Y => GND_net);
    
    COREUART_0 : Top_uart_COREUART_0_COREUART
      generic map(BAUD_VAL_FRCTN_EN => 1, FAMILY => 15,
         RX_FIFO => 0, RX_LEGACY_MODE => 0, TX_FIFO => 0)

      port map(BIT8 => VCC_net, CLK => CLK, CSN => GND_net, 
        ODD_N_EVEN => GND_net, OEN => Uart_ctl_0_OEn, OVERFLOW
         => OPEN, PARITY_EN => GND_net, PARITY_ERR => OPEN, 
        RESET_N => RESET_N, RX => RX, RXRDY => COREUART_0_RXRDY, 
        TX => TX, TXRDY => COREUART_0_TXRDY, WEN => 
        Uart_ctl_0_WEn, FRAMING_ERR => OPEN, BAUD_VAL(12) => 
        \Uart_ctl_0_BaudValue_[12]\, BAUD_VAL(11) => 
        \Uart_ctl_0_BaudValue_[11]\, BAUD_VAL(10) => 
        \Uart_ctl_0_BaudValue_[10]\, BAUD_VAL(9) => 
        \Uart_ctl_0_BaudValue_[9]\, BAUD_VAL(8) => 
        \Uart_ctl_0_BaudValue_[8]\, BAUD_VAL(7) => 
        \Uart_ctl_0_BaudValue_[7]\, BAUD_VAL(6) => 
        \Uart_ctl_0_BaudValue_[6]\, BAUD_VAL(5) => 
        \Uart_ctl_0_BaudValue_[5]\, BAUD_VAL(4) => 
        \Uart_ctl_0_BaudValue_[4]\, BAUD_VAL(3) => 
        \Uart_ctl_0_BaudValue_[3]\, BAUD_VAL(2) => 
        \Uart_ctl_0_BaudValue_[2]\, BAUD_VAL(1) => 
        \Uart_ctl_0_BaudValue_[1]\, BAUD_VAL(0) => 
        \Uart_ctl_0_BaudValue_[0]\, DATA_IN(7) => 
        \Uart_ctl_0_TxData_[7]\, DATA_IN(6) => 
        \Uart_ctl_0_TxData_[6]\, DATA_IN(5) => 
        \Uart_ctl_0_TxData_[5]\, DATA_IN(4) => 
        \Uart_ctl_0_TxData_[4]\, DATA_IN(3) => 
        \Uart_ctl_0_TxData_[3]\, DATA_IN(2) => 
        \Uart_ctl_0_TxData_[2]\, DATA_IN(1) => 
        \Uart_ctl_0_TxData_[1]\, DATA_IN(0) => 
        \Uart_ctl_0_TxData_[0]\, DATA_OUT(7) => 
        \COREUART_0_DATA_OUT_[7]\, DATA_OUT(6) => 
        \COREUART_0_DATA_OUT_[6]\, DATA_OUT(5) => 
        \COREUART_0_DATA_OUT_[5]\, DATA_OUT(4) => 
        \COREUART_0_DATA_OUT_[4]\, DATA_OUT(3) => 
        \COREUART_0_DATA_OUT_[3]\, DATA_OUT(2) => 
        \COREUART_0_DATA_OUT_[2]\, DATA_OUT(1) => 
        \COREUART_0_DATA_OUT_[1]\, DATA_OUT(0) => 
        \COREUART_0_DATA_OUT_[0]\, BAUD_VAL_FRACTION(2) => 
        GND_net, BAUD_VAL_FRACTION(1) => GND_net, 
        BAUD_VAL_FRACTION(0) => GND_net);
    

end DEF_ARCH; 
