-- ------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------- --
--                                                                           --
-- File................: TESTBNCH.VHD                                        --
-- Function............: Test bench for GENERIC UART                          --
-- Version.............: 4.00                                                --
-- Last Updated........: 10-31-08                                            --
-- Component of........: None                                                --
-- Components Required.: UART                                                 --
-- Compilation Notes...:                                                     --
--                                                                           --
-- Revision History:                                                         --
--   4.00:  Changed BAUD_VAL to 13 bits                                      --
--   2.00:  improve report
--   1.01:  Initial design                                                   --
--   1.00:  Initial design                                                   --
--                                                                           --
--                                                                           --
-- ------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------- --
library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
use work.tbpack.all;
use work.textio.all;
use work.coreparameters.all;

entity testbnch is 
   GENERIC (
      FAMILY                     :  integer := FAMILY;              -- Device Family
      BAUD_VAL_FRCTN_EN          :  integer := BAUD_VAL_FRCTN_EN;    -- 0=disable baud fraction, 1=enable baud fraction  
      TX_FIFO                    :  integer := TX_FIFO;             --  0=without fifo operation mode, 1=with fifo operation mode
      RX_FIFO                    :  integer := RX_FIFO);            --  0=without fifo operation mode, 1=with fifo operation mode     
                                                                    --  0=fifo depth is 256 bytes for devices
                                                                    --  (PA3/E, APA, AX, RTAX-S)
                                                                    --  1=fifo depth is 16 bytes, FIFO_DEPTH_16
                                                                    --  is used for the testbench purpose only to
                                                                    --  support the devices(SX-A, RTSX-S)
                                                                    --  (SmartFusion4)
                                                                    --  1=fifo depth is 128 bytes, FIFO_DEPTH_128 
end;



architecture ver100 of testbnch is

-------------------------------------------------
-- component port listings
-------------------------------------------------

component Top_uart_COREUART_0_COREUART 
 GENERIC (
      RX_LEGACY_MODE             :  integer := 0;
      FAMILY                     :  integer := 15;    -- Device Family
      TX_FIFO                    :  integer := 0;    --  0=without fifo operation mode
      RX_FIFO                    :  integer := 0;          --  0=without fifo operation mode, 1=with fifo operation mode
      BAUD_VAL_FRCTN_EN          :  integer := 0 );   -- 0=DISABLE BAUD FRACTION, 1=ENABLE BAUD FRACTION 
port (
    reset_n             : in        std_logic;
    clk                 : in        std_logic;
    WEn                 : in        std_logic;
    OEn                 : in        std_logic;
    csn                 : in        std_logic;
    data_in             : in        std_logic_vector(7 downto 0);
    rx                  : in        std_logic;
    baud_val            : in        std_logic_vector(12 downto 0);
    bit8                : in        std_logic;
    parity_en           : in        std_logic;
    odd_n_even          : in        std_logic;
    baud_val_fraction   : in        std_logic_vector(2 downto 0);
    parity_err          : out       std_logic;
    overflow            : out       std_logic;
    txrdy               : out       std_logic;
    rxrdy               : out       std_logic;
    data_out            : out       std_logic_vector(7 downto 0);
    tx                  : out       std_logic;
    framing_err         : out       std_logic
);
end component;

-------------------------------------------------
-- internal signals
-------------------------------------------------

signal    clk                     : std_logic := '0';
signal    reset_n                 : std_logic := '0'; 
signal    cpucontrol              : Tcpucontrol;
signal    UARTstatus1             : TUARTstatus;
signal    UARTstatus2             : TUARTstatus;
signal    UARTconfig1             : TUARTconfig;
signal    UARTconfig2             : TUARTconfig;
signal    cpudata                 : std_logic_vector(7 downto 0);
signal    txdata1                 : std_logic;
signal    rxdata1                 : std_logic; 
signal    txdata2                 : std_logic;
signal    rxdata2                 : std_logic; 
--signal    baud_val                : std_logic_vector(12 downto 0);
--signal    BAUD_VAL_FRACTION       : std_logic_vector(2 downto 0);

signal    passflag                : passcheck;

signal    rxdata2_select          : std_logic;

