-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity top_sdram is

    port( Sysclk       : in    std_logic;
          rst_n        : in    std_logic;
          ras_n        : out   std_logic;
          cas_n        : out   std_logic;
          we_n         : out   std_logic;
          Fifo_RAfull  : in    std_logic;
          Fifo_Wafull  : in    std_logic;
          LVDS_En      : in    std_logic;
          GLB          : in    std_logic;
          SDRAM_En     : in    std_logic;
          DQ           : inout std_logic_vector(71 downto 0) := (others => 'Z');
          Sys_dataIn   : in    std_logic_vector(71 downto 0);
          Sys_dataOut  : out   std_logic_vector(71 downto 0);
          SDoneFrameOk : out   std_logic;
          cke          : out   std_logic_vector(1 downto 0);
          cs_n         : out   std_logic_vector(1 downto 0);
          SD_Clk       : out   std_logic_vector(1 downto 0);
          dqm          : out   std_logic_vector(7 downto 0);
          addr         : out   std_logic_vector(12 downto 0);
          ba           : out   std_logic_vector(1 downto 0);
          RFifo_we     : out   std_logic;
          WFifo_re     : out   std_logic;
          RefEn        : in    std_logic
        );

end top_sdram;

architecture DEF_ARCH of top_sdram is 

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal Sdram_cmd_0_rdrow_end, Sdram_cmd_0_wrrow_end, 
        Sdram_ctl_v2_0_ClkEN, Sdram_ctl_v2_0_SD_iniEn, 
        Sdram_ctl_v2_0_SD_pdEN, Sdram_ctl_v2_0_SD_rdEn, 
        Sdram_ctl_v2_0_SD_rdEN_noact, Sdram_ctl_v2_0_SD_RefEn, 
        Sdram_ctl_v2_0_SD_wrEn, \Sdram_ini_0_ini_state_[2]\, 
        \Sdram_ini_0_ini_state_[1]\, \Sdram_ini_0_ini_state_[0]\, 
        Sdram_ini_0_Sd_iniOK, \SDram_rd_0_rd_state_[2]\, 
        \SDram_rd_0_rd_state_[1]\, \SDram_rd_0_rd_state_[0]\, 
        SDram_rd_0_SD_RdOK, \SDRAM_Ref_0_Ref_state_[2]\, 
        \SDRAM_Ref_0_Ref_state_[1]\, \SDRAM_Ref_0_Ref_state_[0]\, 
        SDRAM_Ref_0_SD_refOK, SDRAM_wr_0_SD_WrOK, 
        \SDRAM_wr_0_wr_state_[2]\, \SDRAM_wr_0_wr_state_[1]\, 
        \SDRAM_wr_0_wr_state_[0]\, GND_net, VCC_net : std_logic;

