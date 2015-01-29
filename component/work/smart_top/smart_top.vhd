-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;
library COREUART_LIB;
use COREUART_LIB.all;

entity smart_top is

    port( ExterCLk    : in    std_logic;
          CMOS_sample : out   std_logic;
          mem_HL      : out   std_logic;
          Sync_X      : out   std_logic;
          Clock_Y     : out   std_logic;
          spi_data    : out   std_logic;
          reset_ds    : out   std_logic;
          Clock_X     : out   std_logic;
          Prebus1     : out   std_logic;
          Prebus2     : out   std_logic;
          Sync_Y      : out   std_logic;
          spi_clock   : out   std_logic;
          Sh_co       : out   std_logic;
          precharge   : out   std_logic;
          AdcClk      : out   std_logic;
          VoltAvg     : out   std_logic;
          NoRowSel    : out   std_logic;
          CMOS_reset  : out   std_logic;
          Pre_co      : out   std_logic;
          spi_load    : out   std_logic;
          SD_ras_n    : out   std_logic;
          SD_cas_n    : out   std_logic;
          SD_we_n     : out   std_logic;
          LVDS_O      : out   std_logic;
          RX          : in    std_logic;
          TX          : out   std_logic;
          cmos_start  : in    std_logic;
          Sd_DQ       : inout std_logic_vector(71 downto 0) := (others => 'Z');
          SD_cke      : out   std_logic_vector(1 downto 0);
          SD_cs_n     : out   std_logic_vector(1 downto 0);
          SD_Clk      : out   std_logic_vector(1 downto 0);
          SD_dqm      : out   std_logic_vector(7 downto 0);
          SD_addr     : out   std_logic_vector(12 downto 0);
          SD_ba       : out   std_logic_vector(1 downto 0);
          ADCdataIn   : in    std_logic_vector(13 downto 0)
        );

end smart_top;