signal    FIFO_DEPTH_16           :  integer;
signal    FIFO_DEPTH_128          :  integer;

begin

cpudata   <= cpucontrol.data;
FIFO_DEPTH_16 <= USE_SOFT_FIFO;
FIFO_DEPTH_128 <= FAMILY;


process
 begin
  wait for 15 ns;
  clk <= not clk;
 end process;


-------------------------------------------------
-- component instantiations
-------------------------------------------------

make_UART1 : Top_uart_COREUART_0_COREUART 
                  GENERIC MAP (
                               RX_LEGACY_MODE => RX_LEGACY_MODE,
                               FAMILY => FAMILY,
                               TX_FIFO => TX_FIFO,
                               RX_FIFO => RX_FIFO,
                               BAUD_VAL_FRCTN_EN=> BAUD_VAL_FRCTN_EN)
                  port map (
                            reset_n            => reset_n,
                            clk                => clk,
                            WEn                => cpucontrol.WEn,
                            OEn                => cpucontrol.OEn,
                            csn                => cpucontrol.sel1,
                            data_in            => cpudata,
                            rx                 => rxdata1,
                            baud_val           => UARTconfig1.baud_val,
                            baud_val_fraction  => UARTconfig1.baud_val_fraction,
                            bit8               => UARTconfig1.bit8,
                            parity_en          => UARTconfig1.parity_en,
                            odd_n_even         => UARTconfig1.odd_n_even,
                            framing_err        => UARTstatus1.framing_err,
                            parity_err         => UARTstatus1.parity_err,
                            overflow           => UARTstatus1.overflow,
                            txrdy              => UARTstatus1.txrdy,
                            rxrdy              => UARTstatus1.rxrdy,
                            data_out           => UARTstatus1.UART_data_out,
                            tx                 => txdata1
);

make_UART2 : Top_uart_COREUART_0_COREUART 
                  GENERIC MAP (
                               RX_LEGACY_MODE => RX_LEGACY_MODE,
                               FAMILY => FAMILY,
                               TX_FIFO => TX_FIFO,
                               RX_FIFO => RX_FIFO,
                               BAUD_VAL_FRCTN_EN=> BAUD_VAL_FRCTN_EN)
                  port map (
                            reset_n            => reset_n,
                            clk                => clk,
                            WEn                => cpucontrol.WEn,
                            OEn                => cpucontrol.OEn,
                            csn                => cpucontrol.sel2,
                            data_in            => cpudata,
                            rx                 => rxdata2,
                            baud_val           => UARTconfig2.baud_val,
                            baud_val_fraction  => UARTconfig2.baud_val_fraction,
                            bit8               => UARTconfig2.bit8,
                            parity_en          => UARTconfig2.parity_en,
                            odd_n_even         => UARTconfig2.odd_n_even,
                            framing_err        => UARTstatus2.framing_err,
                            parity_err         => UARTstatus2.parity_err,
                            overflow           => UARTstatus2.overflow,
                            txrdy              => UARTstatus2.txrdy,
                            rxrdy              => UARTstatus2.rxrdy,
                            data_out           => UARTstatus2.UART_data_out,
                            tx                 => txdata2
);

 rxdata1 <= txdata2;        
 -- AS, added:
 rxdata2 <= txdata1 WHEN (rxdata2_select = '0') ELSE '0';




process
  variable ERR : BOOLEAN := FALSE; 
  variable TEMP : BYTE;
begin

   -- ALL TESTS BY DEFAULT TRANSMIT ON UART1 AND RECEIVE ON UART2
   
   -------------------------------------------------
   -- 2 Meg baud selection based on 33 MHZ clock
   -- This is fixed if BAUD_VAL_FRCTN_EN = 0
   -------------------------------------------------
   UARTconfig1.baud_val <= "0000000000001";
   UARTconfig2.baud_val <= "0000000000001";
   -------------------------------------------------

  printf("Actel UART Testbench  v2.00 ");
  printf("--------------------------------------"); 
  printf(" ");

