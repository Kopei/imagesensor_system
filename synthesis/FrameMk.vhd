-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingle is

    port( RE         : out   std_logic;
          SysRst_n_c : in    std_logic;
          SysClk_c   : in    std_logic;
          REen       : in    std_logic
        );

end WaveGenSingle;

architecture DEF_ARCH of WaveGenSingle is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component AX1D
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \PrState_ns_0_0_a2_0_4[4]\, 
        \PrState_ns_0_0_a2_0_2[4]\, \PrState_ns_0_0_a2_0_1[4]\, 
        N_120, \CycCnt[10]_net_1\, \PrState_ns_0_0_a2_0_0[4]\, 
        \CycCnt[9]_net_1\, \PrState[1]_net_1\, \CycCnt[11]_net_1\, 
        \Phase2Cnt[3]_net_1\, \PrState_ns_0_0_0[2]\, 
        \PrState_ns_0_0_a2_1_0[2]\, \PrState_ns_0_0_a2_1_1[2]\, 
        N_52, \PrState_ns_0_0_a2_2[2]\, \PrState_ns_0_0_a2_0[2]\, 
        CycCntlde_0_a2_2, CycCntlde_0_a2_0, \PrState[2]_net_1\, 
        \PrState[0]_net_1\, \PrState[3]_net_1\, 
        \PrState_ns_0_i_0[1]\, \PrState[4]_net_1\, 
        \PrState_ns_0_0_a2_2_7[2]\, N_218, 
        \PrState_ns_0_0_a2_2_6[2]\, \CycCnt[7]_net_1\, 
        \CycCnt[4]_net_1\, \PrState_ns_0_0_a2_2_3[2]\, 
        \PrState_ns_0_0_a2_2_5[2]\, \CycCnt[6]_net_1\, 
        \CycCnt[5]_net_1\, \PrState_ns_0_0_a2_2_1[2]\, 
        \CycCnt[8]_net_1\, \CycCnt[2]_net_1\, \CycCnt[3]_net_1\, 
        \PrState_ns_0_i_a2_0_0[1]\, \PrState_ns_0_i_a2_0_1[1]\, 
        \PrState_ns_0_i_a2_0_0_0[1]\, \PrState_ns_i_0_a2_2[0]\, 
        N_23, N_212, N_34, N_25, \DelayCnt_i[5]\, N_38, N_214, 
        N_220, N_215, N_221, N_18, N_222, N_30, 
        \DelayCnt[2]_net_1\, N_211_i_0, \PrState_ns[2]\, N_11, 
        \Phase1Cnt[0]_net_1\, N_20, N_223, N_12, N_219, N_10, 
        N_22, N_56, N_233, \PrState_RNO_1[1]_net_1\, N_35, N_14, 
        N_54, N_21, \Phase2Cnt[0]_net_1\, \Phase2Cnt[1]_net_1\, 
        \DelayCnt[4]_net_1\, \DelayCnt[6]_net_1\, N_36, N_88_i_i, 
        N_58, \Phase2Cnt[2]_net_1\, DelayCnt_n0, 
        \DelayCnt[0]_net_1\, \DelayCnt[1]_net_1\, N_27, N_44_i, 
        \DelayCnt[3]_net_1\, N_60, \DelayCnt_RNO[3]_net_1\, N_59, 
        \DelayCnt_RNO[4]_net_1\, \CycCnt[1]_net_1\, 
        \CycCnt[0]_net_1\, CycCnt_n11, N_81, N_19, CycCnt_n0, 
        N_91, \PrState_ns[4]\, N_84, \CycCnt_RNIJV8E[9]_net_1\, 
        N_28, CycCnt_n10, CycCnt_n9, \PrState_RNO[4]_net_1\, N_29, 
        CycCnte, \GND\, \VCC\, GND_0, VCC_0 : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => RE);
    
    \CycCnt[11]\ : DFN1E1C0
      port map(D => CycCnt_n11, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => CycCnte, Q => \CycCnt[11]_net_1\);
    
    \PrState[2]\ : DFN1C0
      port map(D => \PrState_ns[2]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \PrState[2]_net_1\);
    
    \PrState_RNO_3[2]\ : NOR2B
      port map(A => \Phase2Cnt[3]_net_1\, B => \PrState[1]_net_1\, 
        Y => \PrState_ns_0_0_a2_0[2]\);
    
    \DelayCnt[6]\ : DFN1C0
      port map(D => N_27, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DelayCnt[6]_net_1\);
    
    \DelayCnt_RNIATS6[3]\ : NOR2B
      port map(A => N_36, B => N_34, Y => N_60);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => SysClk_c, CLR => SysRst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \CycCnt_RNIP5I8[5]\ : OR2A
      port map(A => \CycCnt[5]_net_1\, B => N_221, Y => N_222);
    
    \CycCnt_RNO_0[11]\ : OR2B
      port map(A => \CycCnt_RNIJV8E[9]_net_1\, B => 
        \CycCnt[10]_net_1\, Y => N_81);
    
    \CycCnt_RNO[7]\ : XA1B
      port map(A => \CycCnt[7]_net_1\, B => N_223, C => 
        \PrState[4]_net_1\, Y => N_20);
    
    \PrState_RNO_4[0]\ : NOR2B
      port map(A => \CycCnt[11]_net_1\, B => \Phase2Cnt[3]_net_1\, 
        Y => \PrState_ns_0_0_a2_0_0[4]\);
    
    \PrState_RNO_0[0]\ : NOR3B
      port map(A => \PrState_ns_0_0_a2_0_2[4]\, B => 
        \PrState_ns_0_0_a2_0_1[4]\, C => N_120, Y => 
        \PrState_ns_0_0_a2_0_4[4]\);
    
    \DelayCnt_RNO_0[3]\ : NOR2B
      port map(A => N_34, B => \DelayCnt[2]_net_1\, Y => N_59);
    
    \Phase2Cnt_RNO[2]\ : XA1
      port map(A => N_58, B => \Phase2Cnt[2]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_88_i_i);
    
    \Phase1Cnt_RNIQTK9[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => N_35);
    
    \PrState_RNO_4[2]\ : NOR3C
      port map(A => \CycCnt[7]_net_1\, B => \CycCnt[4]_net_1\, C
         => \PrState_ns_0_0_a2_2_3[2]\, Y => 
        \PrState_ns_0_0_a2_2_6[2]\);
    
    \DelayCnt_RNO[1]\ : NOR3A
      port map(A => \PrState[3]_net_1\, B => N_212, C => N_34, Y
         => N_23);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[1]_net_1\, C => \PrState[1]_net_1\, Y => N_21);
    
    \CycCnt_RNI39RC[8]\ : OR3C
      port map(A => \CycCnt[7]_net_1\, B => N_223, C => 
        \CycCnt[8]_net_1\, Y => N_56);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_22, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_215, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_220, C => 
        \PrState[4]_net_1\, Y => N_214);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => SysClk_c, CLR => SysRst_n_c, 
        E => CycCnte, Q => \CycCnt[0]_net_1\);
    
    \PrState_RNO_1[3]\ : OAI1
      port map(A => \PrState[3]_net_1\, B => \PrState[4]_net_1\, 
        C => REen, Y => \PrState_ns_0_i_0[1]\);
    
    \PrState_RNO_10[2]\ : NOR2B
      port map(A => \CycCnt[8]_net_1\, B => \CycCnt[11]_net_1\, Y
         => \PrState_ns_0_0_a2_2_3[2]\);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_56, C => 
        \PrState[4]_net_1\, Y => CycCnt_n9);
    
    \PrState[1]\ : DFN1C0
      port map(D => N_14, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \PrState[1]_net_1\);
    
    \DelayCnt_RNO[4]\ : XA1
      port map(A => \DelayCnt[4]_net_1\, B => N_60, C => 
        \PrState[3]_net_1\, Y => \DelayCnt_RNO[4]_net_1\);
    
    \CycCnt_RNO[6]\ : XA1C
      port map(A => \CycCnt[6]_net_1\, B => N_222, C => 
        \PrState[4]_net_1\, Y => N_18);
    
    \CycCnt_RNO_0[8]\ : AOI1
      port map(A => N_223, B => \CycCnt[7]_net_1\, C => 
        \CycCnt[8]_net_1\, Y => N_233);
    
    \PrState_RNO_0[2]\ : NOR3B
      port map(A => \PrState_ns_0_0_a2_0[2]\, B => REen, C => 
        N_120, Y => \PrState_ns_0_0_a2_2[2]\);
    
    \Phase2Cnt[3]\ : DFN1C0
      port map(D => N_28, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \Phase2Cnt[3]_net_1\);
    
    \DelayCnt_RNIJEE3_0[1]\ : NOR2
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_212);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_10, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_219, C => 
        \PrState[4]_net_1\, Y => N_12);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_218, C => 
        \PrState[4]_net_1\, Y => N_10);
    
    \CycCnt_RNIFCR2[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => \CycCnt[0]_net_1\, Y
         => N_218);
    
    \PrState_RNO[2]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_2[2]\, B => N_211_i_0, C
         => \PrState_ns_0_0_0[2]\, Y => \PrState_ns[2]\);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => \PrState[4]_net_1\, B => \CycCnt[0]_net_1\, Y
         => CycCnt_n0);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_30, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \DelayCnt[5]\ : DFN1P0
      port map(D => N_25, CLK => SysClk_c, PRE => SysRst_n_c, Q
         => \DelayCnt_i[5]\);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_18, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \PrState_RNO_0[1]\ : NOR2
      port map(A => \PrState[1]_net_1\, B => N_35, Y => N_54);
    
    \Phase2Cnt[2]\ : DFN1C0
      port map(D => N_88_i_i, CLK => SysClk_c, CLR => SysRst_n_c, 
        Q => \Phase2Cnt[2]_net_1\);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => N_35, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \Phase1Cnt[0]_net_1\);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_23, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \PrState_RNIJJK61[4]\ : AO1A
      port map(A => N_120, B => CycCntlde_0_a2_2, C => 
        \PrState[4]_net_1\, Y => CycCnte);
    
    \CycCnt_RNIJV8E[9]\ : NOR2A
      port map(A => \CycCnt[9]_net_1\, B => N_56, Y => 
        \CycCnt_RNIJV8E[9]_net_1\);
    
    \CycCnt_RNIDF47[4]\ : OR2B
      port map(A => N_220, B => \CycCnt[4]_net_1\, Y => N_221);
    
    \PrState_RNO_7[2]\ : OR2B
      port map(A => REen, B => \PrState[3]_net_1\, Y => 
        \PrState_ns_0_0_a2_1_0[2]\);
    
    \PrState_RNO_0[3]\ : OR2
      port map(A => \PrState_ns_0_i_a2_0_0[1]\, B => 
        \PrState[4]_net_1\, Y => \PrState_ns_0_i_a2_0_0_0[1]\);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_12, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \PrState_RNO_11[2]\ : NOR2B
      port map(A => \CycCnt[2]_net_1\, B => \CycCnt[3]_net_1\, Y
         => \PrState_ns_0_0_a2_2_1[2]\);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => N_29);
    
    \DelayCnt_RNIAM55[6]\ : OR3C
      port map(A => \DelayCnt[4]_net_1\, B => \DelayCnt[6]_net_1\, 
        C => \DelayCnt_i[5]\, Y => \PrState_ns_0_i_a2_0_0[1]\);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => \DelayCnt_RNO[3]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \DelayCnt[3]_net_1\);
    
    \PrState_RNO[1]\ : NOR3A
      port map(A => REen, B => N_54, C => 
        \PrState_RNO_1[1]_net_1\, Y => N_14);
    
    \PrState[4]\ : DFN1P0
      port map(D => \PrState_RNO[4]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, Q => \PrState[4]_net_1\);
    
    \DelayCnt_RNIATS6[1]\ : OR2B
      port map(A => N_212, B => N_36, Y => 
        \PrState_ns_0_i_a2_0_1[1]\);
    
    \PrState_RNO_9[2]\ : OR3C
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        C => REen, Y => N_52);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \DelayCnt_RNO[6]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => N_44_i, Y => N_27);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => \PrState[4]_net_1\, Y => N_19);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_19, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \CycCnt_RNI2PM5[3]\ : NOR2B
      port map(A => N_219, B => \CycCnt[3]_net_1\, Y => N_220);
    
    \DelayCnt_RNO[2]\ : XA1
      port map(A => \DelayCnt[2]_net_1\, B => N_34, C => 
        \PrState[3]_net_1\, Y => N_30);
    
    \DelayCnt[4]\ : DFN1C0
      port map(D => \DelayCnt_RNO[4]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \DelayCnt[4]_net_1\);
    
    \CycCnt_RNO[10]\ : XA1B
      port map(A => \CycCnt[10]_net_1\, B => 
        \CycCnt_RNIJV8E[9]_net_1\, C => \PrState[4]_net_1\, Y => 
        CycCnt_n10);
    
    \DelayCnt_RNO_0[6]\ : AX1D
      port map(A => \DelayCnt_i[5]\, B => N_38, C => 
        \DelayCnt[6]_net_1\, Y => N_44_i);
    
    \DelayCnt_RNO[3]\ : XA1
      port map(A => \DelayCnt[3]_net_1\, B => N_59, C => 
        \PrState[3]_net_1\, Y => \DelayCnt_RNO[3]_net_1\);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_21, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \PrState_RNO_3[0]\ : NOR2B
      port map(A => \PrState[1]_net_1\, B => REen, Y => 
        \PrState_ns_0_0_a2_0_1[4]\);
    
    \DelayCnt_RNO[5]\ : XAI1
      port map(A => \DelayCnt_i[5]\, B => N_38, C => 
        \PrState[3]_net_1\, Y => N_25);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \PrState[0]\ : DFN1C0
      port map(D => \PrState_ns[4]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \PrState[0]_net_1\);
    
    \DelayCnt_RNIJEE3[1]\ : NOR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_34);
    
    \PrState_RNI5SRD[2]\ : NOR3B
      port map(A => \Phase2Cnt[3]_net_1\, B => CycCntlde_0_a2_0, 
        C => \PrState[2]_net_1\, Y => CycCntlde_0_a2_2);
    
    \Phase2Cnt_RNI84LM[1]\ : OR3
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[1]_net_1\, C => \Phase2Cnt[2]_net_1\, Y => 
        N_120);
    
    \PrState_RNO_6[2]\ : NOR3B
      port map(A => \CycCnt[10]_net_1\, B => N_218, C => 
        \CycCnt[9]_net_1\, Y => \PrState_ns_0_0_a2_2_7[2]\);
    
    \CycCnt_RNIO294[2]\ : NOR2B
      port map(A => N_218, B => \CycCnt[2]_net_1\, Y => N_219);
    
    \PrState_RNO_5[2]\ : NOR3C
      port map(A => \CycCnt[6]_net_1\, B => \CycCnt[5]_net_1\, C
         => \PrState_ns_0_0_a2_2_1[2]\, Y => 
        \PrState_ns_0_0_a2_2_5[2]\);
    
    \CycCnt_RNO[11]\ : XA1C
      port map(A => \CycCnt[11]_net_1\, B => N_81, C => 
        \PrState[4]_net_1\, Y => CycCnt_n11);
    
    \Phase2Cnt_RNO[3]\ : XA1A
      port map(A => N_84, B => \Phase2Cnt[3]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_28);
    
    \Phase2Cnt_RNIF93F[1]\ : NOR2B
      port map(A => \Phase2Cnt[1]_net_1\, B => 
        \Phase2Cnt[0]_net_1\, Y => N_58);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_214, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \PrState_RNO[3]\ : OA1B
      port map(A => \PrState_ns_0_i_a2_0_1[1]\, B => 
        \PrState_ns_0_i_a2_0_0_0[1]\, C => \PrState_ns_0_i_0[1]\, 
        Y => N_11);
    
    \DelayCnt_RNINEE3[3]\ : NOR2B
      port map(A => \DelayCnt[3]_net_1\, B => \DelayCnt[2]_net_1\, 
        Y => N_36);
    
    \CycCnt_RNI6SV9[6]\ : NOR2A
      port map(A => \CycCnt[6]_net_1\, B => N_222, Y => N_223);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_20, CLK => SysClk_c, CLR => SysRst_n_c, E
         => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \CycCnt[10]\ : DFN1E1C0
      port map(D => CycCnt_n10, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => CycCnte, Q => \CycCnt[10]_net_1\);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_11, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \PrState[3]_net_1\);
    
    \PrState_RNO_1[2]\ : OR3C
      port map(A => \PrState_ns_0_0_a2_2_6[2]\, B => 
        \PrState_ns_0_0_a2_2_5[2]\, C => 
        \PrState_ns_0_0_a2_2_7[2]\, Y => N_211_i_0);
    
    \PrState_RNI7I64[0]\ : NOR2
      port map(A => \PrState[0]_net_1\, B => \PrState[3]_net_1\, 
        Y => CycCntlde_0_a2_0);
    
    \PrState_RNO[0]\ : AO1A
      port map(A => N_56, B => \PrState_ns_0_0_a2_0_4[4]\, C => 
        N_91, Y => \PrState_ns[4]\);
    
    \Phase2Cnt_RNO_0[3]\ : OR2B
      port map(A => \Phase2Cnt[2]_net_1\, B => N_58, Y => N_84);
    
    \PrState_RNO_0[4]\ : NOR3A
      port map(A => CycCntlde_0_a2_0, B => \PrState[2]_net_1\, C
         => \PrState[1]_net_1\, Y => \PrState_ns_i_0_a2_2[0]\);
    
    \CycCnt_RNO[5]\ : XA1C
      port map(A => \CycCnt[5]_net_1\, B => N_221, C => 
        \PrState[4]_net_1\, Y => N_215);
    
    \PrState_RNO_8[2]\ : OR2
      port map(A => \PrState_ns_0_i_a2_0_0[1]\, B => 
        \PrState_ns_0_i_a2_0_1[1]\, Y => 
        \PrState_ns_0_0_a2_1_1[2]\);
    
    \PrState_RNO_2[0]\ : NOR3B
      port map(A => \CycCnt[10]_net_1\, B => 
        \PrState_ns_0_0_a2_0_0[4]\, C => \CycCnt[9]_net_1\, Y => 
        \PrState_ns_0_0_a2_0_2[4]\);
    
    \DelayCnt_RNIN4K8[4]\ : OR2B
      port map(A => N_60, B => \DelayCnt[4]_net_1\, Y => N_38);
    
    \CycCnt_RNO[8]\ : NOR3A
      port map(A => N_56, B => N_233, C => \PrState[4]_net_1\, Y
         => N_22);
    
    \PrState_RNO_2[2]\ : OA1
      port map(A => \PrState_ns_0_0_a2_1_0[2]\, B => 
        \PrState_ns_0_0_a2_1_1[2]\, C => N_52, Y => 
        \PrState_ns_0_0_0[2]\);
    
    \PrState_RNO_1[1]\ : NOR3A
      port map(A => \Phase2Cnt[3]_net_1\, B => N_35, C => N_120, 
        Y => \PrState_RNO_1[1]_net_1\);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => N_29, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \Phase2Cnt[0]_net_1\);
    
    \PrState_RNO[4]\ : OA1C
      port map(A => \PrState_ns_i_0_a2_2[0]\, B => 
        \PrState[4]_net_1\, C => REen, Y => 
        \PrState_RNO[4]_net_1\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    \PrState_RNO_1[0]\ : NOR2B
      port map(A => REen, B => \PrState[0]_net_1\, Y => N_91);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    \DelayCnt_RNO[0]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity ByteData is

    port( Fifo_dout    : out   std_logic_vector(7 downto 0);
          data_reg_6   : in    std_logic;
          data_reg_0   : in    std_logic;
          data_reg_5   : in    std_logic;
          data_reg_2   : in    std_logic;
          ByteData_VCC : in    std_logic;
          ByteData_GND : in    std_logic;
          LVDS_en_c    : in    std_logic;
          SysClk_c     : in    std_logic;
          WE           : in    std_logic;
          RE           : in    std_logic
        );

end ByteData;

architecture DEF_ARCH of ByteData is 

  component XNOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component RAM4K9
    generic (MEMORYFILE:string := "");

    port( ADDRA11 : in    std_logic := 'U';
          ADDRA10 : in    std_logic := 'U';
          ADDRA9  : in    std_logic := 'U';
          ADDRA8  : in    std_logic := 'U';
          ADDRA7  : in    std_logic := 'U';
          ADDRA6  : in    std_logic := 'U';
          ADDRA5  : in    std_logic := 'U';
          ADDRA4  : in    std_logic := 'U';
          ADDRA3  : in    std_logic := 'U';
          ADDRA2  : in    std_logic := 'U';
          ADDRA1  : in    std_logic := 'U';
          ADDRA0  : in    std_logic := 'U';
          ADDRB11 : in    std_logic := 'U';
          ADDRB10 : in    std_logic := 'U';
          ADDRB9  : in    std_logic := 'U';
          ADDRB8  : in    std_logic := 'U';
          ADDRB7  : in    std_logic := 'U';
          ADDRB6  : in    std_logic := 'U';
          ADDRB5  : in    std_logic := 'U';
          ADDRB4  : in    std_logic := 'U';
          ADDRB3  : in    std_logic := 'U';
          ADDRB2  : in    std_logic := 'U';
          ADDRB1  : in    std_logic := 'U';
          ADDRB0  : in    std_logic := 'U';
          DINA8   : in    std_logic := 'U';
          DINA7   : in    std_logic := 'U';
          DINA6   : in    std_logic := 'U';
          DINA5   : in    std_logic := 'U';
          DINA4   : in    std_logic := 'U';
          DINA3   : in    std_logic := 'U';
          DINA2   : in    std_logic := 'U';
          DINA1   : in    std_logic := 'U';
          DINA0   : in    std_logic := 'U';
          DINB8   : in    std_logic := 'U';
          DINB7   : in    std_logic := 'U';
          DINB6   : in    std_logic := 'U';
          DINB5   : in    std_logic := 'U';
          DINB4   : in    std_logic := 'U';
          DINB3   : in    std_logic := 'U';
          DINB2   : in    std_logic := 'U';
          DINB1   : in    std_logic := 'U';
          DINB0   : in    std_logic := 'U';
          WIDTHA0 : in    std_logic := 'U';
          WIDTHA1 : in    std_logic := 'U';
          WIDTHB0 : in    std_logic := 'U';
          WIDTHB1 : in    std_logic := 'U';
          PIPEA   : in    std_logic := 'U';
          PIPEB   : in    std_logic := 'U';
          WMODEA  : in    std_logic := 'U';
          WMODEB  : in    std_logic := 'U';
          BLKA    : in    std_logic := 'U';
          BLKB    : in    std_logic := 'U';
          WENA    : in    std_logic := 'U';
          WENB    : in    std_logic := 'U';
          CLKA    : in    std_logic := 'U';
          CLKB    : in    std_logic := 'U';
          RESET   : in    std_logic := 'U';
          DOUTA8  : out   std_logic;
          DOUTA7  : out   std_logic;
          DOUTA6  : out   std_logic;
          DOUTA5  : out   std_logic;
          DOUTA4  : out   std_logic;
          DOUTA3  : out   std_logic;
          DOUTA2  : out   std_logic;
          DOUTA1  : out   std_logic;
          DOUTA0  : out   std_logic;
          DOUTB8  : out   std_logic;
          DOUTB7  : out   std_logic;
          DOUTB6  : out   std_logic;
          DOUTB5  : out   std_logic;
          DOUTB4  : out   std_logic;
          DOUTB3  : out   std_logic;
          DOUTB2  : out   std_logic;
          DOUTB1  : out   std_logic;
          DOUTB0  : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component INV
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component NAND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

    signal AO1_21_Y, XOR2_53_Y, AO1_2_Y, AND2_1_Y, AO1_37_Y, 
        XOR2_4_Y, AND2_30_Y, AND2_53_Y, XOR2_9_Y, XOR2_3_Y, 
        RBINNXTSHIFT_11_net, XOR2_76_Y, AO1_36_Y, XNOR2_16_Y, 
        RBINNXTSHIFT_8_net, MEM_WADDR_8_net, AO1_33_Y, AND2_31_Y, 
        AO1_8_Y, XNOR2_23_Y, RBINNXTSHIFT_10_net, 
        MEM_WADDR_10_net, XOR2_50_Y, AO1_16_Y, AND2_26_Y, 
        AND2_17_Y, XNOR2_4_Y, AND2_48_Y, AO1_18_Y, AO1_32_Y, 
        RBINNXTSHIFT_7_net, XOR2_63_Y, AO1_30_Y, AND2_15_Y, 
        AND2_46_Y, XOR2_29_Y, XNOR2_24_Y, RBINNXTSHIFT_4_net, 
        MEM_WADDR_4_net, RBINNXTSHIFT_5_net, XOR2_20_Y, AO1_11_Y, 
        AND3_9_Y, XNOR2_18_Y, XNOR2_20_Y, XNOR2_10_Y, 
        MEM_WADDR_5_net, AO1_6_Y, AO1_14_Y, XNOR2_22_Y, 
        RBINNXTSHIFT_12_net, MEM_WADDR_12_net, MEMORYRE, 
        NAND2_1_Y, AND2_3_Y, RBINNXTSHIFT_6_net, MEM_WADDR_6_net, 
        AND2_19_Y, XOR2_10_Y, XOR2_23_Y, MEM_WADDR_7_net, 
        MEM_WADDR_11_net, AND3_8_Y, AND3_7_Y, AND3_6_Y, XOR2_68_Y, 
        XOR2_72_Y, XOR2_74_Y, AO1_34_Y, AND2_56_Y, AO1_0_Y, 
        XOR2_6_Y, AND2_61_Y, AND2_35_Y, AND3_0_Y, XNOR2_9_Y, 
        XOR2_73_Y, EMPTYINT, MEM_RADDR_0_net, AND2_4_Y, AND2_14_Y, 
        RBINNXTSHIFT_9_net, XOR2_8_Y, AO1_7_Y, XOR2_14_Y, 
        AND2_24_Y, MEM_WADDR_9_net, XNOR2_14_Y, AND2_25_Y, 
        AND2_59_Y, AND2_44_Y, XNOR2_8_Y, MEM_RADDR_7_net, 
        WBINNXTSHIFT_7_net, AO1_4_Y, XOR2_47_Y, AND2_52_Y, 
        AND2_13_Y, AND3_4_Y, XNOR2_15_Y, XNOR2_2_Y, 
        WBINNXTSHIFT_11_net, XOR2_49_Y, AO1_29_Y, AO1_27_Y, 
        XOR2_19_Y, AO1_5_Y, AND2_58_Y, AO1_25_Y, AO1_23_Y, 
        XNOR2_5_Y, MEM_RADDR_5_net, WBINNXTSHIFT_5_net, FULLINT, 
        AND3_1_Y, XOR2_40_Y, XOR2_62_Y, XOR2_58_Y, XOR2_24_Y, 
        AO1_10_Y, AO1_19_Y, AND2_49_Y, WBINNXTSHIFT_10_net, 
        XOR2_27_Y, AO1_12_Y, XOR2_38_Y, AO1_13_Y, AND2_43_Y, 
        AO1_28_Y, AND2_54_Y, XOR2_16_Y, XOR2_66_Y, XOR2_60_Y, 
        AND2_2_Y, XOR2_0_Y, AO1_9_Y, AO1_3_Y, MEM_RADDR_12_net, 
        WBINNXTSHIFT_12_net, AO1_20_Y, AND2_9_Y, AND2_6_Y, 
        MEMORYWE, NAND2_0_Y, AND2_27_Y, MEM_WADDR_0_net, AND2_8_Y, 
        AO1_17_Y, AND3_2_Y, AND3_5_Y, AND3_3_Y, MEM_RADDR_6_net, 
        WBINNXTSHIFT_6_net, XNOR2_3_Y, MEM_RADDR_9_net, 
        WBINNXTSHIFT_9_net, AND2_10_Y, AO1_1_Y, XOR2_30_Y, 
        AND2_45_Y, XNOR2_11_Y, MEM_RADDR_11_net, XOR2_59_Y, 
        XNOR2_6_Y, MEM_RADDR_10_net, WBINNXTSHIFT_4_net, 
        XOR2_75_Y, XOR2_12_Y, XNOR2_0_Y, MEM_RADDR_4_net, 
        AND2_65_Y, WBINNXTSHIFT_8_net, XOR2_1_Y, MEM_RADDR_8_net, 
        XNOR2_19_Y, XOR2_61_Y, XOR2_36_Y, MEM_RADDR_1_net, 
        RBINNXTSHIFT_2_net, XOR2_34_Y, RBINNXTSHIFT_3_net, 
        MEM_WADDR_3_net, \DFN1P0_EMPTY\, WBINNXTSHIFT_1_net, 
        XOR2_48_Y, RAM4K9_QXI_3_DOUTA0, RAM4K9_QXI_3_inst_DOUTA1, 
        RAM4K9_QXI_3_inst_DOUTA2, RAM4K9_QXI_3_inst_DOUTA3, 
        RAM4K9_QXI_3_inst_DOUTA4, RAM4K9_QXI_3_inst_DOUTA5, 
        RAM4K9_QXI_3_inst_DOUTA6, RAM4K9_QXI_3_inst_DOUTA7, 
        RAM4K9_QXI_3_inst_DOUTA8, QXI_3_net, 
        RAM4K9_QXI_3_inst_DOUTB1, RAM4K9_QXI_3_inst_DOUTB2, 
        RAM4K9_QXI_3_inst_DOUTB3, RAM4K9_QXI_3_inst_DOUTB4, 
        RAM4K9_QXI_3_inst_DOUTB5, RAM4K9_QXI_3_inst_DOUTB6, 
        RAM4K9_QXI_3_inst_DOUTB7, RAM4K9_QXI_3_inst_DOUTB8, 
        MEM_WADDR_1_net, MEM_WADDR_2_net, MEM_RADDR_2_net, 
        MEM_RADDR_3_net, MEMWENEG, MEMRENEG, XNOR2_17_Y, 
        XOR2_41_Y, AND2_50_Y, RBINNXTSHIFT_0_net, XNOR2_12_Y, 
        XNOR2_7_Y, XNOR2_13_Y, RBINNXTSHIFT_1_net, AND2_41_Y, 
        XOR2_51_Y, QXI_2_net, DVLDI, RAM4K9_QXI_5_DOUTA0, 
        RAM4K9_QXI_5_inst_DOUTA1, RAM4K9_QXI_5_inst_DOUTA2, 
        RAM4K9_QXI_5_inst_DOUTA3, RAM4K9_QXI_5_inst_DOUTA4, 
        RAM4K9_QXI_5_inst_DOUTA5, RAM4K9_QXI_5_inst_DOUTA6, 
        RAM4K9_QXI_5_inst_DOUTA7, RAM4K9_QXI_5_inst_DOUTA8, 
        QXI_5_net, RAM4K9_QXI_5_inst_DOUTB1, 
        RAM4K9_QXI_5_inst_DOUTB2, RAM4K9_QXI_5_inst_DOUTB3, 
        RAM4K9_QXI_5_inst_DOUTB4, RAM4K9_QXI_5_inst_DOUTB5, 
        RAM4K9_QXI_5_inst_DOUTB6, RAM4K9_QXI_5_inst_DOUTB7, 
        RAM4K9_QXI_5_inst_DOUTB8, XOR2_65_Y, XOR2_69_Y, XOR2_7_Y, 
        AND2_33_Y, AO1_26_Y, AND2A_0_Y, AO1_15_Y, \DFN1C0_FULL\, 
        XOR2_11_Y, RAM4K9_QXI_4_DOUTA0, RAM4K9_QXI_4_inst_DOUTA1, 
        RAM4K9_QXI_4_inst_DOUTA2, RAM4K9_QXI_4_inst_DOUTA3, 
        RAM4K9_QXI_4_inst_DOUTA4, RAM4K9_QXI_4_inst_DOUTA5, 
        RAM4K9_QXI_4_inst_DOUTA6, RAM4K9_QXI_4_inst_DOUTA7, 
        RAM4K9_QXI_4_inst_DOUTA8, QXI_4_net, 
        RAM4K9_QXI_4_inst_DOUTB1, RAM4K9_QXI_4_inst_DOUTB2, 
        RAM4K9_QXI_4_inst_DOUTB3, RAM4K9_QXI_4_inst_DOUTB4, 
        RAM4K9_QXI_4_inst_DOUTB5, RAM4K9_QXI_4_inst_DOUTB6, 
        RAM4K9_QXI_4_inst_DOUTB7, RAM4K9_QXI_4_inst_DOUTB8, 
        WBINNXTSHIFT_3_net, AND2_5_Y, WBINNXTSHIFT_2_net, 
        RAM4K9_QXI_0_DOUTA0, RAM4K9_QXI_0_inst_DOUTA1, 
        RAM4K9_QXI_0_inst_DOUTA2, RAM4K9_QXI_0_inst_DOUTA3, 
        RAM4K9_QXI_0_inst_DOUTA4, RAM4K9_QXI_0_inst_DOUTA5, 
        RAM4K9_QXI_0_inst_DOUTA6, RAM4K9_QXI_0_inst_DOUTA7, 
        RAM4K9_QXI_0_inst_DOUTA8, QXI_0_net, 
        RAM4K9_QXI_0_inst_DOUTB1, RAM4K9_QXI_0_inst_DOUTB2, 
        RAM4K9_QXI_0_inst_DOUTB3, RAM4K9_QXI_0_inst_DOUTB4, 
        RAM4K9_QXI_0_inst_DOUTB5, RAM4K9_QXI_0_inst_DOUTB6, 
        RAM4K9_QXI_0_inst_DOUTB7, RAM4K9_QXI_0_inst_DOUTB8, 
        XNOR2_1_Y, WBINNXTSHIFT_0_net, AO1_24_Y, XOR2_22_Y, 
        AND2_12_Y, AO1_35_Y, XNOR2_21_Y, RAM4K9_QXI_7_DOUTA0, 
        RAM4K9_QXI_7_inst_DOUTA1, RAM4K9_QXI_7_inst_DOUTA2, 
        RAM4K9_QXI_7_inst_DOUTA3, RAM4K9_QXI_7_inst_DOUTA4, 
        RAM4K9_QXI_7_inst_DOUTA5, RAM4K9_QXI_7_inst_DOUTA6, 
        RAM4K9_QXI_7_inst_DOUTA7, RAM4K9_QXI_7_inst_DOUTA8, 
        QXI_7_net, RAM4K9_QXI_7_inst_DOUTB1, 
        RAM4K9_QXI_7_inst_DOUTB2, RAM4K9_QXI_7_inst_DOUTB3, 
        RAM4K9_QXI_7_inst_DOUTB4, RAM4K9_QXI_7_inst_DOUTB5, 
        RAM4K9_QXI_7_inst_DOUTB6, RAM4K9_QXI_7_inst_DOUTB7, 
        RAM4K9_QXI_7_inst_DOUTB8, AND2_32_Y, QXI_6_net, 
        RAM4K9_QXI_1_DOUTA0, RAM4K9_QXI_1_inst_DOUTA1, 
        RAM4K9_QXI_1_inst_DOUTA2, RAM4K9_QXI_1_inst_DOUTA3, 
        RAM4K9_QXI_1_inst_DOUTA4, RAM4K9_QXI_1_inst_DOUTA5, 
        RAM4K9_QXI_1_inst_DOUTA6, RAM4K9_QXI_1_inst_DOUTA7, 
        RAM4K9_QXI_1_inst_DOUTA8, QXI_1_net, 
        RAM4K9_QXI_1_inst_DOUTB1, RAM4K9_QXI_1_inst_DOUTB2, 
        RAM4K9_QXI_1_inst_DOUTB3, RAM4K9_QXI_1_inst_DOUTB4, 
        RAM4K9_QXI_1_inst_DOUTB5, RAM4K9_QXI_1_inst_DOUTB6, 
        RAM4K9_QXI_1_inst_DOUTB7, RAM4K9_QXI_1_inst_DOUTB8, 
        RAM4K9_QXI_2_DOUTA0, RAM4K9_QXI_2_inst_DOUTA1, 
        RAM4K9_QXI_2_inst_DOUTA2, RAM4K9_QXI_2_inst_DOUTA3, 
        RAM4K9_QXI_2_inst_DOUTA4, RAM4K9_QXI_2_inst_DOUTA5, 
        RAM4K9_QXI_2_inst_DOUTA6, RAM4K9_QXI_2_inst_DOUTA7, 
        RAM4K9_QXI_2_inst_DOUTA8, RAM4K9_QXI_2_inst_DOUTB1, 
        RAM4K9_QXI_2_inst_DOUTB2, RAM4K9_QXI_2_inst_DOUTB3, 
        RAM4K9_QXI_2_inst_DOUTB4, RAM4K9_QXI_2_inst_DOUTB5, 
        RAM4K9_QXI_2_inst_DOUTB6, RAM4K9_QXI_2_inst_DOUTB7, 
        RAM4K9_QXI_2_inst_DOUTB8, RAM4K9_QXI_6_DOUTA0, 
        RAM4K9_QXI_6_inst_DOUTA1, RAM4K9_QXI_6_inst_DOUTA2, 
        RAM4K9_QXI_6_inst_DOUTA3, RAM4K9_QXI_6_inst_DOUTA4, 
        RAM4K9_QXI_6_inst_DOUTA5, RAM4K9_QXI_6_inst_DOUTA6, 
        RAM4K9_QXI_6_inst_DOUTA7, RAM4K9_QXI_6_inst_DOUTA8, 
        RAM4K9_QXI_6_inst_DOUTB1, RAM4K9_QXI_6_inst_DOUTB2, 
        RAM4K9_QXI_6_inst_DOUTB3, RAM4K9_QXI_6_inst_DOUTB4, 
        RAM4K9_QXI_6_inst_DOUTB5, RAM4K9_QXI_6_inst_DOUTB6, 
        RAM4K9_QXI_6_inst_DOUTB7, RAM4K9_QXI_6_inst_DOUTB8, \GND\, 
        \VCC\, GND_0, VCC_0 : std_logic;

begin 


    DFN1P0_EMPTY_RNO_10 : XNOR2
      port map(A => RBINNXTSHIFT_8_net, B => MEM_WADDR_8_net, Y
         => XNOR2_16_Y);
    
    AND2_2 : AND2
      port map(A => MEM_WADDR_10_net, B => ByteData_GND, Y => 
        AND2_2_Y);
    
    AND3_6 : AND3
      port map(A => XNOR2_14_Y, B => XNOR2_24_Y, C => XNOR2_10_Y, 
        Y => AND3_6_Y);
    
    XNOR2_13 : XNOR2
      port map(A => RBINNXTSHIFT_2_net, B => MEM_WADDR_2_net, Y
         => XNOR2_13_Y);
    
    DFN1C0_FULL : DFN1C0
      port map(D => FULLINT, CLK => SysClk_c, CLR => LVDS_en_c, Q
         => \DFN1C0_FULL\);
    
    XOR2_19 : XOR2
      port map(A => MEM_WADDR_8_net, B => ByteData_GND, Y => 
        XOR2_19_Y);
    
    AND2_44 : AND2
      port map(A => XOR2_0_Y, B => XOR2_47_Y, Y => AND2_44_Y);
    
    XOR2_23 : XOR2
      port map(A => MEM_RADDR_5_net, B => ByteData_GND, Y => 
        XOR2_23_Y);
    
    XOR2_1 : XOR2
      port map(A => MEM_WADDR_8_net, B => ByteData_GND, Y => 
        XOR2_1_Y);
    
    RAM4K9_QXI_1_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => ByteData_GND, DINB8 => 
        ByteData_GND, DINB7 => ByteData_GND, DINB6 => 
        ByteData_GND, DINB5 => ByteData_GND, DINB4 => 
        ByteData_GND, DINB3 => ByteData_GND, DINB2 => 
        ByteData_GND, DINB1 => ByteData_GND, DINB0 => 
        ByteData_GND, WIDTHA0 => ByteData_GND, WIDTHA1 => 
        ByteData_GND, WIDTHB0 => ByteData_GND, WIDTHB1 => 
        ByteData_GND, PIPEA => ByteData_GND, PIPEB => 
        ByteData_GND, WMODEA => ByteData_GND, WMODEB => 
        ByteData_GND, BLKA => MEMWENEG, BLKB => MEMRENEG, WENA
         => ByteData_GND, WENB => ByteData_VCC, CLKA => SysClk_c, 
        CLKB => SysClk_c, RESET => LVDS_en_c, DOUTA8 => 
        RAM4K9_QXI_1_inst_DOUTA8, DOUTA7 => 
        RAM4K9_QXI_1_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_1_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_1_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_1_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_1_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_1_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_1_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_1_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_1_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_1_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_1_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_1_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_1_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_1_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_1_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_1_inst_DOUTB1, DOUTB0 => QXI_1_net);
    
    XOR2_76_RNIU15J3 : XOR2
      port map(A => XOR2_76_Y, B => AO1_36_Y, Y => 
        RBINNXTSHIFT_11_net);
    
    DFN1C0_FULL_RNO_0 : AND3
      port map(A => XNOR2_3_Y, B => AND3_2_Y, C => AND2_65_Y, Y
         => AND3_1_Y);
    
    XOR2_29_RNIJ87E3 : XOR2
      port map(A => XOR2_29_Y, B => AO1_16_Y, Y => 
        RBINNXTSHIFT_10_net);
    
    XOR2_47 : XOR2
      port map(A => MEM_WADDR_7_net, B => ByteData_GND, Y => 
        XOR2_47_Y);
    
    XOR2_38 : XOR2
      port map(A => MEM_WADDR_5_net, B => ByteData_GND, Y => 
        XOR2_38_Y);
    
    AND2_15 : AND2
      port map(A => MEM_RADDR_2_net, B => ByteData_GND, Y => 
        AND2_15_Y);
    
    AND2_30_RNIRFBI : AO1
      port map(A => XOR2_4_Y, B => AND2_1_Y, C => AND2_30_Y, Y
         => AO1_37_Y);
    
    DFN1P0_EMPTY_RNO : AND2
      port map(A => AND3_0_Y, B => XNOR2_22_Y, Y => EMPTYINT);
    
    DFN1C0_MEM_WADDR_2_inst : DFN1C0
      port map(D => WBINNXTSHIFT_2_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_2_net);
    
    AND2_1 : AND2
      port map(A => MEM_RADDR_6_net, B => ByteData_GND, Y => 
        AND2_1_Y);
    
    XNOR2_21 : XNOR2
      port map(A => MEM_RADDR_2_net, B => WBINNXTSHIFT_2_net, Y
         => XNOR2_21_Y);
    
    AND2_49 : AND2
      port map(A => MEM_WADDR_4_net, B => ByteData_GND, Y => 
        AND2_49_Y);
    
    AND2_10 : AND2
      port map(A => MEM_WADDR_5_net, B => ByteData_GND, Y => 
        AND2_10_Y);
    
    XOR2_20 : XOR2
      port map(A => MEM_RADDR_5_net, B => ByteData_GND, Y => 
        XOR2_20_Y);
    
    DFN1E1C0_Q_2_inst : DFN1E1C0
      port map(D => QXI_2_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(2));
    
    XOR2_63 : XOR2
      port map(A => MEM_RADDR_7_net, B => ByteData_GND, Y => 
        XOR2_63_Y);
    
    XOR2_10_RNIM3DF : AND2
      port map(A => AND2_19_Y, B => AND2_31_Y, Y => AND2_3_Y);
    
    AND2_12 : AND2
      port map(A => XOR2_60_Y, B => XOR2_22_Y, Y => AND2_12_Y);
    
    AO1_15 : AO1
      port map(A => XOR2_7_Y, B => AND2_26_Y, C => AND2_32_Y, Y
         => AO1_15_Y);
    
    AND2_46_RNIUL2G1 : AO1
      port map(A => AND2_53_Y, B => AO1_14_Y, C => AO1_30_Y, Y
         => AO1_6_Y);
    
    XOR2_24 : XOR2
      port map(A => MEM_WADDR_7_net, B => ByteData_GND, Y => 
        XOR2_24_Y);
    
    DFN1C0_MEM_WADDR_10_inst : DFN1C0
      port map(D => WBINNXTSHIFT_10_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_10_net);
    
    DFN1C0_MEM_RADDR_0_inst : DFN1C0
      port map(D => RBINNXTSHIFT_0_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_0_net);
    
    DFN1C0_MEM_WADDR_6_inst : DFN1C0
      port map(D => WBINNXTSHIFT_6_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_6_net);
    
    AO1_35 : AO1
      port map(A => XOR2_22_Y, B => AND2_2_Y, C => AND2_5_Y, Y
         => AO1_35_Y);
    
    DFN1E1C0_Q_5_inst : DFN1E1C0
      port map(D => QXI_5_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(5));
    
    AND2_46 : AND2
      port map(A => MEM_RADDR_3_net, B => ByteData_GND, Y => 
        AND2_46_Y);
    
    XOR2_16 : XOR2
      port map(A => MEM_WADDR_2_net, B => ByteData_GND, Y => 
        XOR2_16_Y);
    
    XOR2_74_RNIFQ4E3 : XOR2
      port map(A => XOR2_74_Y, B => AO1_34_Y, Y => 
        RBINNXTSHIFT_12_net);
    
    XOR2_60 : XOR2
      port map(A => MEM_WADDR_10_net, B => ByteData_GND, Y => 
        XOR2_60_Y);
    
    XOR2_12_RNIV9VV1 : XOR2
      port map(A => XOR2_12_Y, B => AO1_13_Y, Y => 
        WBINNXTSHIFT_12_net);
    
    AO1_24 : AO1
      port map(A => XOR2_9_Y, B => AO1_14_Y, C => AND2_15_Y, Y
         => AO1_24_Y);
    
    AND2_43 : AND2
      port map(A => AND2_8_Y, B => AND2_12_Y, Y => AND2_43_Y);
    
    AND2_14_RNIH9RC : AO1
      port map(A => XOR2_23_Y, B => AND2_4_Y, C => AND2_14_Y, Y
         => AO1_8_Y);
    
    XOR2_72_RNICHII1 : XOR2
      port map(A => XOR2_72_Y, B => AO1_6_Y, Y => 
        RBINNXTSHIFT_4_net);
    
    RAM4K9_QXI_5_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => data_reg_5, DINB8 => ByteData_GND, 
        DINB7 => ByteData_GND, DINB6 => ByteData_GND, DINB5 => 
        ByteData_GND, DINB4 => ByteData_GND, DINB3 => 
        ByteData_GND, DINB2 => ByteData_GND, DINB1 => 
        ByteData_GND, DINB0 => ByteData_GND, WIDTHA0 => 
        ByteData_GND, WIDTHA1 => ByteData_GND, WIDTHB0 => 
        ByteData_GND, WIDTHB1 => ByteData_GND, PIPEA => 
        ByteData_GND, PIPEB => ByteData_GND, WMODEA => 
        ByteData_GND, WMODEB => ByteData_GND, BLKA => MEMWENEG, 
        BLKB => MEMRENEG, WENA => ByteData_GND, WENB => 
        ByteData_VCC, CLKA => SysClk_c, CLKB => SysClk_c, RESET
         => LVDS_en_c, DOUTA8 => RAM4K9_QXI_5_inst_DOUTA8, DOUTA7
         => RAM4K9_QXI_5_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_5_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_5_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_5_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_5_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_5_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_5_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_5_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_5_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_5_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_5_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_5_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_5_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_5_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_5_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_5_inst_DOUTB1, DOUTB0 => QXI_5_net);
    
    MEMWEBUBBLE : INV
      port map(A => MEMORYWE, Y => MEMWENEG);
    
    AND2_6 : AND2
      port map(A => MEM_WADDR_3_net, B => ByteData_GND, Y => 
        AND2_6_Y);
    
    AO1_28_RNIN6GT1 : AO1
      port map(A => AND2_43_Y, B => AO1_5_Y, C => AO1_28_Y, Y => 
        AO1_13_Y);
    
    XOR2_61 : XOR2
      port map(A => MEM_WADDR_9_net, B => ByteData_GND, Y => 
        XOR2_61_Y);
    
    AND2_44_RNIMG3H : AO1
      port map(A => AND2_44_Y, B => AO1_3_Y, C => AO1_4_Y, Y => 
        AO1_23_Y);
    
    XOR2_53_RNI6PEA : AND2
      port map(A => XOR2_53_Y, B => XOR2_4_Y, Y => AND2_31_Y);
    
    DFN1E1C0_Q_0_inst : DFN1E1C0
      port map(D => QXI_0_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(0));
    
    XOR2_8_RNIA71M3 : XOR2
      port map(A => XOR2_8_Y, B => AO1_7_Y, Y => 
        RBINNXTSHIFT_9_net);
    
    XOR2_49 : XOR2
      port map(A => MEM_WADDR_11_net, B => ByteData_GND, Y => 
        XOR2_49_Y);
    
    XNOR2_19 : XNOR2
      port map(A => MEM_RADDR_3_net, B => WBINNXTSHIFT_3_net, Y
         => XNOR2_19_Y);
    
    XOR2_WBINNXTSHIFT_2_inst : XOR2
      port map(A => XOR2_11_Y, B => AO1_1_Y, Y => 
        WBINNXTSHIFT_2_net);
    
    XOR2_4 : XOR2
      port map(A => MEM_RADDR_7_net, B => ByteData_GND, Y => 
        XOR2_4_Y);
    
    XOR2_59_RNI6M6H1 : XOR2
      port map(A => XOR2_59_Y, B => AO1_9_Y, Y => 
        WBINNXTSHIFT_6_net);
    
    DFN1C0_FULL_RNO_9 : XNOR2
      port map(A => MEM_RADDR_6_net, B => WBINNXTSHIFT_6_net, Y
         => XNOR2_15_Y);
    
    AND2_24 : AND2
      port map(A => MEM_RADDR_8_net, B => ByteData_GND, Y => 
        AND2_24_Y);
    
    XOR2_72 : XOR2
      port map(A => MEM_RADDR_4_net, B => ByteData_GND, Y => 
        XOR2_72_Y);
    
    DFN1P0_EMPTY_RNO_8 : XNOR2
      port map(A => RBINNXTSHIFT_6_net, B => MEM_WADDR_6_net, Y
         => XNOR2_18_Y);
    
    GND_i : GND
      port map(Y => \GND\);
    
    DFN1C0_MEM_RADDR_12_inst : DFN1C0
      port map(D => RBINNXTSHIFT_12_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_12_net);
    
    XOR2_WBINNXTSHIFT_0_inst : XOR2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => 
        WBINNXTSHIFT_0_net);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    DFN1C0_FULL_RNO_5 : AND3
      port map(A => XNOR2_15_Y, B => XNOR2_8_Y, C => XNOR2_2_Y, Y
         => AND3_4_Y);
    
    DFN1C0_MEM_RADDR_11_inst : DFN1C0
      port map(D => RBINNXTSHIFT_11_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_11_net);
    
    XOR2_8 : XOR2
      port map(A => MEM_RADDR_9_net, B => ByteData_GND, Y => 
        XOR2_8_Y);
    
    XOR2_30 : XOR2
      port map(A => MEM_WADDR_1_net, B => ByteData_GND, Y => 
        XOR2_30_Y);
    
    XOR2_RBINNXTSHIFT_2_inst : XOR2
      port map(A => XOR2_34_Y, B => AO1_14_Y, Y => 
        RBINNXTSHIFT_2_net);
    
    MEMREBUBBLE : INV
      port map(A => MEMORYRE, Y => MEMRENEG);
    
    AND2_35 : AND2
      port map(A => MEM_RADDR_1_net, B => ByteData_GND, Y => 
        AND2_35_Y);
    
    XOR2_RBINNXTSHIFT_0_inst : XOR2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        RBINNXTSHIFT_0_net);
    
    XOR2_34 : XOR2
      port map(A => MEM_RADDR_2_net, B => ByteData_GND, Y => 
        XOR2_34_Y);
    
    XOR2_WBINNXTSHIFT_1_inst : XOR2
      port map(A => XOR2_48_Y, B => AND2_27_Y, Y => 
        WBINNXTSHIFT_1_net);
    
    XOR2_73_RNIL7LB3 : XOR2
      port map(A => XOR2_73_Y, B => AO1_18_Y, Y => 
        RBINNXTSHIFT_8_net);
    
    DFN1C0_FULL_RNO_7 : XNOR2
      port map(A => MEM_RADDR_10_net, B => WBINNXTSHIFT_10_net, Y
         => XNOR2_6_Y);
    
    XOR2_10_RNIGAU4 : AND2
      port map(A => XOR2_10_Y, B => XOR2_23_Y, Y => AND2_19_Y);
    
    DFN1P0_EMPTY_RNO_4 : AND2
      port map(A => XNOR2_23_Y, B => XNOR2_4_Y, Y => AND2_17_Y);
    
    AND2_30 : AND2
      port map(A => MEM_RADDR_7_net, B => ByteData_GND, Y => 
        AND2_30_Y);
    
    AND2_14 : AND2
      port map(A => MEM_RADDR_5_net, B => ByteData_GND, Y => 
        AND2_14_Y);
    
    AND2_32 : AND2
      port map(A => MEM_RADDR_11_net, B => ByteData_GND, Y => 
        AND2_32_Y);
    
    AND2_10_RNIERA7 : AO1
      port map(A => XOR2_58_Y, B => AND2_49_Y, C => AND2_10_Y, Y
         => AO1_3_Y);
    
    DFN1C0_MEM_WADDR_5_inst : DFN1C0
      port map(D => WBINNXTSHIFT_5_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_5_net);
    
    DFN1C0_MEM_WADDR_0_inst_RNIJR36 : AND2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => 
        AND2_27_Y);
    
    XOR2_38_RNI7PP91 : XOR2
      port map(A => XOR2_38_Y, B => AO1_19_Y, Y => 
        WBINNXTSHIFT_5_net);
    
    AND2_30_RNIIIL91 : AO1
      port map(A => AND2_31_Y, B => AO1_8_Y, C => AO1_37_Y, Y => 
        AO1_33_Y);
    
    XOR2_75 : XOR2
      port map(A => MEM_WADDR_4_net, B => ByteData_GND, Y => 
        XOR2_75_Y);
    
    AND2_26 : AND2
      port map(A => MEM_RADDR_10_net, B => ByteData_GND, Y => 
        AND2_26_Y);
    
    XOR2_9 : XOR2
      port map(A => MEM_RADDR_2_net, B => ByteData_GND, Y => 
        XOR2_9_Y);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    AND3_5 : AND3
      port map(A => XNOR2_1_Y, B => XNOR2_17_Y, C => XNOR2_21_Y, 
        Y => AND3_5_Y);
    
    RAM4K9_QXI_4_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => ByteData_GND, DINB8 => 
        ByteData_GND, DINB7 => ByteData_GND, DINB6 => 
        ByteData_GND, DINB5 => ByteData_GND, DINB4 => 
        ByteData_GND, DINB3 => ByteData_GND, DINB2 => 
        ByteData_GND, DINB1 => ByteData_GND, DINB0 => 
        ByteData_GND, WIDTHA0 => ByteData_GND, WIDTHA1 => 
        ByteData_GND, WIDTHB0 => ByteData_GND, WIDTHB1 => 
        ByteData_GND, PIPEA => ByteData_GND, PIPEB => 
        ByteData_GND, WMODEA => ByteData_GND, WMODEB => 
        ByteData_GND, BLKA => MEMWENEG, BLKB => MEMRENEG, WENA
         => ByteData_GND, WENB => ByteData_VCC, CLKA => SysClk_c, 
        CLKB => SysClk_c, RESET => LVDS_en_c, DOUTA8 => 
        RAM4K9_QXI_4_inst_DOUTA8, DOUTA7 => 
        RAM4K9_QXI_4_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_4_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_4_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_4_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_4_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_4_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_4_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_4_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_4_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_4_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_4_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_4_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_4_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_4_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_4_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_4_inst_DOUTB1, DOUTB0 => QXI_4_net);
    
    XOR2_RBINNXTSHIFT_1_inst : XOR2
      port map(A => XOR2_36_Y, B => AND2_61_Y, Y => 
        RBINNXTSHIFT_1_net);
    
    XOR2_59 : XOR2
      port map(A => MEM_WADDR_6_net, B => ByteData_GND, Y => 
        XOR2_59_Y);
    
    AND2_49_RNINDA71 : AO1
      port map(A => XOR2_62_Y, B => AO1_25_Y, C => AND2_49_Y, Y
         => AO1_19_Y);
    
    DFN1E1C0_Q_1_inst : DFN1E1C0
      port map(D => QXI_1_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(1));
    
    DFN1C0_MEM_RADDR_7_inst : DFN1C0
      port map(D => RBINNXTSHIFT_7_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_7_net);
    
    DFN1C0_MEM_WADDR_4_inst : DFN1C0
      port map(D => WBINNXTSHIFT_4_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_4_net);
    
    AO1_28 : AO1
      port map(A => AND2_12_Y, B => AO1_17_Y, C => AO1_35_Y, Y
         => AO1_28_Y);
    
    DFN1C0_MEM_WADDR_8_inst : DFN1C0
      port map(D => WBINNXTSHIFT_8_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_8_net);
    
    AND3_6_RNO_0 : XNOR2
      port map(A => RBINNXTSHIFT_5_net, B => MEM_WADDR_5_net, Y
         => XNOR2_10_Y);
    
    XOR2_22 : XOR2
      port map(A => MEM_WADDR_11_net, B => ByteData_GND, Y => 
        XOR2_22_Y);
    
    DFN1E1C0_Q_4_inst : DFN1E1C0
      port map(D => QXI_4_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(4));
    
    AND3_6_RNO : XNOR2
      port map(A => RBINNXTSHIFT_4_net, B => MEM_WADDR_4_net, Y
         => XNOR2_24_Y);
    
    XOR2_53_RNIKHAC2 : AO1
      port map(A => XOR2_53_Y, B => AO1_2_Y, C => AND2_1_Y, Y => 
        AO1_21_Y);
    
    DFN1P0_EMPTY_RNO_2 : XNOR2
      port map(A => RBINNXTSHIFT_9_net, B => MEM_WADDR_9_net, Y
         => XNOR2_9_Y);
    
    XOR2_20_RNIMKVS1 : XOR2
      port map(A => XOR2_20_Y, B => AO1_11_Y, Y => 
        RBINNXTSHIFT_5_net);
    
    AND2_26_RNIC6LG3 : AO1
      port map(A => XOR2_50_Y, B => AO1_16_Y, C => AND2_26_Y, Y
         => AO1_36_Y);
    
    XOR2_WBINNXTSHIFT_3_inst : XOR2
      port map(A => XOR2_69_Y, B => AO1_26_Y, Y => 
        WBINNXTSHIFT_3_net);
    
    DFN1P0_EMPTY_RNO_1 : XNOR2
      port map(A => RBINNXTSHIFT_12_net, B => MEM_WADDR_12_net, Y
         => XNOR2_22_Y);
    
    DFN1C0_MEM_RADDR_6_inst : DFN1C0
      port map(D => RBINNXTSHIFT_6_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_6_net);
    
    AND2_24_RNID12E3 : AO1
      port map(A => XOR2_14_Y, B => AO1_18_Y, C => AND2_24_Y, Y
         => AO1_7_Y);
    
    XOR2_48 : XOR2
      port map(A => MEM_WADDR_1_net, B => ByteData_GND, Y => 
        XOR2_48_Y);
    
    AND2_6_RNIE0DI : AO1
      port map(A => XOR2_66_Y, B => AND2_9_Y, C => AND2_6_Y, Y
         => AO1_20_Y);
    
    DFN1E1C0_Q_7_inst : DFN1E1C0
      port map(D => QXI_7_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(7));
    
    DFN1C0_FULL_RNO : AND2
      port map(A => AND3_1_Y, B => XOR2_40_Y, Y => FULLINT);
    
    XOR2_62 : XOR2
      port map(A => MEM_WADDR_4_net, B => ByteData_GND, Y => 
        XOR2_62_Y);
    
    AND2_13 : AND2
      port map(A => MEM_WADDR_7_net, B => ByteData_GND, Y => 
        AND2_13_Y);
    
    AO1_32_RNI31OB3 : AO1
      port map(A => AND2_48_Y, B => AO1_18_Y, C => AO1_32_Y, Y
         => AO1_16_Y);
    
    XOR2_10 : XOR2
      port map(A => MEM_RADDR_4_net, B => ByteData_GND, Y => 
        XOR2_10_Y);
    
    XNOR2_1 : XNOR2
      port map(A => MEM_RADDR_0_net, B => WBINNXTSHIFT_0_net, Y
         => XNOR2_1_Y);
    
    AND2_58 : AND2
      port map(A => MEM_WADDR_8_net, B => ByteData_GND, Y => 
        AND2_58_Y);
    
    XOR2_RBINNXTSHIFT_3_inst : XOR2
      port map(A => XOR2_51_Y, B => AO1_24_Y, Y => 
        RBINNXTSHIFT_3_net);
    
    AND2_44_RNIU4D7 : AND2
      port map(A => AND2_59_Y, B => AND2_44_Y, Y => AND2_25_Y);
    
    XOR2_27 : XOR2
      port map(A => MEM_WADDR_10_net, B => ByteData_GND, Y => 
        XOR2_27_Y);
    
    XOR2_7 : XOR2
      port map(A => MEM_RADDR_11_net, B => ByteData_GND, Y => 
        XOR2_7_Y);
    
    AND2_5 : AND2
      port map(A => MEM_WADDR_11_net, B => ByteData_GND, Y => 
        AND2_5_Y);
    
    XOR2_14 : XOR2
      port map(A => MEM_RADDR_8_net, B => ByteData_GND, Y => 
        XOR2_14_Y);
    
    AND2_50 : AND2
      port map(A => MEM_WADDR_9_net, B => ByteData_GND, Y => 
        AND2_50_Y);
    
    XOR2_11 : XOR2
      port map(A => MEM_WADDR_2_net, B => ByteData_GND, Y => 
        XOR2_11_Y);
    
    DFN1C0_FULL_RNO_13 : XNOR2
      port map(A => MEM_RADDR_5_net, B => WBINNXTSHIFT_5_net, Y
         => XNOR2_5_Y);
    
    XOR2_58_RNIVAV4 : AND2
      port map(A => XOR2_62_Y, B => XOR2_58_Y, Y => AND2_59_Y);
    
    AND2_52 : AND2
      port map(A => MEM_WADDR_6_net, B => ByteData_GND, Y => 
        AND2_52_Y);
    
    DFN1C0_FULL_RNO_12 : XNOR2
      port map(A => MEM_RADDR_4_net, B => WBINNXTSHIFT_4_net, Y
         => XNOR2_0_Y);
    
    DFN1C0_MEM_RADDR_3_inst : DFN1C0
      port map(D => RBINNXTSHIFT_3_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_3_net);
    
    AND2_30_RNI6C593 : AO1
      port map(A => AND2_3_Y, B => AO1_6_Y, C => AO1_33_Y, Y => 
        AO1_18_Y);
    
    DFN1C0_FULL_RNO_1 : XOR2
      port map(A => MEM_RADDR_12_net, B => WBINNXTSHIFT_12_net, Y
         => XOR2_40_Y);
    
    DFN1C0_FULL_RNO_10 : XNOR2
      port map(A => MEM_RADDR_7_net, B => WBINNXTSHIFT_7_net, Y
         => XNOR2_8_Y);
    
    AND2_13_RNI9RA7 : AO1
      port map(A => XOR2_47_Y, B => AND2_52_Y, C => AND2_13_Y, Y
         => AO1_4_Y);
    
    XOR2_24_RNIHDJR1 : XOR2
      port map(A => XOR2_24_Y, B => AO1_10_Y, Y => 
        WBINNXTSHIFT_7_net);
    
    AND2_9 : AND2
      port map(A => MEM_WADDR_2_net, B => ByteData_GND, Y => 
        AND2_9_Y);
    
    XOR2_65 : XOR2
      port map(A => MEM_RADDR_9_net, B => ByteData_GND, Y => 
        XOR2_65_Y);
    
    XOR2_58 : XOR2
      port map(A => MEM_WADDR_5_net, B => ByteData_GND, Y => 
        XOR2_58_Y);
    
    AND2_45_RNIR01B : AO1
      port map(A => XOR2_30_Y, B => AND2_27_Y, C => AND2_45_Y, Y
         => AO1_1_Y);
    
    DFN1C0_MEM_WADDR_1_inst : DFN1C0
      port map(D => WBINNXTSHIFT_1_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_1_net);
    
    AO1_32 : AO1
      port map(A => XOR2_65_Y, B => AND2_24_Y, C => AND2_33_Y, Y
         => AO1_32_Y);
    
    NAND2_1_RNIHSF4 : AND2
      port map(A => NAND2_1_Y, B => RE, Y => MEMORYRE);
    
    XOR2_68_RNII1C42 : XOR2
      port map(A => XOR2_68_Y, B => AO1_2_Y, Y => 
        RBINNXTSHIFT_6_net);
    
    NAND2_0 : NAND2
      port map(A => \DFN1C0_FULL\, B => ByteData_VCC, Y => 
        NAND2_0_Y);
    
    DFN1C0_MEM_RADDR_10_inst : DFN1C0
      port map(D => RBINNXTSHIFT_10_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_10_net);
    
    DFN1E1C0_Q_3_inst : DFN1E1C0
      port map(D => QXI_3_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(3));
    
    DFN1C0_MEM_RADDR_0_inst_RNIO0T8 : AND2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        AND2_61_Y);
    
    DFN1C0_FULL_RNO_3 : AND3
      port map(A => AND3_4_Y, B => AND3_5_Y, C => AND3_3_Y, Y => 
        AND3_2_Y);
    
    XOR2_76 : XOR2
      port map(A => MEM_RADDR_11_net, B => ByteData_GND, Y => 
        XOR2_76_Y);
    
    XOR2_3_RNIMBUF : AND2
      port map(A => XOR2_9_Y, B => XOR2_3_Y, Y => AND2_53_Y);
    
    DFN1C0_MEM_RADDR_5_inst : DFN1C0
      port map(D => RBINNXTSHIFT_5_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_5_net);
    
    DFN1C0_DVLDI : DFN1C0
      port map(D => AND2A_0_Y, CLK => SysClk_c, CLR => LVDS_en_c, 
        Q => DVLDI);
    
    AND2_14_RNIV9S12 : AO1
      port map(A => AND2_19_Y, B => AO1_6_Y, C => AO1_8_Y, Y => 
        AO1_2_Y);
    
    DFN1C0_MEM_WADDR_9_inst : DFN1C0
      port map(D => WBINNXTSHIFT_9_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_9_net);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    AO1_0 : AO1
      port map(A => AND2_41_Y, B => AO1_32_Y, C => AO1_15_Y, Y
         => AO1_0_Y);
    
    XOR2_29 : XOR2
      port map(A => MEM_RADDR_10_net, B => ByteData_GND, Y => 
        XOR2_29_Y);
    
    NAND2_0_RNID1I2 : AND2
      port map(A => NAND2_0_Y, B => WE, Y => MEMORYWE);
    
    DFN1C0_MEM_WADDR_0_inst : DFN1C0
      port map(D => WBINNXTSHIFT_0_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_0_net);
    
    AND2A_0 : AND2A
      port map(A => \DFN1P0_EMPTY\, B => RE, Y => AND2A_0_Y);
    
    AO1_26 : AO1
      port map(A => XOR2_16_Y, B => AO1_1_Y, C => AND2_9_Y, Y => 
        AO1_26_Y);
    
    DFN1P0_EMPTY_RNO_5 : AND3
      port map(A => XNOR2_18_Y, B => XNOR2_20_Y, C => XNOR2_16_Y, 
        Y => AND3_9_Y);
    
    AND2_33 : AND2
      port map(A => MEM_RADDR_9_net, B => ByteData_GND, Y => 
        AND2_33_Y);
    
    RAM4K9_QXI_0_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => data_reg_0, DINB8 => ByteData_GND, 
        DINB7 => ByteData_GND, DINB6 => ByteData_GND, DINB5 => 
        ByteData_GND, DINB4 => ByteData_GND, DINB3 => 
        ByteData_GND, DINB2 => ByteData_GND, DINB1 => 
        ByteData_GND, DINB0 => ByteData_GND, WIDTHA0 => 
        ByteData_GND, WIDTHA1 => ByteData_GND, WIDTHB0 => 
        ByteData_GND, WIDTHB1 => ByteData_GND, PIPEA => 
        ByteData_GND, PIPEB => ByteData_GND, WMODEA => 
        ByteData_GND, WMODEB => ByteData_GND, BLKA => MEMWENEG, 
        BLKB => MEMRENEG, WENA => ByteData_GND, WENB => 
        ByteData_VCC, CLKA => SysClk_c, CLKB => SysClk_c, RESET
         => LVDS_en_c, DOUTA8 => RAM4K9_QXI_0_inst_DOUTA8, DOUTA7
         => RAM4K9_QXI_0_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_0_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_0_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_0_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_0_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_0_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_0_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_0_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_0_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_0_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_0_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_0_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_0_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_0_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_0_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_0_inst_DOUTB1, DOUTB0 => QXI_0_net);
    
    XOR2_41 : XOR2
      port map(A => MEM_WADDR_9_net, B => ByteData_GND, Y => 
        XOR2_41_Y);
    
    XOR2_27_RNIK8G52 : XOR2
      port map(A => XOR2_27_Y, B => AO1_12_Y, Y => 
        WBINNXTSHIFT_10_net);
    
    XOR2_63_RNI29QE2 : XOR2
      port map(A => XOR2_63_Y, B => AO1_21_Y, Y => 
        RBINNXTSHIFT_7_net);
    
    AO1_0_RNIVUKB3 : AO1
      port map(A => AND2_56_Y, B => AO1_18_Y, C => AO1_0_Y, Y => 
        AO1_34_Y);
    
    DFN1P0_EMPTY : DFN1P0
      port map(D => EMPTYINT, CLK => SysClk_c, PRE => LVDS_en_c, 
        Q => \DFN1P0_EMPTY\);
    
    AND2_52_RNI664P1 : AO1
      port map(A => XOR2_0_Y, B => AO1_9_Y, C => AND2_52_Y, Y => 
        AO1_10_Y);
    
    AND2_41 : AND2
      port map(A => XOR2_50_Y, B => XOR2_7_Y, Y => AND2_41_Y);
    
    XOR2_69 : XOR2
      port map(A => MEM_WADDR_3_net, B => ByteData_GND, Y => 
        XOR2_69_Y);
    
    XOR2_6 : XOR2
      port map(A => MEM_RADDR_1_net, B => ByteData_GND, Y => 
        XOR2_6_Y);
    
    DFN1C0_MEM_WADDR_3_inst : DFN1C0
      port map(D => WBINNXTSHIFT_3_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_3_net);
    
    AND2_10_RNIJ2NE1 : AO1
      port map(A => AND2_59_Y, B => AO1_25_Y, C => AO1_3_Y, Y => 
        AO1_9_Y);
    
    XOR2_53 : XOR2
      port map(A => MEM_RADDR_6_net, B => ByteData_GND, Y => 
        XOR2_53_Y);
    
    DFN1P0_EMPTY_RNO_9 : XNOR2
      port map(A => RBINNXTSHIFT_7_net, B => MEM_WADDR_7_net, Y
         => XNOR2_20_Y);
    
    XOR2_61_RNIPAA22 : XOR2
      port map(A => XOR2_61_Y, B => AO1_27_Y, Y => 
        WBINNXTSHIFT_9_net);
    
    DFN1C0_MEM_WADDR_12_inst : DFN1C0
      port map(D => WBINNXTSHIFT_12_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_12_net);
    
    DFN1P0_EMPTY_RNO_3 : AND3
      port map(A => AND3_9_Y, B => AND3_7_Y, C => AND3_6_Y, Y => 
        AND3_8_Y);
    
    XOR2_12 : XOR2
      port map(A => MEM_WADDR_12_net, B => ByteData_GND, Y => 
        XOR2_12_Y);
    
    XNOR2_7 : XNOR2
      port map(A => RBINNXTSHIFT_1_net, B => MEM_WADDR_1_net, Y
         => XNOR2_7_Y);
    
    XNOR2_12 : XNOR2
      port map(A => RBINNXTSHIFT_0_net, B => MEM_WADDR_0_net, Y
         => XNOR2_12_Y);
    
    AND2_48 : AND2
      port map(A => XOR2_14_Y, B => XOR2_65_Y, Y => AND2_48_Y);
    
    AND2_45 : AND2
      port map(A => MEM_WADDR_1_net, B => ByteData_GND, Y => 
        AND2_45_Y);
    
    XOR2_1_RNIGNS22 : XOR2
      port map(A => XOR2_1_Y, B => AO1_5_Y, Y => 
        WBINNXTSHIFT_8_net);
    
    DFN1P0_EMPTY_RNO_0 : AND3
      port map(A => XNOR2_9_Y, B => AND3_8_Y, C => AND2_17_Y, Y
         => AND3_0_Y);
    
    DFN1C0_MEM_WADDR_11_inst : DFN1C0
      port map(D => WBINNXTSHIFT_11_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_11_net);
    
    DFN1C0_MEM_RADDR_2_inst : DFN1C0
      port map(D => RBINNXTSHIFT_2_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_2_net);
    
    AND2_4 : AND2
      port map(A => MEM_RADDR_4_net, B => ByteData_GND, Y => 
        AND2_4_Y);
    
    DFN1C0_MEM_RADDR_1_inst : DFN1C0
      port map(D => RBINNXTSHIFT_1_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_1_net);
    
    XOR2_75_RNINNS41 : XOR2
      port map(A => XOR2_75_Y, B => AO1_25_Y, Y => 
        WBINNXTSHIFT_4_net);
    
    XOR2_50 : XOR2
      port map(A => MEM_RADDR_10_net, B => ByteData_GND, Y => 
        XOR2_50_Y);
    
    XOR2_49_RNICSUF2 : XOR2
      port map(A => XOR2_49_Y, B => AO1_29_Y, Y => 
        WBINNXTSHIFT_11_net);
    
    RAM4K9_QXI_3_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => data_reg_2, DINB8 => ByteData_GND, 
        DINB7 => ByteData_GND, DINB6 => ByteData_GND, DINB5 => 
        ByteData_GND, DINB4 => ByteData_GND, DINB3 => 
        ByteData_GND, DINB2 => ByteData_GND, DINB1 => 
        ByteData_GND, DINB0 => ByteData_GND, WIDTHA0 => 
        ByteData_GND, WIDTHA1 => ByteData_GND, WIDTHB0 => 
        ByteData_GND, WIDTHB1 => ByteData_GND, PIPEA => 
        ByteData_GND, PIPEB => ByteData_GND, WMODEA => 
        ByteData_GND, WMODEB => ByteData_GND, BLKA => MEMWENEG, 
        BLKB => MEMRENEG, WENA => ByteData_GND, WENB => 
        ByteData_VCC, CLKA => SysClk_c, CLKB => SysClk_c, RESET
         => LVDS_en_c, DOUTA8 => RAM4K9_QXI_3_inst_DOUTA8, DOUTA7
         => RAM4K9_QXI_3_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_3_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_3_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_3_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_3_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_3_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_3_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_3_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_3_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_3_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_3_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_3_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_3_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_3_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_3_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_3_inst_DOUTB1, DOUTB0 => QXI_3_net);
    
    AND2_8 : AND2
      port map(A => XOR2_19_Y, B => XOR2_41_Y, Y => AND2_8_Y);
    
    AO1_17_RNI61132 : AO1
      port map(A => AND2_8_Y, B => AO1_5_Y, C => AO1_17_Y, Y => 
        AO1_12_Y);
    
    XOR2_3 : XOR2
      port map(A => MEM_RADDR_3_net, B => ByteData_GND, Y => 
        XOR2_3_Y);
    
    DFN1C0_FULL_RNO_11 : XNOR2
      port map(A => MEM_RADDR_8_net, B => WBINNXTSHIFT_8_net, Y
         => XNOR2_2_Y);
    
    XOR2_51 : XOR2
      port map(A => MEM_RADDR_3_net, B => ByteData_GND, Y => 
        XOR2_51_Y);
    
    DFN1P0_EMPTY_RNO_6 : XNOR2
      port map(A => RBINNXTSHIFT_10_net, B => MEM_WADDR_10_net, Y
         => XNOR2_23_Y);
    
    DFN1C0_MEM_RADDR_8_inst : DFN1C0
      port map(D => RBINNXTSHIFT_8_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_8_net);
    
    XOR2_66 : XOR2
      port map(A => MEM_WADDR_3_net, B => ByteData_GND, Y => 
        XOR2_66_Y);
    
    AND2_56 : AND2
      port map(A => AND2_48_Y, B => AND2_41_Y, Y => AND2_56_Y);
    
    DFN1P0_EMPTY_RNO_7 : XNOR2
      port map(A => RBINNXTSHIFT_11_net, B => MEM_WADDR_11_net, Y
         => XNOR2_4_Y);
    
    XOR2_73 : XOR2
      port map(A => MEM_RADDR_8_net, B => ByteData_GND, Y => 
        XOR2_73_Y);
    
    AND3_7 : AND3
      port map(A => XNOR2_12_Y, B => XNOR2_7_Y, C => XNOR2_13_Y, 
        Y => AND3_7_Y);
    
    DFN1C0_FULL_RNO_8 : XNOR2
      port map(A => MEM_RADDR_11_net, B => WBINNXTSHIFT_11_net, Y
         => XNOR2_11_Y);
    
    XOR2_60_RNIQCFD2 : AO1
      port map(A => XOR2_60_Y, B => AO1_12_Y, C => AND2_2_Y, Y
         => AO1_29_Y);
    
    AO1_17 : AO1
      port map(A => XOR2_41_Y, B => AND2_58_Y, C => AND2_50_Y, Y
         => AO1_17_Y);
    
    XNOR2_17 : XNOR2
      port map(A => MEM_RADDR_1_net, B => WBINNXTSHIFT_1_net, Y
         => XNOR2_17_Y);
    
    AND2_44_RNIQHTQ1 : AO1
      port map(A => AND2_25_Y, B => AO1_25_Y, C => AO1_23_Y, Y
         => AO1_5_Y);
    
    XOR2_16_RNITQU4 : AND2
      port map(A => XOR2_16_Y, B => XOR2_66_Y, Y => AND2_54_Y);
    
    DFN1C0_MEM_WADDR_7_inst : DFN1C0
      port map(D => WBINNXTSHIFT_7_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_WADDR_7_net);
    
    RAM4K9_QXI_6_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => data_reg_6, DINB8 => ByteData_GND, 
        DINB7 => ByteData_GND, DINB6 => ByteData_GND, DINB5 => 
        ByteData_GND, DINB4 => ByteData_GND, DINB3 => 
        ByteData_GND, DINB2 => ByteData_GND, DINB1 => 
        ByteData_GND, DINB0 => ByteData_GND, WIDTHA0 => 
        ByteData_GND, WIDTHA1 => ByteData_GND, WIDTHB0 => 
        ByteData_GND, WIDTHB1 => ByteData_GND, PIPEA => 
        ByteData_GND, PIPEB => ByteData_GND, WMODEA => 
        ByteData_GND, WMODEB => ByteData_GND, BLKA => MEMWENEG, 
        BLKB => MEMRENEG, WENA => ByteData_GND, WENB => 
        ByteData_VCC, CLKA => SysClk_c, CLKB => SysClk_c, RESET
         => LVDS_en_c, DOUTA8 => RAM4K9_QXI_6_inst_DOUTA8, DOUTA7
         => RAM4K9_QXI_6_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_6_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_6_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_6_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_6_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_6_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_6_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_6_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_6_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_6_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_6_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_6_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_6_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_6_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_6_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_6_inst_DOUTB1, DOUTB0 => QXI_6_net);
    
    AND2_58_RNIDJQV1 : AO1
      port map(A => XOR2_19_Y, B => AO1_5_Y, C => AND2_58_Y, Y
         => AO1_27_Y);
    
    DFN1C0_FULL_RNO_4 : AND2
      port map(A => XNOR2_6_Y, B => XNOR2_11_Y, Y => AND2_65_Y);
    
    XOR2_10_RNIFDGQ1 : AO1
      port map(A => XOR2_10_Y, B => AO1_6_Y, C => AND2_4_Y, Y => 
        AO1_11_Y);
    
    RAM4K9_QXI_2_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => data_reg_2, DINB8 => ByteData_GND, 
        DINB7 => ByteData_GND, DINB6 => ByteData_GND, DINB5 => 
        ByteData_GND, DINB4 => ByteData_GND, DINB3 => 
        ByteData_GND, DINB2 => ByteData_GND, DINB1 => 
        ByteData_GND, DINB0 => ByteData_GND, WIDTHA0 => 
        ByteData_GND, WIDTHA1 => ByteData_GND, WIDTHB0 => 
        ByteData_GND, WIDTHB1 => ByteData_GND, PIPEA => 
        ByteData_GND, PIPEB => ByteData_GND, WMODEA => 
        ByteData_GND, WMODEB => ByteData_GND, BLKA => MEMWENEG, 
        BLKB => MEMRENEG, WENA => ByteData_GND, WENB => 
        ByteData_VCC, CLKA => SysClk_c, CLKB => SysClk_c, RESET
         => LVDS_en_c, DOUTA8 => RAM4K9_QXI_2_inst_DOUTA8, DOUTA7
         => RAM4K9_QXI_2_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_2_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_2_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_2_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_2_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_2_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_2_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_2_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_2_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_2_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_2_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_2_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_2_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_2_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_2_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_2_inst_DOUTB1, DOUTB0 => QXI_2_net);
    
    DFN1E1C0_Q_6_inst : DFN1E1C0
      port map(D => QXI_6_net, CLK => SysClk_c, CLR => LVDS_en_c, 
        E => DVLDI, Q => Fifo_dout(6));
    
    XOR2_0 : XOR2
      port map(A => MEM_WADDR_6_net, B => ByteData_GND, Y => 
        XOR2_0_Y);
    
    NAND2_1 : NAND2
      port map(A => \DFN1P0_EMPTY\, B => ByteData_VCC, Y => 
        NAND2_1_Y);
    
    DFN1C0_MEM_RADDR_4_inst : DFN1C0
      port map(D => RBINNXTSHIFT_4_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_4_net);
    
    DFN1C0_FULL_RNO_6 : AND3
      port map(A => XNOR2_19_Y, B => XNOR2_0_Y, C => XNOR2_5_Y, Y
         => AND3_3_Y);
    
    XOR2_68 : XOR2
      port map(A => MEM_RADDR_6_net, B => ByteData_GND, Y => 
        XOR2_68_Y);
    
    DFN1C0_MEM_RADDR_9_inst : DFN1C0
      port map(D => RBINNXTSHIFT_9_net, CLK => SysClk_c, CLR => 
        LVDS_en_c, Q => MEM_RADDR_9_net);
    
    DFN1C0_FULL_RNO_2 : XNOR2
      port map(A => MEM_RADDR_9_net, B => WBINNXTSHIFT_9_net, Y
         => XNOR2_3_Y);
    
    XNOR2_14 : XNOR2
      port map(A => RBINNXTSHIFT_3_net, B => MEM_WADDR_3_net, Y
         => XNOR2_14_Y);
    
    RAM4K9_QXI_7_inst : RAM4K9
      port map(ADDRA11 => MEM_WADDR_11_net, ADDRA10 => 
        MEM_WADDR_10_net, ADDRA9 => MEM_WADDR_9_net, ADDRA8 => 
        MEM_WADDR_8_net, ADDRA7 => MEM_WADDR_7_net, ADDRA6 => 
        MEM_WADDR_6_net, ADDRA5 => MEM_WADDR_5_net, ADDRA4 => 
        MEM_WADDR_4_net, ADDRA3 => MEM_WADDR_3_net, ADDRA2 => 
        MEM_WADDR_2_net, ADDRA1 => MEM_WADDR_1_net, ADDRA0 => 
        MEM_WADDR_0_net, ADDRB11 => MEM_RADDR_11_net, ADDRB10 => 
        MEM_RADDR_10_net, ADDRB9 => MEM_RADDR_9_net, ADDRB8 => 
        MEM_RADDR_8_net, ADDRB7 => MEM_RADDR_7_net, ADDRB6 => 
        MEM_RADDR_6_net, ADDRB5 => MEM_RADDR_5_net, ADDRB4 => 
        MEM_RADDR_4_net, ADDRB3 => MEM_RADDR_3_net, ADDRB2 => 
        MEM_RADDR_2_net, ADDRB1 => MEM_RADDR_1_net, ADDRB0 => 
        MEM_RADDR_0_net, DINA8 => ByteData_GND, DINA7 => 
        ByteData_GND, DINA6 => ByteData_GND, DINA5 => 
        ByteData_GND, DINA4 => ByteData_GND, DINA3 => 
        ByteData_GND, DINA2 => ByteData_GND, DINA1 => 
        ByteData_GND, DINA0 => ByteData_GND, DINB8 => 
        ByteData_GND, DINB7 => ByteData_GND, DINB6 => 
        ByteData_GND, DINB5 => ByteData_GND, DINB4 => 
        ByteData_GND, DINB3 => ByteData_GND, DINB2 => 
        ByteData_GND, DINB1 => ByteData_GND, DINB0 => 
        ByteData_GND, WIDTHA0 => ByteData_GND, WIDTHA1 => 
        ByteData_GND, WIDTHB0 => ByteData_GND, WIDTHB1 => 
        ByteData_GND, PIPEA => ByteData_GND, PIPEB => 
        ByteData_GND, WMODEA => ByteData_GND, WMODEB => 
        ByteData_GND, BLKA => MEMWENEG, BLKB => MEMRENEG, WENA
         => ByteData_GND, WENB => ByteData_VCC, CLKA => SysClk_c, 
        CLKB => SysClk_c, RESET => LVDS_en_c, DOUTA8 => 
        RAM4K9_QXI_7_inst_DOUTA8, DOUTA7 => 
        RAM4K9_QXI_7_inst_DOUTA7, DOUTA6 => 
        RAM4K9_QXI_7_inst_DOUTA6, DOUTA5 => 
        RAM4K9_QXI_7_inst_DOUTA5, DOUTA4 => 
        RAM4K9_QXI_7_inst_DOUTA4, DOUTA3 => 
        RAM4K9_QXI_7_inst_DOUTA3, DOUTA2 => 
        RAM4K9_QXI_7_inst_DOUTA2, DOUTA1 => 
        RAM4K9_QXI_7_inst_DOUTA1, DOUTA0 => RAM4K9_QXI_7_DOUTA0, 
        DOUTB8 => RAM4K9_QXI_7_inst_DOUTB8, DOUTB7 => 
        RAM4K9_QXI_7_inst_DOUTB7, DOUTB6 => 
        RAM4K9_QXI_7_inst_DOUTB6, DOUTB5 => 
        RAM4K9_QXI_7_inst_DOUTB5, DOUTB4 => 
        RAM4K9_QXI_7_inst_DOUTB4, DOUTB3 => 
        RAM4K9_QXI_7_inst_DOUTB3, DOUTB2 => 
        RAM4K9_QXI_7_inst_DOUTB2, DOUTB1 => 
        RAM4K9_QXI_7_inst_DOUTB1, DOUTB0 => QXI_7_net);
    
    XOR2_36 : XOR2
      port map(A => MEM_RADDR_1_net, B => ByteData_GND, Y => 
        XOR2_36_Y);
    
    AND2_35_RNIIS9J : AO1
      port map(A => XOR2_6_Y, B => AND2_61_Y, C => AND2_35_Y, Y
         => AO1_14_Y);
    
    XOR2_74 : XOR2
      port map(A => MEM_RADDR_12_net, B => ByteData_GND, Y => 
        XOR2_74_Y);
    
    XOR2_16_RNI6SC21 : AO1
      port map(A => AND2_54_Y, B => AO1_1_Y, C => AO1_20_Y, Y => 
        AO1_25_Y);
    
    AND2_46_RNIMDQC : AO1
      port map(A => XOR2_3_Y, B => AND2_15_Y, C => AND2_46_Y, Y
         => AO1_30_Y);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity enc_8b10b is

    port( TenbitDout         : out   std_logic_vector(9 downto 0);
          Din_Delay4_7       : in    std_logic;
          Din_Delay4_6       : in    std_logic;
          Din_Delay4_5       : in    std_logic;
          Din_Delay4_0       : in    std_logic;
          Din_Delay4_1       : in    std_logic;
          CRC_Reg_7          : in    std_logic;
          CRC_Reg_6          : in    std_logic;
          CRC_Reg_5          : in    std_logic;
          CRC_Reg_0          : in    std_logic;
          CRC_Reg_1          : in    std_logic;
          Din_Delay4_RNI31E8 : in    std_logic_vector(3 to 3);
          Din_Delay4_RNI51E8 : in    std_logic_vector(4 to 4);
          Bit_En             : in    std_logic;
          SysRst_n_c         : in    std_logic;
          SysClk_c           : in    std_logic;
          Kin_Delay4         : in    std_logic;
          CRC_ResultAva      : in    std_logic;
          N_983              : in    std_logic;
          N_982              : in    std_logic;
          N_984              : in    std_logic
        );