architecture DEF_ARCH of smart_top is 

  component My_adder0
    port( DataA : in    std_logic_vector(17 downto 0) := (others => 'U');
          DataB : in    std_logic_vector(17 downto 0) := (others => 'U');
          Sum   : out   std_logic_vector(17 downto 0)
        );
  end component;

  component Fifo_rd
    port( WE    : in    std_logic := 'U';
          RE    : in    std_logic := 'U';
          CLK   : in    std_logic := 'U';
          FULL  : out   std_logic;
          EMPTY : out   std_logic;
          RESET : in    std_logic := 'U';
          AFULL : out   std_logic;
          DATA  : in    std_logic_vector(71 downto 0) := (others => 'U');
          Q     : out   std_logic_vector(71 downto 0)
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component Uart_ram
    port( WE     : in    std_logic := 'U';
          RE     : in    std_logic := 'U';
          WCLK   : in    std_logic := 'U';
          RCLK   : in    std_logic := 'U';
          RESETN : in    std_logic := 'U';
          WD     : in    std_logic_vector(7 downto 0) := (others => 'U');
          RD     : out   std_logic_vector(7 downto 0);
          WADDR  : in    std_logic_vector(2 downto 0) := (others => 'U');
          RADDR  : in    std_logic_vector(2 downto 0) := (others => 'U')
        );
  end component;

  component smart_top_COREUART_0_COREUART
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

  component adcclk_3P9
    port( GL  : out   std_logic;
          CLK : in    std_logic := 'U'
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \adc_muxtmp_test_0_DataOut13to0_[13]\, 
        \adc_muxtmp_test_0_DataOut13to0_[12]\, 
        \adc_muxtmp_test_0_DataOut13to0_[11]\, 
        \adc_muxtmp_test_0_DataOut13to0_[10]\, 
        \adc_muxtmp_test_0_DataOut13to0_[9]\, 
        \adc_muxtmp_test_0_DataOut13to0_[8]\, 
        \adc_muxtmp_test_0_DataOut13to0_[7]\, 
        \adc_muxtmp_test_0_DataOut13to0_[6]\, 
        \adc_muxtmp_test_0_DataOut13to0_[5]\, 
        \adc_muxtmp_test_0_DataOut13to0_[4]\, 
        \adc_muxtmp_test_0_DataOut13to0_[3]\, 
        \adc_muxtmp_test_0_DataOut13to0_[2]\, 
        \adc_muxtmp_test_0_DataOut13to0_[1]\, 
        \adc_muxtmp_test_0_DataOut13to0_[0]\, 
        \adc_muxtmp_test_0_DataOut27to14_[27]\, 
        \adc_muxtmp_test_0_DataOut27to14_[26]\, 
        \adc_muxtmp_test_0_DataOut27to14_[25]\, 
        \adc_muxtmp_test_0_DataOut27to14_[24]\, 
        \adc_muxtmp_test_0_DataOut27to14_[23]\, 
        \adc_muxtmp_test_0_DataOut27to14_[22]\, 
        \adc_muxtmp_test_0_DataOut27to14_[21]\, 
        \adc_muxtmp_test_0_DataOut27to14_[20]\, 
        \adc_muxtmp_test_0_DataOut27to14_[19]\, 
        \adc_muxtmp_test_0_DataOut27to14_[18]\, 
        \adc_muxtmp_test_0_DataOut27to14_[17]\, 
        \adc_muxtmp_test_0_DataOut27to14_[16]\, 
        \adc_muxtmp_test_0_DataOut27to14_[15]\, 
        \adc_muxtmp_test_0_DataOut27to14_[14]\, 
        \adc_muxtmp_test_0_DataOut41to28_[41]\, 
        \adc_muxtmp_test_0_DataOut41to28_[40]\, 
        \adc_muxtmp_test_0_DataOut41to28_[39]\, 
        \adc_muxtmp_test_0_DataOut41to28_[38]\, 
        \adc_muxtmp_test_0_DataOut41to28_[37]\, 
        \adc_muxtmp_test_0_DataOut41to28_[36]\, 
        \adc_muxtmp_test_0_DataOut41to28_[35]\, 
        \adc_muxtmp_test_0_DataOut41to28_[34]\, 
        \adc_muxtmp_test_0_DataOut41to28_[33]\, 
        \adc_muxtmp_test_0_DataOut41to28_[32]\, 
        \adc_muxtmp_test_0_DataOut41to28_[31]\, 
        \adc_muxtmp_test_0_DataOut41to28_[30]\, 
        \adc_muxtmp_test_0_DataOut41to28_[29]\, 
        \adc_muxtmp_test_0_DataOut41to28_[28]\, 
        \adc_muxtmp_test_0_DataOut55to42_[55]\, 
        \adc_muxtmp_test_0_DataOut55to42_[54]\, 
        \adc_muxtmp_test_0_DataOut55to42_[53]\, 
        \adc_muxtmp_test_0_DataOut55to42_[52]\, 
        \adc_muxtmp_test_0_DataOut55to42_[51]\, 
        \adc_muxtmp_test_0_DataOut55to42_[50]\, 
        \adc_muxtmp_test_0_DataOut55to42_[49]\, 
        \adc_muxtmp_test_0_DataOut55to42_[48]\, 
        \adc_muxtmp_test_0_DataOut55to42_[47]\, 
        \adc_muxtmp_test_0_DataOut55to42_[46]\, 
        \adc_muxtmp_test_0_DataOut55to42_[45]\, 
        \adc_muxtmp_test_0_DataOut55to42_[44]\, 
        \adc_muxtmp_test_0_DataOut55to42_[43]\, 
        \adc_muxtmp_test_0_DataOut55to42_[42]\, CMOS_DrvX_0_AdcEn, 
        CMOS_DrvX_0_LVDSen, CMOS_DrvX_0_ParaUpdata, 
        CMOS_DrvX_0_SDramEn, \COREUART_0_DATA_OUT_[7]\, 
        \COREUART_0_DATA_OUT_[6]\, \COREUART_0_DATA_OUT_[5]\, 
        \COREUART_0_DATA_OUT_[4]\, \COREUART_0_DATA_OUT_[3]\, 
        \COREUART_0_DATA_OUT_[2]\, \COREUART_0_DATA_OUT_[1]\, 
        \COREUART_0_DATA_OUT_[0]\, COREUART_0_RXRDY, 
        COREUART_0_TXRDY, Counter_ref_0_RefEn, Fifo_rd_0_AFULL, 
        \Fifo_rd_0_Q_[71]\, \Fifo_rd_0_Q_[70]\, 
        \Fifo_rd_0_Q_[69]\, \Fifo_rd_0_Q_[68]\, 
        \Fifo_rd_0_Q_[67]\, \Fifo_rd_0_Q_[66]\, 
        \Fifo_rd_0_Q_[65]\, \Fifo_rd_0_Q_[64]\, 
        \Fifo_rd_0_Q_[63]\, \Fifo_rd_0_Q_[62]\, 
        \Fifo_rd_0_Q_[61]\, \Fifo_rd_0_Q_[60]\, 
        \Fifo_rd_0_Q_[59]\, \Fifo_rd_0_Q_[58]\, 
        \Fifo_rd_0_Q_[57]\, \Fifo_rd_0_Q_[56]\, 
        \Fifo_rd_0_Q_[55]\, \Fifo_rd_0_Q_[54]\, 
        \Fifo_rd_0_Q_[53]\, \Fifo_rd_0_Q_[52]\, 
        \Fifo_rd_0_Q_[51]\, \Fifo_rd_0_Q_[50]\, 
        \Fifo_rd_0_Q_[49]\, \Fifo_rd_0_Q_[48]\, 
        \Fifo_rd_0_Q_[47]\, \Fifo_rd_0_Q_[46]\, 
        \Fifo_rd_0_Q_[45]\, \Fifo_rd_0_Q_[44]\, 
        \Fifo_rd_0_Q_[43]\, \Fifo_rd_0_Q_[42]\, 
        \Fifo_rd_0_Q_[41]\, \Fifo_rd_0_Q_[40]\, 
        \Fifo_rd_0_Q_[39]\, \Fifo_rd_0_Q_[38]\, 
        \Fifo_rd_0_Q_[37]\, \Fifo_rd_0_Q_[36]\, 
        \Fifo_rd_0_Q_[35]\, \Fifo_rd_0_Q_[34]\, 
        \Fifo_rd_0_Q_[33]\, \Fifo_rd_0_Q_[32]\, 
        \Fifo_rd_0_Q_[31]\, \Fifo_rd_0_Q_[30]\, 
        \Fifo_rd_0_Q_[29]\, \Fifo_rd_0_Q_[28]\, 
        \Fifo_rd_0_Q_[27]\, \Fifo_rd_0_Q_[26]\, 
        \Fifo_rd_0_Q_[25]\, \Fifo_rd_0_Q_[24]\, 
        \Fifo_rd_0_Q_[23]\, \Fifo_rd_0_Q_[22]\, 
        \Fifo_rd_0_Q_[21]\, \Fifo_rd_0_Q_[20]\, 
        \Fifo_rd_0_Q_[19]\, \Fifo_rd_0_Q_[18]\, 
        \Fifo_rd_0_Q_[17]\, \Fifo_rd_0_Q_[16]\, 
        \Fifo_rd_0_Q_[15]\, \Fifo_rd_0_Q_[14]\, 
        \Fifo_rd_0_Q_[13]\, \Fifo_rd_0_Q_[12]\, 
        \Fifo_rd_0_Q_[11]\, \Fifo_rd_0_Q_[10]\, \Fifo_rd_0_Q_[9]\, 
        \Fifo_rd_0_Q_[8]\, \Fifo_rd_0_Q_[7]\, \Fifo_rd_0_Q_[6]\, 
        \Fifo_rd_0_Q_[5]\, \Fifo_rd_0_Q_[4]\, \Fifo_rd_0_Q_[3]\, 
        \Fifo_rd_0_Q_[2]\, \Fifo_rd_0_Q_[1]\, \Fifo_rd_0_Q_[0]\, 
        Fifo_wr_0_AFULL, \Fifo_wr_0_Q_[71]\, \Fifo_wr_0_Q_[70]\, 
        \Fifo_wr_0_Q_[69]\, \Fifo_wr_0_Q_[68]\, 
        \Fifo_wr_0_Q_[67]\, \Fifo_wr_0_Q_[66]\, 
        \Fifo_wr_0_Q_[65]\, \Fifo_wr_0_Q_[64]\, 
        \Fifo_wr_0_Q_[63]\, \Fifo_wr_0_Q_[62]\, 
        \Fifo_wr_0_Q_[61]\, \Fifo_wr_0_Q_[60]\, 
        \Fifo_wr_0_Q_[59]\, \Fifo_wr_0_Q_[58]\, 
        \Fifo_wr_0_Q_[57]\, \Fifo_wr_0_Q_[56]\, 
        \Fifo_wr_0_Q_[55]\, \Fifo_wr_0_Q_[54]\, 
        \Fifo_wr_0_Q_[53]\, \Fifo_wr_0_Q_[52]\, 
        \Fifo_wr_0_Q_[51]\, \Fifo_wr_0_Q_[50]\, 
        \Fifo_wr_0_Q_[49]\, \Fifo_wr_0_Q_[48]\, 
        \Fifo_wr_0_Q_[47]\, \Fifo_wr_0_Q_[46]\, 
        \Fifo_wr_0_Q_[45]\, \Fifo_wr_0_Q_[44]\, 
        \Fifo_wr_0_Q_[43]\, \Fifo_wr_0_Q_[42]\, 
        \Fifo_wr_0_Q_[41]\, \Fifo_wr_0_Q_[40]\, 
        \Fifo_wr_0_Q_[39]\, \Fifo_wr_0_Q_[38]\, 
        \Fifo_wr_0_Q_[37]\, \Fifo_wr_0_Q_[36]\, 
        \Fifo_wr_0_Q_[35]\, \Fifo_wr_0_Q_[34]\, 
        \Fifo_wr_0_Q_[33]\, \Fifo_wr_0_Q_[32]\, 
        \Fifo_wr_0_Q_[31]\, \Fifo_wr_0_Q_[30]\, 
        \Fifo_wr_0_Q_[29]\, \Fifo_wr_0_Q_[28]\, 
        \Fifo_wr_0_Q_[27]\, \Fifo_wr_0_Q_[26]\, 
        \Fifo_wr_0_Q_[25]\, \Fifo_wr_0_Q_[24]\, 
        \Fifo_wr_0_Q_[23]\, \Fifo_wr_0_Q_[22]\, 
        \Fifo_wr_0_Q_[21]\, \Fifo_wr_0_Q_[20]\, 
        \Fifo_wr_0_Q_[19]\, \Fifo_wr_0_Q_[18]\, 
        \Fifo_wr_0_Q_[17]\, \Fifo_wr_0_Q_[16]\, 
        \Fifo_wr_0_Q_[15]\, \Fifo_wr_0_Q_[14]\, 
        \Fifo_wr_0_Q_[13]\, \Fifo_wr_0_Q_[12]\, 
        \Fifo_wr_0_Q_[11]\, \Fifo_wr_0_Q_[10]\, \Fifo_wr_0_Q_[9]\, 
        \Fifo_wr_0_Q_[8]\, \Fifo_wr_0_Q_[7]\, \Fifo_wr_0_Q_[6]\, 
        \Fifo_wr_0_Q_[5]\, \Fifo_wr_0_Q_[4]\, \Fifo_wr_0_Q_[3]\, 
        \Fifo_wr_0_Q_[2]\, \Fifo_wr_0_Q_[1]\, \Fifo_wr_0_Q_[0]\, 
        FrameMk_0_LVDS_ok, Main_ctl4SD_0_ByteRdEn, 
        \Main_ctl4SD_0_Data2ACC17to0_[17]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[16]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[15]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[14]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[13]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[12]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[11]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[10]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[9]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[8]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[7]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[6]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[5]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[4]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[3]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[2]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[1]\, 
        \Main_ctl4SD_0_Data2ACC17to0_[0]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[35]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[34]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[33]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[32]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[31]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[30]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[29]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[28]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[27]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[26]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[25]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[24]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[23]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[22]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[21]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[20]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[19]\, 
        \Main_ctl4SD_0_Data2ACC35to18_[18]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[53]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[52]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[51]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[50]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[49]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[48]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[47]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[46]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[45]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[44]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[43]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[42]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[41]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[40]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[39]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[38]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[37]\, 
        \Main_ctl4SD_0_Data2ACC53to36_[36]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[71]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[70]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[69]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[68]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[67]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[66]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[65]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[64]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[63]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[62]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[61]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[60]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[59]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[58]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[57]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[56]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[55]\, 
        \Main_ctl4SD_0_Data2ACC71to54_[54]\, 
        \Main_ctl4SD_0_Data2Fifo_[71]\, 
        \Main_ctl4SD_0_Data2Fifo_[70]\, 
        \Main_ctl4SD_0_Data2Fifo_[69]\, 
        \Main_ctl4SD_0_Data2Fifo_[68]\, 
        \Main_ctl4SD_0_Data2Fifo_[67]\, 
        \Main_ctl4SD_0_Data2Fifo_[66]\, 
        \Main_ctl4SD_0_Data2Fifo_[65]\, 
        \Main_ctl4SD_0_Data2Fifo_[64]\, 
        \Main_ctl4SD_0_Data2Fifo_[63]\, 
        \Main_ctl4SD_0_Data2Fifo_[62]\, 
        \Main_ctl4SD_0_Data2Fifo_[61]\, 
        \Main_ctl4SD_0_Data2Fifo_[60]\, 
        \Main_ctl4SD_0_Data2Fifo_[59]\, 
        \Main_ctl4SD_0_Data2Fifo_[58]\, 
        \Main_ctl4SD_0_Data2Fifo_[57]\, 
        \Main_ctl4SD_0_Data2Fifo_[56]\, 
        \Main_ctl4SD_0_Data2Fifo_[55]\, 
        \Main_ctl4SD_0_Data2Fifo_[54]\, 
        \Main_ctl4SD_0_Data2Fifo_[53]\, 
        \Main_ctl4SD_0_Data2Fifo_[52]\, 
        \Main_ctl4SD_0_Data2Fifo_[51]\, 
        \Main_ctl4SD_0_Data2Fifo_[50]\, 
        \Main_ctl4SD_0_Data2Fifo_[49]\, 
        \Main_ctl4SD_0_Data2Fifo_[48]\, 
        \Main_ctl4SD_0_Data2Fifo_[47]\, 
        \Main_ctl4SD_0_Data2Fifo_[46]\, 
        \Main_ctl4SD_0_Data2Fifo_[45]\, 
        \Main_ctl4SD_0_Data2Fifo_[44]\, 
        \Main_ctl4SD_0_Data2Fifo_[43]\, 
        \Main_ctl4SD_0_Data2Fifo_[42]\, 
        \Main_ctl4SD_0_Data2Fifo_[41]\, 
        \Main_ctl4SD_0_Data2Fifo_[40]\, 
        \Main_ctl4SD_0_Data2Fifo_[39]\, 
        \Main_ctl4SD_0_Data2Fifo_[38]\, 
        \Main_ctl4SD_0_Data2Fifo_[37]\, 
        \Main_ctl4SD_0_Data2Fifo_[36]\, 
        \Main_ctl4SD_0_Data2Fifo_[35]\, 
        \Main_ctl4SD_0_Data2Fifo_[34]\, 
        \Main_ctl4SD_0_Data2Fifo_[33]\, 
        \Main_ctl4SD_0_Data2Fifo_[32]\, 
        \Main_ctl4SD_0_Data2Fifo_[31]\, 
        \Main_ctl4SD_0_Data2Fifo_[30]\, 
        \Main_ctl4SD_0_Data2Fifo_[29]\, 
        \Main_ctl4SD_0_Data2Fifo_[28]\, 
        \Main_ctl4SD_0_Data2Fifo_[27]\, 
        \Main_ctl4SD_0_Data2Fifo_[26]\, 
        \Main_ctl4SD_0_Data2Fifo_[25]\, 
        \Main_ctl4SD_0_Data2Fifo_[24]\, 
        \Main_ctl4SD_0_Data2Fifo_[23]\, 
        \Main_ctl4SD_0_Data2Fifo_[22]\, 
        \Main_ctl4SD_0_Data2Fifo_[21]\, 
        \Main_ctl4SD_0_Data2Fifo_[20]\, 
        \Main_ctl4SD_0_Data2Fifo_[19]\, 
        \Main_ctl4SD_0_Data2Fifo_[18]\, 
        \Main_ctl4SD_0_Data2Fifo_[17]\, 
        \Main_ctl4SD_0_Data2Fifo_[16]\, 
        \Main_ctl4SD_0_Data2Fifo_[15]\, 
        \Main_ctl4SD_0_Data2Fifo_[14]\, 
        \Main_ctl4SD_0_Data2Fifo_[13]\, 
        \Main_ctl4SD_0_Data2Fifo_[12]\, 
        \Main_ctl4SD_0_Data2Fifo_[11]\, 
        \Main_ctl4SD_0_Data2Fifo_[10]\, 
        \Main_ctl4SD_0_Data2Fifo_[9]\, 
        \Main_ctl4SD_0_Data2Fifo_[8]\, 
        \Main_ctl4SD_0_Data2Fifo_[7]\, 
        \Main_ctl4SD_0_Data2Fifo_[6]\, 
        \Main_ctl4SD_0_Data2Fifo_[5]\, 
        \Main_ctl4SD_0_Data2Fifo_[4]\, 
        \Main_ctl4SD_0_Data2Fifo_[3]\, 
        \Main_ctl4SD_0_Data2Fifo_[2]\, 
        \Main_ctl4SD_0_Data2Fifo_[1]\, 
        \Main_ctl4SD_0_Data2Fifo_[0]\, Main_ctl4SD_0_fifo_rd, 
        Main_ctl4SD_0_fifo_rst_n, Main_ctl4SD_0_Fifo_wr, 
        \Main_ctl4SD_0_LVDS_data_[71]\, 
        \Main_ctl4SD_0_LVDS_data_[70]\, 
        \Main_ctl4SD_0_LVDS_data_[69]\, 
        \Main_ctl4SD_0_LVDS_data_[68]\, 
        \Main_ctl4SD_0_LVDS_data_[67]\, 
        \Main_ctl4SD_0_LVDS_data_[66]\, 
        \Main_ctl4SD_0_LVDS_data_[65]\, 
        \Main_ctl4SD_0_LVDS_data_[64]\, 
        \Main_ctl4SD_0_LVDS_data_[63]\, 
        \Main_ctl4SD_0_LVDS_data_[62]\, 
        \Main_ctl4SD_0_LVDS_data_[61]\, 
        \Main_ctl4SD_0_LVDS_data_[60]\, 
        \Main_ctl4SD_0_LVDS_data_[59]\, 
        \Main_ctl4SD_0_LVDS_data_[58]\, 
        \Main_ctl4SD_0_LVDS_data_[57]\, 
        \Main_ctl4SD_0_LVDS_data_[56]\, 
        \Main_ctl4SD_0_LVDS_data_[55]\, 
        \Main_ctl4SD_0_LVDS_data_[54]\, 
        \Main_ctl4SD_0_LVDS_data_[53]\, 
        \Main_ctl4SD_0_LVDS_data_[52]\, 
        \Main_ctl4SD_0_LVDS_data_[51]\, 
        \Main_ctl4SD_0_LVDS_data_[50]\, 
        \Main_ctl4SD_0_LVDS_data_[49]\, 
        \Main_ctl4SD_0_LVDS_data_[48]\, 
        \Main_ctl4SD_0_LVDS_data_[47]\, 
        \Main_ctl4SD_0_LVDS_data_[46]\, 
        \Main_ctl4SD_0_LVDS_data_[45]\, 
        \Main_ctl4SD_0_LVDS_data_[44]\, 
        \Main_ctl4SD_0_LVDS_data_[43]\, 
        \Main_ctl4SD_0_LVDS_data_[42]\, 
        \Main_ctl4SD_0_LVDS_data_[41]\, 
        \Main_ctl4SD_0_LVDS_data_[40]\, 
        \Main_ctl4SD_0_LVDS_data_[39]\, 
        \Main_ctl4SD_0_LVDS_data_[38]\, 
        \Main_ctl4SD_0_LVDS_data_[37]\, 
        \Main_ctl4SD_0_LVDS_data_[36]\, 
        \Main_ctl4SD_0_LVDS_data_[35]\, 
        \Main_ctl4SD_0_LVDS_data_[34]\, 
        \Main_ctl4SD_0_LVDS_data_[33]\, 
        \Main_ctl4SD_0_LVDS_data_[32]\, 
        \Main_ctl4SD_0_LVDS_data_[31]\, 
        \Main_ctl4SD_0_LVDS_data_[30]\, 
        \Main_ctl4SD_0_LVDS_data_[29]\, 
        \Main_ctl4SD_0_LVDS_data_[28]\, 
        \Main_ctl4SD_0_LVDS_data_[27]\, 
        \Main_ctl4SD_0_LVDS_data_[26]\, 
        \Main_ctl4SD_0_LVDS_data_[25]\, 
        \Main_ctl4SD_0_LVDS_data_[24]\, 
        \Main_ctl4SD_0_LVDS_data_[23]\, 
        \Main_ctl4SD_0_LVDS_data_[22]\, 
        \Main_ctl4SD_0_LVDS_data_[21]\, 
        \Main_ctl4SD_0_LVDS_data_[20]\, 
        \Main_ctl4SD_0_LVDS_data_[19]\, 
        \Main_ctl4SD_0_LVDS_data_[18]\, 
        \Main_ctl4SD_0_LVDS_data_[17]\, 
        \Main_ctl4SD_0_LVDS_data_[16]\, 
        \Main_ctl4SD_0_LVDS_data_[15]\, 
        \Main_ctl4SD_0_LVDS_data_[14]\, 
        \Main_ctl4SD_0_LVDS_data_[13]\, 
        \Main_ctl4SD_0_LVDS_data_[12]\, 
        \Main_ctl4SD_0_LVDS_data_[11]\, 
        \Main_ctl4SD_0_LVDS_data_[10]\, 
        \Main_ctl4SD_0_LVDS_data_[9]\, 
        \Main_ctl4SD_0_LVDS_data_[8]\, 
        \Main_ctl4SD_0_LVDS_data_[7]\, 
        \Main_ctl4SD_0_LVDS_data_[6]\, 
        \Main_ctl4SD_0_LVDS_data_[5]\, 
        \Main_ctl4SD_0_LVDS_data_[4]\, 
        \Main_ctl4SD_0_LVDS_data_[3]\, 
        \Main_ctl4SD_0_LVDS_data_[2]\, 
        \Main_ctl4SD_0_LVDS_data_[1]\, 
        \Main_ctl4SD_0_LVDS_data_[0]\, \My_adder0_0_Sum_[17]\, 
        \My_adder0_0_Sum_[16]\, \My_adder0_0_Sum_[15]\, 
        \My_adder0_0_Sum_[14]\, \My_adder0_0_Sum_[13]\, 
        \My_adder0_0_Sum_[12]\, \My_adder0_0_Sum_[11]\, 
        \My_adder0_0_Sum_[10]\, \My_adder0_0_Sum_[9]\, 
        \My_adder0_0_Sum_[8]\, \My_adder0_0_Sum_[7]\, 
        \My_adder0_0_Sum_[6]\, \My_adder0_0_Sum_[5]\, 
        \My_adder0_0_Sum_[4]\, \My_adder0_0_Sum_[3]\, 
        \My_adder0_0_Sum_[2]\, \My_adder0_0_Sum_[1]\, 
        \My_adder0_0_Sum_[0]\, \My_adder0_1_Sum_[17]\, 
        \My_adder0_1_Sum_[16]\, \My_adder0_1_Sum_[15]\, 
        \My_adder0_1_Sum_[14]\, \My_adder0_1_Sum_[13]\, 
        \My_adder0_1_Sum_[12]\, \My_adder0_1_Sum_[11]\, 
        \My_adder0_1_Sum_[10]\, \My_adder0_1_Sum_[9]\, 
        \My_adder0_1_Sum_[8]\, \My_adder0_1_Sum_[7]\, 
        \My_adder0_1_Sum_[6]\, \My_adder0_1_Sum_[5]\, 
        \My_adder0_1_Sum_[4]\, \My_adder0_1_Sum_[3]\, 
        \My_adder0_1_Sum_[2]\, \My_adder0_1_Sum_[1]\, 
        \My_adder0_1_Sum_[0]\, \My_adder0_2_Sum_[17]\, 
        \My_adder0_2_Sum_[16]\, \My_adder0_2_Sum_[15]\, 
        \My_adder0_2_Sum_[14]\, \My_adder0_2_Sum_[13]\, 
        \My_adder0_2_Sum_[12]\, \My_adder0_2_Sum_[11]\, 
        \My_adder0_2_Sum_[10]\, \My_adder0_2_Sum_[9]\, 
        \My_adder0_2_Sum_[8]\, \My_adder0_2_Sum_[7]\, 
        \My_adder0_2_Sum_[6]\, \My_adder0_2_Sum_[5]\, 
        \My_adder0_2_Sum_[4]\, \My_adder0_2_Sum_[3]\, 
        \My_adder0_2_Sum_[2]\, \My_adder0_2_Sum_[1]\, 
        \My_adder0_2_Sum_[0]\, \My_adder0_3_Sum_[17]\, 
        \My_adder0_3_Sum_[16]\, \My_adder0_3_Sum_[15]\, 
        \My_adder0_3_Sum_[14]\, \My_adder0_3_Sum_[13]\, 
        \My_adder0_3_Sum_[12]\, \My_adder0_3_Sum_[11]\, 
        \My_adder0_3_Sum_[10]\, \My_adder0_3_Sum_[9]\, 
        \My_adder0_3_Sum_[8]\, \My_adder0_3_Sum_[7]\, 
        \My_adder0_3_Sum_[6]\, \My_adder0_3_Sum_[5]\, 
        \My_adder0_3_Sum_[4]\, \My_adder0_3_Sum_[3]\, 
        \My_adder0_3_Sum_[2]\, \My_adder0_3_Sum_[1]\, 
        \My_adder0_3_Sum_[0]\, \ParaUpdata_0_Accnum_0_[5]\, 
        \ParaUpdata_0_Accnum_0_[4]\, \ParaUpdata_0_Accnum_0_[3]\, 
        \ParaUpdata_0_Accnum_0_[2]\, \ParaUpdata_0_Accnum_0_[1]\, 
        \ParaUpdata_0_Accnum_0_[0]\, \ParaUpdata_0_BandNum_[3]\, 
        \ParaUpdata_0_BandNum_[2]\, \ParaUpdata_0_BandNum_[1]\, 
        \ParaUpdata_0_BandNum_[0]\, \ParaUpdata_0_ExposureT_[5]\, 
        \ParaUpdata_0_ExposureT_[4]\, 
        \ParaUpdata_0_ExposureT_[3]\, 
        \ParaUpdata_0_ExposureT_[2]\, 
        \ParaUpdata_0_ExposureT_[1]\, 
        \ParaUpdata_0_ExposureT_[0]\, \ParaUpdata_0_Mode_[1]\, 
        \ParaUpdata_0_Mode_[0]\, \ParaUpdata_0_MotorPos_[5]\, 
        \ParaUpdata_0_MotorPos_[4]\, \ParaUpdata_0_MotorPos_[3]\, 
        \ParaUpdata_0_MotorPos_[2]\, \ParaUpdata_0_MotorPos_[1]\, 
        \ParaUpdata_0_MotorPos_[0]\, ParaUpdata_0_ParaLoad, 
        \ParaUpdata_0_P_AddrB_[2]\, \ParaUpdata_0_P_AddrB_[1]\, 
        \ParaUpdata_0_P_AddrB_[0]\, ParaUpdata_0_P_CLkB, 
        ParaUpdata_0_P_RdB, \ParaUpdata_0_SPI_Set_[31]\, 
        \ParaUpdata_0_SPI_Set_[30]\, \ParaUpdata_0_SPI_Set_[29]\, 
        \ParaUpdata_0_SPI_Set_[28]\, \ParaUpdata_0_SPI_Set_[27]\, 
        \ParaUpdata_0_SPI_Set_[26]\, \ParaUpdata_0_SPI_Set_[25]\, 
        \ParaUpdata_0_SPI_Set_[24]\, \ParaUpdata_0_SPI_Set_[23]\, 
        \ParaUpdata_0_SPI_Set_[22]\, \ParaUpdata_0_SPI_Set_[21]\, 
        \ParaUpdata_0_SPI_Set_[20]\, \ParaUpdata_0_SPI_Set_[19]\, 
        \ParaUpdata_0_SPI_Set_[18]\, \ParaUpdata_0_SPI_Set_[17]\, 
        \ParaUpdata_0_SPI_Set_[16]\, \ParaUpdata_0_SPI_Set_[15]\, 
        \ParaUpdata_0_SPI_Set_[14]\, \ParaUpdata_0_SPI_Set_[13]\, 
        \ParaUpdata_0_SPI_Set_[12]\, \ParaUpdata_0_SPI_Set_[11]\, 
        \ParaUpdata_0_SPI_Set_[10]\, \ParaUpdata_0_SPI_Set_[9]\, 
        \ParaUpdata_0_SPI_Set_[8]\, \ParaUpdata_0_SPI_Set_[7]\, 
        \ParaUpdata_0_SPI_Set_[6]\, \ParaUpdata_0_SPI_Set_[5]\, 
        \ParaUpdata_0_SPI_Set_[4]\, \ParaUpdata_0_SPI_Set_[3]\, 
        \ParaUpdata_0_SPI_Set_[2]\, \ParaUpdata_0_SPI_Set_[1]\, 
        \ParaUpdata_0_SPI_Set_[0]\, PLL_Test1_0_ADC_66M_Clk, 
        PLL_Test1_0_Sdram_clk, PLL_Test1_0_SysRst_O, 
        PLL_Test1_0_Sys_66M_Clk, Sdram_cmd_0_rdrow_end, 
        Sdram_cmd_0_RFifo_we, Sdram_cmd_0_SDoneFrameOk, 
        Sdram_cmd_0_WFifo_re, Sdram_cmd_0_wrrow_end, 
        Sdram_ctl_v2_0_ClkEN, Sdram_ctl_v2_0_SD_iniEn, 
        Sdram_ctl_v2_0_SD_pdEN, Sdram_ctl_v2_0_SD_rdEn, 
        Sdram_ctl_v2_0_SD_rdEN_noact, Sdram_ctl_v2_0_SD_RefEn, 
        Sdram_ctl_v2_0_SD_wrEn, \Sdram_data_0_Sys_dataOut_[71]\, 
        \Sdram_data_0_Sys_dataOut_[70]\, 
        \Sdram_data_0_Sys_dataOut_[69]\, 
        \Sdram_data_0_Sys_dataOut_[68]\, 
        \Sdram_data_0_Sys_dataOut_[67]\, 
        \Sdram_data_0_Sys_dataOut_[66]\, 
        \Sdram_data_0_Sys_dataOut_[65]\, 
        \Sdram_data_0_Sys_dataOut_[64]\, 
        \Sdram_data_0_Sys_dataOut_[63]\, 
        \Sdram_data_0_Sys_dataOut_[62]\, 
        \Sdram_data_0_Sys_dataOut_[61]\, 
        \Sdram_data_0_Sys_dataOut_[60]\, 
        \Sdram_data_0_Sys_dataOut_[59]\, 
        \Sdram_data_0_Sys_dataOut_[58]\, 
        \Sdram_data_0_Sys_dataOut_[57]\, 
        \Sdram_data_0_Sys_dataOut_[56]\, 
        \Sdram_data_0_Sys_dataOut_[55]\, 
        \Sdram_data_0_Sys_dataOut_[54]\, 
        \Sdram_data_0_Sys_dataOut_[53]\, 
        \Sdram_data_0_Sys_dataOut_[52]\, 
        \Sdram_data_0_Sys_dataOut_[51]\, 
        \Sdram_data_0_Sys_dataOut_[50]\, 
        \Sdram_data_0_Sys_dataOut_[49]\, 
        \Sdram_data_0_Sys_dataOut_[48]\, 
        \Sdram_data_0_Sys_dataOut_[47]\, 
        \Sdram_data_0_Sys_dataOut_[46]\, 
        \Sdram_data_0_Sys_dataOut_[45]\, 
        \Sdram_data_0_Sys_dataOut_[44]\, 
        \Sdram_data_0_Sys_dataOut_[43]\, 
        \Sdram_data_0_Sys_dataOut_[42]\, 
        \Sdram_data_0_Sys_dataOut_[41]\, 
        \Sdram_data_0_Sys_dataOut_[40]\, 
        \Sdram_data_0_Sys_dataOut_[39]\, 
        \Sdram_data_0_Sys_dataOut_[38]\, 
        \Sdram_data_0_Sys_dataOut_[37]\, 
        \Sdram_data_0_Sys_dataOut_[36]\, 
        \Sdram_data_0_Sys_dataOut_[35]\, 
        \Sdram_data_0_Sys_dataOut_[34]\, 
        \Sdram_data_0_Sys_dataOut_[33]\, 
        \Sdram_data_0_Sys_dataOut_[32]\, 
        \Sdram_data_0_Sys_dataOut_[31]\, 
        \Sdram_data_0_Sys_dataOut_[30]\, 
        \Sdram_data_0_Sys_dataOut_[29]\, 
        \Sdram_data_0_Sys_dataOut_[28]\, 
        \Sdram_data_0_Sys_dataOut_[27]\, 
        \Sdram_data_0_Sys_dataOut_[26]\, 
        \Sdram_data_0_Sys_dataOut_[25]\, 
        \Sdram_data_0_Sys_dataOut_[24]\, 
        \Sdram_data_0_Sys_dataOut_[23]\, 
        \Sdram_data_0_Sys_dataOut_[22]\, 
        \Sdram_data_0_Sys_dataOut_[21]\, 
        \Sdram_data_0_Sys_dataOut_[20]\, 
        \Sdram_data_0_Sys_dataOut_[19]\, 
        \Sdram_data_0_Sys_dataOut_[18]\, 
        \Sdram_data_0_Sys_dataOut_[17]\, 
        \Sdram_data_0_Sys_dataOut_[16]\, 
        \Sdram_data_0_Sys_dataOut_[15]\, 
        \Sdram_data_0_Sys_dataOut_[14]\, 
        \Sdram_data_0_Sys_dataOut_[13]\, 
        \Sdram_data_0_Sys_dataOut_[12]\, 
        \Sdram_data_0_Sys_dataOut_[11]\, 
        \Sdram_data_0_Sys_dataOut_[10]\, 
        \Sdram_data_0_Sys_dataOut_[9]\, 
        \Sdram_data_0_Sys_dataOut_[8]\, 
        \Sdram_data_0_Sys_dataOut_[7]\, 
        \Sdram_data_0_Sys_dataOut_[6]\, 
        \Sdram_data_0_Sys_dataOut_[5]\, 
        \Sdram_data_0_Sys_dataOut_[4]\, 
        \Sdram_data_0_Sys_dataOut_[3]\, 
        \Sdram_data_0_Sys_dataOut_[2]\, 
        \Sdram_data_0_Sys_dataOut_[1]\, 
        \Sdram_data_0_Sys_dataOut_[0]\, 
        \Sdram_ini_0_ini_state_[2]\, \Sdram_ini_0_ini_state_[1]\, 
        \Sdram_ini_0_ini_state_[0]\, Sdram_ini_0_Sd_iniOK, 
        \SDram_rd_0_rd_state_[2]\, \SDram_rd_0_rd_state_[1]\, 
        \SDram_rd_0_rd_state_[0]\, SDram_rd_0_SD_RdOK, 
        \SDRAM_Ref_0_Ref_state_[2]\, \SDRAM_Ref_0_Ref_state_[1]\, 
        \SDRAM_Ref_0_Ref_state_[0]\, SDRAM_Ref_0_SD_refOK, 
        SDRAM_wr_0_SD_WrOK, \SDRAM_wr_0_wr_state_[2]\, 
        \SDRAM_wr_0_wr_state_[1]\, \SDRAM_wr_0_wr_state_[0]\, 
        \Uart_ctl_0_BaudValue_[12]\, \Uart_ctl_0_BaudValue_[11]\, 
        \Uart_ctl_0_BaudValue_[10]\, \Uart_ctl_0_BaudValue_[9]\, 
        \Uart_ctl_0_BaudValue_[8]\, \Uart_ctl_0_BaudValue_[7]\, 
        \Uart_ctl_0_BaudValue_[6]\, \Uart_ctl_0_BaudValue_[5]\, 
        \Uart_ctl_0_BaudValue_[4]\, \Uart_ctl_0_BaudValue_[3]\, 
        \Uart_ctl_0_BaudValue_[2]\, \Uart_ctl_0_BaudValue_[1]\, 
        \Uart_ctl_0_BaudValue_[0]\, Uart_ctl_0_OEn, 
        \Uart_ctl_0_P_AddrA_[2]\, \Uart_ctl_0_P_AddrA_[1]\, 
        \Uart_ctl_0_P_AddrA_[0]\, Uart_ctl_0_P_CLkA, 
        \Uart_ctl_0_P_DataA_[7]\, \Uart_ctl_0_P_DataA_[6]\, 
        \Uart_ctl_0_P_DataA_[5]\, \Uart_ctl_0_P_DataA_[4]\, 
        \Uart_ctl_0_P_DataA_[3]\, \Uart_ctl_0_P_DataA_[2]\, 
        \Uart_ctl_0_P_DataA_[1]\, \Uart_ctl_0_P_DataA_[0]\, 
        Uart_ctl_0_P_WEA, Uart_ctl_0_Rdy1, Uart_ctl_0_Rdy2, 
        \Uart_ctl_0_TxData_[7]\, \Uart_ctl_0_TxData_[6]\, 
        \Uart_ctl_0_TxData_[5]\, \Uart_ctl_0_TxData_[4]\, 
        \Uart_ctl_0_TxData_[3]\, \Uart_ctl_0_TxData_[2]\, 
        \Uart_ctl_0_TxData_[1]\, \Uart_ctl_0_TxData_[0]\, 
        Uart_ctl_0_WEn, \Uart_ram_0_RD_[7]\, \Uart_ram_0_RD_[6]\, 
        \Uart_ram_0_RD_[5]\, \Uart_ram_0_RD_[4]\, 
        \Uart_ram_0_RD_[3]\, \Uart_ram_0_RD_[2]\, 
        \Uart_ram_0_RD_[1]\, \Uart_ram_0_RD_[0]\, GND_net, 
        VCC_net : std_logic;

begin 


    Uart_ctl_0 : entity work.Uart_ctl
      port map(SysRst_n => PLL_Test1_0_SysRst_O, SysClk => 
        PLL_Test1_0_Sys_66M_Clk, RxRdy => COREUART_0_RXRDY, TxRdy
         => COREUART_0_TXRDY, OEn => Uart_ctl_0_OEn, WEn => 
        Uart_ctl_0_WEn, P_CLkA => Uart_ctl_0_P_CLkA, P_WEA => 
        Uart_ctl_0_P_WEA, Rdy1 => Uart_ctl_0_Rdy1, Rdy2 => 
        Uart_ctl_0_Rdy2, ParaLoad => ParaUpdata_0_ParaLoad, 
        RxData(7) => \COREUART_0_DATA_OUT_[7]\, RxData(6) => 
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
        \Uart_ctl_0_TxData_[0]\, BaudValue(12) => 
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
        \Uart_ctl_0_BaudValue_[0]\, P_AddrA(2) => 
        \Uart_ctl_0_P_AddrA_[2]\, P_AddrA(1) => 
        \Uart_ctl_0_P_AddrA_[1]\, P_AddrA(0) => 
        \Uart_ctl_0_P_AddrA_[0]\, P_DataA(7) => 
        \Uart_ctl_0_P_DataA_[7]\, P_DataA(6) => 
        \Uart_ctl_0_P_DataA_[6]\, P_DataA(5) => 
        \Uart_ctl_0_P_DataA_[5]\, P_DataA(4) => 
        \Uart_ctl_0_P_DataA_[4]\, P_DataA(3) => 
        \Uart_ctl_0_P_DataA_[3]\, P_DataA(2) => 
        \Uart_ctl_0_P_DataA_[2]\, P_DataA(1) => 
        \Uart_ctl_0_P_DataA_[1]\, P_DataA(0) => 
        \Uart_ctl_0_P_DataA_[0]\);
    
    My_adder0_2 : My_adder0
      port map(DataA(17) => GND_net, DataA(16) => GND_net, 
        DataA(15) => GND_net, DataA(14) => GND_net, DataA(13) => 
        \adc_muxtmp_test_0_DataOut41to28_[41]\, DataA(12) => 
        \adc_muxtmp_test_0_DataOut41to28_[40]\, DataA(11) => 
        \adc_muxtmp_test_0_DataOut41to28_[39]\, DataA(10) => 
        \adc_muxtmp_test_0_DataOut41to28_[38]\, DataA(9) => 
        \adc_muxtmp_test_0_DataOut41to28_[37]\, DataA(8) => 
        \adc_muxtmp_test_0_DataOut41to28_[36]\, DataA(7) => 
        \adc_muxtmp_test_0_DataOut41to28_[35]\, DataA(6) => 
        \adc_muxtmp_test_0_DataOut41to28_[34]\, DataA(5) => 
        \adc_muxtmp_test_0_DataOut41to28_[33]\, DataA(4) => 
        \adc_muxtmp_test_0_DataOut41to28_[32]\, DataA(3) => 
        \adc_muxtmp_test_0_DataOut41to28_[31]\, DataA(2) => 
        \adc_muxtmp_test_0_DataOut41to28_[30]\, DataA(1) => 
        \adc_muxtmp_test_0_DataOut41to28_[29]\, DataA(0) => 
        \adc_muxtmp_test_0_DataOut41to28_[28]\, DataB(17) => 
        \Main_ctl4SD_0_Data2ACC53to36_[53]\, DataB(16) => 
        \Main_ctl4SD_0_Data2ACC53to36_[52]\, DataB(15) => 
        \Main_ctl4SD_0_Data2ACC53to36_[51]\, DataB(14) => 
        \Main_ctl4SD_0_Data2ACC53to36_[50]\, DataB(13) => 
        \Main_ctl4SD_0_Data2ACC53to36_[49]\, DataB(12) => 
        \Main_ctl4SD_0_Data2ACC53to36_[48]\, DataB(11) => 
        \Main_ctl4SD_0_Data2ACC53to36_[47]\, DataB(10) => 
        \Main_ctl4SD_0_Data2ACC53to36_[46]\, DataB(9) => 
        \Main_ctl4SD_0_Data2ACC53to36_[45]\, DataB(8) => 
        \Main_ctl4SD_0_Data2ACC53to36_[44]\, DataB(7) => 
        \Main_ctl4SD_0_Data2ACC53to36_[43]\, DataB(6) => 
        \Main_ctl4SD_0_Data2ACC53to36_[42]\, DataB(5) => 
        \Main_ctl4SD_0_Data2ACC53to36_[41]\, DataB(4) => 
        \Main_ctl4SD_0_Data2ACC53to36_[40]\, DataB(3) => 
        \Main_ctl4SD_0_Data2ACC53to36_[39]\, DataB(2) => 
        \Main_ctl4SD_0_Data2ACC53to36_[38]\, DataB(1) => 
        \Main_ctl4SD_0_Data2ACC53to36_[37]\, DataB(0) => 
        \Main_ctl4SD_0_Data2ACC53to36_[36]\, Sum(17) => 
        \My_adder0_2_Sum_[17]\, Sum(16) => \My_adder0_2_Sum_[16]\, 
        Sum(15) => \My_adder0_2_Sum_[15]\, Sum(14) => 
        \My_adder0_2_Sum_[14]\, Sum(13) => \My_adder0_2_Sum_[13]\, 
        Sum(12) => \My_adder0_2_Sum_[12]\, Sum(11) => 
        \My_adder0_2_Sum_[11]\, Sum(10) => \My_adder0_2_Sum_[10]\, 
        Sum(9) => \My_adder0_2_Sum_[9]\, Sum(8) => 
        \My_adder0_2_Sum_[8]\, Sum(7) => \My_adder0_2_Sum_[7]\, 
        Sum(6) => \My_adder0_2_Sum_[6]\, Sum(5) => 
        \My_adder0_2_Sum_[5]\, Sum(4) => \My_adder0_2_Sum_[4]\, 
        Sum(3) => \My_adder0_2_Sum_[3]\, Sum(2) => 
        \My_adder0_2_Sum_[2]\, Sum(1) => \My_adder0_2_Sum_[1]\, 
        Sum(0) => \My_adder0_2_Sum_[0]\);
    
    Fifo_wr_0 : Fifo_rd
      port map(WE => Main_ctl4SD_0_Fifo_wr, RE => 
        Sdram_cmd_0_WFifo_re, CLK => PLL_Test1_0_Sys_66M_Clk, 
        FULL => OPEN, EMPTY => OPEN, RESET => 
        Main_ctl4SD_0_fifo_rst_n, AFULL => Fifo_wr_0_AFULL, 
        DATA(71) => \Main_ctl4SD_0_Data2Fifo_[71]\, DATA(70) => 
        \Main_ctl4SD_0_Data2Fifo_[70]\, DATA(69) => 
        \Main_ctl4SD_0_Data2Fifo_[69]\, DATA(68) => 
        \Main_ctl4SD_0_Data2Fifo_[68]\, DATA(67) => 
        \Main_ctl4SD_0_Data2Fifo_[67]\, DATA(66) => 
        \Main_ctl4SD_0_Data2Fifo_[66]\, DATA(65) => 
        \Main_ctl4SD_0_Data2Fifo_[65]\, DATA(64) => 
        \Main_ctl4SD_0_Data2Fifo_[64]\, DATA(63) => 
        \Main_ctl4SD_0_Data2Fifo_[63]\, DATA(62) => 
        \Main_ctl4SD_0_Data2Fifo_[62]\, DATA(61) => 
        \Main_ctl4SD_0_Data2Fifo_[61]\, DATA(60) => 
        \Main_ctl4SD_0_Data2Fifo_[60]\, DATA(59) => 
        \Main_ctl4SD_0_Data2Fifo_[59]\, DATA(58) => 
        \Main_ctl4SD_0_Data2Fifo_[58]\, DATA(57) => 
        \Main_ctl4SD_0_Data2Fifo_[57]\, DATA(56) => 
        \Main_ctl4SD_0_Data2Fifo_[56]\, DATA(55) => 
        \Main_ctl4SD_0_Data2Fifo_[55]\, DATA(54) => 
        \Main_ctl4SD_0_Data2Fifo_[54]\, DATA(53) => 
        \Main_ctl4SD_0_Data2Fifo_[53]\, DATA(52) => 
        \Main_ctl4SD_0_Data2Fifo_[52]\, DATA(51) => 
        \Main_ctl4SD_0_Data2Fifo_[51]\, DATA(50) => 
        \Main_ctl4SD_0_Data2Fifo_[50]\, DATA(49) => 
        \Main_ctl4SD_0_Data2Fifo_[49]\, DATA(48) => 
        \Main_ctl4SD_0_Data2Fifo_[48]\, DATA(47) => 
        \Main_ctl4SD_0_Data2Fifo_[47]\, DATA(46) => 
        \Main_ctl4SD_0_Data2Fifo_[46]\, DATA(45) => 
        \Main_ctl4SD_0_Data2Fifo_[45]\, DATA(44) => 
        \Main_ctl4SD_0_Data2Fifo_[44]\, DATA(43) => 
        \Main_ctl4SD_0_Data2Fifo_[43]\, DATA(42) => 
        \Main_ctl4SD_0_Data2Fifo_[42]\, DATA(41) => 
        \Main_ctl4SD_0_Data2Fifo_[41]\, DATA(40) => 
        \Main_ctl4SD_0_Data2Fifo_[40]\, DATA(39) => 
        \Main_ctl4SD_0_Data2Fifo_[39]\, DATA(38) => 
        \Main_ctl4SD_0_Data2Fifo_[38]\, DATA(37) => 
        \Main_ctl4SD_0_Data2Fifo_[37]\, DATA(36) => 
        \Main_ctl4SD_0_Data2Fifo_[36]\, DATA(35) => 
        \Main_ctl4SD_0_Data2Fifo_[35]\, DATA(34) => 
        \Main_ctl4SD_0_Data2Fifo_[34]\, DATA(33) => 
        \Main_ctl4SD_0_Data2Fifo_[33]\, DATA(32) => 
        \Main_ctl4SD_0_Data2Fifo_[32]\, DATA(31) => 
        \Main_ctl4SD_0_Data2Fifo_[31]\, DATA(30) => 
        \Main_ctl4SD_0_Data2Fifo_[30]\, DATA(29) => 
        \Main_ctl4SD_0_Data2Fifo_[29]\, DATA(28) => 
        \Main_ctl4SD_0_Data2Fifo_[28]\, DATA(27) => 
        \Main_ctl4SD_0_Data2Fifo_[27]\, DATA(26) => 
        \Main_ctl4SD_0_Data2Fifo_[26]\, DATA(25) => 
        \Main_ctl4SD_0_Data2Fifo_[25]\, DATA(24) => 
        \Main_ctl4SD_0_Data2Fifo_[24]\, DATA(23) => 
        \Main_ctl4SD_0_Data2Fifo_[23]\, DATA(22) => 
        \Main_ctl4SD_0_Data2Fifo_[22]\, DATA(21) => 
        \Main_ctl4SD_0_Data2Fifo_[21]\, DATA(20) => 
        \Main_ctl4SD_0_Data2Fifo_[20]\, DATA(19) => 
        \Main_ctl4SD_0_Data2Fifo_[19]\, DATA(18) => 
        \Main_ctl4SD_0_Data2Fifo_[18]\, DATA(17) => 
        \Main_ctl4SD_0_Data2Fifo_[17]\, DATA(16) => 
        \Main_ctl4SD_0_Data2Fifo_[16]\, DATA(15) => 
        \Main_ctl4SD_0_Data2Fifo_[15]\, DATA(14) => 
        \Main_ctl4SD_0_Data2Fifo_[14]\, DATA(13) => 
        \Main_ctl4SD_0_Data2Fifo_[13]\, DATA(12) => 
        \Main_ctl4SD_0_Data2Fifo_[12]\, DATA(11) => 
        \Main_ctl4SD_0_Data2Fifo_[11]\, DATA(10) => 
        \Main_ctl4SD_0_Data2Fifo_[10]\, DATA(9) => 
        \Main_ctl4SD_0_Data2Fifo_[9]\, DATA(8) => 
        \Main_ctl4SD_0_Data2Fifo_[8]\, DATA(7) => 
        \Main_ctl4SD_0_Data2Fifo_[7]\, DATA(6) => 
        \Main_ctl4SD_0_Data2Fifo_[6]\, DATA(5) => 
        \Main_ctl4SD_0_Data2Fifo_[5]\, DATA(4) => 
        \Main_ctl4SD_0_Data2Fifo_[4]\, DATA(3) => 
        \Main_ctl4SD_0_Data2Fifo_[3]\, DATA(2) => 
        \Main_ctl4SD_0_Data2Fifo_[2]\, DATA(1) => 
        \Main_ctl4SD_0_Data2Fifo_[1]\, DATA(0) => 
        \Main_ctl4SD_0_Data2Fifo_[0]\, Q(71) => 
        \Fifo_wr_0_Q_[71]\, Q(70) => \Fifo_wr_0_Q_[70]\, Q(69)
         => \Fifo_wr_0_Q_[69]\, Q(68) => \Fifo_wr_0_Q_[68]\, 
        Q(67) => \Fifo_wr_0_Q_[67]\, Q(66) => \Fifo_wr_0_Q_[66]\, 
        Q(65) => \Fifo_wr_0_Q_[65]\, Q(64) => \Fifo_wr_0_Q_[64]\, 
        Q(63) => \Fifo_wr_0_Q_[63]\, Q(62) => \Fifo_wr_0_Q_[62]\, 
        Q(61) => \Fifo_wr_0_Q_[61]\, Q(60) => \Fifo_wr_0_Q_[60]\, 
        Q(59) => \Fifo_wr_0_Q_[59]\, Q(58) => \Fifo_wr_0_Q_[58]\, 
        Q(57) => \Fifo_wr_0_Q_[57]\, Q(56) => \Fifo_wr_0_Q_[56]\, 
        Q(55) => \Fifo_wr_0_Q_[55]\, Q(54) => \Fifo_wr_0_Q_[54]\, 
        Q(53) => \Fifo_wr_0_Q_[53]\, Q(52) => \Fifo_wr_0_Q_[52]\, 
        Q(51) => \Fifo_wr_0_Q_[51]\, Q(50) => \Fifo_wr_0_Q_[50]\, 
        Q(49) => \Fifo_wr_0_Q_[49]\, Q(48) => \Fifo_wr_0_Q_[48]\, 
        Q(47) => \Fifo_wr_0_Q_[47]\, Q(46) => \Fifo_wr_0_Q_[46]\, 
        Q(45) => \Fifo_wr_0_Q_[45]\, Q(44) => \Fifo_wr_0_Q_[44]\, 
        Q(43) => \Fifo_wr_0_Q_[43]\, Q(42) => \Fifo_wr_0_Q_[42]\, 
        Q(41) => \Fifo_wr_0_Q_[41]\, Q(40) => \Fifo_wr_0_Q_[40]\, 
        Q(39) => \Fifo_wr_0_Q_[39]\, Q(38) => \Fifo_wr_0_Q_[38]\, 
        Q(37) => \Fifo_wr_0_Q_[37]\, Q(36) => \Fifo_wr_0_Q_[36]\, 
        Q(35) => \Fifo_wr_0_Q_[35]\, Q(34) => \Fifo_wr_0_Q_[34]\, 
        Q(33) => \Fifo_wr_0_Q_[33]\, Q(32) => \Fifo_wr_0_Q_[32]\, 
        Q(31) => \Fifo_wr_0_Q_[31]\, Q(30) => \Fifo_wr_0_Q_[30]\, 
        Q(29) => \Fifo_wr_0_Q_[29]\, Q(28) => \Fifo_wr_0_Q_[28]\, 
        Q(27) => \Fifo_wr_0_Q_[27]\, Q(26) => \Fifo_wr_0_Q_[26]\, 
        Q(25) => \Fifo_wr_0_Q_[25]\, Q(24) => \Fifo_wr_0_Q_[24]\, 
        Q(23) => \Fifo_wr_0_Q_[23]\, Q(22) => \Fifo_wr_0_Q_[22]\, 
        Q(21) => \Fifo_wr_0_Q_[21]\, Q(20) => \Fifo_wr_0_Q_[20]\, 
        Q(19) => \Fifo_wr_0_Q_[19]\, Q(18) => \Fifo_wr_0_Q_[18]\, 
        Q(17) => \Fifo_wr_0_Q_[17]\, Q(16) => \Fifo_wr_0_Q_[16]\, 
        Q(15) => \Fifo_wr_0_Q_[15]\, Q(14) => \Fifo_wr_0_Q_[14]\, 
        Q(13) => \Fifo_wr_0_Q_[13]\, Q(12) => \Fifo_wr_0_Q_[12]\, 
        Q(11) => \Fifo_wr_0_Q_[11]\, Q(10) => \Fifo_wr_0_Q_[10]\, 
        Q(9) => \Fifo_wr_0_Q_[9]\, Q(8) => \Fifo_wr_0_Q_[8]\, 
        Q(7) => \Fifo_wr_0_Q_[7]\, Q(6) => \Fifo_wr_0_Q_[6]\, 
        Q(5) => \Fifo_wr_0_Q_[5]\, Q(4) => \Fifo_wr_0_Q_[4]\, 
        Q(3) => \Fifo_wr_0_Q_[3]\, Q(2) => \Fifo_wr_0_Q_[2]\, 
        Q(1) => \Fifo_wr_0_Q_[1]\, Q(0) => \Fifo_wr_0_Q_[0]\);
    
    adc_muxtmp_test_0 : entity work.adc_muxtmp_test
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, rst_n => 
        PLL_Test1_0_SysRst_O, ADC_en => CMOS_DrvX_0_AdcEn, 
        dataIn(13) => ADCdataIn(13), dataIn(12) => ADCdataIn(12), 
        dataIn(11) => ADCdataIn(11), dataIn(10) => ADCdataIn(10), 
        dataIn(9) => ADCdataIn(9), dataIn(8) => ADCdataIn(8), 
        dataIn(7) => ADCdataIn(7), dataIn(6) => ADCdataIn(6), 
        dataIn(5) => ADCdataIn(5), dataIn(4) => ADCdataIn(4), 
        dataIn(3) => ADCdataIn(3), dataIn(2) => ADCdataIn(2), 
        dataIn(1) => ADCdataIn(1), dataIn(0) => ADCdataIn(0), 
        DataOut(55) => \adc_muxtmp_test_0_DataOut55to42_[55]\, 
        DataOut(54) => \adc_muxtmp_test_0_DataOut55to42_[54]\, 
        DataOut(53) => \adc_muxtmp_test_0_DataOut55to42_[53]\, 
        DataOut(52) => \adc_muxtmp_test_0_DataOut55to42_[52]\, 
        DataOut(51) => \adc_muxtmp_test_0_DataOut55to42_[51]\, 
        DataOut(50) => \adc_muxtmp_test_0_DataOut55to42_[50]\, 
        DataOut(49) => \adc_muxtmp_test_0_DataOut55to42_[49]\, 
        DataOut(48) => \adc_muxtmp_test_0_DataOut55to42_[48]\, 
        DataOut(47) => \adc_muxtmp_test_0_DataOut55to42_[47]\, 
        DataOut(46) => \adc_muxtmp_test_0_DataOut55to42_[46]\, 
        DataOut(45) => \adc_muxtmp_test_0_DataOut55to42_[45]\, 
        DataOut(44) => \adc_muxtmp_test_0_DataOut55to42_[44]\, 
        DataOut(43) => \adc_muxtmp_test_0_DataOut55to42_[43]\, 
        DataOut(42) => \adc_muxtmp_test_0_DataOut55to42_[42]\, 
        DataOut(41) => \adc_muxtmp_test_0_DataOut41to28_[41]\, 
        DataOut(40) => \adc_muxtmp_test_0_DataOut41to28_[40]\, 
        DataOut(39) => \adc_muxtmp_test_0_DataOut41to28_[39]\, 
        DataOut(38) => \adc_muxtmp_test_0_DataOut41to28_[38]\, 
        DataOut(37) => \adc_muxtmp_test_0_DataOut41to28_[37]\, 
        DataOut(36) => \adc_muxtmp_test_0_DataOut41to28_[36]\, 
        DataOut(35) => \adc_muxtmp_test_0_DataOut41to28_[35]\, 
        DataOut(34) => \adc_muxtmp_test_0_DataOut41to28_[34]\, 
        DataOut(33) => \adc_muxtmp_test_0_DataOut41to28_[33]\, 
        DataOut(32) => \adc_muxtmp_test_0_DataOut41to28_[32]\, 
        DataOut(31) => \adc_muxtmp_test_0_DataOut41to28_[31]\, 
        DataOut(30) => \adc_muxtmp_test_0_DataOut41to28_[30]\, 
        DataOut(29) => \adc_muxtmp_test_0_DataOut41to28_[29]\, 
        DataOut(28) => \adc_muxtmp_test_0_DataOut41to28_[28]\, 
        DataOut(27) => \adc_muxtmp_test_0_DataOut27to14_[27]\, 
        DataOut(26) => \adc_muxtmp_test_0_DataOut27to14_[26]\, 
        DataOut(25) => \adc_muxtmp_test_0_DataOut27to14_[25]\, 
        DataOut(24) => \adc_muxtmp_test_0_DataOut27to14_[24]\, 
        DataOut(23) => \adc_muxtmp_test_0_DataOut27to14_[23]\, 
        DataOut(22) => \adc_muxtmp_test_0_DataOut27to14_[22]\, 
        DataOut(21) => \adc_muxtmp_test_0_DataOut27to14_[21]\, 
        DataOut(20) => \adc_muxtmp_test_0_DataOut27to14_[20]\, 
        DataOut(19) => \adc_muxtmp_test_0_DataOut27to14_[19]\, 
        DataOut(18) => \adc_muxtmp_test_0_DataOut27to14_[18]\, 
        DataOut(17) => \adc_muxtmp_test_0_DataOut27to14_[17]\, 
        DataOut(16) => \adc_muxtmp_test_0_DataOut27to14_[16]\, 
        DataOut(15) => \adc_muxtmp_test_0_DataOut27to14_[15]\, 
        DataOut(14) => \adc_muxtmp_test_0_DataOut27to14_[14]\, 
        DataOut(13) => \adc_muxtmp_test_0_DataOut13to0_[13]\, 
        DataOut(12) => \adc_muxtmp_test_0_DataOut13to0_[12]\, 
        DataOut(11) => \adc_muxtmp_test_0_DataOut13to0_[11]\, 
        DataOut(10) => \adc_muxtmp_test_0_DataOut13to0_[10]\, 
        DataOut(9) => \adc_muxtmp_test_0_DataOut13to0_[9]\, 
        DataOut(8) => \adc_muxtmp_test_0_DataOut13to0_[8]\, 
        DataOut(7) => \adc_muxtmp_test_0_DataOut13to0_[7]\, 
        DataOut(6) => \adc_muxtmp_test_0_DataOut13to0_[6]\, 
        DataOut(5) => \adc_muxtmp_test_0_DataOut13to0_[5]\, 
        DataOut(4) => \adc_muxtmp_test_0_DataOut13to0_[4]\, 
        DataOut(3) => \adc_muxtmp_test_0_DataOut13to0_[3]\, 
        DataOut(2) => \adc_muxtmp_test_0_DataOut13to0_[2]\, 
        DataOut(1) => \adc_muxtmp_test_0_DataOut13to0_[1]\, 
        DataOut(0) => \adc_muxtmp_test_0_DataOut13to0_[0]\);
    
    Sdram_ini_0 : entity work.Sdram_ini
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, rst_n => 
        PLL_Test1_0_SysRst_O, SD_iniEN => Sdram_ctl_v2_0_SD_iniEn, 
        Sd_iniOK => Sdram_ini_0_Sd_iniOK, ini_state(2) => 
        \Sdram_ini_0_ini_state_[2]\, ini_state(1) => 
        \Sdram_ini_0_ini_state_[1]\, ini_state(0) => 
        \Sdram_ini_0_ini_state_[0]\);
    
    My_adder0_3 : My_adder0
      port map(DataA(17) => GND_net, DataA(16) => GND_net, 
        DataA(15) => GND_net, DataA(14) => GND_net, DataA(13) => 
        \adc_muxtmp_test_0_DataOut55to42_[55]\, DataA(12) => 
        \adc_muxtmp_test_0_DataOut55to42_[54]\, DataA(11) => 
        \adc_muxtmp_test_0_DataOut55to42_[53]\, DataA(10) => 
        \adc_muxtmp_test_0_DataOut55to42_[52]\, DataA(9) => 
        \adc_muxtmp_test_0_DataOut55to42_[51]\, DataA(8) => 
        \adc_muxtmp_test_0_DataOut55to42_[50]\, DataA(7) => 
        \adc_muxtmp_test_0_DataOut55to42_[49]\, DataA(6) => 
        \adc_muxtmp_test_0_DataOut55to42_[48]\, DataA(5) => 
        \adc_muxtmp_test_0_DataOut55to42_[47]\, DataA(4) => 
        \adc_muxtmp_test_0_DataOut55to42_[46]\, DataA(3) => 
        \adc_muxtmp_test_0_DataOut55to42_[45]\, DataA(2) => 
        \adc_muxtmp_test_0_DataOut55to42_[44]\, DataA(1) => 
        \adc_muxtmp_test_0_DataOut55to42_[43]\, DataA(0) => 
        \adc_muxtmp_test_0_DataOut55to42_[42]\, DataB(17) => 
        \Main_ctl4SD_0_Data2ACC71to54_[71]\, DataB(16) => 
        \Main_ctl4SD_0_Data2ACC71to54_[70]\, DataB(15) => 
        \Main_ctl4SD_0_Data2ACC71to54_[69]\, DataB(14) => 
        \Main_ctl4SD_0_Data2ACC71to54_[68]\, DataB(13) => 
        \Main_ctl4SD_0_Data2ACC71to54_[67]\, DataB(12) => 
        \Main_ctl4SD_0_Data2ACC71to54_[66]\, DataB(11) => 
        \Main_ctl4SD_0_Data2ACC71to54_[65]\, DataB(10) => 
        \Main_ctl4SD_0_Data2ACC71to54_[64]\, DataB(9) => 
        \Main_ctl4SD_0_Data2ACC71to54_[63]\, DataB(8) => 
        \Main_ctl4SD_0_Data2ACC71to54_[62]\, DataB(7) => 
        \Main_ctl4SD_0_Data2ACC71to54_[61]\, DataB(6) => 
        \Main_ctl4SD_0_Data2ACC71to54_[60]\, DataB(5) => 
        \Main_ctl4SD_0_Data2ACC71to54_[59]\, DataB(4) => 
        \Main_ctl4SD_0_Data2ACC71to54_[58]\, DataB(3) => 
        \Main_ctl4SD_0_Data2ACC71to54_[57]\, DataB(2) => 
        \Main_ctl4SD_0_Data2ACC71to54_[56]\, DataB(1) => 
        \Main_ctl4SD_0_Data2ACC71to54_[55]\, DataB(0) => 
        \Main_ctl4SD_0_Data2ACC71to54_[54]\, Sum(17) => 
        \My_adder0_3_Sum_[17]\, Sum(16) => \My_adder0_3_Sum_[16]\, 
        Sum(15) => \My_adder0_3_Sum_[15]\, Sum(14) => 
        \My_adder0_3_Sum_[14]\, Sum(13) => \My_adder0_3_Sum_[13]\, 
        Sum(12) => \My_adder0_3_Sum_[12]\, Sum(11) => 
        \My_adder0_3_Sum_[11]\, Sum(10) => \My_adder0_3_Sum_[10]\, 
        Sum(9) => \My_adder0_3_Sum_[9]\, Sum(8) => 
        \My_adder0_3_Sum_[8]\, Sum(7) => \My_adder0_3_Sum_[7]\, 
        Sum(6) => \My_adder0_3_Sum_[6]\, Sum(5) => 
        \My_adder0_3_Sum_[5]\, Sum(4) => \My_adder0_3_Sum_[4]\, 
        Sum(3) => \My_adder0_3_Sum_[3]\, Sum(2) => 
        \My_adder0_3_Sum_[2]\, Sum(1) => \My_adder0_3_Sum_[1]\, 
        Sum(0) => \My_adder0_3_Sum_[0]\);
    
    \GND\ : GND
      port map(Y => GND_net);
    
    PLL_Test1_0 : entity work.PLL_Test1
      port map(I_66M_Clk => ExterCLk, Sys_66M_Clk => 
        PLL_Test1_0_Sys_66M_Clk, ADC_66M_Clk => 
        PLL_Test1_0_ADC_66M_Clk, Sdram_clk => 
        PLL_Test1_0_Sdram_clk, SysRst_O => PLL_Test1_0_SysRst_O);
    
    My_adder0_1 : My_adder0
      port map(DataA(17) => GND_net, DataA(16) => GND_net, 
        DataA(15) => GND_net, DataA(14) => GND_net, DataA(13) => 
        \adc_muxtmp_test_0_DataOut27to14_[27]\, DataA(12) => 
        \adc_muxtmp_test_0_DataOut27to14_[26]\, DataA(11) => 
        \adc_muxtmp_test_0_DataOut27to14_[25]\, DataA(10) => 
        \adc_muxtmp_test_0_DataOut27to14_[24]\, DataA(9) => 
        \adc_muxtmp_test_0_DataOut27to14_[23]\, DataA(8) => 
        \adc_muxtmp_test_0_DataOut27to14_[22]\, DataA(7) => 
        \adc_muxtmp_test_0_DataOut27to14_[21]\, DataA(6) => 
        \adc_muxtmp_test_0_DataOut27to14_[20]\, DataA(5) => 
        \adc_muxtmp_test_0_DataOut27to14_[19]\, DataA(4) => 
        \adc_muxtmp_test_0_DataOut27to14_[18]\, DataA(3) => 
        \adc_muxtmp_test_0_DataOut27to14_[17]\, DataA(2) => 
        \adc_muxtmp_test_0_DataOut27to14_[16]\, DataA(1) => 
        \adc_muxtmp_test_0_DataOut27to14_[15]\, DataA(0) => 
        \adc_muxtmp_test_0_DataOut27to14_[14]\, DataB(17) => 
        \Main_ctl4SD_0_Data2ACC35to18_[35]\, DataB(16) => 
        \Main_ctl4SD_0_Data2ACC35to18_[34]\, DataB(15) => 
        \Main_ctl4SD_0_Data2ACC35to18_[33]\, DataB(14) => 
        \Main_ctl4SD_0_Data2ACC35to18_[32]\, DataB(13) => 
        \Main_ctl4SD_0_Data2ACC35to18_[31]\, DataB(12) => 
        \Main_ctl4SD_0_Data2ACC35to18_[30]\, DataB(11) => 
        \Main_ctl4SD_0_Data2ACC35to18_[29]\, DataB(10) => 
        \Main_ctl4SD_0_Data2ACC35to18_[28]\, DataB(9) => 
        \Main_ctl4SD_0_Data2ACC35to18_[27]\, DataB(8) => 
        \Main_ctl4SD_0_Data2ACC35to18_[26]\, DataB(7) => 
        \Main_ctl4SD_0_Data2ACC35to18_[25]\, DataB(6) => 
        \Main_ctl4SD_0_Data2ACC35to18_[24]\, DataB(5) => 
        \Main_ctl4SD_0_Data2ACC35to18_[23]\, DataB(4) => 
        \Main_ctl4SD_0_Data2ACC35to18_[22]\, DataB(3) => 
        \Main_ctl4SD_0_Data2ACC35to18_[21]\, DataB(2) => 
        \Main_ctl4SD_0_Data2ACC35to18_[20]\, DataB(1) => 
        \Main_ctl4SD_0_Data2ACC35to18_[19]\, DataB(0) => 
        \Main_ctl4SD_0_Data2ACC35to18_[18]\, Sum(17) => 
        \My_adder0_1_Sum_[17]\, Sum(16) => \My_adder0_1_Sum_[16]\, 
        Sum(15) => \My_adder0_1_Sum_[15]\, Sum(14) => 
        \My_adder0_1_Sum_[14]\, Sum(13) => \My_adder0_1_Sum_[13]\, 
        Sum(12) => \My_adder0_1_Sum_[12]\, Sum(11) => 
        \My_adder0_1_Sum_[11]\, Sum(10) => \My_adder0_1_Sum_[10]\, 
        Sum(9) => \My_adder0_1_Sum_[9]\, Sum(8) => 
        \My_adder0_1_Sum_[8]\, Sum(7) => \My_adder0_1_Sum_[7]\, 
        Sum(6) => \My_adder0_1_Sum_[6]\, Sum(5) => 
        \My_adder0_1_Sum_[5]\, Sum(4) => \My_adder0_1_Sum_[4]\, 
        Sum(3) => \My_adder0_1_Sum_[3]\, Sum(2) => 
        \My_adder0_1_Sum_[2]\, Sum(1) => \My_adder0_1_Sum_[1]\, 
        Sum(0) => \My_adder0_1_Sum_[0]\);
    
    Uart_ram_0 : Uart_ram
      port map(WE => Uart_ctl_0_P_WEA, RE => ParaUpdata_0_P_RdB, 
        WCLK => Uart_ctl_0_P_CLkA, RCLK => ParaUpdata_0_P_CLkB, 
        RESETN => PLL_Test1_0_SysRst_O, WD(7) => 
        \Uart_ctl_0_P_DataA_[7]\, WD(6) => 
        \Uart_ctl_0_P_DataA_[6]\, WD(5) => 
        \Uart_ctl_0_P_DataA_[5]\, WD(4) => 
        \Uart_ctl_0_P_DataA_[4]\, WD(3) => 
        \Uart_ctl_0_P_DataA_[3]\, WD(2) => 
        \Uart_ctl_0_P_DataA_[2]\, WD(1) => 
        \Uart_ctl_0_P_DataA_[1]\, WD(0) => 
        \Uart_ctl_0_P_DataA_[0]\, RD(7) => \Uart_ram_0_RD_[7]\, 
        RD(6) => \Uart_ram_0_RD_[6]\, RD(5) => 
        \Uart_ram_0_RD_[5]\, RD(4) => \Uart_ram_0_RD_[4]\, RD(3)
         => \Uart_ram_0_RD_[3]\, RD(2) => \Uart_ram_0_RD_[2]\, 
        RD(1) => \Uart_ram_0_RD_[1]\, RD(0) => 
        \Uart_ram_0_RD_[0]\, WADDR(2) => \Uart_ctl_0_P_AddrA_[2]\, 
        WADDR(1) => \Uart_ctl_0_P_AddrA_[1]\, WADDR(0) => 
        \Uart_ctl_0_P_AddrA_[0]\, RADDR(2) => 
        \ParaUpdata_0_P_AddrB_[2]\, RADDR(1) => 
        \ParaUpdata_0_P_AddrB_[1]\, RADDR(0) => 
        \ParaUpdata_0_P_AddrB_[0]\);
    
    Counter_ref_0 : entity work.Counter_ref
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, SD_RefEn => 
        Sdram_ctl_v2_0_SD_RefEn, sysrst_n => PLL_Test1_0_SysRst_O, 
        Lvds_en => CMOS_DrvX_0_LVDSen, ByterdEn => 
        Main_ctl4SD_0_ByteRdEn, RefEn => Counter_ref_0_RefEn);
    
    ParaUpdata_0 : entity work.ParaUpdata
      port map(SysRst_n => PLL_Test1_0_SysRst_O, SysClk => 
        PLL_Test1_0_Sys_66M_Clk, P_CLkB => ParaUpdata_0_P_CLkB, 
        P_RdB => ParaUpdata_0_P_RdB, Rdy1 => Uart_ctl_0_Rdy1, 
        Rdy2 => Uart_ctl_0_Rdy2, ParaLoad => 
        ParaUpdata_0_ParaLoad, P_AddrB(2) => 
        \ParaUpdata_0_P_AddrB_[2]\, P_AddrB(1) => 
        \ParaUpdata_0_P_AddrB_[1]\, P_AddrB(0) => 
        \ParaUpdata_0_P_AddrB_[0]\, P_DataB(7) => 
        \Uart_ram_0_RD_[7]\, P_DataB(6) => \Uart_ram_0_RD_[6]\, 
        P_DataB(5) => \Uart_ram_0_RD_[5]\, P_DataB(4) => 
        \Uart_ram_0_RD_[4]\, P_DataB(3) => \Uart_ram_0_RD_[3]\, 
        P_DataB(2) => \Uart_ram_0_RD_[2]\, P_DataB(1) => 
        \Uart_ram_0_RD_[1]\, P_DataB(0) => \Uart_ram_0_RD_[0]\, 
        SPI_Set(31) => \ParaUpdata_0_SPI_Set_[31]\, SPI_Set(30)
         => \ParaUpdata_0_SPI_Set_[30]\, SPI_Set(29) => 
        \ParaUpdata_0_SPI_Set_[29]\, SPI_Set(28) => 
        \ParaUpdata_0_SPI_Set_[28]\, SPI_Set(27) => 
        \ParaUpdata_0_SPI_Set_[27]\, SPI_Set(26) => 
        \ParaUpdata_0_SPI_Set_[26]\, SPI_Set(25) => 
        \ParaUpdata_0_SPI_Set_[25]\, SPI_Set(24) => 
        \ParaUpdata_0_SPI_Set_[24]\, SPI_Set(23) => 
        \ParaUpdata_0_SPI_Set_[23]\, SPI_Set(22) => 
        \ParaUpdata_0_SPI_Set_[22]\, SPI_Set(21) => 
        \ParaUpdata_0_SPI_Set_[21]\, SPI_Set(20) => 
        \ParaUpdata_0_SPI_Set_[20]\, SPI_Set(19) => 
        \ParaUpdata_0_SPI_Set_[19]\, SPI_Set(18) => 
        \ParaUpdata_0_SPI_Set_[18]\, SPI_Set(17) => 
        \ParaUpdata_0_SPI_Set_[17]\, SPI_Set(16) => 
        \ParaUpdata_0_SPI_Set_[16]\, SPI_Set(15) => 
        \ParaUpdata_0_SPI_Set_[15]\, SPI_Set(14) => 
        \ParaUpdata_0_SPI_Set_[14]\, SPI_Set(13) => 
        \ParaUpdata_0_SPI_Set_[13]\, SPI_Set(12) => 
        \ParaUpdata_0_SPI_Set_[12]\, SPI_Set(11) => 
        \ParaUpdata_0_SPI_Set_[11]\, SPI_Set(10) => 
        \ParaUpdata_0_SPI_Set_[10]\, SPI_Set(9) => 
        \ParaUpdata_0_SPI_Set_[9]\, SPI_Set(8) => 
        \ParaUpdata_0_SPI_Set_[8]\, SPI_Set(7) => 
        \ParaUpdata_0_SPI_Set_[7]\, SPI_Set(6) => 
        \ParaUpdata_0_SPI_Set_[6]\, SPI_Set(5) => 
        \ParaUpdata_0_SPI_Set_[5]\, SPI_Set(4) => 
        \ParaUpdata_0_SPI_Set_[4]\, SPI_Set(3) => 
        \ParaUpdata_0_SPI_Set_[3]\, SPI_Set(2) => 
        \ParaUpdata_0_SPI_Set_[2]\, SPI_Set(1) => 
        \ParaUpdata_0_SPI_Set_[1]\, SPI_Set(0) => 
        \ParaUpdata_0_SPI_Set_[0]\, ExposureT(5) => 
        \ParaUpdata_0_ExposureT_[5]\, ExposureT(4) => 
        \ParaUpdata_0_ExposureT_[4]\, ExposureT(3) => 
        \ParaUpdata_0_ExposureT_[3]\, ExposureT(2) => 
        \ParaUpdata_0_ExposureT_[2]\, ExposureT(1) => 
        \ParaUpdata_0_ExposureT_[1]\, ExposureT(0) => 
        \ParaUpdata_0_ExposureT_[0]\, MotorPos(5) => 
        \ParaUpdata_0_MotorPos_[5]\, MotorPos(4) => 
        \ParaUpdata_0_MotorPos_[4]\, MotorPos(3) => 
        \ParaUpdata_0_MotorPos_[3]\, MotorPos(2) => 
        \ParaUpdata_0_MotorPos_[2]\, MotorPos(1) => 
        \ParaUpdata_0_MotorPos_[1]\, MotorPos(0) => 
        \ParaUpdata_0_MotorPos_[0]\, BandNum(3) => 
        \ParaUpdata_0_BandNum_[3]\, BandNum(2) => 
        \ParaUpdata_0_BandNum_[2]\, BandNum(1) => 
        \ParaUpdata_0_BandNum_[1]\, BandNum(0) => 
        \ParaUpdata_0_BandNum_[0]\, Mode(1) => 
        \ParaUpdata_0_Mode_[1]\, Mode(0) => 
        \ParaUpdata_0_Mode_[0]\, Accnum(5) => 
        \ParaUpdata_0_Accnum_0_[5]\, Accnum(4) => 
        \ParaUpdata_0_Accnum_0_[4]\, Accnum(3) => 
        \ParaUpdata_0_Accnum_0_[3]\, Accnum(2) => 
        \ParaUpdata_0_Accnum_0_[2]\, Accnum(1) => 
        \ParaUpdata_0_Accnum_0_[1]\, Accnum(0) => 
        \ParaUpdata_0_Accnum_0_[0]\);
    
    CMOS_DrvX_0 : entity work.CMOS_DrvX
      port map(SysClk => PLL_Test1_0_Sys_66M_Clk, SysRst_n => 
        PLL_Test1_0_SysRst_O, ADC_66M_Clk => 
        PLL_Test1_0_ADC_66M_Clk, mem_HL => mem_HL, precharge => 
        precharge, sample => CMOS_sample, reset => CMOS_reset, 
        reset_ds => reset_ds, Sync_Y => Sync_Y, Clock_Y => 
        Clock_Y, NoRowSel => NoRowSel, Pre_co => Pre_co, Sh_co
         => Sh_co, VoltAvg => VoltAvg, Sync_X => Sync_X, Clock_X
         => Clock_X, Prebus1 => Prebus1, Prebus2 => Prebus2, 
        AdcClk => OPEN, ParaUpdata => CMOS_DrvX_0_ParaUpdata, 
        spi_data => spi_data, spi_load => spi_load, spi_clock => 
        spi_clock, SDoneFrameOk => Sdram_cmd_0_SDoneFrameOk, 
        LVDSRdOk => FrameMk_0_LVDS_ok, cmos_start => cmos_start, 
        AdcEn => CMOS_DrvX_0_AdcEn, LVDSen => CMOS_DrvX_0_LVDSen, 
        SDramEn => CMOS_DrvX_0_SDramEn, SPI_setPara(31) => 
        \ParaUpdata_0_SPI_Set_[31]\, SPI_setPara(30) => 
        \ParaUpdata_0_SPI_Set_[30]\, SPI_setPara(29) => 
        \ParaUpdata_0_SPI_Set_[29]\, SPI_setPara(28) => 
        \ParaUpdata_0_SPI_Set_[28]\, SPI_setPara(27) => 
        \ParaUpdata_0_SPI_Set_[27]\, SPI_setPara(26) => 
        \ParaUpdata_0_SPI_Set_[26]\, SPI_setPara(25) => 
        \ParaUpdata_0_SPI_Set_[25]\, SPI_setPara(24) => 
        \ParaUpdata_0_SPI_Set_[24]\, SPI_setPara(23) => 
        \ParaUpdata_0_SPI_Set_[23]\, SPI_setPara(22) => 
        \ParaUpdata_0_SPI_Set_[22]\, SPI_setPara(21) => 
        \ParaUpdata_0_SPI_Set_[21]\, SPI_setPara(20) => 
        \ParaUpdata_0_SPI_Set_[20]\, SPI_setPara(19) => 
        \ParaUpdata_0_SPI_Set_[19]\, SPI_setPara(18) => 
        \ParaUpdata_0_SPI_Set_[18]\, SPI_setPara(17) => 
        \ParaUpdata_0_SPI_Set_[17]\, SPI_setPara(16) => 
        \ParaUpdata_0_SPI_Set_[16]\, SPI_setPara(15) => 
        \ParaUpdata_0_SPI_Set_[15]\, SPI_setPara(14) => 
        \ParaUpdata_0_SPI_Set_[14]\, SPI_setPara(13) => 
        \ParaUpdata_0_SPI_Set_[13]\, SPI_setPara(12) => 
        \ParaUpdata_0_SPI_Set_[12]\, SPI_setPara(11) => 
        \ParaUpdata_0_SPI_Set_[11]\, SPI_setPara(10) => 
        \ParaUpdata_0_SPI_Set_[10]\, SPI_setPara(9) => 
        \ParaUpdata_0_SPI_Set_[9]\, SPI_setPara(8) => 
        \ParaUpdata_0_SPI_Set_[8]\, SPI_setPara(7) => 
        \ParaUpdata_0_SPI_Set_[7]\, SPI_setPara(6) => 
        \ParaUpdata_0_SPI_Set_[6]\, SPI_setPara(5) => 
        \ParaUpdata_0_SPI_Set_[5]\, SPI_setPara(4) => 
        \ParaUpdata_0_SPI_Set_[4]\, SPI_setPara(3) => 
        \ParaUpdata_0_SPI_Set_[3]\, SPI_setPara(2) => 
        \ParaUpdata_0_SPI_Set_[2]\, SPI_setPara(1) => 
        \ParaUpdata_0_SPI_Set_[1]\, SPI_setPara(0) => 
        \ParaUpdata_0_SPI_Set_[0]\, ExposureT(5) => 
        \ParaUpdata_0_ExposureT_[5]\, ExposureT(4) => 
        \ParaUpdata_0_ExposureT_[4]\, ExposureT(3) => 
        \ParaUpdata_0_ExposureT_[3]\, ExposureT(2) => 
        \ParaUpdata_0_ExposureT_[2]\, ExposureT(1) => 
        \ParaUpdata_0_ExposureT_[1]\, ExposureT(0) => 
        \ParaUpdata_0_ExposureT_[0]\, AccNum(5) => 
        \ParaUpdata_0_Accnum_0_[5]\, AccNum(4) => 
        \ParaUpdata_0_Accnum_0_[4]\, AccNum(3) => 
        \ParaUpdata_0_Accnum_0_[3]\, AccNum(2) => 
        \ParaUpdata_0_Accnum_0_[2]\, AccNum(1) => 
        \ParaUpdata_0_Accnum_0_[1]\, AccNum(0) => 
        \ParaUpdata_0_Accnum_0_[0]\);
    
    Main_ctl4SD_0 : entity work.Main_ctl4SD
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, sysrst_n => 
        PLL_Test1_0_SysRst_O, SDramEn => CMOS_DrvX_0_SDramEn, 
        LVDS_en => CMOS_DrvX_0_LVDSen, Adc_en => 
        CMOS_DrvX_0_AdcEn, LVDSRdOk => FrameMk_0_LVDS_ok, fifo_rd
         => Main_ctl4SD_0_fifo_rd, fifo_rst_n => 
        Main_ctl4SD_0_fifo_rst_n, ByteRdEn => 
        Main_ctl4SD_0_ByteRdEn, Fifo_wr => Main_ctl4SD_0_Fifo_wr, 
        Data_fifoIN(71) => \Fifo_rd_0_Q_[71]\, Data_fifoIN(70)
         => \Fifo_rd_0_Q_[70]\, Data_fifoIN(69) => 
        \Fifo_rd_0_Q_[69]\, Data_fifoIN(68) => \Fifo_rd_0_Q_[68]\, 
        Data_fifoIN(67) => \Fifo_rd_0_Q_[67]\, Data_fifoIN(66)
         => \Fifo_rd_0_Q_[66]\, Data_fifoIN(65) => 
        \Fifo_rd_0_Q_[65]\, Data_fifoIN(64) => \Fifo_rd_0_Q_[64]\, 
        Data_fifoIN(63) => \Fifo_rd_0_Q_[63]\, Data_fifoIN(62)
         => \Fifo_rd_0_Q_[62]\, Data_fifoIN(61) => 
        \Fifo_rd_0_Q_[61]\, Data_fifoIN(60) => \Fifo_rd_0_Q_[60]\, 
        Data_fifoIN(59) => \Fifo_rd_0_Q_[59]\, Data_fifoIN(58)
         => \Fifo_rd_0_Q_[58]\, Data_fifoIN(57) => 
        \Fifo_rd_0_Q_[57]\, Data_fifoIN(56) => \Fifo_rd_0_Q_[56]\, 
        Data_fifoIN(55) => \Fifo_rd_0_Q_[55]\, Data_fifoIN(54)
         => \Fifo_rd_0_Q_[54]\, Data_fifoIN(53) => 
        \Fifo_rd_0_Q_[53]\, Data_fifoIN(52) => \Fifo_rd_0_Q_[52]\, 
        Data_fifoIN(51) => \Fifo_rd_0_Q_[51]\, Data_fifoIN(50)
         => \Fifo_rd_0_Q_[50]\, Data_fifoIN(49) => 
        \Fifo_rd_0_Q_[49]\, Data_fifoIN(48) => \Fifo_rd_0_Q_[48]\, 
        Data_fifoIN(47) => \Fifo_rd_0_Q_[47]\, Data_fifoIN(46)
         => \Fifo_rd_0_Q_[46]\, Data_fifoIN(45) => 
        \Fifo_rd_0_Q_[45]\, Data_fifoIN(44) => \Fifo_rd_0_Q_[44]\, 
        Data_fifoIN(43) => \Fifo_rd_0_Q_[43]\, Data_fifoIN(42)
         => \Fifo_rd_0_Q_[42]\, Data_fifoIN(41) => 
        \Fifo_rd_0_Q_[41]\, Data_fifoIN(40) => \Fifo_rd_0_Q_[40]\, 
        Data_fifoIN(39) => \Fifo_rd_0_Q_[39]\, Data_fifoIN(38)
         => \Fifo_rd_0_Q_[38]\, Data_fifoIN(37) => 
        \Fifo_rd_0_Q_[37]\, Data_fifoIN(36) => \Fifo_rd_0_Q_[36]\, 
        Data_fifoIN(35) => \Fifo_rd_0_Q_[35]\, Data_fifoIN(34)
         => \Fifo_rd_0_Q_[34]\, Data_fifoIN(33) => 
        \Fifo_rd_0_Q_[33]\, Data_fifoIN(32) => \Fifo_rd_0_Q_[32]\, 
        Data_fifoIN(31) => \Fifo_rd_0_Q_[31]\, Data_fifoIN(30)
         => \Fifo_rd_0_Q_[30]\, Data_fifoIN(29) => 
        \Fifo_rd_0_Q_[29]\, Data_fifoIN(28) => \Fifo_rd_0_Q_[28]\, 
        Data_fifoIN(27) => \Fifo_rd_0_Q_[27]\, Data_fifoIN(26)
         => \Fifo_rd_0_Q_[26]\, Data_fifoIN(25) => 
        \Fifo_rd_0_Q_[25]\, Data_fifoIN(24) => \Fifo_rd_0_Q_[24]\, 
        Data_fifoIN(23) => \Fifo_rd_0_Q_[23]\, Data_fifoIN(22)
         => \Fifo_rd_0_Q_[22]\, Data_fifoIN(21) => 
        \Fifo_rd_0_Q_[21]\, Data_fifoIN(20) => \Fifo_rd_0_Q_[20]\, 
        Data_fifoIN(19) => \Fifo_rd_0_Q_[19]\, Data_fifoIN(18)
         => \Fifo_rd_0_Q_[18]\, Data_fifoIN(17) => 
        \Fifo_rd_0_Q_[17]\, Data_fifoIN(16) => \Fifo_rd_0_Q_[16]\, 
        Data_fifoIN(15) => \Fifo_rd_0_Q_[15]\, Data_fifoIN(14)
         => \Fifo_rd_0_Q_[14]\, Data_fifoIN(13) => 
        \Fifo_rd_0_Q_[13]\, Data_fifoIN(12) => \Fifo_rd_0_Q_[12]\, 
        Data_fifoIN(11) => \Fifo_rd_0_Q_[11]\, Data_fifoIN(10)
         => \Fifo_rd_0_Q_[10]\, Data_fifoIN(9) => 
        \Fifo_rd_0_Q_[9]\, Data_fifoIN(8) => \Fifo_rd_0_Q_[8]\, 
        Data_fifoIN(7) => \Fifo_rd_0_Q_[7]\, Data_fifoIN(6) => 
        \Fifo_rd_0_Q_[6]\, Data_fifoIN(5) => \Fifo_rd_0_Q_[5]\, 
        Data_fifoIN(4) => \Fifo_rd_0_Q_[4]\, Data_fifoIN(3) => 
        \Fifo_rd_0_Q_[3]\, Data_fifoIN(2) => \Fifo_rd_0_Q_[2]\, 
        Data_fifoIN(1) => \Fifo_rd_0_Q_[1]\, Data_fifoIN(0) => 
        \Fifo_rd_0_Q_[0]\, Data_AccIn(71) => 
        \My_adder0_3_Sum_[17]\, Data_AccIn(70) => 
        \My_adder0_3_Sum_[16]\, Data_AccIn(69) => 
        \My_adder0_3_Sum_[15]\, Data_AccIn(68) => 
        \My_adder0_3_Sum_[14]\, Data_AccIn(67) => 
        \My_adder0_3_Sum_[13]\, Data_AccIn(66) => 
        \My_adder0_3_Sum_[12]\, Data_AccIn(65) => 
        \My_adder0_3_Sum_[11]\, Data_AccIn(64) => 
        \My_adder0_3_Sum_[10]\, Data_AccIn(63) => 
        \My_adder0_3_Sum_[9]\, Data_AccIn(62) => 
        \My_adder0_3_Sum_[8]\, Data_AccIn(61) => 
        \My_adder0_3_Sum_[7]\, Data_AccIn(60) => 
        \My_adder0_3_Sum_[6]\, Data_AccIn(59) => 
        \My_adder0_3_Sum_[5]\, Data_AccIn(58) => 
        \My_adder0_3_Sum_[4]\, Data_AccIn(57) => 
        \My_adder0_3_Sum_[3]\, Data_AccIn(56) => 
        \My_adder0_3_Sum_[2]\, Data_AccIn(55) => 
        \My_adder0_3_Sum_[1]\, Data_AccIn(54) => 
        \My_adder0_3_Sum_[0]\, Data_AccIn(53) => 
        \My_adder0_2_Sum_[17]\, Data_AccIn(52) => 
        \My_adder0_2_Sum_[16]\, Data_AccIn(51) => 
        \My_adder0_2_Sum_[15]\, Data_AccIn(50) => 
        \My_adder0_2_Sum_[14]\, Data_AccIn(49) => 
        \My_adder0_2_Sum_[13]\, Data_AccIn(48) => 
        \My_adder0_2_Sum_[12]\, Data_AccIn(47) => 
        \My_adder0_2_Sum_[11]\, Data_AccIn(46) => 
        \My_adder0_2_Sum_[10]\, Data_AccIn(45) => 
        \My_adder0_2_Sum_[9]\, Data_AccIn(44) => 
        \My_adder0_2_Sum_[8]\, Data_AccIn(43) => 
        \My_adder0_2_Sum_[7]\, Data_AccIn(42) => 
        \My_adder0_2_Sum_[6]\, Data_AccIn(41) => 
        \My_adder0_2_Sum_[5]\, Data_AccIn(40) => 
        \My_adder0_2_Sum_[4]\, Data_AccIn(39) => 
        \My_adder0_2_Sum_[3]\, Data_AccIn(38) => 
        \My_adder0_2_Sum_[2]\, Data_AccIn(37) => 
        \My_adder0_2_Sum_[1]\, Data_AccIn(36) => 
        \My_adder0_2_Sum_[0]\, Data_AccIn(35) => 
        \My_adder0_1_Sum_[17]\, Data_AccIn(34) => 
        \My_adder0_1_Sum_[16]\, Data_AccIn(33) => 
        \My_adder0_1_Sum_[15]\, Data_AccIn(32) => 
        \My_adder0_1_Sum_[14]\, Data_AccIn(31) => 
        \My_adder0_1_Sum_[13]\, Data_AccIn(30) => 
        \My_adder0_1_Sum_[12]\, Data_AccIn(29) => 
        \My_adder0_1_Sum_[11]\, Data_AccIn(28) => 
        \My_adder0_1_Sum_[10]\, Data_AccIn(27) => 
        \My_adder0_1_Sum_[9]\, Data_AccIn(26) => 
        \My_adder0_1_Sum_[8]\, Data_AccIn(25) => 
        \My_adder0_1_Sum_[7]\, Data_AccIn(24) => 
        \My_adder0_1_Sum_[6]\, Data_AccIn(23) => 
        \My_adder0_1_Sum_[5]\, Data_AccIn(22) => 
        \My_adder0_1_Sum_[4]\, Data_AccIn(21) => 
        \My_adder0_1_Sum_[3]\, Data_AccIn(20) => 
        \My_adder0_1_Sum_[2]\, Data_AccIn(19) => 
        \My_adder0_1_Sum_[1]\, Data_AccIn(18) => 
        \My_adder0_1_Sum_[0]\, Data_AccIn(17) => 
        \My_adder0_0_Sum_[17]\, Data_AccIn(16) => 
        \My_adder0_0_Sum_[16]\, Data_AccIn(15) => 
        \My_adder0_0_Sum_[15]\, Data_AccIn(14) => 
        \My_adder0_0_Sum_[14]\, Data_AccIn(13) => 
        \My_adder0_0_Sum_[13]\, Data_AccIn(12) => 
        \My_adder0_0_Sum_[12]\, Data_AccIn(11) => 
        \My_adder0_0_Sum_[11]\, Data_AccIn(10) => 
        \My_adder0_0_Sum_[10]\, Data_AccIn(9) => 
        \My_adder0_0_Sum_[9]\, Data_AccIn(8) => 
        \My_adder0_0_Sum_[8]\, Data_AccIn(7) => 
        \My_adder0_0_Sum_[7]\, Data_AccIn(6) => 
        \My_adder0_0_Sum_[6]\, Data_AccIn(5) => 
        \My_adder0_0_Sum_[5]\, Data_AccIn(4) => 
        \My_adder0_0_Sum_[4]\, Data_AccIn(3) => 
        \My_adder0_0_Sum_[3]\, Data_AccIn(2) => 
        \My_adder0_0_Sum_[2]\, Data_AccIn(1) => 
        \My_adder0_0_Sum_[1]\, Data_AccIn(0) => 
        \My_adder0_0_Sum_[0]\, Data2ACC(71) => 
        \Main_ctl4SD_0_Data2ACC71to54_[71]\, Data2ACC(70) => 
        \Main_ctl4SD_0_Data2ACC71to54_[70]\, Data2ACC(69) => 
        \Main_ctl4SD_0_Data2ACC71to54_[69]\, Data2ACC(68) => 
        \Main_ctl4SD_0_Data2ACC71to54_[68]\, Data2ACC(67) => 
        \Main_ctl4SD_0_Data2ACC71to54_[67]\, Data2ACC(66) => 
        \Main_ctl4SD_0_Data2ACC71to54_[66]\, Data2ACC(65) => 
        \Main_ctl4SD_0_Data2ACC71to54_[65]\, Data2ACC(64) => 
        \Main_ctl4SD_0_Data2ACC71to54_[64]\, Data2ACC(63) => 
        \Main_ctl4SD_0_Data2ACC71to54_[63]\, Data2ACC(62) => 
        \Main_ctl4SD_0_Data2ACC71to54_[62]\, Data2ACC(61) => 
        \Main_ctl4SD_0_Data2ACC71to54_[61]\, Data2ACC(60) => 
        \Main_ctl4SD_0_Data2ACC71to54_[60]\, Data2ACC(59) => 
        \Main_ctl4SD_0_Data2ACC71to54_[59]\, Data2ACC(58) => 
        \Main_ctl4SD_0_Data2ACC71to54_[58]\, Data2ACC(57) => 
        \Main_ctl4SD_0_Data2ACC71to54_[57]\, Data2ACC(56) => 
        \Main_ctl4SD_0_Data2ACC71to54_[56]\, Data2ACC(55) => 
        \Main_ctl4SD_0_Data2ACC71to54_[55]\, Data2ACC(54) => 
        \Main_ctl4SD_0_Data2ACC71to54_[54]\, Data2ACC(53) => 
        \Main_ctl4SD_0_Data2ACC53to36_[53]\, Data2ACC(52) => 
        \Main_ctl4SD_0_Data2ACC53to36_[52]\, Data2ACC(51) => 
        \Main_ctl4SD_0_Data2ACC53to36_[51]\, Data2ACC(50) => 
        \Main_ctl4SD_0_Data2ACC53to36_[50]\, Data2ACC(49) => 
        \Main_ctl4SD_0_Data2ACC53to36_[49]\, Data2ACC(48) => 
        \Main_ctl4SD_0_Data2ACC53to36_[48]\, Data2ACC(47) => 
        \Main_ctl4SD_0_Data2ACC53to36_[47]\, Data2ACC(46) => 
        \Main_ctl4SD_0_Data2ACC53to36_[46]\, Data2ACC(45) => 
        \Main_ctl4SD_0_Data2ACC53to36_[45]\, Data2ACC(44) => 
        \Main_ctl4SD_0_Data2ACC53to36_[44]\, Data2ACC(43) => 
        \Main_ctl4SD_0_Data2ACC53to36_[43]\, Data2ACC(42) => 
        \Main_ctl4SD_0_Data2ACC53to36_[42]\, Data2ACC(41) => 
        \Main_ctl4SD_0_Data2ACC53to36_[41]\, Data2ACC(40) => 
        \Main_ctl4SD_0_Data2ACC53to36_[40]\, Data2ACC(39) => 
        \Main_ctl4SD_0_Data2ACC53to36_[39]\, Data2ACC(38) => 
        \Main_ctl4SD_0_Data2ACC53to36_[38]\, Data2ACC(37) => 
        \Main_ctl4SD_0_Data2ACC53to36_[37]\, Data2ACC(36) => 
        \Main_ctl4SD_0_Data2ACC53to36_[36]\, Data2ACC(35) => 
        \Main_ctl4SD_0_Data2ACC35to18_[35]\, Data2ACC(34) => 
        \Main_ctl4SD_0_Data2ACC35to18_[34]\, Data2ACC(33) => 
        \Main_ctl4SD_0_Data2ACC35to18_[33]\, Data2ACC(32) => 
        \Main_ctl4SD_0_Data2ACC35to18_[32]\, Data2ACC(31) => 
        \Main_ctl4SD_0_Data2ACC35to18_[31]\, Data2ACC(30) => 
        \Main_ctl4SD_0_Data2ACC35to18_[30]\, Data2ACC(29) => 
        \Main_ctl4SD_0_Data2ACC35to18_[29]\, Data2ACC(28) => 
        \Main_ctl4SD_0_Data2ACC35to18_[28]\, Data2ACC(27) => 
        \Main_ctl4SD_0_Data2ACC35to18_[27]\, Data2ACC(26) => 
        \Main_ctl4SD_0_Data2ACC35to18_[26]\, Data2ACC(25) => 
        \Main_ctl4SD_0_Data2ACC35to18_[25]\, Data2ACC(24) => 
        \Main_ctl4SD_0_Data2ACC35to18_[24]\, Data2ACC(23) => 
        \Main_ctl4SD_0_Data2ACC35to18_[23]\, Data2ACC(22) => 
        \Main_ctl4SD_0_Data2ACC35to18_[22]\, Data2ACC(21) => 
        \Main_ctl4SD_0_Data2ACC35to18_[21]\, Data2ACC(20) => 
        \Main_ctl4SD_0_Data2ACC35to18_[20]\, Data2ACC(19) => 
        \Main_ctl4SD_0_Data2ACC35to18_[19]\, Data2ACC(18) => 
        \Main_ctl4SD_0_Data2ACC35to18_[18]\, Data2ACC(17) => 
        \Main_ctl4SD_0_Data2ACC17to0_[17]\, Data2ACC(16) => 
        \Main_ctl4SD_0_Data2ACC17to0_[16]\, Data2ACC(15) => 
        \Main_ctl4SD_0_Data2ACC17to0_[15]\, Data2ACC(14) => 
        \Main_ctl4SD_0_Data2ACC17to0_[14]\, Data2ACC(13) => 
        \Main_ctl4SD_0_Data2ACC17to0_[13]\, Data2ACC(12) => 
        \Main_ctl4SD_0_Data2ACC17to0_[12]\, Data2ACC(11) => 
        \Main_ctl4SD_0_Data2ACC17to0_[11]\, Data2ACC(10) => 
        \Main_ctl4SD_0_Data2ACC17to0_[10]\, Data2ACC(9) => 
        \Main_ctl4SD_0_Data2ACC17to0_[9]\, Data2ACC(8) => 
        \Main_ctl4SD_0_Data2ACC17to0_[8]\, Data2ACC(7) => 
        \Main_ctl4SD_0_Data2ACC17to0_[7]\, Data2ACC(6) => 
        \Main_ctl4SD_0_Data2ACC17to0_[6]\, Data2ACC(5) => 
        \Main_ctl4SD_0_Data2ACC17to0_[5]\, Data2ACC(4) => 
        \Main_ctl4SD_0_Data2ACC17to0_[4]\, Data2ACC(3) => 
        \Main_ctl4SD_0_Data2ACC17to0_[3]\, Data2ACC(2) => 
        \Main_ctl4SD_0_Data2ACC17to0_[2]\, Data2ACC(1) => 
        \Main_ctl4SD_0_Data2ACC17to0_[1]\, Data2ACC(0) => 
        \Main_ctl4SD_0_Data2ACC17to0_[0]\, Data2Fifo(71) => 
        \Main_ctl4SD_0_Data2Fifo_[71]\, Data2Fifo(70) => 
        \Main_ctl4SD_0_Data2Fifo_[70]\, Data2Fifo(69) => 
        \Main_ctl4SD_0_Data2Fifo_[69]\, Data2Fifo(68) => 
        \Main_ctl4SD_0_Data2Fifo_[68]\, Data2Fifo(67) => 
        \Main_ctl4SD_0_Data2Fifo_[67]\, Data2Fifo(66) => 
        \Main_ctl4SD_0_Data2Fifo_[66]\, Data2Fifo(65) => 
        \Main_ctl4SD_0_Data2Fifo_[65]\, Data2Fifo(64) => 
        \Main_ctl4SD_0_Data2Fifo_[64]\, Data2Fifo(63) => 
        \Main_ctl4SD_0_Data2Fifo_[63]\, Data2Fifo(62) => 
        \Main_ctl4SD_0_Data2Fifo_[62]\, Data2Fifo(61) => 
        \Main_ctl4SD_0_Data2Fifo_[61]\, Data2Fifo(60) => 
        \Main_ctl4SD_0_Data2Fifo_[60]\, Data2Fifo(59) => 
        \Main_ctl4SD_0_Data2Fifo_[59]\, Data2Fifo(58) => 
        \Main_ctl4SD_0_Data2Fifo_[58]\, Data2Fifo(57) => 
        \Main_ctl4SD_0_Data2Fifo_[57]\, Data2Fifo(56) => 
        \Main_ctl4SD_0_Data2Fifo_[56]\, Data2Fifo(55) => 
        \Main_ctl4SD_0_Data2Fifo_[55]\, Data2Fifo(54) => 
        \Main_ctl4SD_0_Data2Fifo_[54]\, Data2Fifo(53) => 
        \Main_ctl4SD_0_Data2Fifo_[53]\, Data2Fifo(52) => 
        \Main_ctl4SD_0_Data2Fifo_[52]\, Data2Fifo(51) => 
        \Main_ctl4SD_0_Data2Fifo_[51]\, Data2Fifo(50) => 
        \Main_ctl4SD_0_Data2Fifo_[50]\, Data2Fifo(49) => 
        \Main_ctl4SD_0_Data2Fifo_[49]\, Data2Fifo(48) => 
        \Main_ctl4SD_0_Data2Fifo_[48]\, Data2Fifo(47) => 
        \Main_ctl4SD_0_Data2Fifo_[47]\, Data2Fifo(46) => 
        \Main_ctl4SD_0_Data2Fifo_[46]\, Data2Fifo(45) => 
        \Main_ctl4SD_0_Data2Fifo_[45]\, Data2Fifo(44) => 
        \Main_ctl4SD_0_Data2Fifo_[44]\, Data2Fifo(43) => 
        \Main_ctl4SD_0_Data2Fifo_[43]\, Data2Fifo(42) => 
        \Main_ctl4SD_0_Data2Fifo_[42]\, Data2Fifo(41) => 
        \Main_ctl4SD_0_Data2Fifo_[41]\, Data2Fifo(40) => 
        \Main_ctl4SD_0_Data2Fifo_[40]\, Data2Fifo(39) => 
        \Main_ctl4SD_0_Data2Fifo_[39]\, Data2Fifo(38) => 
        \Main_ctl4SD_0_Data2Fifo_[38]\, Data2Fifo(37) => 
        \Main_ctl4SD_0_Data2Fifo_[37]\, Data2Fifo(36) => 
        \Main_ctl4SD_0_Data2Fifo_[36]\, Data2Fifo(35) => 
        \Main_ctl4SD_0_Data2Fifo_[35]\, Data2Fifo(34) => 
        \Main_ctl4SD_0_Data2Fifo_[34]\, Data2Fifo(33) => 
        \Main_ctl4SD_0_Data2Fifo_[33]\, Data2Fifo(32) => 
        \Main_ctl4SD_0_Data2Fifo_[32]\, Data2Fifo(31) => 
        \Main_ctl4SD_0_Data2Fifo_[31]\, Data2Fifo(30) => 
        \Main_ctl4SD_0_Data2Fifo_[30]\, Data2Fifo(29) => 
        \Main_ctl4SD_0_Data2Fifo_[29]\, Data2Fifo(28) => 
        \Main_ctl4SD_0_Data2Fifo_[28]\, Data2Fifo(27) => 
        \Main_ctl4SD_0_Data2Fifo_[27]\, Data2Fifo(26) => 
        \Main_ctl4SD_0_Data2Fifo_[26]\, Data2Fifo(25) => 
        \Main_ctl4SD_0_Data2Fifo_[25]\, Data2Fifo(24) => 
        \Main_ctl4SD_0_Data2Fifo_[24]\, Data2Fifo(23) => 
        \Main_ctl4SD_0_Data2Fifo_[23]\, Data2Fifo(22) => 
        \Main_ctl4SD_0_Data2Fifo_[22]\, Data2Fifo(21) => 
        \Main_ctl4SD_0_Data2Fifo_[21]\, Data2Fifo(20) => 
        \Main_ctl4SD_0_Data2Fifo_[20]\, Data2Fifo(19) => 
        \Main_ctl4SD_0_Data2Fifo_[19]\, Data2Fifo(18) => 
        \Main_ctl4SD_0_Data2Fifo_[18]\, Data2Fifo(17) => 
        \Main_ctl4SD_0_Data2Fifo_[17]\, Data2Fifo(16) => 
        \Main_ctl4SD_0_Data2Fifo_[16]\, Data2Fifo(15) => 
        \Main_ctl4SD_0_Data2Fifo_[15]\, Data2Fifo(14) => 
        \Main_ctl4SD_0_Data2Fifo_[14]\, Data2Fifo(13) => 
        \Main_ctl4SD_0_Data2Fifo_[13]\, Data2Fifo(12) => 
        \Main_ctl4SD_0_Data2Fifo_[12]\, Data2Fifo(11) => 
        \Main_ctl4SD_0_Data2Fifo_[11]\, Data2Fifo(10) => 
        \Main_ctl4SD_0_Data2Fifo_[10]\, Data2Fifo(9) => 
        \Main_ctl4SD_0_Data2Fifo_[9]\, Data2Fifo(8) => 
        \Main_ctl4SD_0_Data2Fifo_[8]\, Data2Fifo(7) => 
        \Main_ctl4SD_0_Data2Fifo_[7]\, Data2Fifo(6) => 
        \Main_ctl4SD_0_Data2Fifo_[6]\, Data2Fifo(5) => 
        \Main_ctl4SD_0_Data2Fifo_[5]\, Data2Fifo(4) => 
        \Main_ctl4SD_0_Data2Fifo_[4]\, Data2Fifo(3) => 
        \Main_ctl4SD_0_Data2Fifo_[3]\, Data2Fifo(2) => 
        \Main_ctl4SD_0_Data2Fifo_[2]\, Data2Fifo(1) => 
        \Main_ctl4SD_0_Data2Fifo_[1]\, Data2Fifo(0) => 
        \Main_ctl4SD_0_Data2Fifo_[0]\, LVDS_data(71) => 
        \Main_ctl4SD_0_LVDS_data_[71]\, LVDS_data(70) => 
        \Main_ctl4SD_0_LVDS_data_[70]\, LVDS_data(69) => 
        \Main_ctl4SD_0_LVDS_data_[69]\, LVDS_data(68) => 
        \Main_ctl4SD_0_LVDS_data_[68]\, LVDS_data(67) => 
        \Main_ctl4SD_0_LVDS_data_[67]\, LVDS_data(66) => 
        \Main_ctl4SD_0_LVDS_data_[66]\, LVDS_data(65) => 
        \Main_ctl4SD_0_LVDS_data_[65]\, LVDS_data(64) => 
        \Main_ctl4SD_0_LVDS_data_[64]\, LVDS_data(63) => 
        \Main_ctl4SD_0_LVDS_data_[63]\, LVDS_data(62) => 
        \Main_ctl4SD_0_LVDS_data_[62]\, LVDS_data(61) => 
        \Main_ctl4SD_0_LVDS_data_[61]\, LVDS_data(60) => 
        \Main_ctl4SD_0_LVDS_data_[60]\, LVDS_data(59) => 
        \Main_ctl4SD_0_LVDS_data_[59]\, LVDS_data(58) => 
        \Main_ctl4SD_0_LVDS_data_[58]\, LVDS_data(57) => 
        \Main_ctl4SD_0_LVDS_data_[57]\, LVDS_data(56) => 
        \Main_ctl4SD_0_LVDS_data_[56]\, LVDS_data(55) => 
        \Main_ctl4SD_0_LVDS_data_[55]\, LVDS_data(54) => 
        \Main_ctl4SD_0_LVDS_data_[54]\, LVDS_data(53) => 
        \Main_ctl4SD_0_LVDS_data_[53]\, LVDS_data(52) => 
        \Main_ctl4SD_0_LVDS_data_[52]\, LVDS_data(51) => 
        \Main_ctl4SD_0_LVDS_data_[51]\, LVDS_data(50) => 
        \Main_ctl4SD_0_LVDS_data_[50]\, LVDS_data(49) => 
        \Main_ctl4SD_0_LVDS_data_[49]\, LVDS_data(48) => 
        \Main_ctl4SD_0_LVDS_data_[48]\, LVDS_data(47) => 
        \Main_ctl4SD_0_LVDS_data_[47]\, LVDS_data(46) => 
        \Main_ctl4SD_0_LVDS_data_[46]\, LVDS_data(45) => 
        \Main_ctl4SD_0_LVDS_data_[45]\, LVDS_data(44) => 
        \Main_ctl4SD_0_LVDS_data_[44]\, LVDS_data(43) => 
        \Main_ctl4SD_0_LVDS_data_[43]\, LVDS_data(42) => 
        \Main_ctl4SD_0_LVDS_data_[42]\, LVDS_data(41) => 
        \Main_ctl4SD_0_LVDS_data_[41]\, LVDS_data(40) => 
        \Main_ctl4SD_0_LVDS_data_[40]\, LVDS_data(39) => 
        \Main_ctl4SD_0_LVDS_data_[39]\, LVDS_data(38) => 
        \Main_ctl4SD_0_LVDS_data_[38]\, LVDS_data(37) => 
        \Main_ctl4SD_0_LVDS_data_[37]\, LVDS_data(36) => 
        \Main_ctl4SD_0_LVDS_data_[36]\, LVDS_data(35) => 
        \Main_ctl4SD_0_LVDS_data_[35]\, LVDS_data(34) => 
        \Main_ctl4SD_0_LVDS_data_[34]\, LVDS_data(33) => 
        \Main_ctl4SD_0_LVDS_data_[33]\, LVDS_data(32) => 
        \Main_ctl4SD_0_LVDS_data_[32]\, LVDS_data(31) => 
        \Main_ctl4SD_0_LVDS_data_[31]\, LVDS_data(30) => 
        \Main_ctl4SD_0_LVDS_data_[30]\, LVDS_data(29) => 
        \Main_ctl4SD_0_LVDS_data_[29]\, LVDS_data(28) => 
        \Main_ctl4SD_0_LVDS_data_[28]\, LVDS_data(27) => 
        \Main_ctl4SD_0_LVDS_data_[27]\, LVDS_data(26) => 
        \Main_ctl4SD_0_LVDS_data_[26]\, LVDS_data(25) => 
        \Main_ctl4SD_0_LVDS_data_[25]\, LVDS_data(24) => 
        \Main_ctl4SD_0_LVDS_data_[24]\, LVDS_data(23) => 
        \Main_ctl4SD_0_LVDS_data_[23]\, LVDS_data(22) => 
        \Main_ctl4SD_0_LVDS_data_[22]\, LVDS_data(21) => 
        \Main_ctl4SD_0_LVDS_data_[21]\, LVDS_data(20) => 
        \Main_ctl4SD_0_LVDS_data_[20]\, LVDS_data(19) => 
        \Main_ctl4SD_0_LVDS_data_[19]\, LVDS_data(18) => 
        \Main_ctl4SD_0_LVDS_data_[18]\, LVDS_data(17) => 
        \Main_ctl4SD_0_LVDS_data_[17]\, LVDS_data(16) => 
        \Main_ctl4SD_0_LVDS_data_[16]\, LVDS_data(15) => 
        \Main_ctl4SD_0_LVDS_data_[15]\, LVDS_data(14) => 
        \Main_ctl4SD_0_LVDS_data_[14]\, LVDS_data(13) => 
        \Main_ctl4SD_0_LVDS_data_[13]\, LVDS_data(12) => 
        \Main_ctl4SD_0_LVDS_data_[12]\, LVDS_data(11) => 
        \Main_ctl4SD_0_LVDS_data_[11]\, LVDS_data(10) => 
        \Main_ctl4SD_0_LVDS_data_[10]\, LVDS_data(9) => 
        \Main_ctl4SD_0_LVDS_data_[9]\, LVDS_data(8) => 
        \Main_ctl4SD_0_LVDS_data_[8]\, LVDS_data(7) => 
        \Main_ctl4SD_0_LVDS_data_[7]\, LVDS_data(6) => 
        \Main_ctl4SD_0_LVDS_data_[6]\, LVDS_data(5) => 
        \Main_ctl4SD_0_LVDS_data_[5]\, LVDS_data(4) => 
        \Main_ctl4SD_0_LVDS_data_[4]\, LVDS_data(3) => 
        \Main_ctl4SD_0_LVDS_data_[3]\, LVDS_data(2) => 
        \Main_ctl4SD_0_LVDS_data_[2]\, LVDS_data(1) => 
        \Main_ctl4SD_0_LVDS_data_[1]\, LVDS_data(0) => 
        \Main_ctl4SD_0_LVDS_data_[0]\);
    
    Fifo_rd_0 : Fifo_rd
      port map(WE => Sdram_cmd_0_RFifo_we, RE => 
        Main_ctl4SD_0_fifo_rd, CLK => PLL_Test1_0_Sys_66M_Clk, 
        FULL => OPEN, EMPTY => OPEN, RESET => 
        Main_ctl4SD_0_fifo_rst_n, AFULL => Fifo_rd_0_AFULL, 
        DATA(71) => \Sdram_data_0_Sys_dataOut_[71]\, DATA(70) => 
        \Sdram_data_0_Sys_dataOut_[70]\, DATA(69) => 
        \Sdram_data_0_Sys_dataOut_[69]\, DATA(68) => 
        \Sdram_data_0_Sys_dataOut_[68]\, DATA(67) => 
        \Sdram_data_0_Sys_dataOut_[67]\, DATA(66) => 
        \Sdram_data_0_Sys_dataOut_[66]\, DATA(65) => 
        \Sdram_data_0_Sys_dataOut_[65]\, DATA(64) => 
        \Sdram_data_0_Sys_dataOut_[64]\, DATA(63) => 
        \Sdram_data_0_Sys_dataOut_[63]\, DATA(62) => 
        \Sdram_data_0_Sys_dataOut_[62]\, DATA(61) => 
        \Sdram_data_0_Sys_dataOut_[61]\, DATA(60) => 
        \Sdram_data_0_Sys_dataOut_[60]\, DATA(59) => 
        \Sdram_data_0_Sys_dataOut_[59]\, DATA(58) => 
        \Sdram_data_0_Sys_dataOut_[58]\, DATA(57) => 
        \Sdram_data_0_Sys_dataOut_[57]\, DATA(56) => 
        \Sdram_data_0_Sys_dataOut_[56]\, DATA(55) => 
        \Sdram_data_0_Sys_dataOut_[55]\, DATA(54) => 
        \Sdram_data_0_Sys_dataOut_[54]\, DATA(53) => 
        \Sdram_data_0_Sys_dataOut_[53]\, DATA(52) => 
        \Sdram_data_0_Sys_dataOut_[52]\, DATA(51) => 
        \Sdram_data_0_Sys_dataOut_[51]\, DATA(50) => 
        \Sdram_data_0_Sys_dataOut_[50]\, DATA(49) => 
        \Sdram_data_0_Sys_dataOut_[49]\, DATA(48) => 
        \Sdram_data_0_Sys_dataOut_[48]\, DATA(47) => 
        \Sdram_data_0_Sys_dataOut_[47]\, DATA(46) => 
        \Sdram_data_0_Sys_dataOut_[46]\, DATA(45) => 
        \Sdram_data_0_Sys_dataOut_[45]\, DATA(44) => 
        \Sdram_data_0_Sys_dataOut_[44]\, DATA(43) => 
        \Sdram_data_0_Sys_dataOut_[43]\, DATA(42) => 
        \Sdram_data_0_Sys_dataOut_[42]\, DATA(41) => 
        \Sdram_data_0_Sys_dataOut_[41]\, DATA(40) => 
        \Sdram_data_0_Sys_dataOut_[40]\, DATA(39) => 
        \Sdram_data_0_Sys_dataOut_[39]\, DATA(38) => 
        \Sdram_data_0_Sys_dataOut_[38]\, DATA(37) => 
        \Sdram_data_0_Sys_dataOut_[37]\, DATA(36) => 
        \Sdram_data_0_Sys_dataOut_[36]\, DATA(35) => 
        \Sdram_data_0_Sys_dataOut_[35]\, DATA(34) => 
        \Sdram_data_0_Sys_dataOut_[34]\, DATA(33) => 
        \Sdram_data_0_Sys_dataOut_[33]\, DATA(32) => 
        \Sdram_data_0_Sys_dataOut_[32]\, DATA(31) => 
        \Sdram_data_0_Sys_dataOut_[31]\, DATA(30) => 
        \Sdram_data_0_Sys_dataOut_[30]\, DATA(29) => 
        \Sdram_data_0_Sys_dataOut_[29]\, DATA(28) => 
        \Sdram_data_0_Sys_dataOut_[28]\, DATA(27) => 
        \Sdram_data_0_Sys_dataOut_[27]\, DATA(26) => 
        \Sdram_data_0_Sys_dataOut_[26]\, DATA(25) => 
        \Sdram_data_0_Sys_dataOut_[25]\, DATA(24) => 
        \Sdram_data_0_Sys_dataOut_[24]\, DATA(23) => 
        \Sdram_data_0_Sys_dataOut_[23]\, DATA(22) => 
        \Sdram_data_0_Sys_dataOut_[22]\, DATA(21) => 
        \Sdram_data_0_Sys_dataOut_[21]\, DATA(20) => 
        \Sdram_data_0_Sys_dataOut_[20]\, DATA(19) => 
        \Sdram_data_0_Sys_dataOut_[19]\, DATA(18) => 
        \Sdram_data_0_Sys_dataOut_[18]\, DATA(17) => 
        \Sdram_data_0_Sys_dataOut_[17]\, DATA(16) => 
        \Sdram_data_0_Sys_dataOut_[16]\, DATA(15) => 
        \Sdram_data_0_Sys_dataOut_[15]\, DATA(14) => 
        \Sdram_data_0_Sys_dataOut_[14]\, DATA(13) => 
        \Sdram_data_0_Sys_dataOut_[13]\, DATA(12) => 
        \Sdram_data_0_Sys_dataOut_[12]\, DATA(11) => 
        \Sdram_data_0_Sys_dataOut_[11]\, DATA(10) => 
        \Sdram_data_0_Sys_dataOut_[10]\, DATA(9) => 
        \Sdram_data_0_Sys_dataOut_[9]\, DATA(8) => 
        \Sdram_data_0_Sys_dataOut_[8]\, DATA(7) => 
        \Sdram_data_0_Sys_dataOut_[7]\, DATA(6) => 
        \Sdram_data_0_Sys_dataOut_[6]\, DATA(5) => 
        \Sdram_data_0_Sys_dataOut_[5]\, DATA(4) => 
        \Sdram_data_0_Sys_dataOut_[4]\, DATA(3) => 
        \Sdram_data_0_Sys_dataOut_[3]\, DATA(2) => 
        \Sdram_data_0_Sys_dataOut_[2]\, DATA(1) => 
        \Sdram_data_0_Sys_dataOut_[1]\, DATA(0) => 
        \Sdram_data_0_Sys_dataOut_[0]\, Q(71) => 
        \Fifo_rd_0_Q_[71]\, Q(70) => \Fifo_rd_0_Q_[70]\, Q(69)
         => \Fifo_rd_0_Q_[69]\, Q(68) => \Fifo_rd_0_Q_[68]\, 
        Q(67) => \Fifo_rd_0_Q_[67]\, Q(66) => \Fifo_rd_0_Q_[66]\, 
        Q(65) => \Fifo_rd_0_Q_[65]\, Q(64) => \Fifo_rd_0_Q_[64]\, 
        Q(63) => \Fifo_rd_0_Q_[63]\, Q(62) => \Fifo_rd_0_Q_[62]\, 
        Q(61) => \Fifo_rd_0_Q_[61]\, Q(60) => \Fifo_rd_0_Q_[60]\, 
        Q(59) => \Fifo_rd_0_Q_[59]\, Q(58) => \Fifo_rd_0_Q_[58]\, 
        Q(57) => \Fifo_rd_0_Q_[57]\, Q(56) => \Fifo_rd_0_Q_[56]\, 
        Q(55) => \Fifo_rd_0_Q_[55]\, Q(54) => \Fifo_rd_0_Q_[54]\, 
        Q(53) => \Fifo_rd_0_Q_[53]\, Q(52) => \Fifo_rd_0_Q_[52]\, 
        Q(51) => \Fifo_rd_0_Q_[51]\, Q(50) => \Fifo_rd_0_Q_[50]\, 
        Q(49) => \Fifo_rd_0_Q_[49]\, Q(48) => \Fifo_rd_0_Q_[48]\, 
        Q(47) => \Fifo_rd_0_Q_[47]\, Q(46) => \Fifo_rd_0_Q_[46]\, 
        Q(45) => \Fifo_rd_0_Q_[45]\, Q(44) => \Fifo_rd_0_Q_[44]\, 
        Q(43) => \Fifo_rd_0_Q_[43]\, Q(42) => \Fifo_rd_0_Q_[42]\, 
        Q(41) => \Fifo_rd_0_Q_[41]\, Q(40) => \Fifo_rd_0_Q_[40]\, 
        Q(39) => \Fifo_rd_0_Q_[39]\, Q(38) => \Fifo_rd_0_Q_[38]\, 
        Q(37) => \Fifo_rd_0_Q_[37]\, Q(36) => \Fifo_rd_0_Q_[36]\, 
        Q(35) => \Fifo_rd_0_Q_[35]\, Q(34) => \Fifo_rd_0_Q_[34]\, 
        Q(33) => \Fifo_rd_0_Q_[33]\, Q(32) => \Fifo_rd_0_Q_[32]\, 
        Q(31) => \Fifo_rd_0_Q_[31]\, Q(30) => \Fifo_rd_0_Q_[30]\, 
        Q(29) => \Fifo_rd_0_Q_[29]\, Q(28) => \Fifo_rd_0_Q_[28]\, 
        Q(27) => \Fifo_rd_0_Q_[27]\, Q(26) => \Fifo_rd_0_Q_[26]\, 
        Q(25) => \Fifo_rd_0_Q_[25]\, Q(24) => \Fifo_rd_0_Q_[24]\, 
        Q(23) => \Fifo_rd_0_Q_[23]\, Q(22) => \Fifo_rd_0_Q_[22]\, 
        Q(21) => \Fifo_rd_0_Q_[21]\, Q(20) => \Fifo_rd_0_Q_[20]\, 
        Q(19) => \Fifo_rd_0_Q_[19]\, Q(18) => \Fifo_rd_0_Q_[18]\, 
        Q(17) => \Fifo_rd_0_Q_[17]\, Q(16) => \Fifo_rd_0_Q_[16]\, 
        Q(15) => \Fifo_rd_0_Q_[15]\, Q(14) => \Fifo_rd_0_Q_[14]\, 
        Q(13) => \Fifo_rd_0_Q_[13]\, Q(12) => \Fifo_rd_0_Q_[12]\, 
        Q(11) => \Fifo_rd_0_Q_[11]\, Q(10) => \Fifo_rd_0_Q_[10]\, 
        Q(9) => \Fifo_rd_0_Q_[9]\, Q(8) => \Fifo_rd_0_Q_[8]\, 
        Q(7) => \Fifo_rd_0_Q_[7]\, Q(6) => \Fifo_rd_0_Q_[6]\, 
        Q(5) => \Fifo_rd_0_Q_[5]\, Q(4) => \Fifo_rd_0_Q_[4]\, 
        Q(3) => \Fifo_rd_0_Q_[3]\, Q(2) => \Fifo_rd_0_Q_[2]\, 
        Q(1) => \Fifo_rd_0_Q_[1]\, Q(0) => \Fifo_rd_0_Q_[0]\);
    
    Sdram_ctl_v2_0 : entity work.Sdram_ctl_v2
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, SysRst_n => 
        PLL_Test1_0_SysRst_O, Fifo_RAfull => Fifo_rd_0_AFULL, 
        Fifo_Wafull => Fifo_wr_0_AFULL, SD_iniOK => 
        Sdram_ini_0_Sd_iniOK, SD_WrOK => SDRAM_wr_0_SD_WrOK, 
        SD_RdOK => SDram_rd_0_SD_RdOK, SD_refOK => 
        SDRAM_Ref_0_SD_refOK, LVDS_En => CMOS_DrvX_0_LVDSen, 
        SDRAM_En => CMOS_DrvX_0_SDramEn, SD_pdEN => 
        Sdram_ctl_v2_0_SD_pdEN, SD_iniEn => 
        Sdram_ctl_v2_0_SD_iniEn, SD_RefEn => 
        Sdram_ctl_v2_0_SD_RefEn, SD_wrEn => 
        Sdram_ctl_v2_0_SD_wrEn, SD_rdEn => Sdram_ctl_v2_0_SD_rdEn, 
        SD_rdEN_noact => Sdram_ctl_v2_0_SD_rdEN_noact, ClkEN => 
        Sdram_ctl_v2_0_ClkEN);
    
    COREUART_0 : smart_top_COREUART_0_COREUART
      generic map(BAUD_VAL_FRCTN_EN => 0, FAMILY => 15,
         RX_FIFO => 0, RX_LEGACY_MODE => 0, TX_FIFO => 0)

      port map(BIT8 => VCC_net, CLK => PLL_Test1_0_Sys_66M_Clk, 
        CSN => GND_net, ODD_N_EVEN => GND_net, OEN => 
        Uart_ctl_0_OEn, OVERFLOW => OPEN, PARITY_EN => GND_net, 
        PARITY_ERR => OPEN, RESET_N => PLL_Test1_0_SysRst_O, RX
         => RX, RXRDY => COREUART_0_RXRDY, TX => TX, TXRDY => 
        COREUART_0_TXRDY, WEN => Uart_ctl_0_WEn, FRAMING_ERR => 
        OPEN, BAUD_VAL(12) => \Uart_ctl_0_BaudValue_[12]\, 
        BAUD_VAL(11) => \Uart_ctl_0_BaudValue_[11]\, BAUD_VAL(10)
         => \Uart_ctl_0_BaudValue_[10]\, BAUD_VAL(9) => 
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
    
    SDRAM_Ref_0 : entity work.SDRAM_Ref
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, rst_n => 
        PLL_Test1_0_SysRst_O, SD_refEN => Sdram_ctl_v2_0_SD_RefEn, 
        sd_pdEN => Sdram_ctl_v2_0_SD_pdEN, SD_iniOK => 
        Sdram_ini_0_Sd_iniOK, RefEn => Counter_ref_0_RefEn, 
        SD_refOK => SDRAM_Ref_0_SD_refOK, Ref_state(2) => 
        \SDRAM_Ref_0_Ref_state_[2]\, Ref_state(1) => 
        \SDRAM_Ref_0_Ref_state_[1]\, Ref_state(0) => 
        \SDRAM_Ref_0_Ref_state_[0]\);
    
    Sdram_data_0 : entity work.Sdram_data
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, Sysrst_n => 
        PLL_Test1_0_SysRst_O, rd_state(2) => 
        \SDram_rd_0_rd_state_[2]\, rd_state(1) => 
        \SDram_rd_0_rd_state_[1]\, rd_state(0) => 
        \SDram_rd_0_rd_state_[0]\, wr_state(2) => 
        \SDRAM_wr_0_wr_state_[2]\, wr_state(1) => 
        \SDRAM_wr_0_wr_state_[1]\, wr_state(0) => 
        \SDRAM_wr_0_wr_state_[0]\, Sys_dataIn(71) => 
        \Fifo_wr_0_Q_[71]\, Sys_dataIn(70) => \Fifo_wr_0_Q_[70]\, 
        Sys_dataIn(69) => \Fifo_wr_0_Q_[69]\, Sys_dataIn(68) => 
        \Fifo_wr_0_Q_[68]\, Sys_dataIn(67) => \Fifo_wr_0_Q_[67]\, 
        Sys_dataIn(66) => \Fifo_wr_0_Q_[66]\, Sys_dataIn(65) => 
        \Fifo_wr_0_Q_[65]\, Sys_dataIn(64) => \Fifo_wr_0_Q_[64]\, 
        Sys_dataIn(63) => \Fifo_wr_0_Q_[63]\, Sys_dataIn(62) => 
        \Fifo_wr_0_Q_[62]\, Sys_dataIn(61) => \Fifo_wr_0_Q_[61]\, 
        Sys_dataIn(60) => \Fifo_wr_0_Q_[60]\, Sys_dataIn(59) => 
        \Fifo_wr_0_Q_[59]\, Sys_dataIn(58) => \Fifo_wr_0_Q_[58]\, 
        Sys_dataIn(57) => \Fifo_wr_0_Q_[57]\, Sys_dataIn(56) => 
        \Fifo_wr_0_Q_[56]\, Sys_dataIn(55) => \Fifo_wr_0_Q_[55]\, 
        Sys_dataIn(54) => \Fifo_wr_0_Q_[54]\, Sys_dataIn(53) => 
        \Fifo_wr_0_Q_[53]\, Sys_dataIn(52) => \Fifo_wr_0_Q_[52]\, 
        Sys_dataIn(51) => \Fifo_wr_0_Q_[51]\, Sys_dataIn(50) => 
        \Fifo_wr_0_Q_[50]\, Sys_dataIn(49) => \Fifo_wr_0_Q_[49]\, 
        Sys_dataIn(48) => \Fifo_wr_0_Q_[48]\, Sys_dataIn(47) => 
        \Fifo_wr_0_Q_[47]\, Sys_dataIn(46) => \Fifo_wr_0_Q_[46]\, 
        Sys_dataIn(45) => \Fifo_wr_0_Q_[45]\, Sys_dataIn(44) => 
        \Fifo_wr_0_Q_[44]\, Sys_dataIn(43) => \Fifo_wr_0_Q_[43]\, 
        Sys_dataIn(42) => \Fifo_wr_0_Q_[42]\, Sys_dataIn(41) => 
        \Fifo_wr_0_Q_[41]\, Sys_dataIn(40) => \Fifo_wr_0_Q_[40]\, 
        Sys_dataIn(39) => \Fifo_wr_0_Q_[39]\, Sys_dataIn(38) => 
        \Fifo_wr_0_Q_[38]\, Sys_dataIn(37) => \Fifo_wr_0_Q_[37]\, 
        Sys_dataIn(36) => \Fifo_wr_0_Q_[36]\, Sys_dataIn(35) => 
        \Fifo_wr_0_Q_[35]\, Sys_dataIn(34) => \Fifo_wr_0_Q_[34]\, 
        Sys_dataIn(33) => \Fifo_wr_0_Q_[33]\, Sys_dataIn(32) => 
        \Fifo_wr_0_Q_[32]\, Sys_dataIn(31) => \Fifo_wr_0_Q_[31]\, 
        Sys_dataIn(30) => \Fifo_wr_0_Q_[30]\, Sys_dataIn(29) => 
        \Fifo_wr_0_Q_[29]\, Sys_dataIn(28) => \Fifo_wr_0_Q_[28]\, 
        Sys_dataIn(27) => \Fifo_wr_0_Q_[27]\, Sys_dataIn(26) => 
        \Fifo_wr_0_Q_[26]\, Sys_dataIn(25) => \Fifo_wr_0_Q_[25]\, 
        Sys_dataIn(24) => \Fifo_wr_0_Q_[24]\, Sys_dataIn(23) => 
        \Fifo_wr_0_Q_[23]\, Sys_dataIn(22) => \Fifo_wr_0_Q_[22]\, 
        Sys_dataIn(21) => \Fifo_wr_0_Q_[21]\, Sys_dataIn(20) => 
        \Fifo_wr_0_Q_[20]\, Sys_dataIn(19) => \Fifo_wr_0_Q_[19]\, 
        Sys_dataIn(18) => \Fifo_wr_0_Q_[18]\, Sys_dataIn(17) => 
        \Fifo_wr_0_Q_[17]\, Sys_dataIn(16) => \Fifo_wr_0_Q_[16]\, 
        Sys_dataIn(15) => \Fifo_wr_0_Q_[15]\, Sys_dataIn(14) => 
        \Fifo_wr_0_Q_[14]\, Sys_dataIn(13) => \Fifo_wr_0_Q_[13]\, 
        Sys_dataIn(12) => \Fifo_wr_0_Q_[12]\, Sys_dataIn(11) => 
        \Fifo_wr_0_Q_[11]\, Sys_dataIn(10) => \Fifo_wr_0_Q_[10]\, 
        Sys_dataIn(9) => \Fifo_wr_0_Q_[9]\, Sys_dataIn(8) => 
        \Fifo_wr_0_Q_[8]\, Sys_dataIn(7) => \Fifo_wr_0_Q_[7]\, 
        Sys_dataIn(6) => \Fifo_wr_0_Q_[6]\, Sys_dataIn(5) => 
        \Fifo_wr_0_Q_[5]\, Sys_dataIn(4) => \Fifo_wr_0_Q_[4]\, 
        Sys_dataIn(3) => \Fifo_wr_0_Q_[3]\, Sys_dataIn(2) => 
        \Fifo_wr_0_Q_[2]\, Sys_dataIn(1) => \Fifo_wr_0_Q_[1]\, 
        Sys_dataIn(0) => \Fifo_wr_0_Q_[0]\, Sdram_data(71) => 
        Sd_DQ(71), Sdram_data(70) => Sd_DQ(70), Sdram_data(69)
         => Sd_DQ(69), Sdram_data(68) => Sd_DQ(68), 
        Sdram_data(67) => Sd_DQ(67), Sdram_data(66) => Sd_DQ(66), 
        Sdram_data(65) => Sd_DQ(65), Sdram_data(64) => Sd_DQ(64), 
        Sdram_data(63) => Sd_DQ(63), Sdram_data(62) => Sd_DQ(62), 
        Sdram_data(61) => Sd_DQ(61), Sdram_data(60) => Sd_DQ(60), 
        Sdram_data(59) => Sd_DQ(59), Sdram_data(58) => Sd_DQ(58), 
        Sdram_data(57) => Sd_DQ(57), Sdram_data(56) => Sd_DQ(56), 
        Sdram_data(55) => Sd_DQ(55), Sdram_data(54) => Sd_DQ(54), 
        Sdram_data(53) => Sd_DQ(53), Sdram_data(52) => Sd_DQ(52), 
        Sdram_data(51) => Sd_DQ(51), Sdram_data(50) => Sd_DQ(50), 
        Sdram_data(49) => Sd_DQ(49), Sdram_data(48) => Sd_DQ(48), 
        Sdram_data(47) => Sd_DQ(47), Sdram_data(46) => Sd_DQ(46), 
        Sdram_data(45) => Sd_DQ(45), Sdram_data(44) => Sd_DQ(44), 
        Sdram_data(43) => Sd_DQ(43), Sdram_data(42) => Sd_DQ(42), 
        Sdram_data(41) => Sd_DQ(41), Sdram_data(40) => Sd_DQ(40), 
        Sdram_data(39) => Sd_DQ(39), Sdram_data(38) => Sd_DQ(38), 
        Sdram_data(37) => Sd_DQ(37), Sdram_data(36) => Sd_DQ(36), 
        Sdram_data(35) => Sd_DQ(35), Sdram_data(34) => Sd_DQ(34), 
        Sdram_data(33) => Sd_DQ(33), Sdram_data(32) => Sd_DQ(32), 
        Sdram_data(31) => Sd_DQ(31), Sdram_data(30) => Sd_DQ(30), 
        Sdram_data(29) => Sd_DQ(29), Sdram_data(28) => Sd_DQ(28), 
        Sdram_data(27) => Sd_DQ(27), Sdram_data(26) => Sd_DQ(26), 
        Sdram_data(25) => Sd_DQ(25), Sdram_data(24) => Sd_DQ(24), 
        Sdram_data(23) => Sd_DQ(23), Sdram_data(22) => Sd_DQ(22), 
        Sdram_data(21) => Sd_DQ(21), Sdram_data(20) => Sd_DQ(20), 
        Sdram_data(19) => Sd_DQ(19), Sdram_data(18) => Sd_DQ(18), 
        Sdram_data(17) => Sd_DQ(17), Sdram_data(16) => Sd_DQ(16), 
        Sdram_data(15) => Sd_DQ(15), Sdram_data(14) => Sd_DQ(14), 
        Sdram_data(13) => Sd_DQ(13), Sdram_data(12) => Sd_DQ(12), 
        Sdram_data(11) => Sd_DQ(11), Sdram_data(10) => Sd_DQ(10), 
        Sdram_data(9) => Sd_DQ(9), Sdram_data(8) => Sd_DQ(8), 
        Sdram_data(7) => Sd_DQ(7), Sdram_data(6) => Sd_DQ(6), 
        Sdram_data(5) => Sd_DQ(5), Sdram_data(4) => Sd_DQ(4), 
        Sdram_data(3) => Sd_DQ(3), Sdram_data(2) => Sd_DQ(2), 
        Sdram_data(1) => Sd_DQ(1), Sdram_data(0) => Sd_DQ(0), 
        Sys_dataOut(71) => \Sdram_data_0_Sys_dataOut_[71]\, 
        Sys_dataOut(70) => \Sdram_data_0_Sys_dataOut_[70]\, 
        Sys_dataOut(69) => \Sdram_data_0_Sys_dataOut_[69]\, 
        Sys_dataOut(68) => \Sdram_data_0_Sys_dataOut_[68]\, 
        Sys_dataOut(67) => \Sdram_data_0_Sys_dataOut_[67]\, 
        Sys_dataOut(66) => \Sdram_data_0_Sys_dataOut_[66]\, 
        Sys_dataOut(65) => \Sdram_data_0_Sys_dataOut_[65]\, 
        Sys_dataOut(64) => \Sdram_data_0_Sys_dataOut_[64]\, 
        Sys_dataOut(63) => \Sdram_data_0_Sys_dataOut_[63]\, 
        Sys_dataOut(62) => \Sdram_data_0_Sys_dataOut_[62]\, 
        Sys_dataOut(61) => \Sdram_data_0_Sys_dataOut_[61]\, 
        Sys_dataOut(60) => \Sdram_data_0_Sys_dataOut_[60]\, 
        Sys_dataOut(59) => \Sdram_data_0_Sys_dataOut_[59]\, 
        Sys_dataOut(58) => \Sdram_data_0_Sys_dataOut_[58]\, 
        Sys_dataOut(57) => \Sdram_data_0_Sys_dataOut_[57]\, 
        Sys_dataOut(56) => \Sdram_data_0_Sys_dataOut_[56]\, 
        Sys_dataOut(55) => \Sdram_data_0_Sys_dataOut_[55]\, 
        Sys_dataOut(54) => \Sdram_data_0_Sys_dataOut_[54]\, 
        Sys_dataOut(53) => \Sdram_data_0_Sys_dataOut_[53]\, 
        Sys_dataOut(52) => \Sdram_data_0_Sys_dataOut_[52]\, 
        Sys_dataOut(51) => \Sdram_data_0_Sys_dataOut_[51]\, 
        Sys_dataOut(50) => \Sdram_data_0_Sys_dataOut_[50]\, 
        Sys_dataOut(49) => \Sdram_data_0_Sys_dataOut_[49]\, 
        Sys_dataOut(48) => \Sdram_data_0_Sys_dataOut_[48]\, 
        Sys_dataOut(47) => \Sdram_data_0_Sys_dataOut_[47]\, 
        Sys_dataOut(46) => \Sdram_data_0_Sys_dataOut_[46]\, 
        Sys_dataOut(45) => \Sdram_data_0_Sys_dataOut_[45]\, 
        Sys_dataOut(44) => \Sdram_data_0_Sys_dataOut_[44]\, 
        Sys_dataOut(43) => \Sdram_data_0_Sys_dataOut_[43]\, 
        Sys_dataOut(42) => \Sdram_data_0_Sys_dataOut_[42]\, 
        Sys_dataOut(41) => \Sdram_data_0_Sys_dataOut_[41]\, 
        Sys_dataOut(40) => \Sdram_data_0_Sys_dataOut_[40]\, 
        Sys_dataOut(39) => \Sdram_data_0_Sys_dataOut_[39]\, 
        Sys_dataOut(38) => \Sdram_data_0_Sys_dataOut_[38]\, 
        Sys_dataOut(37) => \Sdram_data_0_Sys_dataOut_[37]\, 
        Sys_dataOut(36) => \Sdram_data_0_Sys_dataOut_[36]\, 
        Sys_dataOut(35) => \Sdram_data_0_Sys_dataOut_[35]\, 
        Sys_dataOut(34) => \Sdram_data_0_Sys_dataOut_[34]\, 
        Sys_dataOut(33) => \Sdram_data_0_Sys_dataOut_[33]\, 
        Sys_dataOut(32) => \Sdram_data_0_Sys_dataOut_[32]\, 
        Sys_dataOut(31) => \Sdram_data_0_Sys_dataOut_[31]\, 
        Sys_dataOut(30) => \Sdram_data_0_Sys_dataOut_[30]\, 
        Sys_dataOut(29) => \Sdram_data_0_Sys_dataOut_[29]\, 
        Sys_dataOut(28) => \Sdram_data_0_Sys_dataOut_[28]\, 
        Sys_dataOut(27) => \Sdram_data_0_Sys_dataOut_[27]\, 
        Sys_dataOut(26) => \Sdram_data_0_Sys_dataOut_[26]\, 
        Sys_dataOut(25) => \Sdram_data_0_Sys_dataOut_[25]\, 
        Sys_dataOut(24) => \Sdram_data_0_Sys_dataOut_[24]\, 
        Sys_dataOut(23) => \Sdram_data_0_Sys_dataOut_[23]\, 
        Sys_dataOut(22) => \Sdram_data_0_Sys_dataOut_[22]\, 
        Sys_dataOut(21) => \Sdram_data_0_Sys_dataOut_[21]\, 
        Sys_dataOut(20) => \Sdram_data_0_Sys_dataOut_[20]\, 
        Sys_dataOut(19) => \Sdram_data_0_Sys_dataOut_[19]\, 
        Sys_dataOut(18) => \Sdram_data_0_Sys_dataOut_[18]\, 
        Sys_dataOut(17) => \Sdram_data_0_Sys_dataOut_[17]\, 
        Sys_dataOut(16) => \Sdram_data_0_Sys_dataOut_[16]\, 
        Sys_dataOut(15) => \Sdram_data_0_Sys_dataOut_[15]\, 
        Sys_dataOut(14) => \Sdram_data_0_Sys_dataOut_[14]\, 
        Sys_dataOut(13) => \Sdram_data_0_Sys_dataOut_[13]\, 
        Sys_dataOut(12) => \Sdram_data_0_Sys_dataOut_[12]\, 
        Sys_dataOut(11) => \Sdram_data_0_Sys_dataOut_[11]\, 
        Sys_dataOut(10) => \Sdram_data_0_Sys_dataOut_[10]\, 
        Sys_dataOut(9) => \Sdram_data_0_Sys_dataOut_[9]\, 
        Sys_dataOut(8) => \Sdram_data_0_Sys_dataOut_[8]\, 
        Sys_dataOut(7) => \Sdram_data_0_Sys_dataOut_[7]\, 
        Sys_dataOut(6) => \Sdram_data_0_Sys_dataOut_[6]\, 
        Sys_dataOut(5) => \Sdram_data_0_Sys_dataOut_[5]\, 
        Sys_dataOut(4) => \Sdram_data_0_Sys_dataOut_[4]\, 
        Sys_dataOut(3) => \Sdram_data_0_Sys_dataOut_[3]\, 
        Sys_dataOut(2) => \Sdram_data_0_Sys_dataOut_[2]\, 
        Sys_dataOut(1) => \Sdram_data_0_Sys_dataOut_[1]\, 
        Sys_dataOut(0) => \Sdram_data_0_Sys_dataOut_[0]\);
    
    Sdram_cmd_0 : entity work.Sdram_cmd
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, rst_n => 
        PLL_Test1_0_SysRst_O, ClkEN => Sdram_ctl_v2_0_ClkEN, GLB
         => PLL_Test1_0_Sdram_clk, rdrow_end => 
        Sdram_cmd_0_rdrow_end, wrrow_end => Sdram_cmd_0_wrrow_end, 
        lvds_en => CMOS_DrvX_0_LVDSen, Sdram_en => 
        CMOS_DrvX_0_SDramEn, ras_n => SD_ras_n, cas_n => SD_cas_n, 
        we_n => SD_we_n, SDoneFrameOk => Sdram_cmd_0_SDoneFrameOk, 
        RFifo_we => Sdram_cmd_0_RFifo_we, WFifo_re => 
        Sdram_cmd_0_WFifo_re, ini_state(2) => 
        \Sdram_ini_0_ini_state_[2]\, ini_state(1) => 
        \Sdram_ini_0_ini_state_[1]\, ini_state(0) => 
        \Sdram_ini_0_ini_state_[0]\, rd_state(2) => 
        \SDram_rd_0_rd_state_[2]\, rd_state(1) => 
        \SDram_rd_0_rd_state_[1]\, rd_state(0) => 
        \SDram_rd_0_rd_state_[0]\, wr_state(2) => 
        \SDRAM_wr_0_wr_state_[2]\, wr_state(1) => 
        \SDRAM_wr_0_wr_state_[1]\, wr_state(0) => 
        \SDRAM_wr_0_wr_state_[0]\, ref_state(2) => 
        \SDRAM_Ref_0_Ref_state_[2]\, ref_state(1) => 
        \SDRAM_Ref_0_Ref_state_[1]\, ref_state(0) => 
        \SDRAM_Ref_0_Ref_state_[0]\, cke(1) => SD_cke(1), cke(0)
         => SD_cke(0), cs_n(1) => SD_cs_n(1), cs_n(0) => 
        SD_cs_n(0), SD_Clk(1) => SD_Clk(1), SD_Clk(0) => 
        SD_Clk(0), dqm(7) => SD_dqm(7), dqm(6) => SD_dqm(6), 
        dqm(5) => SD_dqm(5), dqm(4) => SD_dqm(4), dqm(3) => 
        SD_dqm(3), dqm(2) => SD_dqm(2), dqm(1) => SD_dqm(1), 
        dqm(0) => SD_dqm(0), addr(12) => SD_addr(12), addr(11)
         => SD_addr(11), addr(10) => SD_addr(10), addr(9) => 
        SD_addr(9), addr(8) => SD_addr(8), addr(7) => SD_addr(7), 
        addr(6) => SD_addr(6), addr(5) => SD_addr(5), addr(4) => 
        SD_addr(4), addr(3) => SD_addr(3), addr(2) => SD_addr(2), 
        addr(1) => SD_addr(1), addr(0) => SD_addr(0), ba(1) => 
        SD_ba(1), ba(0) => SD_ba(0));
    
    FrameMk_0 : entity work.FrameMk
      port map(SysClk => PLL_Test1_0_Sys_66M_Clk, SysRst_n => 
        PLL_Test1_0_SysRst_O, LVDS_en => CMOS_DrvX_0_LVDSen, 
        ByteRdEn => Main_ctl4SD_0_ByteRdEn, ParaUpdata => 
        CMOS_DrvX_0_ParaUpdata, LVDS_O => LVDS_O, LVDS_ok => 
        FrameMk_0_LVDS_ok, SDram2FK(71) => 
        \Main_ctl4SD_0_LVDS_data_[71]\, SDram2FK(70) => 
        \Main_ctl4SD_0_LVDS_data_[70]\, SDram2FK(69) => 
        \Main_ctl4SD_0_LVDS_data_[69]\, SDram2FK(68) => 
        \Main_ctl4SD_0_LVDS_data_[68]\, SDram2FK(67) => 
        \Main_ctl4SD_0_LVDS_data_[67]\, SDram2FK(66) => 
        \Main_ctl4SD_0_LVDS_data_[66]\, SDram2FK(65) => 
        \Main_ctl4SD_0_LVDS_data_[65]\, SDram2FK(64) => 
        \Main_ctl4SD_0_LVDS_data_[64]\, SDram2FK(63) => 
        \Main_ctl4SD_0_LVDS_data_[63]\, SDram2FK(62) => 
        \Main_ctl4SD_0_LVDS_data_[62]\, SDram2FK(61) => 
        \Main_ctl4SD_0_LVDS_data_[61]\, SDram2FK(60) => 
        \Main_ctl4SD_0_LVDS_data_[60]\, SDram2FK(59) => 
        \Main_ctl4SD_0_LVDS_data_[59]\, SDram2FK(58) => 
        \Main_ctl4SD_0_LVDS_data_[58]\, SDram2FK(57) => 
        \Main_ctl4SD_0_LVDS_data_[57]\, SDram2FK(56) => 
        \Main_ctl4SD_0_LVDS_data_[56]\, SDram2FK(55) => 
        \Main_ctl4SD_0_LVDS_data_[55]\, SDram2FK(54) => 
        \Main_ctl4SD_0_LVDS_data_[54]\, SDram2FK(53) => 
        \Main_ctl4SD_0_LVDS_data_[53]\, SDram2FK(52) => 
        \Main_ctl4SD_0_LVDS_data_[52]\, SDram2FK(51) => 
        \Main_ctl4SD_0_LVDS_data_[51]\, SDram2FK(50) => 
        \Main_ctl4SD_0_LVDS_data_[50]\, SDram2FK(49) => 
        \Main_ctl4SD_0_LVDS_data_[49]\, SDram2FK(48) => 
        \Main_ctl4SD_0_LVDS_data_[48]\, SDram2FK(47) => 
        \Main_ctl4SD_0_LVDS_data_[47]\, SDram2FK(46) => 
        \Main_ctl4SD_0_LVDS_data_[46]\, SDram2FK(45) => 
        \Main_ctl4SD_0_LVDS_data_[45]\, SDram2FK(44) => 
        \Main_ctl4SD_0_LVDS_data_[44]\, SDram2FK(43) => 
        \Main_ctl4SD_0_LVDS_data_[43]\, SDram2FK(42) => 
        \Main_ctl4SD_0_LVDS_data_[42]\, SDram2FK(41) => 
        \Main_ctl4SD_0_LVDS_data_[41]\, SDram2FK(40) => 
        \Main_ctl4SD_0_LVDS_data_[40]\, SDram2FK(39) => 
        \Main_ctl4SD_0_LVDS_data_[39]\, SDram2FK(38) => 
        \Main_ctl4SD_0_LVDS_data_[38]\, SDram2FK(37) => 
        \Main_ctl4SD_0_LVDS_data_[37]\, SDram2FK(36) => 
        \Main_ctl4SD_0_LVDS_data_[36]\, SDram2FK(35) => 
        \Main_ctl4SD_0_LVDS_data_[35]\, SDram2FK(34) => 
        \Main_ctl4SD_0_LVDS_data_[34]\, SDram2FK(33) => 
        \Main_ctl4SD_0_LVDS_data_[33]\, SDram2FK(32) => 
        \Main_ctl4SD_0_LVDS_data_[32]\, SDram2FK(31) => 
        \Main_ctl4SD_0_LVDS_data_[31]\, SDram2FK(30) => 
        \Main_ctl4SD_0_LVDS_data_[30]\, SDram2FK(29) => 
        \Main_ctl4SD_0_LVDS_data_[29]\, SDram2FK(28) => 
        \Main_ctl4SD_0_LVDS_data_[28]\, SDram2FK(27) => 
        \Main_ctl4SD_0_LVDS_data_[27]\, SDram2FK(26) => 
        \Main_ctl4SD_0_LVDS_data_[26]\, SDram2FK(25) => 
        \Main_ctl4SD_0_LVDS_data_[25]\, SDram2FK(24) => 
        \Main_ctl4SD_0_LVDS_data_[24]\, SDram2FK(23) => 
        \Main_ctl4SD_0_LVDS_data_[23]\, SDram2FK(22) => 
        \Main_ctl4SD_0_LVDS_data_[22]\, SDram2FK(21) => 
        \Main_ctl4SD_0_LVDS_data_[21]\, SDram2FK(20) => 
        \Main_ctl4SD_0_LVDS_data_[20]\, SDram2FK(19) => 
        \Main_ctl4SD_0_LVDS_data_[19]\, SDram2FK(18) => 
        \Main_ctl4SD_0_LVDS_data_[18]\, SDram2FK(17) => 
        \Main_ctl4SD_0_LVDS_data_[17]\, SDram2FK(16) => 
        \Main_ctl4SD_0_LVDS_data_[16]\, SDram2FK(15) => 
        \Main_ctl4SD_0_LVDS_data_[15]\, SDram2FK(14) => 
        \Main_ctl4SD_0_LVDS_data_[14]\, SDram2FK(13) => 
        \Main_ctl4SD_0_LVDS_data_[13]\, SDram2FK(12) => 
        \Main_ctl4SD_0_LVDS_data_[12]\, SDram2FK(11) => 
        \Main_ctl4SD_0_LVDS_data_[11]\, SDram2FK(10) => 
        \Main_ctl4SD_0_LVDS_data_[10]\, SDram2FK(9) => 
        \Main_ctl4SD_0_LVDS_data_[9]\, SDram2FK(8) => 
        \Main_ctl4SD_0_LVDS_data_[8]\, SDram2FK(7) => 
        \Main_ctl4SD_0_LVDS_data_[7]\, SDram2FK(6) => 
        \Main_ctl4SD_0_LVDS_data_[6]\, SDram2FK(5) => 
        \Main_ctl4SD_0_LVDS_data_[5]\, SDram2FK(4) => 
        \Main_ctl4SD_0_LVDS_data_[4]\, SDram2FK(3) => 
        \Main_ctl4SD_0_LVDS_data_[3]\, SDram2FK(2) => 
        \Main_ctl4SD_0_LVDS_data_[2]\, SDram2FK(1) => 
        \Main_ctl4SD_0_LVDS_data_[1]\, SDram2FK(0) => 
        \Main_ctl4SD_0_LVDS_data_[0]\, SubFrameMode(1) => 
        \ParaUpdata_0_Mode_[1]\, SubFrameMode(0) => 
        \ParaUpdata_0_Mode_[0]\, SubFrameMotor(5) => 
        \ParaUpdata_0_MotorPos_[5]\, SubFrameMotor(4) => 
        \ParaUpdata_0_MotorPos_[4]\, SubFrameMotor(3) => 
        \ParaUpdata_0_MotorPos_[3]\, SubFrameMotor(2) => 
        \ParaUpdata_0_MotorPos_[2]\, SubFrameMotor(1) => 
        \ParaUpdata_0_MotorPos_[1]\, SubFrameMotor(0) => 
        \ParaUpdata_0_MotorPos_[0]\, BandNum(3) => 
        \ParaUpdata_0_BandNum_[3]\, BandNum(2) => 
        \ParaUpdata_0_BandNum_[2]\, BandNum(1) => 
        \ParaUpdata_0_BandNum_[1]\, BandNum(0) => 
        \ParaUpdata_0_BandNum_[0]\, IntTime(5) => 
        \ParaUpdata_0_ExposureT_[5]\, IntTime(4) => 
        \ParaUpdata_0_ExposureT_[4]\, IntTime(3) => 
        \ParaUpdata_0_ExposureT_[3]\, IntTime(2) => 
        \ParaUpdata_0_ExposureT_[2]\, IntTime(1) => 
        \ParaUpdata_0_ExposureT_[1]\, IntTime(0) => 
        \ParaUpdata_0_ExposureT_[0]\, AccNum(5) => 
        \ParaUpdata_0_Accnum_0_[5]\, AccNum(4) => 
        \ParaUpdata_0_Accnum_0_[4]\, AccNum(3) => 
        \ParaUpdata_0_Accnum_0_[3]\, AccNum(2) => 
        \ParaUpdata_0_Accnum_0_[2]\, AccNum(1) => 
        \ParaUpdata_0_Accnum_0_[1]\, AccNum(0) => 
        \ParaUpdata_0_Accnum_0_[0]\);
    
    adcclk_3P9_0 : adcclk_3P9
      port map(GL => AdcClk, CLK => PLL_Test1_0_ADC_66M_Clk);
    
    \VCC\ : VCC
      port map(Y => VCC_net);
    
    SDram_rd_0 : entity work.SDram_rd
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, rst_n => 
        PLL_Test1_0_SysRst_O, SD_rdEN => Sdram_ctl_v2_0_SD_rdEn, 
        SD_rdEN_noact => Sdram_ctl_v2_0_SD_rdEN_noact, row_end
         => Sdram_cmd_0_rdrow_end, SD_RdOK => SDram_rd_0_SD_RdOK, 
        rd_state(2) => \SDram_rd_0_rd_state_[2]\, rd_state(1) => 
        \SDram_rd_0_rd_state_[1]\, rd_state(0) => 
        \SDram_rd_0_rd_state_[0]\);
    
    SDRAM_wr_0 : entity work.SDRAM_wr
      port map(Sysclk => PLL_Test1_0_Sys_66M_Clk, rst_n => 
        PLL_Test1_0_SysRst_O, SD_wrEn => Sdram_ctl_v2_0_SD_wrEn, 
        SD_WrOK => SDRAM_wr_0_SD_WrOK, WrRow_end => 
        Sdram_cmd_0_wrrow_end, wr_state(2) => 
        \SDRAM_wr_0_wr_state_[2]\, wr_state(1) => 
        \SDRAM_wr_0_wr_state_[1]\, wr_state(0) => 
        \SDRAM_wr_0_wr_state_[0]\);
    
    My_adder0_0 : My_adder0
      port map(DataA(17) => GND_net, DataA(16) => GND_net, 
        DataA(15) => GND_net, DataA(14) => GND_net, DataA(13) => 
        \adc_muxtmp_test_0_DataOut13to0_[13]\, DataA(12) => 
        \adc_muxtmp_test_0_DataOut13to0_[12]\, DataA(11) => 
        \adc_muxtmp_test_0_DataOut13to0_[11]\, DataA(10) => 
        \adc_muxtmp_test_0_DataOut13to0_[10]\, DataA(9) => 
        \adc_muxtmp_test_0_DataOut13to0_[9]\, DataA(8) => 
        \adc_muxtmp_test_0_DataOut13to0_[8]\, DataA(7) => 
        \adc_muxtmp_test_0_DataOut13to0_[7]\, DataA(6) => 
        \adc_muxtmp_test_0_DataOut13to0_[6]\, DataA(5) => 
        \adc_muxtmp_test_0_DataOut13to0_[5]\, DataA(4) => 
        \adc_muxtmp_test_0_DataOut13to0_[4]\, DataA(3) => 
        \adc_muxtmp_test_0_DataOut13to0_[3]\, DataA(2) => 
        \adc_muxtmp_test_0_DataOut13to0_[2]\, DataA(1) => 
        \adc_muxtmp_test_0_DataOut13to0_[1]\, DataA(0) => 
        \adc_muxtmp_test_0_DataOut13to0_[0]\, DataB(17) => 
        \Main_ctl4SD_0_Data2ACC17to0_[17]\, DataB(16) => 
        \Main_ctl4SD_0_Data2ACC17to0_[16]\, DataB(15) => 
        \Main_ctl4SD_0_Data2ACC17to0_[15]\, DataB(14) => 
        \Main_ctl4SD_0_Data2ACC17to0_[14]\, DataB(13) => 
        \Main_ctl4SD_0_Data2ACC17to0_[13]\, DataB(12) => 
        \Main_ctl4SD_0_Data2ACC17to0_[12]\, DataB(11) => 
        \Main_ctl4SD_0_Data2ACC17to0_[11]\, DataB(10) => 
        \Main_ctl4SD_0_Data2ACC17to0_[10]\, DataB(9) => 
        \Main_ctl4SD_0_Data2ACC17to0_[9]\, DataB(8) => 
        \Main_ctl4SD_0_Data2ACC17to0_[8]\, DataB(7) => 
        \Main_ctl4SD_0_Data2ACC17to0_[7]\, DataB(6) => 
        \Main_ctl4SD_0_Data2ACC17to0_[6]\, DataB(5) => 
        \Main_ctl4SD_0_Data2ACC17to0_[5]\, DataB(4) => 
        \Main_ctl4SD_0_Data2ACC17to0_[4]\, DataB(3) => 
        \Main_ctl4SD_0_Data2ACC17to0_[3]\, DataB(2) => 
        \Main_ctl4SD_0_Data2ACC17to0_[2]\, DataB(1) => 
        \Main_ctl4SD_0_Data2ACC17to0_[1]\, DataB(0) => 
        \Main_ctl4SD_0_Data2ACC17to0_[0]\, Sum(17) => 
        \My_adder0_0_Sum_[17]\, Sum(16) => \My_adder0_0_Sum_[16]\, 
        Sum(15) => \My_adder0_0_Sum_[15]\, Sum(14) => 
        \My_adder0_0_Sum_[14]\, Sum(13) => \My_adder0_0_Sum_[13]\, 
        Sum(12) => \My_adder0_0_Sum_[12]\, Sum(11) => 
        \My_adder0_0_Sum_[11]\, Sum(10) => \My_adder0_0_Sum_[10]\, 
        Sum(9) => \My_adder0_0_Sum_[9]\, Sum(8) => 
        \My_adder0_0_Sum_[8]\, Sum(7) => \My_adder0_0_Sum_[7]\, 
        Sum(6) => \My_adder0_0_Sum_[6]\, Sum(5) => 
        \My_adder0_0_Sum_[5]\, Sum(4) => \My_adder0_0_Sum_[4]\, 
        Sum(3) => \My_adder0_0_Sum_[3]\, Sum(2) => 
        \My_adder0_0_Sum_[2]\, Sum(1) => \My_adder0_0_Sum_[1]\, 
        Sum(0) => \My_adder0_0_Sum_[0]\);
    

end DEF_ARCH; 