passflag.n <= 0;
  ------------------------------------
  -- initial control signal conditions
  ------------------------------------
  cpucontrol.sel1 <= '1';
  cpucontrol.sel2 <= '1';
  cpucontrol.WEn  <= '1';
  cpucontrol.OEn  <= '1';
  cpucontrol.data <= (others => 'Z');

  -------------------------------------------------
  -- drive the resets
  -------------------------------------------------
   printf("Applying Reset"); 
   reset_n <= '0';  
   rxdata2_select <= '0';
   waitclocks(10,clk);
   wait until clk'event and clk='1';
   wait for 100 ns;
   reset_n  <= '1'; 

   printnewtest("Setting UART1 Operating Mode 8 bit, parity enabled, and even parity");
   UARTconfig1.bit8 <= '1';
   UARTconfig1.parity_en <= '1';
   UARTconfig1.odd_n_even <= '0';
   
   printf("Setting UART2 Operating Mode 8 bit, parity enabled, and even parity");
   UARTconfig2.bit8 <= '1';
   UARTconfig2.parity_en <= '1';
   UARTconfig2.odd_n_even <= '0';
   
   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "000";
       printf("Setting UART2 baud_val = 1");
       UARTconfig2.baud_val <= "0000000000001";
       UARTconfig2.baud_val_fraction <= "000";
     end if;

   waitclocks(10,clk);
   if (FIFO_DEPTH_16 = 1) then
    txrxtest(16,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   elsif (FIFO_DEPTH_128 = 19) then
    txrxtest(128,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   else
    txrxtest(256,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   end if;

   printnewtest("Setting UART1 Operating Mode 8 bit, parity enabled, and odd parity");
   UARTconfig1.bit8 <= '1';
   UARTconfig1.parity_en <= '1';
   UARTconfig1.odd_n_even <= '1';

   printf("Setting UART2 Operating Mode 8 bit, parity enabled, and odd parity");
   UARTconfig2.bit8 <= '1';
   UARTconfig2.parity_en <= '1';
   UARTconfig2.odd_n_even <= '1';
   
   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1.125");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "001";
       printf("Setting UART2 baud_val = 1.125");
       UARTconfig2.baud_val <= "0000000000001";
       UARTconfig2.baud_val_fraction <= "001";
     end if;
 
   waitclocks(10,clk);
   if (FIFO_DEPTH_16 = 1) then
    txrxtest(16,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   elsif (FIFO_DEPTH_128 = 19) then
    txrxtest(128,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   else
    txrxtest(256,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   end if;

   printnewtest("Setting UART1 Operating Mode 7 bit, parity enabled, and even parity");
   UARTconfig1.bit8 <= '0';
   UARTconfig1.parity_en <= '1';
   UARTconfig1.odd_n_even <= '0';

   printf("Setting UART2 Operating Mode 7 bit, parity enabled, and even parity");
   UARTconfig2.bit8 <= '0';
   UARTconfig2.parity_en <= '1';
   UARTconfig2.odd_n_even <= '0';
   
   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1.25");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "010";
       printf("Setting UART2 baud_val = 1.25");
       UARTconfig2.baud_val <= "0000000000001";
       UARTconfig2.baud_val_fraction <= "010";
     end if;
 
   waitclocks(10,clk);
   if (FIFO_DEPTH_16 = 1) then
    txrxtest(16,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   else
    txrxtest(128,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   end if;

   printnewtest("Setting UART1 Operating Mode 7 bit, parity enabled, and odd parity");
   UARTconfig1.bit8 <= '0';
   UARTconfig1.parity_en <= '1';
   UARTconfig1.odd_n_even <= '1';

   printf("Setting UART2 Operating Mode 7 bit, parity enabled, and odd parity"); 
   UARTconfig2.bit8 <= '0';
   UARTconfig2.parity_en <= '1';
   UARTconfig2.odd_n_even <= '1';

   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1.375");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "011";
       printf("Setting UART2 baud_val = 1.375");
       UARTconfig2.baud_val <= "0000000000001";
       UARTconfig2.baud_val_fraction <= "011";  
     end if;
 
   waitclocks(10,clk);
   if (FIFO_DEPTH_16 = 1) then
    txrxtest(16,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   else
    txrxtest(128,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   end if;

   printnewtest("Setting UART1 Operating Mode 8 bit, parity disabled");
   UARTconfig1.bit8 <= '1';
   UARTconfig1.parity_en <= '0';
   UARTconfig1.odd_n_even <= '1';

   printf("Setting UART2 Operating Mode 8 bit, parity disabled");
   UARTconfig2.bit8 <= '1';
   UARTconfig2.parity_en <= '0';
   UARTconfig2.odd_n_even <= '1';
   
   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1.5");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "100";
       printf("Setting UART2 baud_val = 1.5");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig2.baud_val_fraction <= "100";   
     end if;  
   
   waitclocks(10,clk);
   if (FIFO_DEPTH_16 = 1) then
    txrxtest(16,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   elsif (FIFO_DEPTH_128 = 19) then
    txrxtest(128,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   else
    txrxtest(256,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   end if;

   printnewtest("Setting UART1 Operating Mode 7 bit, parity disabled");
   UARTconfig1.bit8 <= '0';
   UARTconfig1.parity_en <= '0';
   UARTconfig1.odd_n_even <= '1';

   UARTconfig2.baud_val_fraction <= "101";
   UARTconfig2.bit8 <= '0';
   UARTconfig2.parity_en <= '0';
   UARTconfig2.odd_n_even <= '1';
   
   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1.625");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "101";
       printf("Setting UART2 Operating Mode 7 bit, parity disabled");
       printf("Setting UART2 baud_val = 1.625");
       UARTconfig2.baud_val <= "0000000000001"; 
     end if;

   waitclocks(10,clk);
   if (FIFO_DEPTH_16 = 1) then
    txrxtest(16,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   else
    txrxtest(128,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag); 
   end if;

   -----------------------------------
   -- Testing PARITY ERROR Generations
   -----------------------------------

   printnewtest("Setting UART1 8bit, parity enabled, and even parity");
   -- UART1 8bit, parity enabled, and even parity
   printf("Setting UART2 8bit, parity enabled, and odd parity");
   -- UART2 8bit, parity enabled, and odd parity
   
   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1.75");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "110";
       printf("Setting UART2 baud_val = 1.75");
       UARTconfig2.baud_val <= "0000000000001";
       UARTconfig2.baud_val_fraction <= "110";
     end if;

   if (FIFO_DEPTH_16 = 1) then
    paritytest(16,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"110","111",
    ERR,passflag);   
   elsif (FIFO_DEPTH_128 = 19) then 
    paritytest(128,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"110","111",
    ERR,passflag);
   else
   paritytest(256,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"110","111",
   ERR,passflag);
   end if;

   printnewtest("Setting UART1 8bit, parity enabled, and odd parity");
   -- UART1 8bit, parity enabled, and odd parity
   printf("Setting UART2 8bit, parity enabled, and even parity");
   -- UART2 8bit, parity enabled, and even parity
   
   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 1.875");
       UARTconfig1.baud_val <= "0000000000001";
       UARTconfig1.baud_val_fraction <= "111";
       printf("Setting UART2 baud_val = 1.875");
       UARTconfig2.baud_val <= "0000000000001";
       UARTconfig2.baud_val_fraction <= "111";
     end if;
   
   if (FIFO_DEPTH_16 = 1) then
    paritytest(16,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"111","110",
    ERR,passflag);
   elsif (FIFO_DEPTH_128 = 19) then 
    paritytest(128,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"111","110",
    ERR,passflag);
   else
   paritytest(256,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"111","110",
   ERR,passflag);
   end if;

   printnewtest("Setting UART1 7bit, parity enabled, and even parity");
   -- UART1 7bit, parity enabled, and even parity
   printf("Setting UART2 7bit, parity enabled, and odd parity");
   -- UART2 7bit, parity enabled, and odd parity
   
    if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 5.5");
       UARTconfig1.baud_val <= "0000000000101";
       UARTconfig1.baud_val_fraction <= "100";
       printf("Setting UART2 baud_val = 5.5");
       UARTconfig2.baud_val <= "0000000000101";
       UARTconfig2.baud_val_fraction <= "100";
     end if; 
   
   
   if (FIFO_DEPTH_16 = 1) then
    paritytest(16,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"010","011",
    ERR,passflag);
   else
   paritytest(128,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"010","011",
   ERR,passflag);
   end if;

   printnewtest("Setting UART1 7bit, parity enabled, and odd parity");
   -- UART1 7bit, parity enabled, and odd parity
   printf("Setting UART2 8bit, parity enabled, and even parity");
   -- UART2 7bit, parity enabled, and even parity

   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 3.125");
       UARTconfig1.baud_val <= "0000000000011";
       UARTconfig1.baud_val_fraction <= "001";
       printf("Setting UART2 baud_val = 3.125");
       UARTconfig2.baud_val <= "0000000000011";
       UARTconfig2.baud_val_fraction <= "001";
     end if;
   
   if (FIFO_DEPTH_16 = 1) then
    paritytest(16,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"011","010",
    ERR,passflag);
   else
   paritytest(128,RX_FIFO,clk,cpucontrol,UARTstatus1,UARTstatus2,UARTconfig1,UARTconfig2,"011","010",
   ERR,passflag);
   end if;

   -----------------------------------
   -- Testing Overflow circuitry
   -----------------------------------
if (RX_FIFO = 0) then
   printnewtest("Setting UART1 8bit, parity enabled, and odd parity");
   UARTconfig1.bit8 <= '1';
   UARTconfig1.parity_en <= '1';
   UARTconfig1.odd_n_even <= '0';

   printf("Setting UART2 8bit, parity enabled, and odd parity");
   UARTconfig2.bit8 <= '1';
   UARTconfig2.parity_en <= '1';
   UARTconfig2.odd_n_even <= '0';

   if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 2.25");
       UARTconfig1.baud_val <= "0000000000010";
       UARTconfig1.baud_val_fraction <= "010";
       printf("Setting UART2 baud_val = 2.25");
       UARTconfig2.baud_val <= "0000000000010";
       UARTconfig2.baud_val_fraction <= "010";
     end if;   
   
   
   waitclocks(100,clk);
   testoverflow(clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag);
end if;

if (RX_FIFO = 1) then
   printnewtest("Setting UART1 8bit, parity enabled, and odd parity");
   UARTconfig1.bit8 <= '1';
   UARTconfig1.parity_en <= '1';
   UARTconfig1.odd_n_even <= '0';

   printf("Setting UART2 8bit, parity enabled, and odd parity");
   UARTconfig2.bit8 <= '1';
   UARTconfig2.parity_en <= '1';
   UARTconfig2.odd_n_even <= '0';

    if(BAUD_VAL_FRCTN_EN = 1) then
       printf("Setting UART1 baud_val = 2.25");
       UARTconfig1.baud_val <= "0000000000010";
       UARTconfig1.baud_val_fraction <= "010";
       printf("Setting UART2 baud_val = 2.25");
       UARTconfig2.baud_val <= "0000000000010";
       UARTconfig2.baud_val_fraction <= "010";
     end if;    
   
   waitclocks(100,clk);
   if (FIFO_DEPTH_16 = 1) then
    testoverflowfifo(17,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag);
   elsif (FIFO_DEPTH_128 = 19) then 
    testoverflowfifo(129,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag);
   else
    testoverflowfifo(257,clk,cpucontrol,UARTstatus1,UARTstatus2,ERR,passflag);
   end if;
end if;

   -----------------------------------
   -- Testing Framing Error circuitry
   -----------------------------------
   printf("Doing Framing Error Test");
   waitclocks(50009,clk);
   rxdata2_select <= '1';
   waitclocks(80000,clk);
   if (UARTstatus2.framing_err = '0') then
    printf("THIS TEST IS FAILED");
   end if;

   rxdata2_select <= '0';
   cpu_read(2,TEMP,clk,cpucontrol,UARTstatus2);
   waitclocks(10000,clk);

   if (UARTstatus2.framing_err = '1') then
    printf("THIS TEST IS FAILED");
   else
    printf("THIS TEST IS PASSED");
   end if;

   printpass(passflag);

   waitclocks(1000,clk);

assert FALSE
     report "END OF SIMULATION"
     severity FAILURE;  
   wait;
end process;

end ver100; 