end enc_8b10b;

architecture DEF_ARCH of enc_8b10b is 

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XNOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN0E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AX1E
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AX1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO13
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN0C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XNOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AX1D
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal COMPLS4, PD1S4, ND1S4, \LPDL6\, JO_1, SINT, un1_njo, 
        HO_1, \H4\, GO_1, \G4\, un4_ngo, FO_1, \F4\, \K4\, pdl6_0, 
        \LPDL4\, \un3_pd1s6[0]_net_1\, \un3_nd1s6_0\, \L22_1\, 
        \L22_2\, un2_s_1, \L31\, un7_s_1, NIO_0_a0_1, \L13\, 
        \un1_L22_a0_0[0]\, IO_1_0tt_m3_0_a3_0_0, \ND1S6_0_3\, 
        \ND1S6_a0\, \ND1S6_a2\, \ND1S6_a4\, ND1S6_0_2, \ND1S6_a3\, 
        \ND1S6_a1\, compls6_0_1, compls6_a4_1_0, compls6_a2_2, 
        compls6_a4_1, compls6_0_0, compls6_a3_1, \compls6_a3_0\, 
        N_1_i, NIO_2_0, NIO_0_a0_0_0, \IO_RNO_11\, \L31_0\, 
        \un2_l40_m3\, \un1_l31\, ND1S6_a0_0, NIO_0_a1_1_0, 
        NIO_0_a2_0, un7_l13, \IO_RNO_12\, \IO_RNO_13\, 
        \compls6_a0_2\, compls6_a0_1, AO_1, compls6, un3_compls6, 
        NIO_0, \IO_RNO_6\, \IO_RNO_7\, NIO_0_a3_1, \un7_l13_a1\, 
        \un7_l13_a0\, ND1S6_a3_0, \LPDL4_RNIV4T21\, \un21_l22\, 
        un6_l22_i, \un2_l31_i[0]\, NCO, un6_pd1s6, L04_i_0, 
        \un6_l31\, \un12_l31\, SINT_tz_tz, EO_1, \un1_L13[0]\, 
        DO_1, NDO, CO_1, BO_1, NBO, IO_1_i_i, \un1_L22[0]\, 
        \IO_RNO_1\, \COMPLS6\, \l13_m2_e\, l13_i, \l13tt_m1_e\, 
        \IO_RNO_3\, \un2_l40_m2_e\, \un2_l40tt_m1_e\, \S\, 
        \L13_0_tz\, \un1_l13[0]_net_1\, \un3_l04\, \un21_l13\, 
        \BO_RNO_1\, \un14_l13\, \F4_RNO\, \G4_RNO\, S_2, PDL6, 
        PD0S6, \un1_PD0S6[0]\, un1_pd1s6_i, PDL4, PD0S4, 
        \un2_pdl4_i[0]\, ND0S4, \H4_RNO\, \XLRESET\, \LRESET\, 
        \GND\, \VCC\, GND_0, VCC_0 : std_logic;