begin 


    SDRAM_Ref_0 : entity work.SDRAM_Ref
      port map(Sysclk => Sysclk, rst_n => rst_n, SD_refEN => 
        Sdram_ctl_v2_0_SD_RefEn, sd_pdEN => 
        Sdram_ctl_v2_0_SD_pdEN, SD_iniOK => Sdram_ini_0_Sd_iniOK, 
        RefEn => RefEn, SD_refOK => SDRAM_Ref_0_SD_refOK, 
        Ref_state(2) => \SDRAM_Ref_0_Ref_state_[2]\, Ref_state(1)
         => \SDRAM_Ref_0_Ref_state_[1]\, Ref_state(0) => 
        \SDRAM_Ref_0_Ref_state_[0]\);
    
    \VCC\ : VCC
      port map(Y => VCC_net);
    
    Sdram_data_0 : entity work.Sdram_data
      port map(Sysclk => Sysclk, Sysrst_n => rst_n, rd_state(2)
         => \SDram_rd_0_rd_state_[2]\, rd_state(1) => 
        \SDram_rd_0_rd_state_[1]\, rd_state(0) => 
        \SDram_rd_0_rd_state_[0]\, wr_state(2) => 
        \SDRAM_wr_0_wr_state_[2]\, wr_state(1) => 
        \SDRAM_wr_0_wr_state_[1]\, wr_state(0) => 
        \SDRAM_wr_0_wr_state_[0]\, Sys_dataIn(71) => 
        Sys_dataIn(71), Sys_dataIn(70) => Sys_dataIn(70), 
        Sys_dataIn(69) => Sys_dataIn(69), Sys_dataIn(68) => 
        Sys_dataIn(68), Sys_dataIn(67) => Sys_dataIn(67), 
        Sys_dataIn(66) => Sys_dataIn(66), Sys_dataIn(65) => 
        Sys_dataIn(65), Sys_dataIn(64) => Sys_dataIn(64), 
        Sys_dataIn(63) => Sys_dataIn(63), Sys_dataIn(62) => 
        Sys_dataIn(62), Sys_dataIn(61) => Sys_dataIn(61), 
        Sys_dataIn(60) => Sys_dataIn(60), Sys_dataIn(59) => 
        Sys_dataIn(59), Sys_dataIn(58) => Sys_dataIn(58), 
        Sys_dataIn(57) => Sys_dataIn(57), Sys_dataIn(56) => 
        Sys_dataIn(56), Sys_dataIn(55) => Sys_dataIn(55), 
        Sys_dataIn(54) => Sys_dataIn(54), Sys_dataIn(53) => 
        Sys_dataIn(53), Sys_dataIn(52) => Sys_dataIn(52), 
        Sys_dataIn(51) => Sys_dataIn(51), Sys_dataIn(50) => 
        Sys_dataIn(50), Sys_dataIn(49) => Sys_dataIn(49), 
        Sys_dataIn(48) => Sys_dataIn(48), Sys_dataIn(47) => 
        Sys_dataIn(47), Sys_dataIn(46) => Sys_dataIn(46), 
        Sys_dataIn(45) => Sys_dataIn(45), Sys_dataIn(44) => 
        Sys_dataIn(44), Sys_dataIn(43) => Sys_dataIn(43), 
        Sys_dataIn(42) => Sys_dataIn(42), Sys_dataIn(41) => 
        Sys_dataIn(41), Sys_dataIn(40) => Sys_dataIn(40), 
        Sys_dataIn(39) => Sys_dataIn(39), Sys_dataIn(38) => 
        Sys_dataIn(38), Sys_dataIn(37) => Sys_dataIn(37), 
        Sys_dataIn(36) => Sys_dataIn(36), Sys_dataIn(35) => 
        Sys_dataIn(35), Sys_dataIn(34) => Sys_dataIn(34), 
        Sys_dataIn(33) => Sys_dataIn(33), Sys_dataIn(32) => 
        Sys_dataIn(32), Sys_dataIn(31) => Sys_dataIn(31), 
        Sys_dataIn(30) => Sys_dataIn(30), Sys_dataIn(29) => 
        Sys_dataIn(29), Sys_dataIn(28) => Sys_dataIn(28), 
        Sys_dataIn(27) => Sys_dataIn(27), Sys_dataIn(26) => 
        Sys_dataIn(26), Sys_dataIn(25) => Sys_dataIn(25), 
        Sys_dataIn(24) => Sys_dataIn(24), Sys_dataIn(23) => 
        Sys_dataIn(23), Sys_dataIn(22) => Sys_dataIn(22), 
        Sys_dataIn(21) => Sys_dataIn(21), Sys_dataIn(20) => 
        Sys_dataIn(20), Sys_dataIn(19) => Sys_dataIn(19), 
        Sys_dataIn(18) => Sys_dataIn(18), Sys_dataIn(17) => 
        Sys_dataIn(17), Sys_dataIn(16) => Sys_dataIn(16), 
        Sys_dataIn(15) => Sys_dataIn(15), Sys_dataIn(14) => 
        Sys_dataIn(14), Sys_dataIn(13) => Sys_dataIn(13), 
        Sys_dataIn(12) => Sys_dataIn(12), Sys_dataIn(11) => 
        Sys_dataIn(11), Sys_dataIn(10) => Sys_dataIn(10), 
        Sys_dataIn(9) => Sys_dataIn(9), Sys_dataIn(8) => 
        Sys_dataIn(8), Sys_dataIn(7) => Sys_dataIn(7), 
        Sys_dataIn(6) => Sys_dataIn(6), Sys_dataIn(5) => 
        Sys_dataIn(5), Sys_dataIn(4) => Sys_dataIn(4), 
        Sys_dataIn(3) => Sys_dataIn(3), Sys_dataIn(2) => 
        Sys_dataIn(2), Sys_dataIn(1) => Sys_dataIn(1), 
        Sys_dataIn(0) => Sys_dataIn(0), Sdram_data(71) => DQ(71), 
        Sdram_data(70) => DQ(70), Sdram_data(69) => DQ(69), 
        Sdram_data(68) => DQ(68), Sdram_data(67) => DQ(67), 
        Sdram_data(66) => DQ(66), Sdram_data(65) => DQ(65), 
        Sdram_data(64) => DQ(64), Sdram_data(63) => DQ(63), 
        Sdram_data(62) => DQ(62), Sdram_data(61) => DQ(61), 
        Sdram_data(60) => DQ(60), Sdram_data(59) => DQ(59), 
        Sdram_data(58) => DQ(58), Sdram_data(57) => DQ(57), 
        Sdram_data(56) => DQ(56), Sdram_data(55) => DQ(55), 
        Sdram_data(54) => DQ(54), Sdram_data(53) => DQ(53), 
        Sdram_data(52) => DQ(52), Sdram_data(51) => DQ(51), 
        Sdram_data(50) => DQ(50), Sdram_data(49) => DQ(49), 
        Sdram_data(48) => DQ(48), Sdram_data(47) => DQ(47), 
        Sdram_data(46) => DQ(46), Sdram_data(45) => DQ(45), 
        Sdram_data(44) => DQ(44), Sdram_data(43) => DQ(43), 
        Sdram_data(42) => DQ(42), Sdram_data(41) => DQ(41), 
        Sdram_data(40) => DQ(40), Sdram_data(39) => DQ(39), 
        Sdram_data(38) => DQ(38), Sdram_data(37) => DQ(37), 
        Sdram_data(36) => DQ(36), Sdram_data(35) => DQ(35), 
        Sdram_data(34) => DQ(34), Sdram_data(33) => DQ(33), 
        Sdram_data(32) => DQ(32), Sdram_data(31) => DQ(31), 
        Sdram_data(30) => DQ(30), Sdram_data(29) => DQ(29), 
        Sdram_data(28) => DQ(28), Sdram_data(27) => DQ(27), 
        Sdram_data(26) => DQ(26), Sdram_data(25) => DQ(25), 
        Sdram_data(24) => DQ(24), Sdram_data(23) => DQ(23), 
        Sdram_data(22) => DQ(22), Sdram_data(21) => DQ(21), 
        Sdram_data(20) => DQ(20), Sdram_data(19) => DQ(19), 
        Sdram_data(18) => DQ(18), Sdram_data(17) => DQ(17), 
        Sdram_data(16) => DQ(16), Sdram_data(15) => DQ(15), 
        Sdram_data(14) => DQ(14), Sdram_data(13) => DQ(13), 
        Sdram_data(12) => DQ(12), Sdram_data(11) => DQ(11), 
        Sdram_data(10) => DQ(10), Sdram_data(9) => DQ(9), 
        Sdram_data(8) => DQ(8), Sdram_data(7) => DQ(7), 
        Sdram_data(6) => DQ(6), Sdram_data(5) => DQ(5), 
        Sdram_data(4) => DQ(4), Sdram_data(3) => DQ(3), 
        Sdram_data(2) => DQ(2), Sdram_data(1) => DQ(1), 
        Sdram_data(0) => DQ(0), Sys_dataOut(71) => 
        Sys_dataOut(71), Sys_dataOut(70) => Sys_dataOut(70), 
        Sys_dataOut(69) => Sys_dataOut(69), Sys_dataOut(68) => 
        Sys_dataOut(68), Sys_dataOut(67) => Sys_dataOut(67), 
        Sys_dataOut(66) => Sys_dataOut(66), Sys_dataOut(65) => 
        Sys_dataOut(65), Sys_dataOut(64) => Sys_dataOut(64), 
        Sys_dataOut(63) => Sys_dataOut(63), Sys_dataOut(62) => 
        Sys_dataOut(62), Sys_dataOut(61) => Sys_dataOut(61), 
        Sys_dataOut(60) => Sys_dataOut(60), Sys_dataOut(59) => 
        Sys_dataOut(59), Sys_dataOut(58) => Sys_dataOut(58), 
        Sys_dataOut(57) => Sys_dataOut(57), Sys_dataOut(56) => 
        Sys_dataOut(56), Sys_dataOut(55) => Sys_dataOut(55), 
        Sys_dataOut(54) => Sys_dataOut(54), Sys_dataOut(53) => 
        Sys_dataOut(53), Sys_dataOut(52) => Sys_dataOut(52), 
        Sys_dataOut(51) => Sys_dataOut(51), Sys_dataOut(50) => 
        Sys_dataOut(50), Sys_dataOut(49) => Sys_dataOut(49), 
        Sys_dataOut(48) => Sys_dataOut(48), Sys_dataOut(47) => 
        Sys_dataOut(47), Sys_dataOut(46) => Sys_dataOut(46), 
        Sys_dataOut(45) => Sys_dataOut(45), Sys_dataOut(44) => 
        Sys_dataOut(44), Sys_dataOut(43) => Sys_dataOut(43), 
        Sys_dataOut(42) => Sys_dataOut(42), Sys_dataOut(41) => 
        Sys_dataOut(41), Sys_dataOut(40) => Sys_dataOut(40), 
        Sys_dataOut(39) => Sys_dataOut(39), Sys_dataOut(38) => 
        Sys_dataOut(38), Sys_dataOut(37) => Sys_dataOut(37), 
        Sys_dataOut(36) => Sys_dataOut(36), Sys_dataOut(35) => 
        Sys_dataOut(35), Sys_dataOut(34) => Sys_dataOut(34), 
        Sys_dataOut(33) => Sys_dataOut(33), Sys_dataOut(32) => 
        Sys_dataOut(32), Sys_dataOut(31) => Sys_dataOut(31), 
        Sys_dataOut(30) => Sys_dataOut(30), Sys_dataOut(29) => 
        Sys_dataOut(29), Sys_dataOut(28) => Sys_dataOut(28), 
        Sys_dataOut(27) => Sys_dataOut(27), Sys_dataOut(26) => 
        Sys_dataOut(26), Sys_dataOut(25) => Sys_dataOut(25), 
        Sys_dataOut(24) => Sys_dataOut(24), Sys_dataOut(23) => 
        Sys_dataOut(23), Sys_dataOut(22) => Sys_dataOut(22), 
        Sys_dataOut(21) => Sys_dataOut(21), Sys_dataOut(20) => 
        Sys_dataOut(20), Sys_dataOut(19) => Sys_dataOut(19), 
        Sys_dataOut(18) => Sys_dataOut(18), Sys_dataOut(17) => 
        Sys_dataOut(17), Sys_dataOut(16) => Sys_dataOut(16), 
        Sys_dataOut(15) => Sys_dataOut(15), Sys_dataOut(14) => 
        Sys_dataOut(14), Sys_dataOut(13) => Sys_dataOut(13), 
        Sys_dataOut(12) => Sys_dataOut(12), Sys_dataOut(11) => 
        Sys_dataOut(11), Sys_dataOut(10) => Sys_dataOut(10), 
        Sys_dataOut(9) => Sys_dataOut(9), Sys_dataOut(8) => 
        Sys_dataOut(8), Sys_dataOut(7) => Sys_dataOut(7), 
        Sys_dataOut(6) => Sys_dataOut(6), Sys_dataOut(5) => 
        Sys_dataOut(5), Sys_dataOut(4) => Sys_dataOut(4), 
        Sys_dataOut(3) => Sys_dataOut(3), Sys_dataOut(2) => 
        Sys_dataOut(2), Sys_dataOut(1) => Sys_dataOut(1), 
        Sys_dataOut(0) => Sys_dataOut(0));
    
    SDram_rd_0 : entity work.SDram_rd
      port map(Sysclk => Sysclk, rst_n => rst_n, SD_rdEN => 
        Sdram_ctl_v2_0_SD_rdEn, SD_rdEN_noact => 
        Sdram_ctl_v2_0_SD_rdEN_noact, row_end => 
        Sdram_cmd_0_rdrow_end, SD_RdOK => SDram_rd_0_SD_RdOK, 
        rd_state(2) => \SDram_rd_0_rd_state_[2]\, rd_state(1) => 
        \SDram_rd_0_rd_state_[1]\, rd_state(0) => 
        \SDram_rd_0_rd_state_[0]\);
    
    Sdram_cmd_0 : entity work.Sdram_cmd
      port map(Sysclk => Sysclk, rst_n => rst_n, ini_state(2) => 
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
        \SDRAM_Ref_0_Ref_state_[0]\, ClkEN => 
        Sdram_ctl_v2_0_ClkEN, GLB => GLB, rdrow_end => 
        Sdram_cmd_0_rdrow_end, wrrow_end => Sdram_cmd_0_wrrow_end, 
        lvds_en => LVDS_En, Sdram_en => SDRAM_En, ras_n => ras_n, 
        cas_n => cas_n, we_n => we_n, SDoneFrameOk => 
        SDoneFrameOk, cke(1) => cke(1), cke(0) => cke(0), cs_n(1)
         => cs_n(1), cs_n(0) => cs_n(0), SD_Clk(1) => SD_Clk(1), 
        SD_Clk(0) => SD_Clk(0), dqm(7) => dqm(7), dqm(6) => 
        dqm(6), dqm(5) => dqm(5), dqm(4) => dqm(4), dqm(3) => 
        dqm(3), dqm(2) => dqm(2), dqm(1) => dqm(1), dqm(0) => 
        dqm(0), addr(12) => addr(12), addr(11) => addr(11), 
        addr(10) => addr(10), addr(9) => addr(9), addr(8) => 
        addr(8), addr(7) => addr(7), addr(6) => addr(6), addr(5)
         => addr(5), addr(4) => addr(4), addr(3) => addr(3), 
        addr(2) => addr(2), addr(1) => addr(1), addr(0) => 
        addr(0), ba(1) => ba(1), ba(0) => ba(0), RFifo_we => 
        RFifo_we, WFifo_re => WFifo_re);
    
    \GND\ : GND
      port map(Y => GND_net);
    
    SDRAM_wr_0 : entity work.SDRAM_wr
      port map(Sysclk => Sysclk, rst_n => rst_n, SD_wrEn => 
        Sdram_ctl_v2_0_SD_wrEn, SD_WrOK => SDRAM_wr_0_SD_WrOK, 
        WrRow_end => Sdram_cmd_0_wrrow_end, wr_state(2) => 
        \SDRAM_wr_0_wr_state_[2]\, wr_state(1) => 
        \SDRAM_wr_0_wr_state_[1]\, wr_state(0) => 
        \SDRAM_wr_0_wr_state_[0]\);
    
    Sdram_ini_0 : entity work.Sdram_ini
      port map(Sysclk => Sysclk, rst_n => rst_n, SD_iniEN => 
        Sdram_ctl_v2_0_SD_iniEn, Sd_iniOK => Sdram_ini_0_Sd_iniOK, 
        ini_state(2) => \Sdram_ini_0_ini_state_[2]\, ini_state(1)
         => \Sdram_ini_0_ini_state_[1]\, ini_state(0) => 
        \Sdram_ini_0_ini_state_[0]\);
    
    Sdram_ctl_v2_0 : entity work.Sdram_ctl_v2
      port map(Sysclk => Sysclk, SysRst_n => rst_n, Fifo_RAfull
         => Fifo_RAfull, Fifo_Wafull => Fifo_Wafull, SD_iniOK => 
        Sdram_ini_0_Sd_iniOK, SD_WrOK => SDRAM_wr_0_SD_WrOK, 
        SD_RdOK => SDram_rd_0_SD_RdOK, SD_refOK => 
        SDRAM_Ref_0_SD_refOK, LVDS_En => LVDS_En, SDRAM_En => 
        SDRAM_En, SD_pdEN => Sdram_ctl_v2_0_SD_pdEN, SD_iniEn => 
        Sdram_ctl_v2_0_SD_iniEn, SD_RefEn => 
        Sdram_ctl_v2_0_SD_RefEn, SD_wrEn => 
        Sdram_ctl_v2_0_SD_wrEn, SD_rdEn => Sdram_ctl_v2_0_SD_rdEn, 
        SD_rdEN_noact => Sdram_ctl_v2_0_SD_rdEN_noact, ClkEN => 
        Sdram_ctl_v2_0_ClkEN);
    

end DEF_ARCH; 