begin 


    LPDL4_RNIN21I : NOR3B
      port map(A => N_983, B => N_982, C => \LPDL4\, Y => 
        compls6_a0_1);
    
    IO_RNO_13 : OR3
      port map(A => Din_Delay4_1, B => Din_Delay4_0, C => 
        CRC_ResultAva, Y => \IO_RNO_13\);
    
    un2_l40_m3 : MX2C
      port map(A => \un2_l40tt_m1_e\, B => \un2_l40_m2_e\, S => 
        CRC_ResultAva, Y => \un2_l40_m3\);
    
    l13tt_m1_e : OR2A
      port map(A => Din_Delay4_0, B => Din_Delay4_1, Y => 
        \l13tt_m1_e\);
    
    IO_RNO_2 : NOR2
      port map(A => Din_Delay4_RNI51E8(4), B => \L22_1\, Y => 
        \un1_L22_a0_0[0]\);
    
    un2_l40tt_m1_e : OR2B
      port map(A => Din_Delay4_1, B => Din_Delay4_0, Y => 
        \un2_l40tt_m1_e\);
    
    L13_0_tz : OA1C
      port map(A => l13_i, B => un7_l13, C => N_984, Y => 
        \L13_0_tz\);
    
    S_RNO_1 : NOR3A
      port map(A => Din_Delay4_RNI31E8(3), B => 
        Din_Delay4_RNI51E8(4), C => \L31\, Y => un2_s_1);
    
    IO_RNO_12 : OR3A
      port map(A => CRC_ResultAva, B => CRC_Reg_1, C => CRC_Reg_0, 
        Y => \IO_RNO_12\);
    
    DO_RNO : XOR3
      port map(A => compls6, B => NDO, C => un3_compls6, Y => 
        DO_1);
    
    BO_RNO : XNOR3
      port map(A => compls6, B => NBO, C => un3_compls6, Y => 
        BO_1);
    
    LPDL4_RNION365 : OR3C
      port map(A => compls6_0_0, B => \LPDL4_RNIV4T21\, C => 
        compls6_0_1, Y => compls6);
    
    K4_RNIIJJPR : MX2
      port map(A => PD0S6, B => \un3_pd1s6[0]_net_1\, S => 
        \COMPLS6\, Y => \un1_PD0S6[0]\);
    
    K4_RNIHRH58 : OA1B
      port map(A => \L13\, B => \un3_nd1s6_0\, C => \K4\, Y => 
        PD0S6);
    
    LPDL4_RNIS12J5 : AO1B
      port map(A => \ND1S6_0_3\, B => ND1S6_0_2, C => \LPDL4\, Y
         => un3_compls6);
    
    ND1S6_a1_1 : NOR2B
      port map(A => Din_Delay4_RNI31E8(3), B => N_984, Y => 
        NIO_0_a3_1);
    
    un7_l13_a0 : OR3A
      port map(A => Din_Delay4_1, B => Din_Delay4_0, C => 
        CRC_ResultAva, Y => \un7_l13_a0\);
    
    L13 : AO1C
      port map(A => Din_Delay4_RNI31E8(3), B => \L13_0_tz\, C => 
        \un1_l13[0]_net_1\, Y => \L13\);
    
    DO : DFN0E1C0
      port map(D => DO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(3));
    
    BO : DFN0E1C0
      port map(D => BO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(1));
    
    L22_1 : XA1B
      port map(A => N_984, B => Din_Delay4_RNI31E8(3), C => l13_i, 
        Y => \L22_1\);
    
    JO_RNO : AX1E
      port map(A => SINT, B => un1_njo, C => COMPLS4, Y => JO_1);
    
    H4_RNO : MX2
      port map(A => Din_Delay4_7, B => CRC_Reg_7, S => 
        CRC_ResultAva, Y => \H4_RNO\);
    
    G4_RNIBIB1 : NOR2B
      port map(A => \G4\, B => \F4\, Y => ND1S4);
    
    L04 : OR2A
      port map(A => \un3_l04\, B => Din_Delay4_RNI31E8(3), Y => 
        L04_i_0);
    
    l13_m2_e : OR2A
      port map(A => CRC_Reg_0, B => CRC_Reg_1, Y => \l13_m2_e\);
    
    IO_RNO_6 : OR3C
      port map(A => Din_Delay4_RNI51E8(4), B => \un2_l40_m3\, C
         => NIO_0_a3_1, Y => \IO_RNO_6\);
    
    AO_RNO : XNOR3
      port map(A => compls6, B => N_982, C => un3_compls6, Y => 
        AO_1);
    
    LPDL4_RNIRA8E2 : AOI1B
      port map(A => compls6_a3_1, B => \compls6_a3_0\, C => N_1_i, 
        Y => compls6_0_0);
    
    XLRESET : DFN1
      port map(D => SysRst_n_c, CLK => SysClk_c, Q => \XLRESET\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    LPDL4_RNI8V0S8 : NOR2B
      port map(A => \LPDL4\, B => \un3_pd1s6[0]_net_1\, Y => 
        pdl6_0);
    
    un7_l13_0 : OR2B
      port map(A => \un7_l13_a1\, B => \un7_l13_a0\, Y => un7_l13);
    
    EO_RNO : XOR3
      port map(A => \un1_L13[0]\, B => compls6, C => un3_compls6, 
        Y => EO_1);
    
    un12_l31 : NOR3B
      port map(A => \un2_l40_m3\, B => N_984, C => 
        Din_Delay4_RNI31E8(3), Y => \un12_l31\);
    
    EO_RNO_0 : MX2C
      port map(A => \L13\, B => \un14_l13\, S => 
        Din_Delay4_RNI51E8(4), Y => \un1_L13[0]\);
    
    S_RNO : MX2
      port map(A => un7_s_1, B => un2_s_1, S => PDL6, Y => S_2);
    
    ND1S6_a2_0 : NOR2B
      port map(A => N_983, B => N_982, Y => ND1S6_a3_0);
    
    \FNS.un7_s_0\ : NOR2A
      port map(A => Din_Delay4_RNI51E8(4), B => 
        Din_Delay4_RNI31E8(3), Y => NIO_0_a0_1);
    
    L22_2 : OR3C
      port map(A => \un21_l22\, B => un6_l22_i, C => 
        \un2_l31_i[0]\, Y => \L22_2\);
    
    AO : DFN0E1C0
      port map(D => AO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(0));
    
    IO_RNO_10 : AOI1B
      port map(A => \IO_RNO_12\, B => \IO_RNO_13\, C => N_984, Y
         => NIO_0_a0_0_0);
    
    LPDL4_RNIV4T21 : OR3A
      port map(A => compls6_a2_2, B => Din_Delay4_RNI51E8(4), C
         => N_983, Y => \LPDL4_RNIV4T21\);
    
    HO_RNO : XOR2
      port map(A => \H4\, B => COMPLS4, Y => HO_1);
    
    H4_RNIIH12 : OR2B
      port map(A => ND1S4, B => \H4\, Y => PD0S4);
    
    un2_l40_m2_e : OR2B
      port map(A => CRC_Reg_1, B => CRC_Reg_0, Y => 
        \un2_l40_m2_e\);
    
    un21_l13 : NOR3A
      port map(A => N_984, B => N_982, C => N_983, Y => 
        \un21_l13\);
    
    IO_RNO_4 : OR2
      port map(A => \L22_1\, B => \L22_2\, Y => 
        IO_1_0tt_m3_0_a3_0_0);
    
    F4 : DFN0
      port map(D => \F4_RNO\, CLK => SysClk_c, Q => \F4\);
    
    compls6_a1_1 : NOR2
      port map(A => Din_Delay4_RNI51E8(4), B => N_984, Y => 
        compls6_a4_1);
    
    un3_nd1s6_0 : OR3A
      port map(A => Din_Delay4_RNI51E8(4), B => \L22_1\, C => 
        \L22_2\, Y => \un3_nd1s6_0\);
    
    ND1S6_a4 : OR3C
      port map(A => Din_Delay4_RNI51E8(4), B => N_982, C => 
        NIO_0_a3_1, Y => \ND1S6_a4\);
    
    LPDL4_RNO_0 : AX1C
      port map(A => \LPDL6\, B => PD0S4, C => ND0S4, Y => 
        \un2_pdl4_i[0]\);
    
    LPDL4_RNIU7UK1 : OAI1
      port map(A => compls6_a4_1_0, B => compls6_a2_2, C => 
        compls6_a4_1, Y => compls6_0_1);
    
    ND1S6_a3 : OR3C
      port map(A => Din_Delay4_RNI31E8(3), B => 
        Din_Delay4_RNI51E8(4), C => ND1S6_a3_0, Y => \ND1S6_a3\);
    
    L31 : NOR3
      port map(A => \L31_0\, B => \un6_l31\, C => \un12_l31\, Y
         => \L31\);
    
    JO_RNO_0 : XO1A
      port map(A => \F4\, B => \G4\, C => \H4\, Y => un1_njo);
    
    CO_RNO_1 : OR2B
      port map(A => Din_Delay4_RNI51E8(4), B => \un3_l04\, Y => 
        un6_pd1s6);
    
    l13_m3 : MX2
      port map(A => \l13tt_m1_e\, B => \l13_m2_e\, S => 
        CRC_ResultAva, Y => l13_i);
    
    JO : DFN1E1C0
      port map(D => JO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(9));
    
    compls6_a3_0 : NOR2A
      port map(A => Din_Delay4_RNI31E8(3), B => N_983, Y => 
        \compls6_a3_0\);
    
    ND1S6_a0_0_0 : NOR3
      port map(A => N_982, B => N_983, C => Din_Delay4_RNI31E8(3), 
        Y => ND1S6_a0_0);
    
    GND_i : GND
      port map(Y => \GND\);
    
    CO_RNO_0 : OR3B
      port map(A => un6_pd1s6, B => L04_i_0, C => N_984, Y => NCO);
    
    FO : DFN1E1C0
      port map(D => FO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(6));
    
    un7_l13_a1 : OR3B
      port map(A => CRC_Reg_1, B => CRC_ResultAva, C => CRC_Reg_0, 
        Y => \un7_l13_a1\);
    
    \un1_l13[0]\ : MX2C
      port map(A => \un21_l13\, B => \un3_l04\, S => 
        Din_Delay4_RNI31E8(3), Y => \un1_l13[0]_net_1\);
    
    CO : DFN0E1C0
      port map(D => CO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(2));
    
    LPDL4_RNIT21I : NOR3
      port map(A => N_983, B => \LPDL4\, C => 
        Din_Delay4_RNI31E8(3), Y => compls6_a4_1_0);
    
    K4_RNILT12 : AO13
      port map(A => \G4\, B => \F4\, C => \K4\, Y => PD1S4);
    
    GO_RNO_0 : NOR2
      port map(A => \H4\, B => \F4\, Y => un4_ngo);
    
    compls6_a0_2 : NOR2A
      port map(A => N_984, B => Din_Delay4_RNI51E8(4), Y => 
        \compls6_a0_2\);
    
    LPDL4_RNI06BB1 : OR3C
      port map(A => compls6_a0_1, B => Din_Delay4_RNI31E8(3), C
         => \compls6_a0_2\, Y => N_1_i);
    
    IO_RNO_3 : OR2B
      port map(A => Din_Delay4_RNI51E8(4), B => L04_i_0, Y => 
        \IO_RNO_3\);
    
    LPDL4_RNIR21I : NOR3
      port map(A => \LPDL4\, B => N_982, C => 
        Din_Delay4_RNI31E8(3), Y => compls6_a2_2);
    
    LPDL4_RNO : OAI1
      port map(A => COMPLS4, B => PD0S4, C => \un2_pdl4_i[0]\, Y
         => PDL4);
    
    IO_RNO : AX1E
      port map(A => \un1_L22[0]\, B => \IO_RNO_1\, C => \COMPLS6\, 
        Y => IO_1_i_i);
    
    ND1S6_a0 : OR3B
      port map(A => Din_Delay4_RNI51E8(4), B => ND1S6_a0_0, C => 
        N_984, Y => \ND1S6_a0\);
    
    LPDL6_RNITGI4 : MX2A
      port map(A => PD1S4, B => ND1S4, S => \LPDL6\, Y => COMPLS4);
    
    LPDL4_RNIBE6RC1 : AO1B
      port map(A => pdl6_0, B => PD0S6, C => \un1_PD0S6[0]\, Y
         => PDL6);
    
    IO_RNO_5 : OR3C
      port map(A => \IO_RNO_6\, B => \IO_RNO_7\, C => NIO_2_0, Y
         => NIO_0);
    
    LRESET : DFN0
      port map(D => \XLRESET\, CLK => SysClk_c, Q => \LRESET\);
    
    IO_RNO_14 : NOR3A
      port map(A => N_982, B => N_983, C => Din_Delay4_RNI31E8(3), 
        Y => NIO_0_a1_1_0);
    
    G4_RNO : MX2
      port map(A => Din_Delay4_6, B => CRC_Reg_6, S => 
        CRC_ResultAva, Y => \G4_RNO\);
    
    F4_RNO : MX2
      port map(A => Din_Delay4_5, B => CRC_Reg_5, S => 
        CRC_ResultAva, Y => \F4_RNO\);
    
    un1_l31 : NOR2B
      port map(A => N_984, B => un7_l13, Y => \un1_l31\);
    
    un14_l13 : OR2B
      port map(A => Din_Delay4_RNI31E8(3), B => \un3_l04\, Y => 
        \un14_l13\);
    
    IO : DFN0E1C0
      port map(D => IO_1_i_i, CLK => SysClk_c, CLR => \LRESET\, E
         => Bit_En, Q => TenbitDout(5));
    
    un3_l04 : NOR3
      port map(A => N_982, B => N_983, C => N_984, Y => \un3_l04\);
    
    K4 : DFN0
      port map(D => Kin_Delay4, CLK => SysClk_c, Q => \K4\);
    
    IO_RNO_1 : AOI1
      port map(A => Kin_Delay4, B => IO_1_0tt_m3_0_a3_0_0, C => 
        NIO_0, Y => \IO_RNO_1\);
    
    un21_l22 : OR3A
      port map(A => \un2_l40_m3\, B => N_984, C => 
        Din_Delay4_RNI31E8(3), Y => \un21_l22\);
    
    H4 : DFN0
      port map(D => \H4_RNO\, CLK => SysClk_c, Q => \H4\);
    
    \un3_pd1s6[0]\ : MX2A
      port map(A => un1_pd1s6_i, B => \un14_l13\, S => 
        Din_Delay4_RNI51E8(4), Y => \un3_pd1s6[0]_net_1\);
    
    IO_RNO_0 : AO1C
      port map(A => \L22_2\, B => \un1_L22_a0_0[0]\, C => 
        \IO_RNO_3\, Y => \un1_L22[0]\);
    
    K4_RNIMJ642 : NOR3B
      port map(A => \ND1S6_a3\, B => \ND1S6_a1\, C => \K4\, Y => 
        ND1S6_0_2);
    
    IO_RNO_9 : NOR2B
      port map(A => un7_l13, B => Din_Delay4_RNI51E8(4), Y => 
        NIO_0_a2_0);
    
    L31_0 : AO1A
      port map(A => N_984, B => \un2_l40_m3\, C => \un1_l31\, Y
         => \L31_0\);
    
    LPDL4 : DFN0C0
      port map(D => PDL4, CLK => SysClk_c, CLR => \LRESET\, Q => 
        \LPDL4\);
    
    IO_RNO_8 : AOI1B
      port map(A => NIO_0_a0_1, B => NIO_0_a0_0_0, C => 
        \IO_RNO_11\, Y => NIO_2_0);
    
    IO_RNO_11 : OR3B
      port map(A => Din_Delay4_RNI51E8(4), B => NIO_0_a1_1_0, C
         => N_984, Y => \IO_RNO_11\);
    
    G4 : DFN0
      port map(D => \G4_RNO\, CLK => SysClk_c, Q => \G4\);
    
    \un2_l31[0]\ : MX2C
      port map(A => \un1_l31\, B => \un21_l13\, S => 
        Din_Delay4_RNI31E8(3), Y => \un2_l31_i[0]\);
    
    S_RNI8L76 : OR2
      port map(A => \S\, B => \K4\, Y => SINT_tz_tz);
    
    LPDL4_RNIKP5PA : XNOR2
      port map(A => un3_compls6, B => compls6, Y => \COMPLS6\);
    
    IO_RNO_7 : OR3A
      port map(A => NIO_0_a2_0, B => Din_Delay4_RNI31E8(3), C => 
        N_984, Y => \IO_RNO_7\);
    
    un1_pd1s6 : NOR3A
      port map(A => \L31\, B => \L22_1\, C => \L22_2\, Y => 
        un1_pd1s6_i);
    
    ND1S6_a2 : OR3B
      port map(A => ND1S6_a3_0, B => N_984, C => 
        Din_Delay4_RNI31E8(3), Y => \ND1S6_a2\);
    
    BO_RNO_1 : NOR3C
      port map(A => \un2_l40_m3\, B => N_984, C => 
        Din_Delay4_RNI31E8(3), Y => \BO_RNO_1\);
    
    HO : DFN1E1C0
      port map(D => HO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(8));
    
    EO : DFN0E1C0
      port map(D => EO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(4));
    
    DO_RNO_0 : AO1B
      port map(A => N_984, B => \un2_l40_m3\, C => 
        Din_Delay4_RNI31E8(3), Y => NDO);
    
    ND1S6_a1 : OR3C
      port map(A => Din_Delay4_RNI51E8(4), B => N_983, C => 
        NIO_0_a3_1, Y => \ND1S6_a1\);
    
    LPDL6 : DFN1C0
      port map(D => PDL6, CLK => SysClk_c, CLR => \LRESET\, Q => 
        \LPDL6\);
    
    S_RNO_0 : NOR2B
      port map(A => NIO_0_a0_1, B => \L13\, Y => un7_s_1);
    
    S : DFN1C0
      port map(D => S_2, CLK => SysClk_c, CLR => \LRESET\, Q => 
        \S\);
    
    CO_RNO : XNOR3
      port map(A => compls6, B => NCO, C => un3_compls6, Y => 
        CO_1);
    
    BO_RNO_0 : AO1C
      port map(A => \BO_RNO_1\, B => N_983, C => L04_i_0, Y => 
        NBO);
    
    un6_l31 : NOR2A
      port map(A => N_984, B => l13_i, Y => \un6_l31\);
    
    H4_RNIQ698 : OR3C
      port map(A => SINT_tz_tz, B => \H4\, C => ND1S4, Y => SINT);
    
    GO_RNO : AX1D
      port map(A => \G4\, B => un4_ngo, C => COMPLS4, Y => GO_1);
    
    un6_l22 : OR3B
      port map(A => un7_l13, B => Din_Delay4_RNI31E8(3), C => 
        N_984, Y => un6_l22_i);
    
    ND1S6_0_3 : NOR3C
      port map(A => \ND1S6_a0\, B => \ND1S6_a2\, C => \ND1S6_a4\, 
        Y => \ND1S6_0_3\);
    
    FO_RNO : AX1C
      port map(A => \F4\, B => SINT, C => COMPLS4, Y => FO_1);
    
    GO : DFN1E1C0
      port map(D => GO_1, CLK => SysClk_c, CLR => \LRESET\, E => 
        Bit_En, Q => TenbitDout(7));
    
    LPDL4_RNIP21I : NOR3
      port map(A => \LPDL4\, B => N_982, C => N_984, Y => 
        compls6_a3_1);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    LPDL4_RNO_1 : OR2
      port map(A => \G4\, B => \F4\, Y => ND0S4);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity FrameMk is

    port( SysClk   : in    std_logic;
          SysRst_n : in    std_logic;
          LVDS_en  : in    std_logic;
          ByteRdEn : in    std_logic;
          SDram2FK : in    std_logic_vector(71 downto 0);
          LVDS_O   : out   std_logic;
          tok      : out   std_logic;
          LVDS_ok  : out   std_logic
        );

end FrameMk;

architecture DEF_ARCH of FrameMk is 

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E0C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OUTBUF
    port( D   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component AX1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AX1E
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component INV
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AXOI3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component INBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XNOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1D
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AX1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AX1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component WaveGenSingle
    port( RE         : out   std_logic;
          SysRst_n_c : in    std_logic := 'U';
          SysClk_c   : in    std_logic := 'U';
          REen       : in    std_logic := 'U'
        );
  end component;

  component ByteData
    port( Fifo_dout    : out   std_logic_vector(7 downto 0);
          data_reg_6   : in    std_logic := 'U';
          data_reg_0   : in    std_logic := 'U';
          data_reg_5   : in    std_logic := 'U';
          data_reg_2   : in    std_logic := 'U';
          ByteData_VCC : in    std_logic := 'U';
          ByteData_GND : in    std_logic := 'U';
          LVDS_en_c    : in    std_logic := 'U';
          SysClk_c     : in    std_logic := 'U';
          WE           : in    std_logic := 'U';
          RE           : in    std_logic := 'U'
        );
  end component;

  component AOI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AXOI5
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component enc_8b10b
    port( TenbitDout         : out   std_logic_vector(9 downto 0);
          Din_Delay4_7       : in    std_logic := 'U';
          Din_Delay4_6       : in    std_logic := 'U';
          Din_Delay4_5       : in    std_logic := 'U';
          Din_Delay4_0       : in    std_logic := 'U';
          Din_Delay4_1       : in    std_logic := 'U';
          CRC_Reg_7          : in    std_logic := 'U';
          CRC_Reg_6          : in    std_logic := 'U';
          CRC_Reg_5          : in    std_logic := 'U';
          CRC_Reg_0          : in    std_logic := 'U';
          CRC_Reg_1          : in    std_logic := 'U';
          Din_Delay4_RNI31E8 : in    std_logic_vector(3 to 3) := (others => 'U');
          Din_Delay4_RNI51E8 : in    std_logic_vector(4 to 4) := (others => 'U');
          Bit_En             : in    std_logic := 'U';
          SysRst_n_c         : in    std_logic := 'U';
          SysClk_c           : in    std_logic := 'U';
          Kin_Delay4         : in    std_logic := 'U';
          CRC_ResultAva      : in    std_logic := 'U';
          N_983              : in    std_logic := 'U';
          N_982              : in    std_logic := 'U';
          N_984              : in    std_logic := 'U'
        );
  end component;

  component CLKBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component AND3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \data_reg[0]_net_1\, \GND\, \data_reg[2]_net_1\, 
        \data_reg[5]_net_1\, \data_reg[6]_net_1\, \Fifo_dout[0]\, 
        \Fifo_dout[1]\, \Fifo_dout[2]\, \Fifo_dout[3]\, 
        \Fifo_dout[4]\, \Fifo_dout[5]\, \Fifo_dout[6]\, 
        \Fifo_dout[7]\, \WE\, RE, \REen\, \Kin_Delay4\, \Bit_En\, 
        \TenbitDout[9]\, \TenbitDout[8]\, \TenbitDout[7]\, 
        \TenbitDout[6]\, \TenbitDout[5]\, \TenbitDout[4]\, 
        \TenbitDout[3]\, \TenbitDout[2]\, \TenbitDout[1]\, 
        \TenbitDout[0]\, \ClkDivCnt[0]_net_1\, 
        \ClkDivCnt[1]_net_1\, \ClkDivCnt[2]_net_1\, 
        \ClkDivCnt[3]_net_1\, \ByteSel[0]_net_1\, 
        \ByteSel[1]_net_1\, \ByteSel[2]_net_1\, 
        \DataClkCnt[9]_net_1\, \ClkEn\, \DataClkCnt[0]_net_1\, 
        \CRC_Reg[7]_net_1\, \CRC_Reg[8]_net_1\, 
        \CRC_Reg[9]_net_1\, \CRC_Reg[11]_net_1\, 
        \CRC_Reg[12]_net_1\, \CRC_Reg[14]_net_1\, 
        \CRC_Reg[15]_net_1\, \CRC_Reg[17]_net_1\, 
        \CRC_Reg[18]_net_1\, \CRC_Reg[19]_net_1\, 
        \CRC_Reg[23]_net_1\, \CRC_Reg[29]_net_1\, 
        \CRC_Reg[30]_net_1\, \CRC_Reg[33]_net_1\, \CRC_ResultAva\, 
        \VCC\, data_reg32, \Prstate[0]_net_1\, \Prstate[5]_net_1\, 
        \Prstate[4]_net_1\, \Prstate[1]_net_1\, 
        \Prstate[7]_net_1\, \Prstate[3]_net_1\, 
        \Din_Delay4[0]_net_1\, \Din_Delay4[1]_net_1\, 
        \Din_Delay4[2]_net_1\, \Din_Delay4[3]_net_1\, 
        \Din_Delay4[4]_net_1\, \Din_Delay4[5]_net_1\, 
        \Din_Delay4[6]_net_1\, \Din_Delay4[7]_net_1\, 
        \CRC_Reg[32]_net_1\, \CRC_Reg[34]_net_1\, 
        \CRC_Reg[35]_net_1\, \CRC_Reg[36]_net_1\, 
        \CRC_Reg[37]_net_1\, \CRC_Reg[38]_net_1\, 
        \CRC_Reg[39]_net_1\, \op_eq.pts_en2\, data_reg27, 
        data_reg28, \DelayCnt[0]_net_1\, \DelayCnt[1]_net_1\, 
        \DelayCnt[2]_net_1\, \DelayCnt[3]_net_1\, \Shifter_4[8]\, 
        \Shifter[1]_net_1\, \Shifter[2]_net_1\, 
        \Shifter[3]_net_1\, \Shifter[4]_net_1\, 
        \Shifter[5]_net_1\, \Shifter[6]_net_1\, 
        \Shifter[7]_net_1\, \Shifter[8]_net_1\, 
        \Shifter[9]_net_1\, \PtS_En\, \op_eq.bit_en2\, 
        \op_eq.clken2\, \Shifter[0]_net_1\, \DataClkCnt[1]_net_1\, 
        \DataClkCnt[2]_net_1\, \DataClkCnt[3]_net_1\, 
        \DataClkCnt[4]_net_1\, \DataClkCnt[5]_net_1\, 
        \DataClkCnt[6]_net_1\, \DataClkCnt[7]_net_1\, 
        \DataClkCnt[8]_net_1\, \DataClkCnt[10]_net_1\, 
        \DataClkCnt[11]_net_1\, \Prstate[2]_net_1\, 
        \CRC_Reg[0]_net_1\, \CRC_Reg[1]_net_1\, 
        \CRC_Reg[2]_net_1\, \CRC_Reg[3]_net_1\, 
        \CRC_Reg[4]_net_1\, \CRC_Reg[5]_net_1\, 
        \CRC_Reg[6]_net_1\, \CRC_Reg[10]_net_1\, 
        \CRC_Reg[13]_net_1\, \CRC_Reg[16]_net_1\, 
        \CRC_Reg[20]_net_1\, \CRC_Reg[21]_net_1\, 
        \CRC_Reg[22]_net_1\, \CRC_Reg[24]_net_1\, 
        \CRC_Reg[25]_net_1\, \CRC_Reg[26]_net_1\, 
        \CRC_Reg[27]_net_1\, \CRC_Reg[28]_net_1\, 
        \CRC_Reg[31]_net_1\, \StepCnt[3]_net_1\, \Kin_Delay2\, 
        \Kin_Delay1\, \Din_Delay2[0]_net_1\, 
        \Din_Delay2[1]_net_1\, \Din_Delay2[2]_net_1\, 
        \Din_Delay2[3]_net_1\, \Din_Delay2[4]_net_1\, 
        \Din_Delay2[5]_net_1\, \Din_Delay2[6]_net_1\, 
        \Din_Delay2[7]_net_1\, \Din_Delay1[0]_net_1\, 
        \Din_Delay1[1]_net_1\, \Din_Delay1[2]_net_1\, 
        \Din_Delay1[3]_net_1\, \Din_Delay1[4]_net_1\, 
        \Din_Delay1[5]_net_1\, \Din_Delay1[6]_net_1\, 
        \Din_Delay1[7]_net_1\, \Prstate[6]_net_1\, \Kin_Delay3\, 
        \Din_Delay3[0]_net_1\, \Din_Delay3[1]_net_1\, 
        \Din_Delay3[2]_net_1\, \Din_Delay3[3]_net_1\, 
        \Din_Delay3[4]_net_1\, \Din_Delay3[5]_net_1\, 
        \Din_Delay3[6]_net_1\, \Din_Delay3[7]_net_1\, I_4, I_5, 
        I_9, I_13, \Kin\, \rowcnt[0]_net_1\, \rowcnt[1]_net_1\, 
        \rowcnt[2]_net_1\, \rowcnt[3]_net_1\, \rowcnt[4]_net_1\, 
        \rowcnt[5]_net_1\, \rowcnt[6]_net_1\, \rowcnt[7]_net_1\, 
        \rowcnt[8]_net_1\, \rowcnt[9]_net_1\, \rowcnt[10]_net_1\, 
        \DataOk\, \ByteDout[0]_net_1\, \ByteDout[1]_net_1\, 
        \ByteDout[2]_net_1\, \ByteDout[3]_net_1\, 
        \ByteDout[4]_net_1\, \ByteDout[5]_net_1\, 
        \ByteDout[6]_net_1\, \ByteDout[7]_net_1\, 
        \ClkDivCnt_3[1]\, \ClkDivCnt_3[3]\, \PKGCnt[0]_net_1\, 
        \PKGCnt[1]_net_1\, \PKGCnt[2]_net_1\, \PKGCnt[3]_net_1\, 
        \PKGCnt[4]_net_1\, \PKGCnt[5]_net_1\, \PKGCnt[6]_net_1\, 
        \PKGCnt[7]_net_1\, \PKGCnt[8]_net_1\, \PKGCnt[9]_net_1\, 
        \PKGCnt[10]_net_1\, \PKGCnt[11]_net_1\, 
        \PKGCnt[12]_net_1\, \PKGCnt[13]_net_1\, 
        \PKGCnt[14]_net_1\, \PKGCnt[15]_net_1\, 
        \FrameCnt[4]_net_1\, \FrameCnt[5]_net_1\, 
        \FrameCnt[6]_net_1\, \FrameCnt[7]_net_1\, 
        \FrameCnt[8]_net_1\, \FrameCnt[0]_net_1\, 
        \FrameCnt[1]_net_1\, \FrameCnt[2]_net_1\, 
        \FrameCnt[3]_net_1\, CRC_ResultAva_3, \StepCnt[0]_net_1\, 
        \StepCnt[1]_net_1\, \StepCnt[2]_net_1\, \ByteDout_8[0]\, 
        ByteSel_n0, ByteSel_n1, data_reg30, ByteSel_n2, 
        PKGCnt_n10, PKGCnt_n11, PKGCnt_n12, PKGCnt_n13, 
        PKGCnt_n14, PKGCnt_n15, StepCnt_e1, StepCnt_e2, 
        StepCnt_e3, DataClkCnt_e0, DataClkCnt_e8, DataClkCnt_e9, 
        DataClkCnt_e10, DataClkCnt_e11, \Prstate_ns[0]\, 
        \Prstate_ns[3]\, \Prstate_ns[5]\, \Prstate_ns[7]\, 
        \Prstate_RNO[6]_net_1\, \Prstate_RNO[5]_net_1\, 
        \Prstate_RNO[3]_net_1\, \Prstate_RNO[1]_net_1\, N_14, 
        N_16, N_18, N_20, N_22, N_24, \DelayCnt_RNO_0[3]_net_1\, 
        N_27, N_31, \CRC_Reg_RNO[4]_net_1\, 
        \CRC_Reg_RNO[5]_net_1\, \CRC_Reg_RNO[6]_net_1\, 
        ByteSel_1_sqmuxa, \CRC_Reg_RNO[10]_net_1\, N_10, 
        \CRC_Reg_RNO[21]_net_1\, \CRC_Reg_RNO[22]_net_1\, 
        \CRC_Reg_RNO[23]_net_1\, \CRC_Reg_RNO[25]_net_1\, 
        \CRC_Reg_RNO[26]_net_1\, \CRC_Reg_RNO[27]_net_1\, 
        \CRC_Reg_RNO[28]_net_1\, N_26, N_28, N_30, N_32, 
        \CRC_Reg_RNO[34]_net_1\, \CRC_Reg_RNO[35]_net_1\, 
        \CRC_Reg_RNO[36]_net_1\, \CRC_Reg_RNO[37]_net_1\, 
        \CRC_Reg_RNO[38]_net_1\, \CRC_Reg_RNO[2]_net_1\, N_15, 
        \CRC_Reg_RNO[13]_net_1\, \CRC_Reg_RNO[32]_net_1\, 
        \CRC_Reg_RNO[39]_net_1\, N_97, N_113, N_115, N_117, 
        \rowcnt_RNO[10]_net_1\, N_229, \DelayCnt_RNO[1]_net_1\, 
        N_252, N_261, N_288, N_308, N_358, N_360, N_362, 
        \CRC_Reg_RNO[18]_net_1\, \CRC_Reg_RNO[19]_net_1\, 
        \CRC_Reg_RNO[24]_net_1\, N_374, N_375, N_376, N_377, 
        N_380, N_384, N_388, N_389, N_390, N_393, N_395, N_396, 
        N_399, N_403, N_405, N_408, N_411, N_413, N_414, N_417, 
        N_418, N_419, N_424, N_429, N_430, N_431, 
        \PKGCnt_RNIH0HQ[13]_net_1\, \rowcnt_RNI9CNN[10]_net_1\, 
        \rowcnt_RNIFK101[10]_net_1\, \ByteDout_RNO_8[1]_net_1\, 
        \Prstate_RNIUCLD[6]_net_1\, \Prstate_RNO_3[3]_net_1\, 
        \ByteDout_RNO_6[0]_net_1\, \ByteDout_RNO_11[1]_net_1\, 
        \ByteDout_RNO_5[3]_net_1\, \Din_Delay4_RNI31E8[3]_net_1\, 
        \Din_Delay4_RNI51E8[4]_net_1\, \CRC_Reg_RNO_0[9]_net_1\, 
        \CRC_Reg_RNO_0[10]_net_1\, \CRC_Reg_RNO_0[20]_net_1\, 
        \CRC_Reg_RNO_0[30]_net_1\, \CRC_Reg_RNO_0[34]_net_1\, 
        \CRC_Reg_RNO_0[12]_net_1\, \CRC_Reg_RNO_0[15]_net_1\, 
        \CRC_Reg_RNO_0[18]_net_1\, \CRC_Reg_RNO_0[19]_net_1\, 
        \CRC_Reg_RNO_0[24]_net_1\, \CRC_Reg_RNO_0[31]_net_1\, 
        \CRC_Reg_RNO_0[13]_net_1\, N_525, N_534, N_557, N_558, 
        N_559, N_586, N_588, N_592, N_594, N_598, N_599, N_606, 
        N_622, N_629, N_631, N_633, N_636, N_637, N_638, N_639, 
        N_644, N_648, N_656, N_664, N_672, N_680, N_694, N_695, 
        N_703, N_704, N_705, N_711, N_712, N_739, N_757, N_759, 
        \CRC_Reg_RNO_1[4]_net_1\, \CRC_Reg_RNO_2[4]_net_1\, N_766, 
        N_768, N_773, N_797, \CRC_Reg_RNO_2[34]_net_1\, 
        \CRC_Reg_RNO_2[12]_net_1\, N_817, N_821, N_823, N_825, 
        N_833, N_835, N_837, N_839, N_840, N_841, N_842, N_845, 
        N_846, N_847, N_848, N_849, N_851, N_854, N_855, N_930, 
        N_462_i, N_463_i, N_464_i, \Shifter_4[0]\, \Shifter_4[1]\, 
        \Shifter_4[2]\, \Shifter_4[3]\, \Shifter_4[4]\, 
        \Shifter_4[5]\, \Shifter_4[6]\, \Shifter_4[7]\, 
        \un1_clkdivcnt.N_4\, \un1_clkdivcnt.N_7\, SysClk_c, 
        SysRst_n_c, LVDS_en_c, ByteRdEn_c, LVDS_O_c, tok_c, 
        LVDS_ok_c, N_604, N_959, N_624, N_920, N_602, N_432, 
        N_476_i, N_603, N_652, un1_Prstate_3_i, N_420, N_714, 
        N_530, N_434, DataOk_0_sqmuxa, N_5, N_546, N_554, N_406, 
        N_556, N_563, N_552, N_553, N_401, N_386, N_382, N_555, 
        REen_1, N_983, N_984, N_982, N_997, N_819, 
        \ByteDout_RNO_5[2]_net_1\, \ByteDout_8_1_a5_3_1[0]\, 
        \ByteDout_8_i_a5_0[2]\, N_1497_tz, \op_eq.bit_en2_1\, 
        N_771_i, N_772_i, FrameCnt_0_sqmuxa_i, N_589_i, N_852_i, 
        N_12_i_0, N_468_i_i_0, N_466_i_i_0, N_937_i_0, N_145_i_0, 
        N_278_i_0, N_282_i_0, N_284_i_0, N_286_i_0, N_536_i_i_0, 
        N_532_i_i_0, N_527_i_i_0, N_497_i_i_0, N_484_i_i_0, 
        N_478_i_i_0, N_474_i_i_0, N_471_i_i_0, N_538_i_i_0, 
        N_533_i_i_0, N_528_i_i_0, N_498_i_i_0, N_486_i_i_0, 
        N_479_i_i_0, N_475_i_i_0, N_472_i_i_0, N_529_i_i_0, 
        N_510_i_i_0, N_496_i_i_0, N_482_i_i_0, N_477_i_i_0, 
        N_473_i_i_0, N_469_i_i_0, N_33_i_0, N_280_i_0, 
        \CRC_Reg_RNO_4[3]_net_1\, \CRC_Reg_RNO_1[3]_net_1\, 
        \ByteDout_RNO_1[7]_net_1\, \ByteDout_RNO_6[7]_net_1\, 
        \ByteDout_RNO_1[6]_net_1\, \ByteDout_RNO_5[6]_net_1\, 
        \ByteDout_RNO_8[6]_net_1\, \ByteDout_RNO_0[5]_net_1\, 
        \ByteDout_RNO_5[5]_net_1\, \ByteDout_RNO_4[5]_net_1\, 
        \ByteDout_RNO_2[3]_net_1\, \ByteDout_RNO_5[0]_net_1\, 
        \ByteDout_RNO_2[2]_net_1\, \ByteDout_RNO_8[2]_net_1\, 
        \ByteDout_RNO_0[4]_net_1\, \ByteDout_RNO_5[4]_net_1\, 
        \ByteDout_RNO_3[4]_net_1\, REen_1_0_a5_0, 
        \op_eq.clken2_0\, \op_eq.clkdivcnt7_0\, 
        CRC_ResultAva_3_0_a5_0_1, CRC_ResultAva_3_0_a5_0_2, 
        \ByteDout_8_i_o2_0_0[1]\, DataOk_0_sqmuxa_0_a3_0_a5_2, 
        DataOk_0_sqmuxa_0_a3_0_a5_4, DataOk_0_sqmuxa_0_a3_0_a5_6, 
        DataOk_0_sqmuxa_0_a3_0_a5_7, DataOk_0_sqmuxa_0_a3_0_a5_8, 
        DataOk_0_sqmuxa_0_a3_0_a5_9, \ByteDout_8_i_a5_1_1[2]\, 
        CRC_ResultAva_3_0_o2_0, CRC_ResultAva_3_0_a5_0, 
        \Prstate_ns_i_0_a5_0_1[2]\, \Prstate_ns_0_0_a5_0_0[3]\, 
        \Prstate_ns_0_0_a5_0_2[3]\, \Prstate_ns_0_0_a5_0_1[5]\, 
        DataClkCnt_e11_0_0_a5_0_0, \Prstate_ns_i_0_0[2]\, 
        \Prstate_ns_i_0_1[2]\, \ByteDout_8_i_a5_5_0[1]\, 
        \ByteDout_8_i_a5_2_1[3]\, \ByteDout_8_i_a5_4_0[1]\, 
        \ByteDout_8_i_a5_1_0[6]\, \ByteDout_8_i_a5_0_0[7]\, 
        \ByteDout_8_i_a5_2_0[2]\, \Prstate_ns_i_0_0[4]\, 
        DataClkCnt_e1_i_0_0, \Prstate_ns_0_0_0_a5_0_0[7]\, 
        \Prstate_ns_i_0_0[6]\, \Prstate_ns_i_0_1[6]\, 
        \ByteDout_8_i_0[1]\, \ByteDout_8_i_2[1]\, 
        \ByteDout_8_i_4[1]\, DataClkCnt_e2_i_0_0, 
        DataClkCnt_e3_i_0_0, DataClkCnt_e4_i_0_0, 
        DataClkCnt_e5_i_0_0, DataClkCnt_e6_i_0_0, 
        \ByteDout_8_1_0[0]\, \ByteDout_8_1_2[0]\, 
        \CRC_Reg_14_i_0_0_0[0]\, \CRC_Reg_14_i_0_0_1[3]\, 
        StepCnt_e2_0_0_0_a5_0_0, \ByteDout_8_i_0[6]\, 
        \ByteDout_8_i_1[6]\, \ByteDout_8_i_2[6]\, 
        \ByteDout_8_i_4[6]\, \ByteDout_8_i_0[7]\, 
        \ByteDout_8_i_2[7]\, \ByteDout_8_i_3[7]\, 
        \ByteDout_8_i_0[3]\, \ByteDout_8_i_1[3]\, 
        StepCnt_e1_0_0_0_a5_0, \ByteDout_8_i_0[2]\, 
        \ByteDout_8_i_2[2]\, \ByteDout_8_i_0[4]\, 
        \ByteDout_8_i_2[4]\, \ByteDout_8_i_3[4]\, 
        \ByteDout_8_i_0[5]\, \ByteDout_8_i_2[5]\, 
        \CRC_Reg_14_1_a3_i_1[7]\, \CRC_Reg_14_i_0_1[2]\, 
        \CRC_Reg_14_i_0_0[6]\, \CRC_Reg_14_i_0_1[5]\, 
        \CRC_Reg_14_i_0_1[4]\, \CRC_Reg_14_i_0_1[1]\, 
        DataClkCnt_e11_0_0_a5_1_1, \CRC_Reg_14_2_0_i_0[16]\, 
        \CRC_Reg_14_i_0_0_0[35]\, \CRC_Reg_14_i_0_0_1[35]\, 
        \CRC_Reg_14_i_0_0_0[27]\, \CRC_Reg_14_i_0_0_1[27]\, 
        \CRC_Reg_14_i_0_0_0[26]\, \CRC_Reg_14_i_0_0_1[26]\, 
        \CRC_Reg_14_i_0_0[33]\, \CRC_Reg_14_i_0_1[33]\, 
        \CRC_Reg_14_i_0_0[36]\, \CRC_Reg_14_i_0_1[36]\, 
        \CRC_Reg_14_2_0_i_0[11]\, \CRC_Reg_14_2_0_i_1[11]\, 
        \CRC_Reg_14_2_0_i_0[14]\, \CRC_Reg_14_2_0_i_1[14]\, 
        \CRC_Reg_14_2_0_i_0[17]\, \CRC_Reg_14_2_0_i_1[17]\, 
        \CRC_Reg_14_2_i_0[9]\, \CRC_Reg_14_i_0_0[10]\, 
        \CRC_Reg_14_i_0_0[29]\, \CRC_Reg_14_i_0_1[29]\, 
        \CRC_Reg_14_i_0_0_0[20]\, \CRC_Reg_14_i_0_0_0[21]\, 
        \CRC_Reg_14_i_0_0_1[21]\, \CRC_Reg_14_i_0_0_0[22]\, 
        \CRC_Reg_14_i_0_0_1[22]\, \CRC_Reg_14_i_0_0_0[23]\, 
        \CRC_Reg_14_i_0_0_1[23]\, \CRC_Reg_14_i_0_0_0[25]\, 
        \CRC_Reg_14_i_0_0_1[25]\, \CRC_Reg_14_i_0_0_0[28]\, 
        \CRC_Reg_14_i_0_0_1[28]\, \CRC_Reg_14_i_0_0_0[30]\, 
        \CRC_Reg_14_i_0_0_0[34]\, \CRC_Reg_14_i_0_0_0[37]\, 
        \CRC_Reg_14_i_0_0_1[37]\, \CRC_Reg_14_i_0_0_0[38]\, 
        \CRC_Reg_14_i_0_0_1[38]\, \CRC_Reg_14_2_0_i_0[12]\, 
        \CRC_Reg_14_2_0_i_0[15]\, \CRC_Reg_14_2_0_i_0[18]\, 
        \CRC_Reg_14_2_0_i_0[19]\, \CRC_Reg_14_2_0_i_0[24]\, 
        \CRC_Reg_14_i_0_0[39]\, \CRC_Reg_14_i_0_1[39]\, 
        \CRC_Reg_14_i_0_0[32]\, \CRC_Reg_14_i_0_1[32]\, 
        \CRC_Reg_14_i_0_0_0[31]\, \CRC_Reg_14_2_i_0_0[13]\, 
        \CRC_Reg_14_2_i_0_0[8]\, StepCnt_e3_0_0_0, \LVDS_en_pad\, 
        ClkEn_0, N_841_0, N_839_0, N_413_0, N_374_0, N_738, 
        N_3308, N_1108, StepCnte, N_526, N_1028, N_1023, N_1020, 
        N_1024, N_1025, N_1026, StepCnt_e3_0_0_2, 
        StepCnt_e3_0_0_a5_0, N_945, N_427, N_561, 
        DataClkCnt_e11_0_0_0, GND_0, VCC_0 : std_logic;

    for all : WaveGenSingle
	Use entity work.WaveGenSingle(DEF_ARCH);
    for all : ByteData
	Use entity work.ByteData(DEF_ARCH);
    for all : enc_8b10b
	Use entity work.enc_8b10b(DEF_ARCH);
begin 


    \DataClkCnt_RNO_2[9]\ : OR3
      port map(A => N_852_i, B => \DataClkCnt[9]_net_1\, C => 
        N_414, Y => N_559);
    
    \CRC_Reg_RNO_0[7]\ : OR3
      port map(A => N_703, B => N_704, C => N_430, Y => 
        \CRC_Reg_14_1_a3_i_1[7]\);
    
    \CRC_Reg_RNO_1[4]\ : NOR2
      port map(A => N_534, B => \ByteDout[4]_net_1\, Y => 
        \CRC_Reg_RNO_1[4]_net_1\);
    
    \rowcnt[3]\ : DFN1E0C0
      port map(D => N_474_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[3]_net_1\);
    
    \Prstate_RNIUCLD[6]\ : NOR2
      port map(A => \Prstate[6]_net_1\, B => \Prstate[2]_net_1\, 
        Y => \Prstate_RNIUCLD[6]_net_1\);
    
    \StepCnt_RNO_0[2]\ : OR3A
      port map(A => N_377, B => N_526, C => 
        StepCnt_e2_0_0_0_a5_0_0, Y => N_1026);
    
    \Prstate_RNO[7]\ : OR3B
      port map(A => LVDS_en_c, B => N_413_0, C => N_854, Y => 
        \Prstate_ns[0]\);
    
    \CRC_Reg[21]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[21]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[21]_net_1\);
    
    \StepCnt_RNO[1]\ : OR3C
      port map(A => N_1020, B => N_1024, C => N_1023, Y => 
        StepCnt_e1);
    
    \CRC_Reg_RNO_1[28]\ : OAI1
      port map(A => \CRC_Reg[27]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[28]\);
    
    tok_pad : OUTBUF
      port map(D => tok_c, PAD => tok);
    
    \rowcnt_RNO[8]\ : AX1C
      port map(A => N_405, B => \rowcnt[7]_net_1\, C => 
        \rowcnt[8]_net_1\, Y => N_532_i_i_0);
    
    \rowcnt_RNO[5]\ : XOR2
      port map(A => \rowcnt[5]_net_1\, B => N_395, Y => 
        N_484_i_i_0);
    
    \Din_Delay1[0]\ : DFN1E1C0
      port map(D => \ByteDout[0]_net_1\, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[0]_net_1\);
    
    \Shifter_RNO[3]\ : MX2
      port map(A => \Shifter[4]_net_1\, B => \TenbitDout[3]\, S
         => \PtS_En\, Y => \Shifter_4[3]\);
    
    \PKGCnt_RNO[1]\ : XOR2
      port map(A => \PKGCnt[1]_net_1\, B => \PKGCnt[0]_net_1\, Y
         => N_463_i);
    
    \rowcnt[5]\ : DFN1E0C0
      port map(D => N_484_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[5]_net_1\);
    
    \CRC_Reg[35]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[35]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[35]_net_1\);
    
    \CRC_Reg_RNO_1[34]\ : OAI1
      port map(A => \CRC_Reg[26]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[34]\);
    
    \ByteDout_RNO_2[0]\ : OR2B
      port map(A => \PKGCnt[11]_net_1\, B => N_855, Y => N_637);
    
    \DataClkCnt_RNO_0[6]\ : AX1E
      port map(A => N_396, B => \ClkEn\, C => 
        \DataClkCnt[6]_net_1\, Y => DataClkCnt_e6_i_0_0);
    
    Kin_Delay4 : DFN1E1P0
      port map(D => \Kin_Delay3\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Kin_Delay4\);
    
    LVDS_O_pad : OUTBUF
      port map(D => LVDS_O_c, PAD => LVDS_O);
    
    CRC_ResultAva_RNO_4 : OR2A
      port map(A => \CRC_ResultAva\, B => \Prstate[7]_net_1\, Y
         => CRC_ResultAva_3_0_a5_0);
    
    un1_clkdivcnt_I_4 : INV
      port map(A => \ClkDivCnt[0]_net_1\, Y => I_4);
    
    \StepCnt_RNO[0]\ : AXOI3
      port map(A => N_526, B => \StepCnt[0]_net_1\, C => StepCnte, 
        Y => N_97);
    
    \DataClkCnt_RNIKSO53[9]\ : AO1B
      port map(A => N_427, B => N_5, C => \ClkEn\, Y => N_945);
    
    \DelayCnt_RNIHG4A[3]\ : OR3A
      port map(A => \DelayCnt[2]_net_1\, B => N_417, C => 
        \DelayCnt[3]_net_1\, Y => N_920);
    
    ByteRdEn_pad : INBUF
      port map(PAD => ByteRdEn, Y => ByteRdEn_c);
    
    \Prstate_RNO[5]\ : OA1B
      port map(A => N_432, B => \Prstate_ns_i_0_a5_0_1[2]\, C => 
        \Prstate_ns_i_0_1[2]\, Y => \Prstate_RNO[5]_net_1\);
    
    \StepCnt_RNO_1[2]\ : OR3B
      port map(A => N_420, B => \StepCnt[2]_net_1\, C => N_526, Y
         => N_1025);
    
    \CRC_Reg_RNO[23]\ : OA1B
      port map(A => \CRC_Reg[23]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[23]\, Y => \CRC_Reg_RNO[23]_net_1\);
    
    \ByteDout_RNO_4[3]\ : OA1A
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[3]\, C
         => N_639, Y => \ByteDout_8_i_0[3]\);
    
    \rowcnt[8]\ : DFN1E0C0
      port map(D => N_532_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[8]_net_1\);
    
    \Prstate_RNO_2[3]\ : NOR3A
      port map(A => N_429, B => \Prstate[4]_net_1\, C => N_417, Y
         => N_695);
    
    \ByteSel_RNO[0]\ : NOR2A
      port map(A => ByteSel_1_sqmuxa, B => \ByteSel[0]_net_1\, Y
         => ByteSel_n0);
    
    \CRC_Reg_RNO_1[33]\ : OAI1
      port map(A => \CRC_Reg[32]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0[33]\);
    
    \ByteDout_RNO_4[2]\ : OA1A
      port map(A => N_375, B => \ByteDout_8_i_a5_1_1[2]\, C => 
        \ByteDout_RNO_8[2]_net_1\, Y => \ByteDout_8_i_0[2]\);
    
    \PKGCnt[11]\ : DFN1E0C0
      port map(D => PKGCnt_n11, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[11]_net_1\);
    
    \CRC_Reg_RNO_1[30]\ : OAI1
      port map(A => \CRC_Reg[22]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[30]\);
    
    \CRC_Reg_RNO_0[19]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[18]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[19]_net_1\);
    
    \StepCnt_RNIN1G9[0]\ : OR2B
      port map(A => \StepCnt[1]_net_1\, B => \StepCnt[0]_net_1\, 
        Y => N_420);
    
    \CRC_Reg_RNO_1[18]\ : OAI1
      port map(A => \CRC_Reg[10]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[18]\);
    
    \ClkDivCnt[1]\ : DFN1C0
      port map(D => \ClkDivCnt_3[1]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \ClkDivCnt[1]_net_1\);
    
    \CRC_Reg_RNO[29]\ : OA1B
      port map(A => \CRC_Reg[29]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_1[29]\, Y => N_26);
    
    \CRC_Reg[12]\ : DFN1C0
      port map(D => N_358, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[12]_net_1\);
    
    \DataClkCnt_RNIQJMG[3]\ : NOR2B
      port map(A => N_386, B => \DataClkCnt[3]_net_1\, Y => N_389);
    
    \Prstate_RNO_0[5]\ : OR3B
      port map(A => \DelayCnt[3]_net_1\, B => N_845, C => 
        \Prstate[6]_net_1\, Y => \Prstate_ns_i_0_a5_0_1[2]\);
    
    \CRC_Reg_RNO_2[4]\ : NOR2
      port map(A => N_839, B => \CRC_Reg[3]_net_1\, Y => 
        \CRC_Reg_RNO_2[4]_net_1\);
    
    \ByteSel[1]\ : DFN1C0
      port map(D => ByteSel_n1, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \ByteSel[1]_net_1\);
    
    \Din_Delay2[7]\ : DFN1E1P0
      port map(D => \Din_Delay1[7]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[7]_net_1\);
    
    \data_reg_RNO[2]\ : NOR2B
      port map(A => \ByteSel[2]_net_1\, B => \ByteSel[0]_net_1\, 
        Y => data_reg32);
    
    \CRC_Reg_RNO_0[24]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[23]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[24]_net_1\);
    
    \PKGCnt[6]\ : DFN1E0C0
      port map(D => N_498_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \PKGCnt[6]_net_1\);
    
    \ByteSel_RNIH3EF[1]\ : NOR2B
      port map(A => \ByteSel[1]_net_1\, B => \ByteSel[0]_net_1\, 
        Y => data_reg30);
    
    \FrameCnt_RNIMQM1[4]\ : NOR3C
      port map(A => \FrameCnt[3]_net_1\, B => N_403, C => 
        \FrameCnt[4]_net_1\, Y => N_411);
    
    \CRC_Reg_RNO_2[19]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[19]_net_1\, Y => N_823);
    
    \CRC_Reg[13]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[13]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[13]_net_1\);
    
    \Prstate_RNIUCLD[3]\ : OR2
      port map(A => \Prstate[5]_net_1\, B => \Prstate[3]_net_1\, 
        Y => N_652);
    
    \DataClkCnt_RNI6KMG[3]\ : NOR3C
      port map(A => \DataClkCnt[4]_net_1\, B => 
        \DataClkCnt[3]_net_1\, C => DataOk_0_sqmuxa_0_a3_0_a5_2, 
        Y => DataOk_0_sqmuxa_0_a3_0_a5_7);
    
    \CRC_Reg_RNO[14]\ : OA1B
      port map(A => \CRC_Reg[14]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_2_0_i_1[14]\, Y => N_115);
    
    \Prstate_RNO_0[0]\ : NOR2B
      port map(A => LVDS_en_c, B => \Prstate[1]_net_1\, Y => 
        \Prstate_ns_0_0_0_a5_0_0[7]\);
    
    \PKGCnt_RNI1SDC[4]\ : NOR3B
      port map(A => \PKGCnt[3]_net_1\, B => \PKGCnt[4]_net_1\, C
         => N_380, Y => N_384);
    
    \DataClkCnt[2]\ : DFN1C0
      port map(D => N_14, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DataClkCnt[2]_net_1\);
    
    \Prstate_RNO[3]\ : NOR3
      port map(A => N_694, B => \Prstate_ns_i_0_0[4]\, C => N_695, 
        Y => \Prstate_RNO[3]_net_1\);
    
    \PKGCnt_RNO[13]\ : XNOR2
      port map(A => N_424, B => \PKGCnt[13]_net_1\, Y => 
        PKGCnt_n13);
    
    \Prstate_RNO[6]\ : NOR3B
      port map(A => LVDS_en_c, B => N_680, C => N_854, Y => 
        \Prstate_RNO[6]_net_1\);
    
    \DataClkCnt_RNO_1[8]\ : OR2A
      port map(A => \DataClkCnt[8]_net_1\, B => \ClkEn\, Y => 
        N_555);
    
    \CRC_Reg_RNO_1[7]\ : NOR2
      port map(A => N_534, B => \ByteDout[7]_net_1\, Y => N_703);
    
    \CRC_Reg_RNO_0[23]\ : AO1D
      port map(A => N_841_0, B => \CRC_Reg[15]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[23]\, Y => \CRC_Reg_14_i_0_0_1[23]\);
    
    \PKGCnt_RNO[7]\ : XOR2
      port map(A => \PKGCnt[7]_net_1\, B => N_390, Y => 
        N_528_i_i_0);
    
    \CRC_Reg_RNO_0[20]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[19]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[20]_net_1\);
    
    \Din_Delay4[3]\ : DFN1E1P0
      port map(D => \Din_Delay3[3]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[3]_net_1\);
    
    \DataClkCnt_RNO_0[4]\ : AX1E
      port map(A => N_389, B => \ClkEn\, C => 
        \DataClkCnt[4]_net_1\, Y => DataClkCnt_e4_i_0_0);
    
    \CRC_Reg_RNO[5]\ : OA1B
      port map(A => \CRC_Reg[5]_net_1\, B => N_377, C => 
        \CRC_Reg_14_i_0_1[5]\, Y => \CRC_Reg_RNO[5]_net_1\);
    
    \CRC_Reg[17]\ : DFN1C0
      port map(D => N_117, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[17]_net_1\);
    
    \DataClkCnt_RNO[3]\ : NOR2A
      port map(A => N_546, B => DataClkCnt_e3_i_0_0, Y => N_16);
    
    \CRC_Reg_RNO[31]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[31]_net_1\, B => 
        \CRC_Reg_14_i_0_0_0[31]\, C => N_833, Y => N_30);
    
    PtS_En : DFN1C0
      port map(D => \op_eq.pts_en2\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \PtS_En\);
    
    \FrameCnt_RNO[1]\ : XOR2
      port map(A => \FrameCnt[1]_net_1\, B => \FrameCnt[0]_net_1\, 
        Y => N_462_i);
    
    \ByteDout_RNO_3[3]\ : NOR3B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[2]_net_1\, 
        C => \rowcnt[3]_net_1\, Y => \ByteDout_8_i_a5_2_1[3]\);
    
    \PKGCnt[1]\ : DFN1E0C0
      port map(D => N_463_i, CLK => SysClk_c, CLR => SysRst_n_c, 
        E => N_413_0, Q => \PKGCnt[1]_net_1\);
    
    \StepCnt_RNIPC86[3]\ : OR2
      port map(A => \StepCnt[3]_net_1\, B => \ClkEn\, Y => 
        N_839_0);
    
    \Din_Delay1[5]\ : DFN1E1P0
      port map(D => \ByteDout[5]_net_1\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[5]_net_1\);
    
    \PKGCnt_RNO[12]\ : AX1
      port map(A => N_408, B => \PKGCnt[11]_net_1\, C => 
        \PKGCnt[12]_net_1\, Y => PKGCnt_n12);
    
    \CRC_Reg[22]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[22]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[22]_net_1\);
    
    \CRC_Reg_RNO_1[8]\ : OAI1
      port map(A => \CRC_Reg[0]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_i_0_0[8]\);
    
    \CRC_Reg_RNO[30]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[30]_net_1\, B => 
        \CRC_Reg_14_i_0_0_0[30]\, C => N_797, Y => N_28);
    
    \Shifter[6]\ : DFN1C0
      port map(D => \Shifter_4[6]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[6]_net_1\);
    
    \Prstate_RNIVGLD[5]\ : OR2A
      port map(A => \Prstate[5]_net_1\, B => \Prstate[4]_net_1\, 
        Y => N_840);
    
    \DataClkCnt_RNO_0[9]\ : OR3C
      port map(A => N_5, B => \DataClkCnt[9]_net_1\, C => N_414, 
        Y => N_557);
    
    \ByteDout_RNO_1[4]\ : NOR3B
      port map(A => \ByteDout_RNO_3[4]_net_1\, B => 
        \ByteDout_8_i_0[4]\, C => N_419, Y => \ByteDout_8_i_2[4]\);
    
    \ByteSel_RNO[2]\ : XA1
      port map(A => \ByteSel[2]_net_1\, B => data_reg30, C => 
        ByteSel_1_sqmuxa, Y => ByteSel_n2);
    
    \rowcnt[10]\ : DFN1E0C0
      port map(D => \rowcnt_RNO[10]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => N_413, Q => \rowcnt[10]_net_1\);
    
    \Din_Delay2[2]\ : DFN1E1P0
      port map(D => \Din_Delay1[2]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[2]_net_1\);
    
    \ByteDout_RNO_1[3]\ : OAI1
      port map(A => \DelayCnt[2]_net_1\, B => 
        \ByteDout_RNO_5[3]_net_1\, C => N_848, Y => N_638);
    
    \Din_Delay1[7]\ : DFN1E1P0
      port map(D => \ByteDout[7]_net_1\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[7]_net_1\);
    
    PtS_En_RNO : NOR3A
      port map(A => \ClkDivCnt[1]_net_1\, B => 
        \ClkDivCnt[2]_net_1\, C => \ClkDivCnt[0]_net_1\, Y => 
        \op_eq.pts_en2\);
    
    \rowcnt_RNI6P27[2]\ : NOR3C
      port map(A => \rowcnt[0]_net_1\, B => \rowcnt[1]_net_1\, C
         => \rowcnt[2]_net_1\, Y => N_388);
    
    CRC_ResultAva_RNINSB7_0 : OR2B
      port map(A => \ClkEn\, B => \CRC_ResultAva\, Y => N_841_0);
    
    \CRC_Reg[23]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[23]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[23]_net_1\);
    
    \Din_Delay1[4]\ : DFN1E1P0
      port map(D => \ByteDout[4]_net_1\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[4]_net_1\);
    
    \rowcnt_RNIS5HG[6]\ : NOR3C
      port map(A => N_395, B => \rowcnt[5]_net_1\, C => 
        \rowcnt[6]_net_1\, Y => N_405);
    
    \CRC_Reg_RNO_0[2]\ : OR3
      port map(A => N_711, B => N_712, C => N_430, Y => 
        \CRC_Reg_14_i_0_1[2]\);
    
    \CRC_Reg_RNO_0[9]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[8]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[9]_net_1\);
    
    \ByteDout_RNO_3[5]\ : OA1C
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[5]\, C
         => N_419, Y => \ByteDout_8_i_0[5]\);
    
    \CRC_Reg_RNO_2[3]\ : OR3B
      port map(A => \ClkEn\, B => N_376, C => \CRC_Reg[3]_net_1\, 
        Y => N_772_i);
    
    \DataClkCnt_RNO_0[1]\ : AX1C
      port map(A => \DataClkCnt[0]_net_1\, B => \ClkEn\, C => 
        \DataClkCnt[1]_net_1\, Y => DataClkCnt_e1_i_0_0);
    
    \DataClkCnt[6]\ : DFN1C0
      port map(D => N_22, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DataClkCnt[6]_net_1\);
    
    \FrameCnt_RNO[7]\ : XOR2
      port map(A => N_431, B => \FrameCnt[7]_net_1\, Y => 
        N_510_i_i_0);
    
    \CRC_Reg_RNO[28]\ : OA1B
      port map(A => \CRC_Reg[28]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[28]\, Y => \CRC_Reg_RNO[28]_net_1\);
    
    \Prstate_RNI68A8_0[0]\ : OR2B
      port map(A => \Prstate[0]_net_1\, B => \ClkEn\, Y => N_413);
    
    \Prstate_RNO_1[0]\ : OR3B
      port map(A => \Prstate[0]_net_1\, B => LVDS_en_c, C => 
        \ClkEn\, Y => N_624);
    
    \CRC_Reg_RNO[22]\ : OA1B
      port map(A => \CRC_Reg[22]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[22]\, Y => \CRC_Reg_RNO[22]_net_1\);
    
    \DataClkCnt[4]\ : DFN1C0
      port map(D => N_18, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DataClkCnt[4]_net_1\);
    
    \DataClkCnt_RNI6JDB[7]\ : NOR3C
      port map(A => \DataClkCnt[10]_net_1\, B => 
        \DataClkCnt[7]_net_1\, C => DataOk_0_sqmuxa_0_a3_0_a5_4, 
        Y => DataOk_0_sqmuxa_0_a3_0_a5_8);
    
    \CRC_Reg[38]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[38]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[38]_net_1\);
    
    \DelayCnt_RNIB7A4[1]\ : OR2A
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[2]_net_1\, 
        Y => N_851);
    
    \PKGCnt_RNO[6]\ : AX1C
      port map(A => N_384, B => \PKGCnt[5]_net_1\, C => 
        \PKGCnt[6]_net_1\, Y => N_498_i_i_0);
    
    \DataClkCnt_RNIKRM5[11]\ : NOR2B
      port map(A => \DataClkCnt[11]_net_1\, B => 
        \DataClkCnt[8]_net_1\, Y => DataOk_0_sqmuxa_0_a3_0_a5_4);
    
    \CRC_Reg[27]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[27]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[27]_net_1\);
    
    \ByteDout_RNO_1[1]\ : NOR3C
      port map(A => N_589_i, B => \ByteDout_8_i_0[1]\, C => N_588, 
        Y => \ByteDout_8_i_2[1]\);
    
    \ByteDout_RNO_7[6]\ : AOI1B
      port map(A => \Prstate_RNIUCLD[6]_net_1\, B => N_375, C => 
        \ByteDout_RNO_8[6]_net_1\, Y => \ByteDout_8_i_0[6]\);
    
    \DataClkCnt_RNIR8SK[4]\ : NOR2B
      port map(A => N_389, B => \DataClkCnt[4]_net_1\, Y => N_393);
    
    \CRC_Reg_RNO[33]\ : OA1B
      port map(A => \CRC_Reg[33]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_1[33]\, Y => N_32);
    
    \ByteDout_RNO_1[5]\ : OR3B
      port map(A => \DelayCnt[2]_net_1\, B => N_847, C => 
        \rowcnt[5]_net_1\, Y => N_656);
    
    \CRC_Reg_RNO_0[35]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[27]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[35]\, Y => \CRC_Reg_14_i_0_0_1[35]\);
    
    \Prstate_RNO_0[6]\ : AO1A
      port map(A => \ClkEn\, B => \Prstate[6]_net_1\, C => 
        \Prstate[7]_net_1\, Y => N_680);
    
    \CRC_Reg_RNO_0[37]\ : AO1D
      port map(A => N_841_0, B => \CRC_Reg[29]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[37]\, Y => \CRC_Reg_14_i_0_0_1[37]\);
    
    \CRC_Reg_RNO_1[38]\ : OAI1
      port map(A => \CRC_Reg[37]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[38]\);
    
    \FrameCnt[5]\ : DFN1E0C0
      port map(D => N_482_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[5]_net_1\);
    
    \CRC_Reg_RNO_0[36]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[28]_net_1\, C => 
        \CRC_Reg_14_i_0_0[36]\, Y => \CRC_Reg_14_i_0_1[36]\);
    
    CRC_ResultAva_RNO_2 : AO1
      port map(A => CRC_ResultAva_3_0_o2_0, B => N_429, C => 
        CRC_ResultAva_3_0_a5_0, Y => N_586);
    
    \CRC_Reg_RNO[39]\ : OA1B
      port map(A => \CRC_Reg[39]_net_1\, B => N_374, C => 
        \CRC_Reg_14_i_0_1[39]\, Y => \CRC_Reg_RNO[39]_net_1\);
    
    \StepCnt_RNO_2[3]\ : AOI1B
      port map(A => StepCnt_e3_0_0_a5_0, B => N_1108, C => N_714, 
        Y => StepCnt_e3_0_0_2);
    
    \DataClkCnt[0]\ : DFN1C0
      port map(D => DataClkCnt_e0, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \DataClkCnt[0]_net_1\);
    
    \ClkDivCnt[2]\ : DFN1C0
      port map(D => I_9, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \ClkDivCnt[2]_net_1\);
    
    \Shifter_RNO[5]\ : MX2
      port map(A => \Shifter[6]_net_1\, B => \TenbitDout[5]\, S
         => \PtS_En\, Y => \Shifter_4[5]\);
    
    \data_reg_RNO[6]\ : NOR3A
      port map(A => \ByteSel[0]_net_1\, B => \ByteSel[1]_net_1\, 
        C => \ByteSel[2]_net_1\, Y => data_reg28);
    
    \CRC_Reg_RNO_1[3]\ : OR2
      port map(A => N_534, B => \ByteDout[3]_net_1\, Y => 
        \CRC_Reg_RNO_1[3]_net_1\);
    
    Bit_En_RNO : NOR3A
      port map(A => \ClkDivCnt[2]_net_1\, B => 
        \ClkDivCnt[3]_net_1\, C => \op_eq.bit_en2_1\, Y => 
        \op_eq.bit_en2\);
    
    \Shifter[8]\ : DFN1C0
      port map(D => \Shifter_4[8]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[8]_net_1\);
    
    \Din_Delay4[6]\ : DFN1E1C0
      port map(D => \Din_Delay3[6]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[6]_net_1\);
    
    \PKGCnt[0]\ : DFN1C0
      port map(D => N_468_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \PKGCnt[0]_net_1\);
    
    \FrameCnt_RNO[4]\ : AX1C
      port map(A => \FrameCnt[3]_net_1\, B => N_403, C => 
        \FrameCnt[4]_net_1\, Y => N_477_i_i_0);
    
    \CRC_Reg[14]\ : DFN1C0
      port map(D => N_115, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[14]_net_1\);
    
    \FrameCnt_RNO[8]\ : AX1C
      port map(A => \FrameCnt[7]_net_1\, B => N_431, C => 
        \FrameCnt[8]_net_1\, Y => N_529_i_i_0);
    
    \DataClkCnt_RNO_1[11]\ : OR3A
      port map(A => \DataClkCnt[10]_net_1\, B => 
        \DataClkCnt[11]_net_1\, C => N_852_i, Y => 
        DataClkCnt_e11_0_0_a5_1_1);
    
    \CRC_Reg_RNO_0[31]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[30]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[31]_net_1\);
    
    \rowcnt_RNI9CNN[10]\ : NOR3C
      port map(A => N_418, B => \rowcnt[9]_net_1\, C => 
        \rowcnt[10]_net_1\, Y => \rowcnt_RNI9CNN[10]_net_1\);
    
    \CRC_Reg[19]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[19]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[19]_net_1\);
    
    \DataClkCnt_RNO_0[10]\ : OR3
      port map(A => N_852_i, B => \DataClkCnt[10]_net_1\, C => 
        N_427, Y => N_561);
    
    \PKGCnt_RNO[15]\ : AX1
      port map(A => \PKGCnt_RNIH0HQ[13]_net_1\, B => 
        \PKGCnt[14]_net_1\, C => \PKGCnt[15]_net_1\, Y => 
        PKGCnt_n15);
    
    \DelayCnt_RNO_0[3]\ : AX1A
      port map(A => N_417, B => \DelayCnt[2]_net_1\, C => 
        \DelayCnt[3]_net_1\, Y => N_476_i);
    
    \CRC_Reg_RNO_0[4]\ : OR3
      port map(A => \CRC_Reg_RNO_1[4]_net_1\, B => 
        \CRC_Reg_RNO_2[4]_net_1\, C => N_430, Y => 
        \CRC_Reg_14_i_0_1[4]\);
    
    CRC_ResultAva_RNINSB7 : OR2B
      port map(A => \ClkEn\, B => \CRC_ResultAva\, Y => N_841);
    
    \ByteSel_RNO[1]\ : XA1
      port map(A => \ByteSel[1]_net_1\, B => \ByteSel[0]_net_1\, 
        C => ByteSel_1_sqmuxa, Y => ByteSel_n1);
    
    \CRC_Reg_RNO_0[15]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[14]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[15]_net_1\);
    
    \Prstate_RNO_0[4]\ : NOR3C
      port map(A => \Prstate_ns_0_0_a5_0_0[3]\, B => 
        \DelayCnt[3]_net_1\, C => N_845, Y => 
        \Prstate_ns_0_0_a5_0_2[3]\);
    
    \Din_Delay1[3]\ : DFN1E1P0
      port map(D => \ByteDout[3]_net_1\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[3]_net_1\);
    
    \CRC_Reg_RNO_0[17]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[9]_net_1\, C => 
        \CRC_Reg_14_2_0_i_0[17]\, Y => \CRC_Reg_14_2_0_i_1[17]\);
    
    \Shifter[4]\ : DFN1C0
      port map(D => \Shifter_4[4]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[4]_net_1\);
    
    \CRC_Reg_RNO_0[28]\ : AO1D
      port map(A => N_841_0, B => \CRC_Reg[20]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[28]\, Y => \CRC_Reg_14_i_0_0_1[28]\);
    
    \Prstate[6]\ : DFN1C0
      port map(D => \Prstate_RNO[6]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \Prstate[6]_net_1\);
    
    \CRC_Reg[4]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[4]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[4]_net_1\);
    
    \CRC_Reg[2]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[2]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[2]_net_1\);
    
    \CRC_Reg_RNO_0[16]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[15]_net_1\, 
        C => N_839_0, Y => N_997);
    
    LVDS_en_pad_RNIE6L21 : NOR2A
      port map(A => LVDS_en_c, B => N_377, Y => StepCnte);
    
    \DelayCnt_RNO[2]\ : XA1C
      port map(A => \DelayCnt[2]_net_1\, B => N_417, C => N_603, 
        Y => N_288);
    
    \ByteDout_RNO_4[7]\ : OA1B
      port map(A => N_849, B => \PKGCnt[10]_net_1\, C => N_419, Y
         => \ByteDout_8_i_2[7]\);
    
    \PKGCnt_RNI21DH[6]\ : NOR3C
      port map(A => N_384, B => \PKGCnt[5]_net_1\, C => 
        \PKGCnt[6]_net_1\, Y => N_390);
    
    Kin_Delay2 : DFN1E1P0
      port map(D => \Kin_Delay1\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Kin_Delay2\);
    
    \CRC_Reg_RNO_2[9]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[9]_net_1\, Y => N_622);
    
    \CRC_Reg_RNO_2[7]\ : NOR2
      port map(A => N_839, B => \CRC_Reg[6]_net_1\, Y => N_704);
    
    \Shifter[0]\ : DFN1C0
      port map(D => \Shifter_4[0]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[0]_net_1\);
    
    \Prstate[7]\ : DFN1P0
      port map(D => \Prstate_ns[0]\, CLK => SysClk_c, PRE => 
        SysRst_n_c, Q => \Prstate[7]_net_1\);
    
    \Prstate_RNIA8GQ1[4]\ : NOR2A
      port map(A => \Prstate[4]_net_1\, B => DataOk_0_sqmuxa, Y
         => N_5);
    
    \DataClkCnt_RNO[5]\ : NOR2A
      port map(A => N_546, B => DataClkCnt_e5_i_0_0, Y => N_20);
    
    \Prstate[3]\ : DFN1C0
      port map(D => \Prstate_RNO[3]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \Prstate[3]_net_1\);
    
    \CRC_Reg_RNO_2[15]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[15]_net_1\, Y => N_817);
    
    \CRC_Reg[31]\ : DFN1C0
      port map(D => N_30, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[31]_net_1\);
    
    \CRC_Reg_RNO_1[5]\ : NOR2
      port map(A => N_534, B => \ByteDout[5]_net_1\, Y => N_757);
    
    \PKGCnt[14]\ : DFN1E0C0
      port map(D => PKGCnt_n14, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[14]_net_1\);
    
    \CRC_Reg_RNO_0[32]\ : AO1D
      port map(A => N_841_0, B => \CRC_Reg[24]_net_1\, C => 
        \CRC_Reg_14_i_0_0[32]\, Y => \CRC_Reg_14_i_0_1[32]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \DataClkCnt[10]\ : DFN1C0
      port map(D => DataClkCnt_e10, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \DataClkCnt[10]_net_1\);
    
    \DataClkCnt_RNO_0[11]\ : OA1
      port map(A => N_427, B => DataClkCnt_e11_0_0_a5_1_1, C => 
        N_563, Y => DataClkCnt_e11_0_0_0);
    
    \CRC_Reg_RNO_2[16]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[16]_net_1\, Y => N_819);
    
    \CRC_Reg_RNO_1[9]\ : OAI1
      port map(A => \CRC_Reg[1]_net_1\, B => N_841, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_i_0[9]\);
    
    \ByteDout_RNO_7[1]\ : OR2
      port map(A => \PKGCnt[12]_net_1\, B => \DelayCnt[1]_net_1\, 
        Y => \ByteDout_8_i_a5_4_0[1]\);
    
    \FrameCnt[4]\ : DFN1E0C0
      port map(D => N_477_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[4]_net_1\);
    
    \PKGCnt_RNO[9]\ : XOR2
      port map(A => \PKGCnt[9]_net_1\, B => N_399, Y => 
        N_538_i_i_0);
    
    REGEN : WaveGenSingle
      port map(RE => RE, SysRst_n_c => SysRst_n_c, SysClk_c => 
        SysClk_c, REen => \REen\);
    
    \CRC_Reg_RNO_0[11]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[3]_net_1\, C => 
        \CRC_Reg_14_2_0_i_0[11]\, Y => \CRC_Reg_14_2_0_i_1[11]\);
    
    \rowcnt[9]\ : DFN1E0C0
      port map(D => N_536_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[9]_net_1\);
    
    \StepCnt_RNO[3]\ : OR3C
      port map(A => N_3308, B => StepCnt_e3_0_0_0, C => 
        StepCnt_e3_0_0_2, Y => StepCnt_e3);
    
    un1_clkdivcnt_I_8 : NOR2B
      port map(A => \ClkDivCnt[1]_net_1\, B => 
        \ClkDivCnt[0]_net_1\, Y => \un1_clkdivcnt.N_7\);
    
    \CRC_Reg_RNO[6]\ : NOR3
      port map(A => N_430, B => \CRC_Reg_14_i_0_0[6]\, C => N_738, 
        Y => \CRC_Reg_RNO[6]_net_1\);
    
    \CRC_Reg_RNO[27]\ : OA1B
      port map(A => \CRC_Reg[27]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[27]\, Y => \CRC_Reg_RNO[27]_net_1\);
    
    \FrameCnt_RNINS01[2]\ : NOR3C
      port map(A => \FrameCnt[0]_net_1\, B => \FrameCnt[1]_net_1\, 
        C => \FrameCnt[2]_net_1\, Y => N_403);
    
    \Din_Delay2[3]\ : DFN1E1P0
      port map(D => \Din_Delay1[3]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[3]_net_1\);
    
    \CRC_Reg[24]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[24]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[24]_net_1\);
    
    \CRC_Reg[29]\ : DFN1C0
      port map(D => N_26, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[29]_net_1\);
    
    \LVDS_ok\ : DFN1E1C0
      port map(D => FrameCnt_0_sqmuxa_i, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \ClkEn\, Q => LVDS_ok_c);
    
    \CRC_Reg_RNO[11]\ : OA1B
      port map(A => \CRC_Reg[11]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_2_0_i_1[11]\, Y => N_113);
    
    \Prstate_RNO_2[5]\ : OAI1
      port map(A => \Prstate[5]_net_1\, B => \Prstate[6]_net_1\, 
        C => LVDS_en_c, Y => \Prstate_ns_i_0_0[2]\);
    
    \FrameCnt[1]\ : DFN1E0C0
      port map(D => N_462_i, CLK => SysClk_c, CLR => SysRst_n_c, 
        E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[1]_net_1\);
    
    \DataClkCnt[11]\ : DFN1C0
      port map(D => DataClkCnt_e11, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \DataClkCnt[11]_net_1\);
    
    \ByteDout_RNO_4[0]\ : OA1A
      port map(A => N_375, B => \Prstate_RNIUCLD[6]_net_1\, C => 
        N_633, Y => \ByteDout_8_1_0[0]\);
    
    \Prstate_RNO_0[3]\ : NOR2A
      port map(A => \Prstate[4]_net_1\, B => \ClkEn\, Y => N_694);
    
    \ByteDout_RNO_0[4]\ : OR3A
      port map(A => \DelayCnt[0]_net_1\, B => N_849, C => 
        \PKGCnt[7]_net_1\, Y => \ByteDout_RNO_0[4]_net_1\);
    
    \FrameCnt[3]\ : DFN1E0C0
      port map(D => N_473_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[3]_net_1\);
    
    \CRC_Reg_RNO[10]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[10]_net_1\, B => 
        \CRC_Reg_14_i_0_0[10]\, C => N_705, Y => 
        \CRC_Reg_RNO[10]_net_1\);
    
    \CRC_Reg_RNO[38]\ : OA1B
      port map(A => \CRC_Reg[38]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[38]\, Y => \CRC_Reg_RNO[38]_net_1\);
    
    LVDS_en_pad_RNILPCS : OR2B
      port map(A => N_534, B => LVDS_en_c, Y => N_526);
    
    \CRC_Reg_RNO[32]\ : OA1B
      port map(A => \CRC_Reg[32]_net_1\, B => N_374, C => 
        \CRC_Reg_14_i_0_1[32]\, Y => \CRC_Reg_RNO[32]_net_1\);
    
    \StepCnt_RNO_1[1]\ : OR3A
      port map(A => \StepCnt[1]_net_1\, B => \StepCnt[0]_net_1\, 
        C => N_526, Y => N_1024);
    
    \rowcnt[0]\ : DFN1C0
      port map(D => N_466_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \rowcnt[0]_net_1\);
    
    CRC_ResultAva_RNO : AO1B
      port map(A => CRC_ResultAva_3_0_a5_0_2, B => 
        CRC_ResultAva_3_0_a5_0_1, C => N_586, Y => 
        CRC_ResultAva_3);
    
    \Prstate_RNI850M[3]\ : OR2A
      port map(A => \ClkEn\, B => N_376, Y => N_534);
    
    GenFIFO_Byte : ByteData
      port map(Fifo_dout(7) => \Fifo_dout[7]\, Fifo_dout(6) => 
        \Fifo_dout[6]\, Fifo_dout(5) => \Fifo_dout[5]\, 
        Fifo_dout(4) => \Fifo_dout[4]\, Fifo_dout(3) => 
        \Fifo_dout[3]\, Fifo_dout(2) => \Fifo_dout[2]\, 
        Fifo_dout(1) => \Fifo_dout[1]\, Fifo_dout(0) => 
        \Fifo_dout[0]\, data_reg_6 => \data_reg[6]_net_1\, 
        data_reg_0 => \data_reg[0]_net_1\, data_reg_5 => 
        \data_reg[5]_net_1\, data_reg_2 => \data_reg[2]_net_1\, 
        ByteData_VCC => \VCC\, ByteData_GND => \GND\, LVDS_en_c
         => LVDS_en_c, SysClk_c => SysClk_c, WE => \WE\, RE => RE);
    
    \DataClkCnt_RNO_0[7]\ : AOI1
      port map(A => N_401, B => \ClkEn\, C => 
        \DataClkCnt[7]_net_1\, Y => N_552);
    
    \ByteDout_RNO_6[1]\ : AO1B
      port map(A => \ByteDout_8_i_o2_0_0[1]\, B => 
        \ByteDout_RNO_11[1]_net_1\, C => N_930, Y => N_588);
    
    \StepCnt_RNI92LA1[2]\ : OR2A
      port map(A => N_434, B => N_526, Y => N_1108);
    
    \StepCnt_RNO_3[1]\ : NOR2A
      port map(A => \StepCnt[0]_net_1\, B => \StepCnt[1]_net_1\, 
        Y => StepCnt_e1_0_0_0_a5_0);
    
    \ByteDout_RNO_8[2]\ : OR2A
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[2]\, Y
         => \ByteDout_RNO_8[2]_net_1\);
    
    \CRC_Reg_RNO_0[12]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[11]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[12]_net_1\);
    
    \rowcnt[6]\ : DFN1E0C0
      port map(D => N_497_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[6]_net_1\);
    
    \PKGCnt_RNO[10]\ : AX1C
      port map(A => N_399, B => \PKGCnt[9]_net_1\, C => 
        \PKGCnt[10]_net_1\, Y => PKGCnt_n10);
    
    \Din_Delay4_RNIV0E8[1]\ : MX2
      port map(A => \Din_Delay4[1]_net_1\, B => 
        \CRC_Reg[33]_net_1\, S => \CRC_ResultAva\, Y => N_983);
    
    \Prstate_RNO_1[2]\ : OR3B
      port map(A => \Prstate[2]_net_1\, B => LVDS_en_c, C => 
        \ClkEn\, Y => N_606);
    
    \StepCnt[2]\ : DFN1C0
      port map(D => StepCnt_e2, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \StepCnt[2]_net_1\);
    
    \StepCnt_RNO_2[1]\ : OR2B
      port map(A => StepCnte, B => \StepCnt[1]_net_1\, Y => 
        N_1023);
    
    \rowcnt_RNO[6]\ : AX1C
      port map(A => N_395, B => \rowcnt[5]_net_1\, C => 
        \rowcnt[6]_net_1\, Y => N_497_i_i_0);
    
    \Din_Delay2[1]\ : DFN1E1C0
      port map(D => \Din_Delay1[1]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[1]_net_1\);
    
    \ByteDout[6]\ : DFN1E1C0
      port map(D => N_284_i_0, CLK => SysClk_c, CLR => SysRst_n_c, 
        E => N_629, Q => \ByteDout[6]_net_1\);
    
    \Shifter[5]\ : DFN1C0
      port map(D => \Shifter_4[5]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[5]_net_1\);
    
    \PKGCnt[7]\ : DFN1E0C0
      port map(D => N_528_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \PKGCnt[7]_net_1\);
    
    \CRC_Reg_RNO_2[12]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[12]_net_1\, Y => 
        \CRC_Reg_RNO_2[12]_net_1\);
    
    \ByteDout_RNO_6[6]\ : OR2
      port map(A => \PKGCnt[1]_net_1\, B => \DelayCnt[2]_net_1\, 
        Y => \ByteDout_8_i_a5_1_0[6]\);
    
    ClkEn_RNO_0 : OR2
      port map(A => \ClkDivCnt[3]_net_1\, B => 
        \ClkDivCnt[1]_net_1\, Y => \op_eq.clken2_0\);
    
    \ByteDout_RNO_2[2]\ : OR3A
      port map(A => \DelayCnt[0]_net_1\, B => N_849, C => 
        \PKGCnt[5]_net_1\, Y => \ByteDout_RNO_2[2]_net_1\);
    
    \ByteDout_RNO_4[1]\ : OR3
      port map(A => N_851, B => \ByteDout_RNO_8[1]_net_1\, C => 
        N_840, Y => N_589_i);
    
    \CRC_Reg[10]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[10]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[10]_net_1\);
    
    CRC_ResultAva_RNIG9KD : OR2B
      port map(A => N_841, B => N_839, Y => N_374);
    
    \StepCnt_RNO_5[3]\ : OAI1
      port map(A => \ClkEn\, B => N_376, C => LVDS_en_c, Y => 
        N_530);
    
    \FrameCnt[7]\ : DFN1E0C0
      port map(D => N_510_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[7]_net_1\);
    
    \ClkDivCnt[0]\ : DFN1C0
      port map(D => I_4, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \ClkDivCnt[0]_net_1\);
    
    \CRC_Reg_RNO[13]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[13]_net_1\, B => 
        \CRC_Reg_14_2_i_0_0[13]\, C => N_835, Y => 
        \CRC_Reg_RNO[13]_net_1\);
    
    \PKGCnt[12]\ : DFN1E0C0
      port map(D => PKGCnt_n12, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[12]_net_1\);
    
    \Shifter[7]\ : DFN1C0
      port map(D => \Shifter_4[7]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[7]_net_1\);
    
    \FrameCnt_RNO[6]\ : AX1C
      port map(A => \FrameCnt[5]_net_1\, B => N_411, C => 
        \FrameCnt[6]_net_1\, Y => N_496_i_i_0);
    
    \PKGCnt_RNO[4]\ : AX1
      port map(A => N_380, B => \PKGCnt[3]_net_1\, C => 
        \PKGCnt[4]_net_1\, Y => N_479_i_i_0);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => N_229, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DelayCnt[0]_net_1\);
    
    \CRC_Reg_RNO[19]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[19]_net_1\, B => 
        \CRC_Reg_14_2_0_i_0[19]\, C => N_823, Y => 
        \CRC_Reg_RNO[19]_net_1\);
    
    \CRC_Reg[32]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[32]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[32]_net_1\);
    
    \rowcnt_RNO[0]\ : XNOR2
      port map(A => \rowcnt[0]_net_1\, B => N_413_0, Y => 
        N_466_i_i_0);
    
    \ByteDout_RNO_5[1]\ : OA1A
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[1]\, C
         => N_592, Y => \ByteDout_8_i_0[1]\);
    
    \CRC_Reg_RNO_1[2]\ : NOR2
      port map(A => N_534, B => \ByteDout[2]_net_1\, Y => N_711);
    
    \CRC_Reg_RNO_0[8]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[7]_net_1\, 
        C => N_839_0, Y => N_525);
    
    \DataClkCnt_RNO_0[8]\ : OR3C
      port map(A => N_5, B => \DataClkCnt[8]_net_1\, C => N_406, 
        Y => N_554);
    
    \data_reg[2]\ : DFN1C0
      port map(D => data_reg32, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \data_reg[2]_net_1\);
    
    \Prstate_RNID4B8[7]\ : NOR2A
      port map(A => \Prstate[7]_net_1\, B => \ClkEn\, Y => N_854);
    
    \Prstate_RNO_3[3]\ : NOR2B
      port map(A => \Prstate[4]_net_1\, B => \DataOk\, Y => 
        \Prstate_RNO_3[3]_net_1\);
    
    \DelayCnt_RNIF5L3[0]\ : OR2B
      port map(A => \DelayCnt[0]_net_1\, B => \ClkEn\, Y => N_432);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => \DelayCnt_RNO[1]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \DelayCnt[1]_net_1\);
    
    \CRC_Reg_RNO_0[34]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[33]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[34]_net_1\);
    
    \ByteSel[2]\ : DFN1C0
      port map(D => ByteSel_n2, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \ByteSel[2]_net_1\);
    
    CRC_ResultAva_RNI4HOD : OR2B
      port map(A => N_841, B => LVDS_en_c, Y => N_430);
    
    \Prstate_RNI5PVL[1]\ : NOR2A
      port map(A => \ClkEn\, B => un1_Prstate_3_i, Y => N_603);
    
    \rowcnt_RNO[10]\ : AX1C
      port map(A => N_418, B => \rowcnt[9]_net_1\, C => 
        \rowcnt[10]_net_1\, Y => \rowcnt_RNO[10]_net_1\);
    
    \DataClkCnt_RNO_1[9]\ : OR2A
      port map(A => \DataClkCnt[9]_net_1\, B => \ClkEn\, Y => 
        N_558);
    
    \CRC_Reg[33]\ : DFN1C0
      port map(D => N_32, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[33]_net_1\);
    
    \DataClkCnt_RNO[8]\ : OR3C
      port map(A => N_554, B => N_555, C => N_556, Y => 
        DataClkCnt_e8);
    
    \CRC_Reg_RNO_0[0]\ : MX2C
      port map(A => \ByteDout[0]_net_1\, B => \CRC_Reg[0]_net_1\, 
        S => N_534, Y => \CRC_Reg_14_i_0_0_0[0]\);
    
    \Shifter[2]\ : DFN1C0
      port map(D => \Shifter_4[2]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[2]_net_1\);
    
    \CRC_Reg_RNO[7]\ : OA1B
      port map(A => \CRC_Reg[7]_net_1\, B => N_377, C => 
        \CRC_Reg_14_1_a3_i_1[7]\, Y => N_308);
    
    \PKGCnt[5]\ : DFN1E0C0
      port map(D => N_486_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[5]_net_1\);
    
    \CRC_Reg_RNO_0[3]\ : NOR3C
      port map(A => N_772_i, B => N_771_i, C => 
        \CRC_Reg_RNO_4[3]_net_1\, Y => \CRC_Reg_14_i_0_0_1[3]\);
    
    \ByteDout_RNO_3[2]\ : OR2B
      port map(A => \ByteDout_8_i_a5_2_0[2]\, B => N_848, Y => 
        N_598);
    
    \StepCnt[0]\ : DFN1C0
      port map(D => N_97, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \StepCnt[0]_net_1\);
    
    \DataClkCnt[7]\ : DFN1C0
      port map(D => N_24, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DataClkCnt[7]_net_1\);
    
    \ByteDout_RNO[2]\ : NOR3C
      port map(A => N_599, B => \ByteDout_8_i_2[2]\, C => 
        \ByteDout_RNO_2[2]_net_1\, Y => N_145_i_0);
    
    \CRC_Reg_RNO[37]\ : OA1B
      port map(A => \CRC_Reg[37]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[37]\, Y => \CRC_Reg_RNO[37]_net_1\);
    
    \CRC_Reg[20]\ : DFN1C0
      port map(D => N_10, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[20]_net_1\);
    
    \Din_Delay4[4]\ : DFN1E1P0
      port map(D => \Din_Delay3[4]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[4]_net_1\);
    
    \ByteDout_RNO[7]\ : NOR3C
      port map(A => \ByteDout_8_i_3[7]\, B => 
        \ByteDout_RNO_1[7]_net_1\, C => N_672, Y => N_286_i_0);
    
    \PKGCnt_RNO[0]\ : XNOR2
      port map(A => \PKGCnt[0]_net_1\, B => N_413_0, Y => 
        N_468_i_i_0);
    
    \CRC_Reg_RNO[3]\ : NOR3B
      port map(A => \CRC_Reg_14_i_0_0_1[3]\, B => 
        \CRC_Reg_RNO_1[3]_net_1\, C => N_430, Y => N_33_i_0);
    
    \Prstate_RNO_0[1]\ : AO1A
      port map(A => \ClkEn\, B => \Prstate[2]_net_1\, C => 
        \Prstate_ns_i_0_0[6]\, Y => \Prstate_ns_i_0_1[6]\);
    
    \CRC_Reg_RNO_0[33]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[25]_net_1\, C => 
        \CRC_Reg_14_i_0_0[33]\, Y => \CRC_Reg_14_i_0_1[33]\);
    
    \ByteDout_RNO[0]\ : OR3C
      port map(A => N_636, B => \ByteDout_8_1_2[0]\, C => N_637, 
        Y => \ByteDout_8[0]\);
    
    \CRC_Reg[37]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[37]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[37]_net_1\);
    
    \ByteDout_RNO_1[6]\ : OR3A
      port map(A => N_847, B => \DelayCnt[2]_net_1\, C => 
        \FrameCnt[2]_net_1\, Y => \ByteDout_RNO_1[6]_net_1\);
    
    \CRC_Reg_RNO_0[30]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[29]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[30]_net_1\);
    
    \Din_Delay2[6]\ : DFN1E1C0
      port map(D => \Din_Delay1[6]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[6]_net_1\);
    
    \ByteDout_RNO_0[5]\ : OR3A
      port map(A => \DelayCnt[0]_net_1\, B => N_849, C => 
        \PKGCnt[8]_net_1\, Y => \ByteDout_RNO_0[5]_net_1\);
    
    \Shifter_RNO[0]\ : MX2
      port map(A => \Shifter[1]_net_1\, B => \TenbitDout[0]\, S
         => \PtS_En\, Y => \Shifter_4[0]\);
    
    \PKGCnt[10]\ : DFN1E0C0
      port map(D => PKGCnt_n10, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[10]_net_1\);
    
    \ByteDout_RNO_9[1]\ : OR2A
      port map(A => N_375, B => \Prstate[2]_net_1\, Y => N_592);
    
    \ByteDout_RNO_3[7]\ : OA1A
      port map(A => N_846, B => \ByteDout_8_i_a5_0_0[7]\, C => 
        \ByteDout_RNO_6[7]_net_1\, Y => \ByteDout_8_i_0[7]\);
    
    \FrameCnt_RNO[2]\ : AX1C
      port map(A => \FrameCnt[0]_net_1\, B => \FrameCnt[1]_net_1\, 
        C => \FrameCnt[2]_net_1\, Y => N_469_i_i_0);
    
    \StepCnt_RNIK88E[2]\ : NOR2A
      port map(A => \StepCnt[2]_net_1\, B => N_420, Y => N_434);
    
    \PKGCnt[4]\ : DFN1E0C0
      port map(D => N_479_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[4]_net_1\);
    
    \ByteDout_RNO_2[7]\ : OR3B
      port map(A => \DelayCnt[2]_net_1\, B => N_847, C => 
        \rowcnt[7]_net_1\, Y => N_672);
    
    \CRC_Reg_RNO_1[29]\ : OAI1
      port map(A => \CRC_Reg[28]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0[29]\);
    
    \DelayCnt_RNIAOVH[0]\ : NOR2
      port map(A => N_842, B => \DelayCnt[0]_net_1\, Y => N_848);
    
    \CRC_Reg_RNO[0]\ : NOR2
      port map(A => \CRC_Reg_14_i_0_0_0[0]\, B => N_430, Y => 
        N_27);
    
    \CRC_Reg_RNO_0[14]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[6]_net_1\, C => 
        \CRC_Reg_14_2_0_i_0[14]\, Y => \CRC_Reg_14_2_0_i_1[14]\);
    
    LVDS_ok_RNO : NOR2B
      port map(A => \Prstate[0]_net_1\, B => 
        \rowcnt_RNI9CNN[10]_net_1\, Y => FrameCnt_0_sqmuxa_i);
    
    \ByteDout_RNO_9[2]\ : AO1D
      port map(A => N_851, B => \FrameCnt[6]_net_1\, C => 
        \ByteDout_8_i_a5_0[2]\, Y => N_1497_tz);
    
    \DataClkCnt_RNO_0[5]\ : AX1E
      port map(A => N_393, B => \ClkEn\, C => 
        \DataClkCnt[5]_net_1\, Y => DataClkCnt_e5_i_0_0);
    
    \Din_Delay4[0]\ : DFN1E1C0
      port map(D => \Din_Delay3[0]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[0]_net_1\);
    
    \data_reg_RNO[0]\ : NOR3
      port map(A => \ByteSel[1]_net_1\, B => \ByteSel[0]_net_1\, 
        C => \ByteSel[2]_net_1\, Y => data_reg27);
    
    \DataClkCnt_RNO[2]\ : NOR2A
      port map(A => N_546, B => DataClkCnt_e2_i_0_0, Y => N_14);
    
    \PKGCnt_RNI76CM[8]\ : NOR3C
      port map(A => N_390, B => \PKGCnt[7]_net_1\, C => 
        \PKGCnt[8]_net_1\, Y => N_399);
    
    \Din_Delay3[5]\ : DFN1E1P0
      port map(D => \Din_Delay2[5]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[5]_net_1\);
    
    \DataClkCnt_RNIQUGC[2]\ : NOR2B
      port map(A => N_382, B => \DataClkCnt[2]_net_1\, Y => N_386);
    
    \data_reg[5]\ : DFN1C0
      port map(D => data_reg30, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \data_reg[5]_net_1\);
    
    \DataClkCnt_RNO_0[3]\ : AX1E
      port map(A => N_386, B => \ClkEn\, C => 
        \DataClkCnt[3]_net_1\, Y => DataClkCnt_e3_i_0_0);
    
    \Prstate_RNO_1[3]\ : OAI1
      port map(A => \Prstate_RNO_3[3]_net_1\, B => 
        \Prstate[3]_net_1\, C => LVDS_en_c, Y => 
        \Prstate_ns_i_0_0[4]\);
    
    \Prstate[2]\ : DFN1C0
      port map(D => \Prstate_ns[5]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Prstate[2]_net_1\);
    
    \Prstate[5]\ : DFN1C0
      port map(D => \Prstate_RNO[5]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \Prstate[5]_net_1\);
    
    \CRC_Reg_RNO_0[13]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[12]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[13]_net_1\);
    
    \StepCnt_RNO_1[3]\ : AOI1B
      port map(A => \StepCnt[3]_net_1\, B => N_376, C => 
        LVDS_en_c, Y => StepCnt_e3_0_0_0);
    
    \CRC_Reg_RNO[18]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[18]_net_1\, B => 
        \CRC_Reg_14_2_0_i_0[18]\, C => N_821, Y => 
        \CRC_Reg_RNO[18]_net_1\);
    
    \CRC_Reg_RNO[12]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[12]_net_1\, B => 
        \CRC_Reg_14_2_0_i_0[12]\, C => \CRC_Reg_RNO_2[12]_net_1\, 
        Y => N_358);
    
    \CRC_Reg_RNO_0[10]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[9]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[10]_net_1\);
    
    \PKGCnt[13]\ : DFN1E0C0
      port map(D => PKGCnt_n13, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[13]_net_1\);
    
    \CRC_Reg_RNO[26]\ : OA1B
      port map(A => \CRC_Reg[26]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[26]\, Y => \CRC_Reg_RNO[26]_net_1\);
    
    \ByteDout_RNO_1[0]\ : NOR3C
      port map(A => N_631, B => \ByteDout_8_1_0[0]\, C => 
        \ByteDout_RNO_5[0]_net_1\, Y => \ByteDout_8_1_2[0]\);
    
    \DataClkCnt[5]\ : DFN1C0
      port map(D => N_20, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DataClkCnt[5]_net_1\);
    
    \CRC_Reg_RNO_1[19]\ : OAI1
      port map(A => \CRC_Reg[11]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[19]\);
    
    \ByteDout_RNO_8[1]\ : NOR2A
      port map(A => \FrameCnt[5]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => \ByteDout_RNO_8[1]_net_1\);
    
    \rowcnt_RNIFVPB[4]\ : NOR3C
      port map(A => N_388, B => \rowcnt[3]_net_1\, C => 
        \rowcnt[4]_net_1\, Y => N_395);
    
    \ByteDout_RNO_8[6]\ : OR2A
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[6]\, Y
         => \ByteDout_RNO_8[6]_net_1\);
    
    REen : DFN1E1C0
      port map(D => REen_1, CLK => SysClk_c, CLR => SysRst_n_c, E
         => \ClkEn\, Q => \REen\);
    
    \Prstate_RNID4B8_0[7]\ : NOR2A
      port map(A => \ClkEn\, B => \Prstate[7]_net_1\, Y => N_629);
    
    \Din_Delay2[0]\ : DFN1E1C0
      port map(D => \Din_Delay1[0]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[0]_net_1\);
    
    \CRC_Reg_RNO_2[24]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[24]_net_1\, Y => N_825);
    
    \CRC_Reg_RNO_2[13]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[13]_net_1\, Y => N_835);
    
    \CRC_Reg_RNO_2[10]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[10]_net_1\, Y => N_705);
    
    \CRC_Reg[5]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[5]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[5]_net_1\);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_288, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \ByteDout_RNO_0[1]\ : OR3A
      port map(A => \ByteDout_8_i_a5_5_0[1]\, B => 
        \DelayCnt[2]_net_1\, C => N_842, Y => N_594);
    
    \ByteDout_RNO_7[2]\ : OR3
      port map(A => \Prstate[1]_net_1\, B => \Prstate[0]_net_1\, 
        C => \Prstate[6]_net_1\, Y => \ByteDout_8_i_a5_1_1[2]\);
    
    \ByteDout_RNO_0[7]\ : NOR3B
      port map(A => \ByteDout_8_i_0[7]\, B => \ByteDout_8_i_2[7]\, 
        C => N_855, Y => \ByteDout_8_i_3[7]\);
    
    \CRC_Reg_RNO[9]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[9]_net_1\, B => 
        \CRC_Reg_14_2_i_0[9]\, C => N_622, Y => N_252);
    
    \Prstate_RNO[1]\ : OA1B
      port map(A => N_920, B => \Prstate[2]_net_1\, C => 
        \Prstate_ns_i_0_1[6]\, Y => \Prstate_RNO[1]_net_1\);
    
    \CRC_Reg[16]\ : DFN1C0
      port map(D => N_362, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[16]_net_1\);
    
    \DelayCnt_RNIUR4K[1]\ : NOR2B
      port map(A => N_846, B => N_845, Y => N_855);
    
    \ByteDout_RNO_2[1]\ : AO1C
      port map(A => \DelayCnt[3]_net_1\, B => 
        \ByteDout_8_i_a5_4_0[1]\, C => N_846, Y => 
        \ByteDout_8_i_4[1]\);
    
    \Din_Delay3[1]\ : DFN1E1C0
      port map(D => \Din_Delay2[1]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[1]_net_1\);
    
    \CRC_Reg_RNO_2[20]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[20]_net_1\, Y => N_773);
    
    \rowcnt[4]\ : DFN1E0C0
      port map(D => N_478_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[4]_net_1\);
    
    \CRC_Reg[34]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[34]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[34]_net_1\);
    
    \CRC_Reg[39]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[39]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[39]_net_1\);
    
    \CRC_Reg[1]\ : DFN1C0
      port map(D => N_31, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[1]_net_1\);
    
    \DelayCnt_RNO[0]\ : AXOI5
      port map(A => un1_Prstate_3_i, B => \ClkEn\, C => 
        \DelayCnt[0]_net_1\, Y => N_229);
    
    ClkEn_RNO : NOR3
      port map(A => \ClkDivCnt[0]_net_1\, B => 
        \ClkDivCnt[2]_net_1\, C => \op_eq.clken2_0\, Y => 
        \op_eq.clken2\);
    
    \rowcnt_RNO[4]\ : AX1C
      port map(A => N_388, B => \rowcnt[3]_net_1\, C => 
        \rowcnt[4]_net_1\, Y => N_478_i_i_0);
    
    \ByteDout_RNO[6]\ : NOR3C
      port map(A => \ByteDout_8_i_4[6]\, B => 
        \ByteDout_RNO_1[6]_net_1\, C => N_664, Y => N_284_i_0);
    
    \Shifter_RNO[7]\ : MX2
      port map(A => \Shifter[8]_net_1\, B => \TenbitDout[7]\, S
         => \PtS_En\, Y => \Shifter_4[7]\);
    
    \Prstate[4]\ : DFN1C0
      port map(D => \Prstate_ns[3]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Prstate[4]_net_1\);
    
    \Shifter_RNO[8]\ : MX2
      port map(A => \Shifter[9]_net_1\, B => \TenbitDout[8]\, S
         => \PtS_En\, Y => \Shifter_4[8]\);
    
    \DataClkCnt_RNO[9]\ : OR3C
      port map(A => N_557, B => N_558, C => N_559, Y => 
        DataClkCnt_e9);
    
    \ByteDout[3]\ : DFN1E1P0
      port map(D => N_278_i_0, CLK => SysClk_c, PRE => SysRst_n_c, 
        E => N_629, Q => \ByteDout[3]_net_1\);
    
    \ByteSel[0]\ : DFN1C0
      port map(D => ByteSel_n0, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \ByteSel[0]_net_1\);
    
    \DataClkCnt_RNI48D11[7]\ : OR2B
      port map(A => N_401, B => \DataClkCnt[7]_net_1\, Y => N_406);
    
    \CRC_Reg_RNO_0[38]\ : AO1D
      port map(A => N_841_0, B => \CRC_Reg[30]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[38]\, Y => \CRC_Reg_14_i_0_0_1[38]\);
    
    \CRC_Reg_RNO_2[31]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[31]_net_1\, Y => N_833);
    
    \PKGCnt[2]\ : DFN1E0C0
      port map(D => N_472_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[2]_net_1\);
    
    \DataClkCnt_RNO[1]\ : NOR2B
      port map(A => DataClkCnt_e1_i_0_0, B => N_546, Y => 
        N_12_i_0);
    
    \CRC_Reg_RNO_1[6]\ : NOR2
      port map(A => N_377, B => \CRC_Reg[6]_net_1\, Y => N_738);
    
    \FrameCnt_RNO[5]\ : XOR2
      port map(A => N_411, B => \FrameCnt[5]_net_1\, Y => 
        N_482_i_i_0);
    
    \ByteDout_RNO_10[2]\ : OA1C
      port map(A => \PKGCnt[13]_net_1\, B => \DelayCnt[2]_net_1\, 
        C => \DelayCnt[1]_net_1\, Y => \ByteDout_8_i_a5_0[2]\);
    
    \PKGCnt_RNO[14]\ : XNOR2
      port map(A => \PKGCnt_RNIH0HQ[13]_net_1\, B => 
        \PKGCnt[14]_net_1\, Y => PKGCnt_n14);
    
    \CRC_Reg_RNO_2[8]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[8]_net_1\, Y => N_837);
    
    \ByteDout_RNO_0[2]\ : OR3B
      port map(A => \DelayCnt[2]_net_1\, B => N_847, C => 
        \rowcnt[2]_net_1\, Y => N_599);
    
    \Prstate_RNO_2[4]\ : NOR2B
      port map(A => LVDS_en_c, B => \Prstate[5]_net_1\, Y => 
        \Prstate_ns_0_0_a5_0_0[3]\);
    
    \DataClkCnt_RNO_1[7]\ : NOR2A
      port map(A => \ClkEn\, B => N_406, Y => N_553);
    
    \rowcnt[7]\ : DFN1E0C0
      port map(D => N_527_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[7]_net_1\);
    
    \DataClkCnt_RNO[10]\ : AO1B
      port map(A => N_945, B => \DataClkCnt[10]_net_1\, C => 
        N_561, Y => DataClkCnt_e10);
    
    \ByteDout_RNO_5[0]\ : AO1A
      port map(A => \DelayCnt[3]_net_1\, B => 
        \ByteDout_8_1_a5_3_1[0]\, C => N_840, Y => 
        \ByteDout_RNO_5[0]_net_1\);
    
    \ByteDout_RNO_5[7]\ : OR2
      port map(A => \PKGCnt[2]_net_1\, B => \DelayCnt[2]_net_1\, 
        Y => \ByteDout_8_i_a5_0_0[7]\);
    
    \ByteDout_RNO_2[5]\ : NOR3C
      port map(A => \ByteDout_8_i_0[5]\, B => 
        \ByteDout_RNO_4[5]_net_1\, C => \ByteDout_RNO_5[5]_net_1\, 
        Y => \ByteDout_8_i_2[5]\);
    
    \ByteDout_RNO_4[5]\ : OR3A
      port map(A => N_846, B => N_851, C => \PKGCnt[0]_net_1\, Y
         => \ByteDout_RNO_4[5]_net_1\);
    
    \LVDS_O\ : DFN1C0
      port map(D => \Shifter[0]_net_1\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => LVDS_O_c);
    
    \PKGCnt[8]\ : DFN1E0C0
      port map(D => N_533_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \PKGCnt[8]_net_1\);
    
    \data_reg[6]\ : DFN1C0
      port map(D => data_reg28, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \data_reg[6]_net_1\);
    
    \CRC_Reg[26]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[26]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[26]_net_1\);
    
    \PKGCnt_RNI4NE7[2]\ : OR3C
      port map(A => \PKGCnt[0]_net_1\, B => \PKGCnt[1]_net_1\, C
         => \PKGCnt[2]_net_1\, Y => N_380);
    
    \tok\ : DFN1E1C0
      port map(D => N_652, CLK => SysClk_c, CLR => SysRst_n_c, E
         => \ClkEn\, Q => tok_c);
    
    \CRC_Reg_RNO[25]\ : OA1B
      port map(A => \CRC_Reg[25]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[25]\, Y => \CRC_Reg_RNO[25]_net_1\);
    
    \rowcnt_RNO[3]\ : XOR2
      port map(A => \rowcnt[3]_net_1\, B => N_388, Y => 
        N_474_i_i_0);
    
    \Prstate_RNIANFK[1]\ : OR2
      port map(A => \Prstate[1]_net_1\, B => N_652, Y => 
        un1_Prstate_3_i);
    
    \PKGCnt_RNO[5]\ : XOR2
      port map(A => \PKGCnt[5]_net_1\, B => N_384, Y => 
        N_486_i_i_0);
    
    \CRC_Reg_RNO[17]\ : OA1B
      port map(A => \CRC_Reg[17]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_2_0_i_1[17]\, Y => N_117);
    
    \CRC_Reg_RNO[8]\ : NOR3
      port map(A => N_525, B => \CRC_Reg_14_2_i_0_0[8]\, C => 
        N_837, Y => N_15);
    
    \Din_Delay4_RNIT0E8[0]\ : MX2
      port map(A => \Din_Delay4[0]_net_1\, B => 
        \CRC_Reg[32]_net_1\, S => \CRC_ResultAva\, Y => N_982);
    
    \StepCnt_RNO_0[1]\ : OR3B
      port map(A => StepCnt_e1_0_0_0_a5_0, B => N_377, C => N_526, 
        Y => N_1020);
    
    \ByteDout_RNO_1[7]\ : OR3A
      port map(A => N_847, B => \DelayCnt[2]_net_1\, C => 
        \FrameCnt[3]_net_1\, Y => \ByteDout_RNO_1[7]_net_1\);
    
    \Shifter_RNO[1]\ : MX2
      port map(A => \Shifter[2]_net_1\, B => \TenbitDout[1]\, S
         => \PtS_En\, Y => \Shifter_4[1]\);
    
    \Din_Delay2[4]\ : DFN1E1P0
      port map(D => \Din_Delay1[4]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[4]_net_1\);
    
    \DataClkCnt_RNO[6]\ : NOR2A
      port map(A => N_546, B => DataClkCnt_e6_i_0_0, Y => N_22);
    
    \ByteDout[2]\ : DFN1E1P0
      port map(D => N_145_i_0, CLK => SysClk_c, PRE => SysRst_n_c, 
        E => N_629, Q => \ByteDout[2]_net_1\);
    
    \Din_Delay2[5]\ : DFN1E1P0
      port map(D => \Din_Delay1[5]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay2[5]_net_1\);
    
    \StepCnt_RNO_3[3]\ : AOI1B
      port map(A => N_526, B => \ClkEn\, C => \StepCnt[3]_net_1\, 
        Y => StepCnt_e3_0_0_a5_0);
    
    \CRC_Reg_RNO[2]\ : OA1B
      port map(A => \CRC_Reg[2]_net_1\, B => N_377, C => 
        \CRC_Reg_14_i_0_1[2]\, Y => \CRC_Reg_RNO[2]_net_1\);
    
    \CRC_Reg_RNO_0[18]\ : XA1C
      port map(A => \CRC_Reg[39]_net_1\, B => \CRC_Reg[17]_net_1\, 
        C => N_839, Y => \CRC_Reg_RNO_0[18]_net_1\);
    
    \Din_Delay3[4]\ : DFN1E1P0
      port map(D => \Din_Delay2[4]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[4]_net_1\);
    
    \Din_Delay3[6]\ : DFN1E1C0
      port map(D => \Din_Delay2[6]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[6]_net_1\);
    
    \FrameCnt[2]\ : DFN1E0C0
      port map(D => N_469_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[2]_net_1\);
    
    \PKGCnt_RNIH0HQ[13]\ : OR2A
      port map(A => \PKGCnt[13]_net_1\, B => N_424, Y => 
        \PKGCnt_RNIH0HQ[13]_net_1\);
    
    \CRC_Reg_RNO_1[39]\ : OAI1
      port map(A => \CRC_Reg[38]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0[39]\);
    
    CRC_ResultAva_RNO_3 : NOR3C
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \Prstate[1]_net_1\, Y => CRC_ResultAva_3_0_o2_0);
    
    \FrameCnt_RNO[0]\ : XNOR2
      port map(A => \FrameCnt[0]_net_1\, B => 
        \rowcnt_RNIFK101[10]_net_1\, Y => N_261);
    
    \CRC_Reg_RNO[36]\ : OA1B
      port map(A => \CRC_Reg[36]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_1[36]\, Y => \CRC_Reg_RNO[36]_net_1\);
    
    \ByteDout_RNO_5[4]\ : OR3A
      port map(A => N_847, B => \DelayCnt[2]_net_1\, C => 
        \FrameCnt[0]_net_1\, Y => \ByteDout_RNO_5[4]_net_1\);
    
    \CRC_Reg_RNO_1[25]\ : OAI1
      port map(A => \CRC_Reg[24]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[25]\);
    
    \ClkDivCnt_RNO[1]\ : OA1A
      port map(A => \op_eq.clkdivcnt7_0\, B => \op_eq.bit_en2_1\, 
        C => I_5, Y => \ClkDivCnt_3[1]\);
    
    \CRC_Reg_RNO_1[27]\ : OAI1
      port map(A => \CRC_Reg[26]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[27]\);
    
    \CRC_Reg[3]\ : DFN1C0
      port map(D => N_33_i_0, CLK => SysClk_c, CLR => SysRst_n_c, 
        Q => \CRC_Reg[3]_net_1\);
    
    \DelayCnt_RNIMKQF[3]\ : OR2
      port map(A => N_840, B => \DelayCnt[3]_net_1\, Y => N_842);
    
    \CRC_Reg_RNO_1[26]\ : OAI1
      port map(A => \CRC_Reg[25]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[26]\);
    
    \ByteDout_RNO[3]\ : NOR3C
      port map(A => \ByteDout_8_i_1[3]\, B => N_638, C => 
        \ByteDout_RNO_2[3]_net_1\, Y => N_278_i_0);
    
    \rowcnt[1]\ : DFN1E0C0
      port map(D => N_464_i, CLK => SysClk_c, CLR => SysRst_n_c, 
        E => N_413, Q => \rowcnt[1]_net_1\);
    
    \CRC_Reg_RNO_2[18]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[18]_net_1\, Y => N_821);
    
    \Prstate[0]\ : DFN1C0
      port map(D => \Prstate_ns[7]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Prstate[0]_net_1\);
    
    \Prstate_RNI5A0S1[4]\ : OR2B
      port map(A => N_5, B => \ClkEn\, Y => N_852_i);
    
    \Din_Delay3[0]\ : DFN1E1C0
      port map(D => \Din_Delay2[0]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[0]_net_1\);
    
    \data_reg[0]\ : DFN1C0
      port map(D => data_reg27, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \data_reg[0]_net_1\);
    
    REen_RNO : AO1
      port map(A => REen_1_0_a5_0, B => \REen\, C => 
        \Prstate[5]_net_1\, Y => REen_1);
    
    LVDS_ok_pad : OUTBUF
      port map(D => LVDS_ok_c, PAD => LVDS_ok);
    
    \StepCnt_RNI1I8S[3]\ : OR2B
      port map(A => N_839, B => N_534, Y => N_377);
    
    \Din_Delay3[3]\ : DFN1E1P0
      port map(D => \Din_Delay2[3]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[3]_net_1\);
    
    \CRC_Reg_RNO_3[3]\ : OR3A
      port map(A => \StepCnt[3]_net_1\, B => \CRC_Reg[3]_net_1\, 
        C => \ClkEn\, Y => N_771_i);
    
    \CRC_Reg_RNO_1[21]\ : OAI1
      port map(A => \CRC_Reg[20]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[21]\);
    
    \CRC_Reg_RNO_1[15]\ : OAI1
      port map(A => \CRC_Reg[7]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[15]\);
    
    \Prstate_RNO_1[5]\ : AO1A
      port map(A => \ClkEn\, B => \Prstate[6]_net_1\, C => 
        \Prstate_ns_i_0_0[2]\, Y => \Prstate_ns_i_0_1[2]\);
    
    \CRC_Reg_RNO_1[17]\ : OAI1
      port map(A => \CRC_Reg[16]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[17]\);
    
    \CRC_Reg_RNO_0[29]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[21]_net_1\, C => 
        \CRC_Reg_14_i_0_0[29]\, Y => \CRC_Reg_14_i_0_1[29]\);
    
    \DataClkCnt_RNO[4]\ : NOR2A
      port map(A => N_546, B => DataClkCnt_e4_i_0_0, Y => N_18);
    
    \Shifter[9]\ : DFN1E1C0
      port map(D => \TenbitDout[9]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \PtS_En\, Q => \Shifter[9]_net_1\);
    
    \StepCnt_RNO_3[2]\ : OR2
      port map(A => \StepCnt[2]_net_1\, B => N_420, Y => 
        StepCnt_e2_0_0_0_a5_0_0);
    
    \CRC_Reg[30]\ : DFN1C0
      port map(D => N_28, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[30]_net_1\);
    
    \Prstate_RNI5A0S1_0[4]\ : OR2A
      port map(A => \ClkEn\, B => N_5, Y => N_546);
    
    \CRC_Reg_RNO_1[16]\ : OAI1
      port map(A => \CRC_Reg[8]_net_1\, B => N_841, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[16]\);
    
    \Prstate_RNO_1[4]\ : OR3C
      port map(A => \Prstate[4]_net_1\, B => LVDS_en_c, C => 
        N_959, Y => N_604);
    
    \Shifter_RNO[2]\ : MX2
      port map(A => \Shifter[3]_net_1\, B => \TenbitDout[2]\, S
         => \PtS_En\, Y => \Shifter_4[2]\);
    
    \StepCnt_RNIPC86_0[3]\ : OR2
      port map(A => \StepCnt[3]_net_1\, B => \ClkEn\, Y => N_839);
    
    \Din_Delay4_RNI51E8[4]\ : MX2
      port map(A => \Din_Delay4[4]_net_1\, B => 
        \CRC_Reg[36]_net_1\, S => \CRC_ResultAva\, Y => 
        \Din_Delay4_RNI51E8[4]_net_1\);
    
    \PKGCnt_RNO[8]\ : AX1C
      port map(A => N_390, B => \PKGCnt[7]_net_1\, C => 
        \PKGCnt[8]_net_1\, Y => N_533_i_i_0);
    
    \CRC_Reg[0]\ : DFN1C0
      port map(D => N_27, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[0]_net_1\);
    
    \ByteDout_RNO[4]\ : NOR3C
      port map(A => \ByteDout_RNO_0[4]_net_1\, B => 
        \ByteDout_8_i_2[4]\, C => \ByteDout_8_i_3[4]\, Y => 
        N_280_i_0);
    
    \CRC_Reg[8]\ : DFN1C0
      port map(D => N_15, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[8]_net_1\);
    
    \ByteDout_RNO_5[6]\ : OR2
      port map(A => \PKGCnt[9]_net_1\, B => N_849, Y => 
        \ByteDout_RNO_5[6]_net_1\);
    
    \Prstate_RNO[0]\ : AO1C
      port map(A => N_920, B => \Prstate_ns_0_0_0_a5_0_0[7]\, C
         => N_624, Y => \Prstate_ns[7]\);
    
    \CRC_Reg[15]\ : DFN1C0
      port map(D => N_360, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[15]_net_1\);
    
    \ByteDout_RNO[5]\ : NOR3C
      port map(A => \ByteDout_RNO_0[5]_net_1\, B => N_656, C => 
        \ByteDout_8_i_2[5]\, Y => N_282_i_0);
    
    \Prstate[1]\ : DFN1C0
      port map(D => \Prstate_RNO[1]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \Prstate[1]_net_1\);
    
    \CRC_Reg[7]\ : DFN1C0
      port map(D => N_308, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[7]_net_1\);
    
    Com_8b10b : enc_8b10b
      port map(TenbitDout(9) => \TenbitDout[9]\, TenbitDout(8)
         => \TenbitDout[8]\, TenbitDout(7) => \TenbitDout[7]\, 
        TenbitDout(6) => \TenbitDout[6]\, TenbitDout(5) => 
        \TenbitDout[5]\, TenbitDout(4) => \TenbitDout[4]\, 
        TenbitDout(3) => \TenbitDout[3]\, TenbitDout(2) => 
        \TenbitDout[2]\, TenbitDout(1) => \TenbitDout[1]\, 
        TenbitDout(0) => \TenbitDout[0]\, Din_Delay4_7 => 
        \Din_Delay4[7]_net_1\, Din_Delay4_6 => 
        \Din_Delay4[6]_net_1\, Din_Delay4_5 => 
        \Din_Delay4[5]_net_1\, Din_Delay4_0 => 
        \Din_Delay4[0]_net_1\, Din_Delay4_1 => 
        \Din_Delay4[1]_net_1\, CRC_Reg_7 => \CRC_Reg[39]_net_1\, 
        CRC_Reg_6 => \CRC_Reg[38]_net_1\, CRC_Reg_5 => 
        \CRC_Reg[37]_net_1\, CRC_Reg_0 => \CRC_Reg[32]_net_1\, 
        CRC_Reg_1 => \CRC_Reg[33]_net_1\, Din_Delay4_RNI31E8(3)
         => \Din_Delay4_RNI31E8[3]_net_1\, Din_Delay4_RNI51E8(4)
         => \Din_Delay4_RNI51E8[4]_net_1\, Bit_En => \Bit_En\, 
        SysRst_n_c => SysRst_n_c, SysClk_c => SysClk_c, 
        Kin_Delay4 => \Kin_Delay4\, CRC_ResultAva => 
        \CRC_ResultAva\, N_983 => N_983, N_982 => N_982, N_984
         => N_984);
    
    \ClkDivCnt[3]\ : DFN1C0
      port map(D => \ClkDivCnt_3[3]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \ClkDivCnt[3]_net_1\);
    
    \DataClkCnt_RNIFIO91[9]\ : OR2A
      port map(A => \DataClkCnt[9]_net_1\, B => N_414, Y => N_427);
    
    \FrameCnt_RNO[3]\ : XOR2
      port map(A => N_403, B => \FrameCnt[3]_net_1\, Y => 
        N_473_i_i_0);
    
    \DataClkCnt_RNO[0]\ : AXOI5
      port map(A => N_5, B => \ClkEn\, C => \DataClkCnt[0]_net_1\, 
        Y => DataClkCnt_e0);
    
    \CRC_Reg_RNO_1[11]\ : OAI1
      port map(A => \CRC_Reg[10]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[11]\);
    
    \CRC_Reg_RNO_1[22]\ : OAI1
      port map(A => \CRC_Reg[21]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[22]\);
    
    \Prstate_RNID3GK[3]\ : OR2B
      port map(A => \Prstate[3]_net_1\, B => N_375, Y => N_639);
    
    \Shifter[3]\ : DFN1C0
      port map(D => \Shifter_4[3]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[3]_net_1\);
    
    \Din_Delay4_RNI31E8[3]\ : MX2
      port map(A => \Din_Delay4[3]_net_1\, B => 
        \CRC_Reg[35]_net_1\, S => \CRC_ResultAva\, Y => 
        \Din_Delay4_RNI31E8[3]_net_1\);
    
    \Prstate_RNO_0[2]\ : NOR3C
      port map(A => \Prstate[3]_net_1\, B => LVDS_en_c, C => 
        N_429, Y => \Prstate_ns_0_0_a5_0_1[5]\);
    
    \ClkDivCnt_RNILV21[1]\ : OR2A
      port map(A => \ClkDivCnt[0]_net_1\, B => 
        \ClkDivCnt[1]_net_1\, Y => \op_eq.bit_en2_1\);
    
    \CRC_Reg[6]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[6]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[6]_net_1\);
    
    \ByteDout_RNO_7[4]\ : OR2A
      port map(A => N_855, B => \PKGCnt[15]_net_1\, Y => N_644);
    
    \ByteDout_RNO_0[3]\ : OA1A
      port map(A => \ByteDout_8_i_a5_2_1[3]\, B => N_842, C => 
        \ByteDout_8_i_0[3]\, Y => \ByteDout_8_i_1[3]\);
    
    \Din_Delay4_RNI11E8[2]\ : MX2
      port map(A => \Din_Delay4[2]_net_1\, B => 
        \CRC_Reg[34]_net_1\, S => \CRC_ResultAva\, Y => N_984);
    
    \StepCnt_RNO_0[3]\ : OR2
      port map(A => N_1108, B => \ClkEn\, Y => N_3308);
    
    \DataClkCnt[3]\ : DFN1C0
      port map(D => N_16, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \DataClkCnt[3]_net_1\);
    
    \CRC_Reg_RNO_0[1]\ : OR3
      port map(A => N_766, B => N_768, C => N_430, Y => 
        \CRC_Reg_14_i_0_1[1]\);
    
    \PKGCnt_RNIIG3Q[12]\ : OR3B
      port map(A => \PKGCnt[11]_net_1\, B => \PKGCnt[12]_net_1\, 
        C => N_408, Y => N_424);
    
    LVDS_en_pad : INBUF
      port map(PAD => LVDS_en, Y => \LVDS_en_pad\);
    
    \CRC_Reg_RNO[35]\ : OA1B
      port map(A => \CRC_Reg[35]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[35]\, Y => \CRC_Reg_RNO[35]_net_1\);
    
    \CRC_Reg_RNO_2[34]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[34]_net_1\, Y => 
        \CRC_Reg_RNO_2[34]_net_1\);
    
    \ByteDout_RNO_4[4]\ : OA1A
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[4]\, C
         => N_644, Y => \ByteDout_8_i_0[4]\);
    
    \ByteDout_RNO_10[1]\ : NOR2A
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[3]_net_1\, 
        Y => \ByteDout_8_i_o2_0_0[1]\);
    
    Kin : DFN1E1P0
      port map(D => N_376, CLK => SysClk_c, PRE => SysRst_n_c, E
         => \ClkEn\, Q => \Kin\);
    
    \PKGCnt_RNO[11]\ : XNOR2
      port map(A => N_408, B => \PKGCnt[11]_net_1\, Y => 
        PKGCnt_n11);
    
    CRC_ResultAva_RNO_0 : NOR3B
      port map(A => \Prstate[2]_net_1\, B => \DelayCnt[2]_net_1\, 
        C => \DelayCnt[3]_net_1\, Y => CRC_ResultAva_3_0_a5_0_2);
    
    \ByteDout_RNO[1]\ : NOR3C
      port map(A => N_594, B => \ByteDout_8_i_2[1]\, C => 
        \ByteDout_8_i_4[1]\, Y => N_937_i_0);
    
    un1_clkdivcnt_I_9 : XOR2
      port map(A => \un1_clkdivcnt.N_7\, B => 
        \ClkDivCnt[2]_net_1\, Y => I_9);
    
    \DataClkCnt_RNO_3[11]\ : NOR2A
      port map(A => \DataClkCnt[11]_net_1\, B => 
        \DataClkCnt[10]_net_1\, Y => DataClkCnt_e11_0_0_a5_0_0);
    
    \DelayCnt_RNO[3]\ : NOR2
      port map(A => N_603, B => N_476_i, Y => 
        \DelayCnt_RNO_0[3]_net_1\);
    
    \CRC_Reg_RNO_1[12]\ : OAI1
      port map(A => \CRC_Reg[4]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[12]\);
    
    \PKGCnt_RNO[2]\ : AX1C
      port map(A => \PKGCnt[0]_net_1\, B => \PKGCnt[1]_net_1\, C
         => \PKGCnt[2]_net_1\, Y => N_472_i_i_0);
    
    \CRC_Reg[25]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[25]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[25]_net_1\);
    
    \CRC_Reg_RNO[24]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[24]_net_1\, B => 
        \CRC_Reg_14_2_0_i_0[24]\, C => N_825, Y => 
        \CRC_Reg_RNO[24]_net_1\);
    
    \rowcnt_RNIDC8L[8]\ : NOR3C
      port map(A => N_405, B => \rowcnt[7]_net_1\, C => 
        \rowcnt[8]_net_1\, Y => N_418);
    
    \DelayCnt_RNIVR4K[1]\ : NOR3B
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => N_842, Y => N_847);
    
    \ByteDout_RNO_7[0]\ : OR2B
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[0]\, Y
         => N_633);
    
    \ByteDout_RNO_6[0]\ : MX2
      port map(A => \rowcnt[8]_net_1\, B => \rowcnt[0]_net_1\, S
         => \DelayCnt[0]_net_1\, Y => \ByteDout_RNO_6[0]_net_1\);
    
    \CRC_Reg_RNO_2[2]\ : NOR2
      port map(A => N_839, B => \CRC_Reg[1]_net_1\, Y => N_712);
    
    \ByteDout_RNO_8[0]\ : OR3C
      port map(A => \DelayCnt[0]_net_1\, B => \PKGCnt[3]_net_1\, 
        C => N_845, Y => \ByteDout_8_1_a5_3_1[0]\);
    
    \ByteDout_RNO_5[5]\ : OR3A
      port map(A => N_847, B => \DelayCnt[2]_net_1\, C => 
        \FrameCnt[1]_net_1\, Y => \ByteDout_RNO_5[5]_net_1\);
    
    \DelayCnt_RNIB7A4_0[1]\ : NOR2
      port map(A => \DelayCnt[2]_net_1\, B => \DelayCnt[1]_net_1\, 
        Y => N_845);
    
    \CRC_Reg_RNO_2[6]\ : NOR2
      port map(A => N_534, B => \ByteDout[6]_net_1\, Y => N_739);
    
    \CRC_Reg_RNO_2[30]\ : NOR2
      port map(A => N_374, B => \CRC_Reg[30]_net_1\, Y => N_797);
    
    WE : DFN1C0
      port map(D => ByteRdEn_c, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \WE\);
    
    \PKGCnt[9]\ : DFN1E0C0
      port map(D => N_538_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \PKGCnt[9]_net_1\);
    
    \DataClkCnt_RNIC06F[1]\ : NOR3C
      port map(A => \DataClkCnt[2]_net_1\, B => 
        \DataClkCnt[1]_net_1\, C => \Prstate[4]_net_1\, Y => 
        DataOk_0_sqmuxa_0_a3_0_a5_6);
    
    \ByteDout_RNO_11[1]\ : MX2
      port map(A => \rowcnt[9]_net_1\, B => \rowcnt[1]_net_1\, S
         => \DelayCnt[0]_net_1\, Y => \ByteDout_RNO_11[1]_net_1\);
    
    Kin_Delay3 : DFN1E1P0
      port map(D => \Kin_Delay2\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Kin_Delay3\);
    
    \ClkDivCnt_RNO[3]\ : OA1A
      port map(A => \op_eq.clkdivcnt7_0\, B => \op_eq.bit_en2_1\, 
        C => I_13, Y => \ClkDivCnt_3[3]\);
    
    \FrameCnt[0]\ : DFN1C0
      port map(D => N_261, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \FrameCnt[0]_net_1\);
    
    \ByteDout_RNO_5[2]\ : OR2B
      port map(A => N_1497_tz, B => N_848, Y => 
        \ByteDout_RNO_5[2]_net_1\);
    
    SysRst_n_pad : CLKBUF
      port map(PAD => SysRst_n, Y => SysRst_n_c);
    
    \rowcnt_RNIFK101[10]\ : OR2A
      port map(A => \rowcnt_RNI9CNN[10]_net_1\, B => N_413_0, Y
         => \rowcnt_RNIFK101[10]_net_1\);
    
    \rowcnt_RNO[7]\ : XOR2
      port map(A => \rowcnt[7]_net_1\, B => N_405, Y => 
        N_527_i_i_0);
    
    \ClkDivCnt_RNIPF31[3]\ : NOR2A
      port map(A => \ClkDivCnt[3]_net_1\, B => 
        \ClkDivCnt[2]_net_1\, Y => \op_eq.clkdivcnt7_0\);
    
    \DataClkCnt_RNIR9B8[1]\ : NOR2B
      port map(A => \DataClkCnt[1]_net_1\, B => 
        \DataClkCnt[0]_net_1\, Y => N_382);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    \DelayCnt_RNO_0[1]\ : NOR2A
      port map(A => N_432, B => \DelayCnt[1]_net_1\, Y => N_602);
    
    \DataClkCnt[9]\ : DFN1C0
      port map(D => DataClkCnt_e9, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \DataClkCnt[9]_net_1\);
    
    \Prstate_RNO_1[1]\ : OAI1
      port map(A => \Prstate[1]_net_1\, B => \Prstate[2]_net_1\, 
        C => LVDS_en_c, Y => \Prstate_ns_i_0_0[6]\);
    
    \DataClkCnt_RNITT1P[5]\ : NOR2B
      port map(A => N_393, B => \DataClkCnt[5]_net_1\, Y => N_396);
    
    \rowcnt_RNO[9]\ : XOR2
      port map(A => \rowcnt[9]_net_1\, B => N_418, Y => 
        N_536_i_i_0);
    
    \CRC_Reg_RNO_1[35]\ : OAI1
      port map(A => \CRC_Reg[34]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[35]\);
    
    \CRC_Reg_RNO[16]\ : NOR3
      port map(A => N_997, B => \CRC_Reg_14_2_0_i_0[16]\, C => 
        N_819, Y => N_362);
    
    \CRC_Reg_RNO_1[37]\ : OAI1
      port map(A => \CRC_Reg[36]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[37]\);
    
    \ByteDout_RNO_1[2]\ : NOR3C
      port map(A => N_598, B => \ByteDout_8_i_0[2]\, C => 
        \ByteDout_RNO_5[2]_net_1\, Y => \ByteDout_8_i_2[2]\);
    
    \CRC_Reg_RNO_1[36]\ : OAI1
      port map(A => \CRC_Reg[35]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0[36]\);
    
    \Din_Delay1[1]\ : DFN1E1C0
      port map(D => \ByteDout[1]_net_1\, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[1]_net_1\);
    
    \DelayCnt_RNI1S4K[1]\ : OR2A
      port map(A => N_845, B => N_842, Y => N_849);
    
    \DelayCnt_RNINRF61[3]\ : AO1B
      port map(A => N_846, B => \DelayCnt[3]_net_1\, C => N_639, 
        Y => N_419);
    
    \PKGCnt_RNINS8P[10]\ : OR3C
      port map(A => N_399, B => \PKGCnt[9]_net_1\, C => 
        \PKGCnt[10]_net_1\, Y => N_408);
    
    un1_clkdivcnt_I_12 : AND3
      port map(A => \ClkDivCnt[0]_net_1\, B => 
        \ClkDivCnt[1]_net_1\, C => \ClkDivCnt[2]_net_1\, Y => 
        \un1_clkdivcnt.N_4\);
    
    \ByteDout_RNO_6[4]\ : OR3B
      port map(A => \DelayCnt[2]_net_1\, B => N_847, C => 
        \rowcnt[4]_net_1\, Y => N_648);
    
    \Prstate_RNI68A8[0]\ : OR2B
      port map(A => \Prstate[0]_net_1\, B => \ClkEn\, Y => 
        N_413_0);
    
    \Din_Delay3[7]\ : DFN1E1P0
      port map(D => \Din_Delay2[7]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[7]_net_1\);
    
    \DataClkCnt_RNO_2[11]\ : OR2B
      port map(A => DataClkCnt_e11_0_0_a5_0_0, B => N_5, Y => 
        N_563);
    
    \ByteDout_RNO_3[6]\ : OA1C
      port map(A => N_846, B => \ByteDout_8_i_a5_1_0[6]\, C => 
        N_855, Y => \ByteDout_8_i_2[6]\);
    
    \DataClkCnt[1]\ : DFN1C0
      port map(D => N_12_i_0, CLK => SysClk_c, CLR => SysRst_n_c, 
        Q => \DataClkCnt[1]_net_1\);
    
    \DataClkCnt_RNO_2[8]\ : OR3
      port map(A => N_852_i, B => \DataClkCnt[8]_net_1\, C => 
        N_406, Y => N_556);
    
    \rowcnt[2]\ : DFN1E0C0
      port map(D => N_471_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413, Q => \rowcnt[2]_net_1\);
    
    \Prstate_RNO[4]\ : AO1C
      port map(A => N_432, B => \Prstate_ns_0_0_a5_0_2[3]\, C => 
        N_604, Y => \Prstate_ns[3]\);
    
    \CRC_Reg_RNO_1[24]\ : OAI1
      port map(A => \CRC_Reg[16]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[24]\);
    
    \Prstate_RNID3GK_0[3]\ : NOR2A
      port map(A => N_375, B => \Prstate[3]_net_1\, Y => N_376);
    
    \ByteDout[1]\ : DFN1E1C0
      port map(D => N_937_i_0, CLK => SysClk_c, CLR => SysRst_n_c, 
        E => N_629, Q => \ByteDout[1]_net_1\);
    
    \CRC_Reg_RNO_4[3]\ : OR2
      port map(A => N_839, B => \CRC_Reg[2]_net_1\, Y => 
        \CRC_Reg_RNO_4[3]_net_1\);
    
    \CRC_Reg_RNO_1[31]\ : OAI1
      port map(A => \CRC_Reg[23]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[31]\);
    
    \rowcnt_RNO[2]\ : AX1C
      port map(A => \rowcnt[0]_net_1\, B => \rowcnt[1]_net_1\, C
         => \rowcnt[2]_net_1\, Y => N_471_i_i_0);
    
    CRC_ResultAva : DFN1E1C0
      port map(D => CRC_ResultAva_3, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \ClkEn\, Q => \CRC_ResultAva\);
    
    \CRC_Reg[18]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[18]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[18]_net_1\);
    
    un1_clkdivcnt_I_5 : XOR2
      port map(A => \ClkDivCnt[0]_net_1\, B => 
        \ClkDivCnt[1]_net_1\, Y => I_5);
    
    \ByteDout[5]\ : DFN1E1P0
      port map(D => N_282_i_0, CLK => SysClk_c, PRE => SysRst_n_c, 
        E => N_629, Q => \ByteDout[5]_net_1\);
    
    \CRC_Reg_RNO_0[5]\ : OR3
      port map(A => N_757, B => N_759, C => N_430, Y => 
        \CRC_Reg_14_i_0_1[5]\);
    
    ClkEn : DFN1C0
      port map(D => \op_eq.clken2\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => ClkEn_0);
    
    \StepCnt_RNO_4[3]\ : OR3B
      port map(A => N_434, B => N_530, C => \StepCnt[3]_net_1\, Y
         => N_714);
    
    \CRC_Reg[36]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[36]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[36]_net_1\);
    
    ClkEn_RNIR1G1 : CLKINT
      port map(A => ClkEn_0, Y => \ClkEn\);
    
    \CRC_Reg_RNO_0[25]\ : AO1D
      port map(A => N_841_0, B => \CRC_Reg[17]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[25]\, Y => \CRC_Reg_14_i_0_0_1[25]\);
    
    \CRC_Reg_RNO_2[1]\ : NOR2
      port map(A => N_839, B => \CRC_Reg[0]_net_1\, Y => N_768);
    
    \Shifter_RNO[6]\ : MX2
      port map(A => \Shifter[7]_net_1\, B => \TenbitDout[6]\, S
         => \PtS_En\, Y => \Shifter_4[6]\);
    
    \Din_Delay3[2]\ : DFN1E1P0
      port map(D => \Din_Delay2[2]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay3[2]_net_1\);
    
    \CRC_Reg_RNO_0[27]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[19]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[27]\, Y => \CRC_Reg_14_i_0_0_1[27]\);
    
    \Din_Delay4[5]\ : DFN1E1P0
      port map(D => \Din_Delay3[5]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[5]_net_1\);
    
    \Din_Delay4[7]\ : DFN1E1P0
      port map(D => \Din_Delay3[7]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[7]_net_1\);
    
    \Prstate_RNO_3[4]\ : OR2B
      port map(A => \DataOk\, B => \ClkEn\, Y => N_959);
    
    \Din_Delay1[6]\ : DFN1E1C0
      port map(D => \ByteDout[6]_net_1\, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[6]_net_1\);
    
    \StepCnt_RNO[2]\ : OR3C
      port map(A => N_1026, B => N_1025, C => N_1028, Y => 
        StepCnt_e2);
    
    \CRC_Reg_RNO[1]\ : OA1B
      port map(A => \CRC_Reg[1]_net_1\, B => N_377, C => 
        \CRC_Reg_14_i_0_1[1]\, Y => N_31);
    
    \CRC_Reg_RNO_0[26]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[18]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[26]\, Y => \CRC_Reg_14_i_0_0_1[26]\);
    
    CRC_ResultAva_RNIG9KD_0 : OR2B
      port map(A => N_841, B => N_839, Y => N_374_0);
    
    \CRC_Reg_RNO_1[23]\ : OAI1
      port map(A => \CRC_Reg[22]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[23]\);
    
    \DataClkCnt_RNO_0[2]\ : AX1E
      port map(A => N_382, B => \ClkEn\, C => 
        \DataClkCnt[2]_net_1\, Y => DataClkCnt_e2_i_0_0);
    
    \CRC_Reg_RNO_1[20]\ : OAI1
      port map(A => \CRC_Reg[12]_net_1\, B => N_841, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0_0[20]\);
    
    \DelayCnt_RNIJKQF[0]\ : NOR2
      port map(A => N_840, B => \DelayCnt[0]_net_1\, Y => N_846);
    
    \ByteDout[0]\ : DFN1E1C0
      port map(D => \ByteDout_8[0]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_629, Q => \ByteDout[0]_net_1\);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => \DelayCnt_RNO_0[3]_net_1\, CLK => SysClk_c, 
        CLR => SysRst_n_c, Q => \DelayCnt[3]_net_1\);
    
    \CRC_Reg_RNO_1[14]\ : OAI1
      port map(A => \CRC_Reg[13]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_0_i_0[14]\);
    
    \Din_Delay1[2]\ : DFN1E1P0
      port map(D => \ByteDout[2]_net_1\, CLK => SysClk_c, PRE => 
        SysRst_n_c, E => \ClkEn\, Q => \Din_Delay1[2]_net_1\);
    
    Kin_Delay1 : DFN1E1P0
      port map(D => \Kin\, CLK => SysClk_c, PRE => SysRst_n_c, E
         => \ClkEn\, Q => \Kin_Delay1\);
    
    \DataClkCnt_RNI9TI51[8]\ : OR2A
      port map(A => \DataClkCnt[8]_net_1\, B => N_406, Y => N_414);
    
    \CRC_Reg_RNO_1[32]\ : OAI1
      port map(A => \CRC_Reg[31]_net_1\, B => N_839_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0[32]\);
    
    Bit_En : DFN1C0
      port map(D => \op_eq.bit_en2\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Bit_En\);
    
    \DelayCnt_RNO[1]\ : NOR3A
      port map(A => N_417, B => N_603, C => N_602, Y => 
        \DelayCnt_RNO[1]_net_1\);
    
    \CRC_Reg_RNO_0[21]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[13]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[21]\, Y => \CRC_Reg_14_i_0_0_1[21]\);
    
    \FrameCnt_RNIPOC2[6]\ : NOR3C
      port map(A => \FrameCnt[5]_net_1\, B => N_411, C => 
        \FrameCnt[6]_net_1\, Y => N_431);
    
    \ByteDout[4]\ : DFN1E1P0
      port map(D => N_280_i_0, CLK => SysClk_c, PRE => SysRst_n_c, 
        E => N_629, Q => \ByteDout[4]_net_1\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    \Din_Delay4[1]\ : DFN1E1C0
      port map(D => \Din_Delay3[1]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[1]_net_1\);
    
    \Shifter[1]\ : DFN1C0
      port map(D => \Shifter_4[1]\, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \Shifter[1]_net_1\);
    
    \CRC_Reg_RNO[34]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[34]_net_1\, B => 
        \CRC_Reg_14_i_0_0_0[34]\, C => \CRC_Reg_RNO_2[34]_net_1\, 
        Y => \CRC_Reg_RNO[34]_net_1\);
    
    REen_RNO_0 : NOR2
      port map(A => \Prstate[7]_net_1\, B => \Prstate[3]_net_1\, 
        Y => REen_1_0_a5_0);
    
    SysClk_pad : CLKBUF
      port map(PAD => SysClk, Y => SysClk_c);
    
    \ByteDout_RNO_6[2]\ : NOR2A
      port map(A => \DelayCnt[2]_net_1\, B => \rowcnt[10]_net_1\, 
        Y => \ByteDout_8_i_a5_2_0[2]\);
    
    \ByteDout_RNO_3[1]\ : NOR2A
      port map(A => \DelayCnt[0]_net_1\, B => \PKGCnt[4]_net_1\, 
        Y => \ByteDout_8_i_a5_5_0[1]\);
    
    \ByteDout_RNO_2[3]\ : OR3A
      port map(A => \DelayCnt[0]_net_1\, B => N_849, C => 
        \PKGCnt[6]_net_1\, Y => \ByteDout_RNO_2[3]_net_1\);
    
    \CRC_Reg_RNO_2[5]\ : NOR2
      port map(A => N_839, B => \CRC_Reg[4]_net_1\, Y => N_759);
    
    \CRC_Reg[28]\ : DFN1C0
      port map(D => \CRC_Reg_RNO[28]_net_1\, CLK => SysClk_c, CLR
         => SysRst_n_c, Q => \CRC_Reg[28]_net_1\);
    
    \DataClkCnt_RNIRHLJ1[0]\ : NOR3C
      port map(A => DataOk_0_sqmuxa_0_a3_0_a5_8, B => 
        DataOk_0_sqmuxa_0_a3_0_a5_7, C => 
        DataOk_0_sqmuxa_0_a3_0_a5_9, Y => DataOk_0_sqmuxa);
    
    \CRC_Reg_RNO[15]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[15]_net_1\, B => 
        \CRC_Reg_14_2_0_i_0[15]\, C => N_817, Y => N_360);
    
    \CRC_Reg_RNO_1[13]\ : OAI1
      port map(A => \CRC_Reg[5]_net_1\, B => N_841_0, C => 
        LVDS_en_c, Y => \CRC_Reg_14_2_i_0_0[13]\);
    
    \PKGCnt[3]\ : DFN1E0C0
      port map(D => N_475_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[3]_net_1\);
    
    \CRC_Reg_RNO_1[10]\ : OAI1
      port map(A => \CRC_Reg[2]_net_1\, B => N_841, C => 
        LVDS_en_c, Y => \CRC_Reg_14_i_0_0[10]\);
    
    \CRC_Reg_RNO_1[1]\ : NOR2
      port map(A => N_534, B => \ByteDout[1]_net_1\, Y => N_766);
    
    \Prstate_RNO[2]\ : AO1C
      port map(A => N_417, B => \Prstate_ns_0_0_a5_0_1[5]\, C => 
        N_606, Y => \Prstate_ns[5]\);
    
    \Prstate_RNIVGLD_0[5]\ : NOR2
      port map(A => \Prstate[5]_net_1\, B => \Prstate[4]_net_1\, 
        Y => N_375);
    
    un1_clkdivcnt_I_13 : XOR2
      port map(A => \un1_clkdivcnt.N_4\, B => 
        \ClkDivCnt[3]_net_1\, Y => I_13);
    
    \PKGCnt[15]\ : DFN1E0C0
      port map(D => PKGCnt_n15, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => N_413_0, Q => \PKGCnt[15]_net_1\);
    
    \DataClkCnt_RNO[7]\ : NOR3A
      port map(A => N_546, B => N_552, C => N_553, Y => N_24);
    
    \DataClkCnt_RNI0J7T[6]\ : NOR2B
      port map(A => N_396, B => \DataClkCnt[6]_net_1\, Y => N_401);
    
    \CRC_Reg[9]\ : DFN1C0
      port map(D => N_252, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[9]_net_1\);
    
    \DataClkCnt[8]\ : DFN1C0
      port map(D => DataClkCnt_e8, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \DataClkCnt[8]_net_1\);
    
    \DelayCnt_RNI49Q5[1]\ : OR3C
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \ClkEn\, Y => N_417);
    
    \CRC_Reg_RNO_0[22]\ : AO1D
      port map(A => N_841, B => \CRC_Reg[14]_net_1\, C => 
        \CRC_Reg_14_i_0_0_0[22]\, Y => \CRC_Reg_14_i_0_0_1[22]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CRC_Reg[11]\ : DFN1C0
      port map(D => N_113, CLK => SysClk_c, CLR => SysRst_n_c, Q
         => \CRC_Reg[11]_net_1\);
    
    \Din_Delay4[2]\ : DFN1E1P0
      port map(D => \Din_Delay3[2]_net_1\, CLK => SysClk_c, PRE
         => SysRst_n_c, E => \ClkEn\, Q => \Din_Delay4[2]_net_1\);
    
    ByteRdEn_pad_RNI276N : AOI1B
      port map(A => \ByteSel[2]_net_1\, B => \ByteSel[1]_net_1\, 
        C => ByteRdEn_c, Y => ByteSel_1_sqmuxa);
    
    \ByteDout_RNO_5[3]\ : MX2C
      port map(A => \PKGCnt[14]_net_1\, B => \FrameCnt[7]_net_1\, 
        S => \DelayCnt[1]_net_1\, Y => \ByteDout_RNO_5[3]_net_1\);
    
    \ByteDout_RNO_3[4]\ : OR3A
      port map(A => N_846, B => N_851, C => \FrameCnt[8]_net_1\, 
        Y => \ByteDout_RNO_3[4]_net_1\);
    
    CRC_ResultAva_RNO_1 : NOR2
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        Y => CRC_ResultAva_3_0_a5_0_1);
    
    \StepCnt[3]\ : DFN1P0
      port map(D => StepCnt_e3, CLK => SysClk_c, PRE => 
        SysRst_n_c, Q => \StepCnt[3]_net_1\);
    
    DataOk : DFN1E1C0
      port map(D => DataOk_0_sqmuxa, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \ClkEn\, Q => \DataOk\);
    
    \ByteDout_RNO_4[6]\ : AOI1B
      port map(A => N_846, B => \DelayCnt[3]_net_1\, C => 
        \ByteDout_8_i_0[6]\, Y => \ByteDout_8_i_1[6]\);
    
    \CRC_Reg_RNO[4]\ : OA1B
      port map(A => \CRC_Reg[4]_net_1\, B => N_377, C => 
        \CRC_Reg_14_i_0_1[4]\, Y => \CRC_Reg_RNO[4]_net_1\);
    
    \StepCnt_RNO_2[2]\ : OR2B
      port map(A => StepCnte, B => \StepCnt[2]_net_1\, Y => 
        N_1028);
    
    \DataClkCnt_RNO[11]\ : AO1B
      port map(A => N_945, B => \DataClkCnt[11]_net_1\, C => 
        DataClkCnt_e11_0_0_0, Y => DataClkCnt_e11);
    
    \DelayCnt_RNID7A4[3]\ : NOR2
      port map(A => \DelayCnt[3]_net_1\, B => \DelayCnt[2]_net_1\, 
        Y => N_429);
    
    \ByteDout[7]\ : DFN1E1P0
      port map(D => N_286_i_0, CLK => SysClk_c, PRE => SysRst_n_c, 
        E => N_629, Q => \ByteDout[7]_net_1\);
    
    \CRC_Reg_RNO[21]\ : OA1B
      port map(A => \CRC_Reg[21]_net_1\, B => N_374_0, C => 
        \CRC_Reg_14_i_0_0_1[21]\, Y => \CRC_Reg_RNO[21]_net_1\);
    
    \ByteDout_RNO_0[0]\ : OR3B
      port map(A => N_846, B => \FrameCnt[4]_net_1\, C => N_851, 
        Y => N_636);
    
    \ByteDout_RNO_2[6]\ : OR3B
      port map(A => \DelayCnt[2]_net_1\, B => N_847, C => 
        \rowcnt[6]_net_1\, Y => N_664);
    
    \ByteDout_RNO_0[6]\ : NOR3C
      port map(A => \ByteDout_8_i_2[6]\, B => \ByteDout_8_i_1[6]\, 
        C => \ByteDout_RNO_5[6]_net_1\, Y => \ByteDout_8_i_4[6]\);
    
    \DataClkCnt_RNI5AB8[5]\ : NOR2B
      port map(A => \DataClkCnt[5]_net_1\, B => 
        \DataClkCnt[6]_net_1\, Y => DataOk_0_sqmuxa_0_a3_0_a5_2);
    
    \PKGCnt_RNO[3]\ : XNOR2
      port map(A => \PKGCnt[3]_net_1\, B => N_380, Y => 
        N_475_i_i_0);
    
    \DataClkCnt_RNIFAHN[0]\ : NOR3A
      port map(A => DataOk_0_sqmuxa_0_a3_0_a5_6, B => 
        \DataClkCnt[9]_net_1\, C => \DataClkCnt[0]_net_1\, Y => 
        DataOk_0_sqmuxa_0_a3_0_a5_9);
    
    \CRC_Reg_RNO[20]\ : NOR3
      port map(A => \CRC_Reg_RNO_0[20]_net_1\, B => 
        \CRC_Reg_14_i_0_0_0[20]\, C => N_773, Y => N_10);
    
    \ByteDout_RNO_6[7]\ : OR2A
      port map(A => \Prstate[4]_net_1\, B => \Fifo_dout[7]\, Y
         => \ByteDout_RNO_6[7]_net_1\);
    
    \ByteDout_RNO_3[0]\ : OR3C
      port map(A => \ByteDout_RNO_6[0]_net_1\, B => 
        \DelayCnt[1]_net_1\, C => N_930, Y => N_631);
    
    \ByteDout_RNO_2[4]\ : NOR2B
      port map(A => \ByteDout_RNO_5[4]_net_1\, B => N_648, Y => 
        \ByteDout_8_i_3[4]\);
    
    \DelayCnt_RNILKQF[2]\ : NOR2A
      port map(A => \DelayCnt[2]_net_1\, B => N_840, Y => N_930);
    
    LVDS_en_pad_RNIDKC6 : CLKINT
      port map(A => \LVDS_en_pad\, Y => LVDS_en_c);
    
    \StepCnt[1]\ : DFN1C0
      port map(D => StepCnt_e1, CLK => SysClk_c, CLR => 
        SysRst_n_c, Q => \StepCnt[1]_net_1\);
    
    \rowcnt_RNO[1]\ : XOR2
      port map(A => \rowcnt[1]_net_1\, B => \rowcnt[0]_net_1\, Y
         => N_464_i);
    
    \FrameCnt[8]\ : DFN1E0C0
      port map(D => N_529_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[8]_net_1\);
    
    \FrameCnt[6]\ : DFN1E0C0
      port map(D => N_496_i_i_0, CLK => SysClk_c, CLR => 
        SysRst_n_c, E => \rowcnt_RNIFK101[10]_net_1\, Q => 
        \FrameCnt[6]_net_1\);
    
    \CRC_Reg_RNO_0[6]\ : AO1D
      port map(A => N_839_0, B => \CRC_Reg[5]_net_1\, C => N_739, 
        Y => \CRC_Reg_14_i_0_0[6]\);
    
    \CRC_Reg_RNO_0[39]\ : AO1D
      port map(A => N_841_0, B => \CRC_Reg[31]_net_1\, C => 
        \CRC_Reg_14_i_0_0[39]\, Y => \CRC_Reg_14_i_0_1[39]\);
    
    \Shifter_RNO[4]\ : MX2
      port map(A => \Shifter[5]_net_1\, B => \TenbitDout[4]\, S
         => \PtS_En\, Y => \Shifter_4[4]\);
    

end DEF_ARCH; 
