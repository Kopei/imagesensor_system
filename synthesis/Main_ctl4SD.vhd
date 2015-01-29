-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ7 is

    port( Fifo_wr_c      : out   std_logic;
          sysrst_n_c     : in    std_logic;
          Sysclk_c       : in    std_logic;
          FifoRowRdOut   : in    std_logic;
          FifoRowRdOut_0 : in    std_logic
        );

end WaveGenSingleZ7;

architecture DEF_ARCH of WaveGenSingleZ7 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AX1E
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

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component NOR3C
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

  component XA1B
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

  component OAI1
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

  component NOR3
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

  component NOR3B
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

  component NOR2
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

  component AO1B
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

  component OR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \PrState_ns_i_0_a3_0[0]\, \PrState[1]_net_1\, 
        \PrState[2]_net_1\, \PrState_ns_0_i_0[3]\, 
        \Phase1Cnt_RNIIAID[0]_net_1\, \PrState_ns_0_i_0[1]\, N_41, 
        \PrState[3]_net_1\, \PrState_ns_0_i_a3_0_0[1]\, 
        \DelayCnt[3]_net_1\, \DelayCnt[2]_net_1\, 
        \PrState_ns_0_0_a3_1_2_0[2]\, CycCntlde_0_a3_1, 
        \PrState[0]_net_1\, N_17, \Phase2Cnt_RNIL4GE[1]_net_1\, 
        N_21, \CycCnt[0]_net_1\, \CycCnt[1]_net_1\, N_23, 
        \CycCnt[5]_net_1\, N_161, N_25, \CycCnt[6]_net_1\, N_42, 
        N_27_i_0, \CycCnt[7]_net_1\, N_43, N_29_i_0, 
        \CycCnt[8]_net_1\, N_45, N_14, N_163, N_35, N_33, 
        \DelayCnt[0]_net_1\, \DelayCnt[1]_net_1\, 
        \PrState_ns_0_0_a3_0[2]\, \PrState_RNO_0_0[0]\, 
        \CycCnt[9]_net_1\, N_162, N_68, \PrState_ns_0_0_0_tz[2]\, 
        \PrState_ns_0_0_a3_0_0[2]\, \Phase1Cnt[0]_net_1\, 
        \PrState_ns[2]\, DelayCnt_n0, CycCnt_n9, N_66_2, N_37, 
        N_166, N_13, \CycCnt[4]_net_1\, N_182, N_14_i, N_183, 
        \CycCnt[3]_net_1\, N_12, N_9, \CycCnt[2]_net_1\, CycCnte, 
        CycCnt_n0, \PrState_RNO_0[4]_net_1\, \PrState_ns[4]\, N_7, 
        N_159_i_0, \Phase2Cnt[1]_net_1\, N_5, \GND\, \VCC\, GND_0, 
        VCC_0 : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => Fifo_wr_c);
    
    \PrState[2]\ : DFN1C0
      port map(D => \PrState_ns[2]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[2]_net_1\);
    
    \PrState_RNO_3[2]\ : OR2B
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => \PrState_ns_0_0_a3_0_0[2]\);
    
    \CycCnt_RNIF0M71[6]\ : OR2B
      port map(A => N_42, B => \CycCnt[6]_net_1\, Y => N_43);
    
    \PrState_RNI2PV71[4]\ : AO1A
      port map(A => \Phase2Cnt_RNIL4GE[1]_net_1\, B => 
        CycCntlde_0_a3_1, C => N_41, Y => CycCnte);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \CycCnt_RNO_0[2]\ : AX1E
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => \CycCnt[2]_net_1\, Y => N_14_i);
    
    \CycCnt_RNO[7]\ : XA1C
      port map(A => \CycCnt[7]_net_1\, B => N_43, C => N_41, Y
         => N_27_i_0);
    
    \PrState_RNO_0[0]\ : OR3A
      port map(A => \PrState_ns_0_0_a3_0[2]\, B => 
        \CycCnt[9]_net_1\, C => N_162, Y => \PrState_RNO_0_0[0]\);
    
    \Phase2Cnt_RNIL4GE[1]\ : OR2A
      port map(A => \Phase2Cnt[1]_net_1\, B => N_159_i_0, Y => 
        \Phase2Cnt_RNIL4GE[1]_net_1\);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => N_159_i_0, B => \Phase2Cnt[1]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_7);
    
    \CycCnt_RNI5HVG[2]\ : NOR3C
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => \CycCnt[2]_net_1\, Y => N_12);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_29_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_23, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_13, C => N_66_2, Y
         => N_9);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[0]_net_1\);
    
    \CycCnt_RNIJ6021[5]\ : NOR2B
      port map(A => N_161, B => \CycCnt[5]_net_1\, Y => N_42);
    
    \PrState_RNO_1[3]\ : OAI1
      port map(A => N_41, B => \PrState[3]_net_1\, C => 
        FifoRowRdOut_0, Y => \PrState_ns_0_i_0[1]\);
    
    \Phase1Cnt_RNIIAID[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => \Phase1Cnt_RNIIAID[0]_net_1\);
    
    \PrState_RNI8N3J[0]\ : NOR3
      port map(A => \PrState[2]_net_1\, B => \PrState[0]_net_1\, 
        C => \PrState[3]_net_1\, Y => CycCntlde_0_a3_1);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_162, C => N_66_2, Y
         => CycCnt_n9);
    
    \PrState_RNIAN3J[0]\ : OR3
      port map(A => N_41, B => \PrState[3]_net_1\, C => 
        \PrState[0]_net_1\, Y => N_66_2);
    
    \PrState[1]\ : DFN1C0
      port map(D => N_17, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[1]_net_1\);
    
    \PrState_RNII1JS[1]\ : NOR3B
      port map(A => \PrState[1]_net_1\, B => FifoRowRdOut_0, C
         => \Phase2Cnt_RNIL4GE[1]_net_1\, Y => 
        \PrState_ns_0_0_a3_0[2]\);
    
    \CycCnt_RNO[6]\ : XA1B
      port map(A => \CycCnt[6]_net_1\, B => N_42, C => N_41, Y
         => N_25);
    
    \CycCnt_RNIA02J1[8]\ : OR2A
      port map(A => \CycCnt[8]_net_1\, B => N_45, Y => N_162);
    
    \PrState_RNO_0[2]\ : OA1
      port map(A => N_163, B => \PrState_ns_0_0_a3_1_2_0[2]\, C
         => \PrState_ns_0_0_a3_0_0[2]\, Y => 
        \PrState_ns_0_0_0_tz[2]\);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_182, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_12, C => N_66_2, Y
         => N_183);
    
    \CycCnt_RNO[2]\ : NOR2
      port map(A => N_66_2, B => N_14_i, Y => N_182);
    
    \PrState_RNO[2]\ : AO1C
      port map(A => \PrState_ns_0_0_0_tz[2]\, B => FifoRowRdOut_0, 
        C => N_68, Y => \PrState_ns[2]\);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => N_41, B => \CycCnt[0]_net_1\, Y => CycCnt_n0);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_35, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_25, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \PrState_RNO_0[1]\ : OAI1
      port map(A => \Phase1Cnt_RNIIAID[0]_net_1\, B => 
        \PrState[1]_net_1\, C => FifoRowRdOut_0, Y => 
        \PrState_ns_0_i_0[3]\);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => \Phase1Cnt_RNIIAID[0]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[0]_net_1\);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_33, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \CycCnt_RNIOGAS[4]\ : NOR2B
      port map(A => N_13, B => \CycCnt[4]_net_1\, Y => N_161);
    
    \PrState_RNO_0[3]\ : OR3A
      port map(A => \DelayCnt[3]_net_1\, B => \DelayCnt[2]_net_1\, 
        C => N_41, Y => \PrState_ns_0_i_a3_0_0[1]\);
    
    DelayCnt_n2_0_i : XA1A
      port map(A => \DelayCnt[2]_net_1\, B => N_163, C => 
        \PrState[3]_net_1\, Y => N_35);
    
    \CycCnt_RNIUUKM[3]\ : NOR2B
      port map(A => N_12, B => \CycCnt[3]_net_1\, Y => N_13);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_183, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => N_159_i_0, Y => N_5);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => N_37, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[3]_net_1\);
    
    \PrState_RNO[1]\ : OA1B
      port map(A => \Phase1Cnt_RNIIAID[0]_net_1\, B => 
        \Phase2Cnt_RNIL4GE[1]_net_1\, C => \PrState_ns_0_i_0[3]\, 
        Y => N_17);
    
    \PrState[4]\ : DFN1P0
      port map(D => \PrState_RNO_0[4]_net_1\, CLK => Sysclk_c, 
        PRE => sysrst_n_c, Q => N_41);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => N_41, Y => N_21);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_21, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    DelayCnt_n0_0_0_a3 : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    
    \CycCnt_RNICUBD1[7]\ : OR2A
      port map(A => \CycCnt[7]_net_1\, B => N_43, Y => N_45);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_7, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \PrState[0]\ : DFN1C0
      port map(D => \PrState_ns[4]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[0]_net_1\);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_9, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \PrState_RNO[3]\ : OA1B
      port map(A => N_163, B => \PrState_ns_0_i_a3_0_0[1]\, C => 
        \PrState_ns_0_i_0[1]\, Y => N_14);
    
    DelayCnt_n1_0_i_o2 : OR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_163);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_27_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_14, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    DelayCnt_n1_0_i : XA1
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[3]_net_1\, Y => N_33);
    
    \PrState_RNO_1[2]\ : OAI1
      port map(A => \CycCnt[9]_net_1\, B => N_162, C => 
        \PrState_ns_0_0_a3_0[2]\, Y => N_68);
    
    \PrState_RNO[0]\ : AO1B
      port map(A => \PrState[0]_net_1\, B => FifoRowRdOut, C => 
        \PrState_RNO_0_0[0]\, Y => \PrState_ns[4]\);
    
    \PrState_RNO_0[4]\ : OR2
      port map(A => \PrState[1]_net_1\, B => \PrState[2]_net_1\, 
        Y => \PrState_ns_i_0_a3_0[0]\);
    
    DelayCnt_n2_0_i_o2 : NOR2A
      port map(A => \DelayCnt[2]_net_1\, B => N_163, Y => N_166);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_161, C => N_41, Y
         => N_23);
    
    \CycCnt_RNO[8]\ : XA1C
      port map(A => \CycCnt[8]_net_1\, B => N_45, C => N_41, Y
         => N_29_i_0);
    
    \PrState_RNO_2[2]\ : OR3B
      port map(A => \DelayCnt[3]_net_1\, B => \PrState[3]_net_1\, 
        C => \DelayCnt[2]_net_1\, Y => 
        \PrState_ns_0_0_a3_1_2_0[2]\);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => N_5, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => N_159_i_0);
    
    \PrState_RNO[4]\ : OA1B
      port map(A => N_66_2, B => \PrState_ns_i_0_a3_0[0]\, C => 
        FifoRowRdOut, Y => \PrState_RNO_0[4]_net_1\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    DelayCnt_n3_0_i : XA1
      port map(A => \DelayCnt[3]_net_1\, B => N_166, C => 
        \PrState[3]_net_1\, Y => N_37);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ4 is

    port( PrState_4      : out   std_logic;
          PrState_0      : out   std_logic_vector(4 to 4);
          latch_en       : out   std_logic;
          FifoRowRdOut   : in    std_logic;
          FifoRowRdOut_0 : in    std_logic;
          sysrst_n_c     : in    std_logic;
          FifoRowRdOut_i : in    std_logic;
          Sysclk_c       : in    std_logic
        );

end WaveGenSingleZ4;

architecture DEF_ARCH of WaveGenSingleZ4 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
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

  component AOI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NAND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component XA1A
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

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component XA1B
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

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2B
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

  component OA1
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

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \PrState_ns_0_0_a2_1_1[2]_net_1\, DelayCnt_n0, 
        \PrState_ns_0_i_a2_0_0[1]\, 
        \PrState_ns_0_0_0_tz[2]_net_1\, 
        \PrState_ns_0_0_a2_0_0[2]_net_1\, \CycCnt[0]_net_1\, N_49, 
        \PrState_ns_0_i_0[1]\, \PrState[3]_net_1\, 
        \PrState_0[4]_net_1\, \PrState_ns_0_i_a2_0_1[1]\, 
        \DelayCnt[0]_net_1\, \DelayCnt[2]_net_1\, 
        \DelayCnt[1]_net_1\, \CycCnt_5_i_o2_0[0]\, 
        \PrState[0]_net_1\, \Phase2Cnt[0]_net_1\, N_19_i_0, 
        \Phase1Cnt[0]_net_1\, \Phase1Cnt[1]_net_1\, 
        \PrState[2]_net_1\, N_21_i_0, N_39, \Phase1Cnt[2]_net_1\, 
        N_23, N_40, \Phase1Cnt[3]_net_1\, N_25, N_41, 
        \Phase1Cnt[4]_net_1\, N_27, N_42, \Phase1Cnt[5]_net_1\, 
        N_29, \Phase1Cnt_RNO_0[6]_net_1\, N_44, N_31, 
        \Phase1Cnt[7]_net_1\, N_33, N_45, \Phase1Cnt[8]_net_1\, 
        N_54, N_8, N_64, \PrState[1]_net_1\, N_14, 
        \PrState_ns[2]\, N_61, \PrState_ns[3]\, N_65_1, N_51, 
        N_12_i_0, \PrState_RNO_0[0]_net_1\, N_16, N_50, 
        Phase1Cnt_n10, \Phase1Cnt[10]_net_1\, N_47, Phase1Cnt_n11, 
        \Phase1Cnt[11]_net_1\, N_48, \Phase1Cnt[9]_net_1\, N_46, 
        \Phase1Cnt[6]_net_1\, Phase1Cnt_n9, N_6, Phase1Cnt_n0, 
        \PrState[4]_net_1\, \GND\, \VCC\, GND_0, VCC_0
         : std_logic;

begin 

    PrState_4 <= \PrState[4]_net_1\;
    PrState_0(4) <= \PrState_0[4]_net_1\;

    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => latch_en);
    
    \PrState[2]\ : DFN1C0
      port map(D => \PrState_ns[2]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[2]_net_1\);
    
    \Phase1Cnt_RNIB5HR[4]\ : NOR2B
      port map(A => \Phase1Cnt[4]_net_1\, B => N_41, Y => N_42);
    
    \Phase1Cnt_RNIFB2N1[9]\ : OR2A
      port map(A => \Phase1Cnt[9]_net_1\, B => N_46, Y => N_47);
    
    \Phase1Cnt_RNO_0[6]\ : AOI1
      port map(A => \Phase1Cnt[5]_net_1\, B => N_42, C => 
        \Phase1Cnt[6]_net_1\, Y => \Phase1Cnt_RNO_0[6]_net_1\);
    
    \Phase1Cnt_RNI4S1C1[7]\ : NOR2B
      port map(A => \Phase1Cnt[7]_net_1\, B => N_44, Y => N_45);
    
    \Phase1Cnt[4]\ : DFN1C0
      port map(D => N_25, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[4]_net_1\);
    
    \PrState_ns_0_0_a2_0_0[2]\ : NAND2
      port map(A => \CycCnt[0]_net_1\, B => N_49, Y => 
        \PrState_ns_0_0_a2_0_0[2]_net_1\);
    
    \Phase1Cnt_RNO[4]\ : XA1
      port map(A => N_41, B => \Phase1Cnt[4]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_25);
    
    \PrState_RNO_0[0]\ : NOR2A
      port map(A => N_49, B => \CycCnt[0]_net_1\, Y => 
        \PrState_RNO_0[0]_net_1\);
    
    \Phase1Cnt[1]\ : DFN1C0
      port map(D => N_19_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \Phase1Cnt[1]_net_1\);
    
    \Phase1Cnt[11]\ : DFN1C0
      port map(D => Phase1Cnt_n11, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[11]_net_1\);
    
    \PrState_RNI2RP8[1]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => N_49);
    
    \Phase1Cnt[5]\ : DFN1C0
      port map(D => N_27, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \Phase1Cnt_RNO[2]\ : XA1A
      port map(A => N_39, B => \Phase1Cnt[2]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_21_i_0);
    
    \CycCnt[0]\ : DFN1C0
      port map(D => N_6, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \CycCnt[0]_net_1\);
    
    \PrState_RNO_1[3]\ : OAI1
      port map(A => \PrState[3]_net_1\, B => \PrState_0[4]_net_1\, 
        C => FifoRowRdOut_0, Y => \PrState_ns_0_i_0[1]\);
    
    \Phase1Cnt_RNO[1]\ : XA1
      port map(A => \Phase1Cnt[0]_net_1\, B => 
        \Phase1Cnt[1]_net_1\, C => \PrState[2]_net_1\, Y => 
        N_19_i_0);
    
    \Phase1Cnt_RNICHLN1[11]\ : NOR2
      port map(A => \Phase1Cnt[11]_net_1\, B => N_48, Y => N_51);
    
    \PrState[1]\ : DFN1C0
      port map(D => \PrState_ns[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[1]_net_1\);
    
    \Phase1Cnt_RNO[6]\ : NOR3A
      port map(A => \PrState[2]_net_1\, B => 
        \Phase1Cnt_RNO_0[6]_net_1\, C => N_44, Y => N_29);
    
    \PrState_RNO_0[2]\ : OR2A
      port map(A => N_65_1, B => N_51, Y => N_61);
    
    \Phase1Cnt_RNIGKH61[6]\ : NOR3C
      port map(A => N_42, B => \Phase1Cnt[5]_net_1\, C => 
        \Phase1Cnt[6]_net_1\, Y => N_44);
    
    \PrState_RNO[2]\ : AO1C
      port map(A => \PrState_ns_0_0_0_tz[2]_net_1\, B => 
        FifoRowRdOut_0, C => N_61, Y => \PrState_ns[2]\);
    
    \CycCnt_RNO[0]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => N_54, C => 
        \PrState[4]_net_1\, Y => N_6);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_16, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \PrState_RNO_0[1]\ : OR3C
      port map(A => \Phase2Cnt[0]_net_1\, B => \PrState[1]_net_1\, 
        C => FifoRowRdOut_0, Y => N_64);
    
    \Phase1Cnt_RNIAMGG[2]\ : OR2A
      port map(A => \Phase1Cnt[2]_net_1\, B => N_39, Y => N_40);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => Phase1Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[0]_net_1\);
    
    \Phase1Cnt_RNO[8]\ : XA1
      port map(A => N_45, B => \Phase1Cnt[8]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_33);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_14, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \PrState_RNO_0[3]\ : NOR2A
      port map(A => \PrState_ns_0_i_a2_0_0[1]\, B => 
        \DelayCnt[0]_net_1\, Y => \PrState_ns_0_i_a2_0_1[1]\);
    
    DelayCnt_n2_0_i : XA1
      port map(A => \DelayCnt[2]_net_1\, B => N_50, C => 
        \PrState[3]_net_1\, Y => N_16);
    
    \PrState_RNID297[2]\ : NOR2B
      port map(A => \PrState[2]_net_1\, B => FifoRowRdOut, Y => 
        N_65_1);
    
    \Phase1Cnt_RNO[10]\ : XA1A
      port map(A => \Phase1Cnt[10]_net_1\, B => N_47, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n10);
    
    \PrState_RNO[1]\ : AO1B
      port map(A => N_65_1, B => N_51, C => N_64, Y => 
        \PrState_ns[3]\);
    
    \PrState[4]\ : DFN1P0
      port map(D => FifoRowRdOut_i, CLK => Sysclk_c, PRE => 
        sysrst_n_c, Q => \PrState[4]_net_1\);
    
    \PrState_0[4]\ : DFN1P0
      port map(D => FifoRowRdOut_i, CLK => Sysclk_c, PRE => 
        sysrst_n_c, Q => \PrState_0[4]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \Phase1Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => Phase1Cnt_n0);
    
    \PrState_ns_0_0_a2_1_1[2]\ : NAND2
      port map(A => DelayCnt_n0, B => \PrState_ns_0_i_a2_0_0[1]\, 
        Y => \PrState_ns_0_0_a2_1_1[2]_net_1\);
    
    \Phase1Cnt[10]\ : DFN1C0
      port map(D => Phase1Cnt_n10, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[10]_net_1\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \PrState[0]\ : DFN1C0
      port map(D => N_12_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \PrState[0]_net_1\);
    
    \Phase1Cnt[6]\ : DFN1C0
      port map(D => N_29, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[6]_net_1\);
    
    \Phase1Cnt_RNO[7]\ : XA1
      port map(A => N_44, B => \Phase1Cnt[7]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_31);
    
    \Phase1Cnt[7]\ : DFN1C0
      port map(D => N_31, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[7]_net_1\);
    
    \Phase1Cnt_RNO[9]\ : XA1A
      port map(A => \Phase1Cnt[9]_net_1\, B => N_46, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n9);
    
    \DelayCnt_RNIFP5C[2]\ : NOR2B
      port map(A => \DelayCnt[2]_net_1\, B => \DelayCnt[1]_net_1\, 
        Y => \PrState_ns_0_i_a2_0_0[1]\);
    
    \PrState_RNO[3]\ : OA1C
      port map(A => \PrState_ns_0_i_a2_0_1[1]\, B => 
        \PrState_0[4]_net_1\, C => \PrState_ns_0_i_0[1]\, Y => 
        N_8);
    
    \DelayCnt_RNIILA9[0]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    
    DelayCnt_n1_0_i_o2 : NOR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_50);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_8, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    \Phase1Cnt_RNO[3]\ : XA1A
      port map(A => N_40, B => \Phase1Cnt[3]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_23);
    
    DelayCnt_n1_0_i : XA1
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[3]_net_1\, Y => N_14);
    
    \Phase1Cnt_RNIP3IH1[8]\ : OR2B
      port map(A => \Phase1Cnt[8]_net_1\, B => N_45, Y => N_46);
    
    \Phase1Cnt[9]\ : DFN1C0
      port map(D => Phase1Cnt_n9, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[9]_net_1\);
    
    \CycCnt_RNO_1[0]\ : OR2
      port map(A => \PrState[0]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => \CycCnt_5_i_o2_0[0]\);
    
    \PrState_RNO[0]\ : OA1
      port map(A => \PrState_RNO_0[0]_net_1\, B => 
        \PrState[0]_net_1\, C => FifoRowRdOut, Y => N_12_i_0);
    
    \Phase1Cnt_RNIDSBN1[10]\ : OR2A
      port map(A => \Phase1Cnt[10]_net_1\, B => N_47, Y => N_48);
    
    \Phase1Cnt[3]\ : DFN1C0
      port map(D => N_23, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[3]_net_1\);
    
    \Phase1Cnt_RNO[5]\ : XA1
      port map(A => N_42, B => \Phase1Cnt[5]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_27);
    
    \CycCnt_RNO_0[0]\ : NOR3
      port map(A => \CycCnt_5_i_o2_0[0]\, B => \PrState[3]_net_1\, 
        C => \PrState[2]_net_1\, Y => N_54);
    
    \Phase1Cnt_RNO[11]\ : XA1A
      port map(A => \Phase1Cnt[11]_net_1\, B => N_48, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n11);
    
    \Phase1Cnt_RNIRE0B[1]\ : OR2B
      port map(A => \Phase1Cnt[1]_net_1\, B => 
        \Phase1Cnt[0]_net_1\, Y => N_39);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => N_49, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[0]_net_1\);
    
    \PrState_ns_0_0_0_tz[2]\ : AND2
      port map(A => \PrState_ns_0_0_a2_0_0[2]_net_1\, B => 
        \PrState_ns_0_0_a2_1_1[2]_net_1\, Y => 
        \PrState_ns_0_0_0_tz[2]_net_1\);
    
    \Phase1Cnt_RNIQT0M[3]\ : NOR2A
      port map(A => \Phase1Cnt[3]_net_1\, B => N_40, Y => N_41);
    
    \Phase1Cnt[8]\ : DFN1C0
      port map(D => N_33, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[8]_net_1\);
    
    \Phase1Cnt[2]\ : DFN1C0
      port map(D => N_21_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \Phase1Cnt[2]_net_1\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ3 is

    port( sysrst_n_c         : in    std_logic;
          Sysclk_c           : in    std_logic;
          LVDS_en_c          : in    std_logic;
          lvdsFifoRowRdOut   : out   std_logic;
          lvdsFifoRowRdOut_i : out   std_logic
        );

end WaveGenSingleZ3;

architecture DEF_ARCH of WaveGenSingleZ3 is 

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component NOR3A
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

  component NOR2A
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

  component AO1A
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

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2B
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

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XA1C
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

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component AOI1
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

  component NOR3C
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

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component AOI1B
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

  component NAND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component INV
    port( A : in    std_logic := 'U';
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

    signal \PrState_ns_i_a3_i_0_a3_0_0[3]\, \PrState[2]_net_1\, 
        N_188, \PrState_ns_i_a3_i_0_o3_1_6[3]\, 
        \PrState_ns_i_a3_i_0_o3_1_7[3]\, N_243, 
        \PrState_ns_0_i_0_1[2]\, N_268, N_178, 
        \PrState_ns_0_i_0_0[2]\, \PrState[1]_net_1\, 
        \PrState_ns_0_0_0_a3_0_1[4]\, 
        \PrState_ns_0_0_0_a3_0_0[4]\, N_265, \CycCnt[11]_net_1\, 
        CycCnt_n11_0_0_0_a3_0_0, \CycCnt[10]_net_1\, N_89, 
        CycCnt_n11_0_0_0_a3_0, \PrState_ns_0_i_0_a3_0_0[2]\, 
        Phase2Cnt_n11_0_0_0_a3_0_0, \Phase2Cnt_RNIIL49[10]_net_1\, 
        \Phase2Cnt[11]_net_1\, Phase2Cnt_n12_0_0_0_a3_0_0, 
        \Phase2Cnt_RNI24MA[11]_net_1\, \Phase2Cnt[12]_net_1\, 
        Phase2Cnt_n13_0_0_0_a3_0_0, \Phase2Cnt_RNIJI7C[12]_net_1\, 
        \Phase2Cnt[13]_net_1\, Phase2Cnt_n10_0_0_0_a3_0_0, 
        \Phase2Cnt[9]_net_1\, \Phase2Cnt[10]_net_1\, 
        Phase2Cnt_n14_0_i_i_a3_0_0, \Phase2Cnt[14]_net_1\, N_162, 
        Phase2Cnt_n10_0_0_0_a3_0, Phase2Cnt_n11_0_0_0_a3_0, 
        Phase2Cnt_n12_0_0_0_a3_0, Phase2Cnt_n13_0_0_0_a3_0, 
        Phase2Cnt_n14_0_i_i_a3_0, Phase2Cnt_n15_0_i_i_a3_0, 
        \Phase2Cnt[15]_net_1\, CycCntlde_0_0_a3_0, 
        \PrState[0]_net_1\, N_202_1, Phase2Cnt_n7_0_i_0_0, N_145, 
        \PrState_ns_i_a3_i_0_o3_5[3]\, 
        \PrState_ns_i_a3_i_0_o3_3[3]\, 
        \PrState_ns_i_a3_i_0_o3_2[3]\, N_141, 
        \PrState_ns_i_a3_i_0_o3_1[3]_net_1\, \Phase2Cnt[2]_net_1\, 
        \Phase2Cnt[1]_net_1\, \Phase2Cnt[3]_net_1\, 
        \Phase2Cnt[0]_net_1\, \Phase2Cnt[4]_net_1\, 
        \Phase2Cnt[8]_net_1\, \PrState_ns_i_0_0_a3_1[0]\, 
        \PrState_ns_i_a3_i_0_o3_1_1[3]\, 
        \PrState_ns_i_a3_i_0_o3_1_0[3]\, 
        \PrState_ns_i_a3_i_0_o3_1_5[3]\, \Phase1Cnt[0]_net_1\, 
        \Phase1Cnt[11]_net_1\, N_166, \Phase1Cnt[8]_net_1\, 
        \Phase1Cnt[7]_net_1\, N_147, \Phase1Cnt[5]_net_1\, 
        \Phase1Cnt[6]_net_1\, \Phase1Cnt[1]_net_1\, 
        \Phase1Cnt[2]_net_1\, N_23, N_25, N_135, N_27, N_136, 
        N_29, N_137, N_31, N_138, \Phase2Cnt[5]_net_1\, N_33, 
        N_189, N_210, N_35, \Phase2Cnt[7]_net_1\, N_37, 
        \Phase1Cnt_RNO[1]_net_1\, \Phase1Cnt_RNO[2]_net_1\, N_142, 
        \Phase1Cnt_RNO_0[3]\, N_144, \Phase1Cnt[3]_net_1\, 
        \Phase1Cnt_RNO_0[4]_net_1\, \Phase1Cnt_RNI7MR51[4]_net_1\, 
        N_251, \Phase1Cnt_RNO[5]_net_1\, N_26, 
        \Phase1Cnt_RNI5DED1[5]_net_1\, \Phase1Cnt_RNO_0[7]_net_1\, 
        N_254, \Phase1Cnt_RNI47KS1[7]_net_1\, 
        \Phase1Cnt_RNO_0[8]\, N_246, N_164, 
        \Phase2Cnt_RNIEA742[8]_net_1\, N_244, N_221, 
        \Phase2Cnt_RNO_1[12]_net_1\, \Phase2Cnt_RNO_1[11]_net_1\, 
        N_215, N_7, N_171, N_168, N_335, \CycCnt[0]_net_1\, 
        \CycCnt[1]_net_1\, N_336, \CycCnt[2]_net_1\, N_140, N_337, 
        \CycCnt[3]_net_1\, N_143, N_16, \CycCnt[4]_net_1\, N_146, 
        N_22_i_0, \CycCnt[7]_net_1\, N_416, N_24_i_0, 
        \CycCnt[8]_net_1\, N_418, N_20, N_232, N_18, 
        \CycCnt[5]_net_1\, N_410, N_268_tz, N_161, 
        \CycCnt[6]_net_1\, CycCnt_n9, \CycCnt[9]_net_1\, N_160, 
        N_165, CycCnt_n11, \PrState_ns[4]\, N_203, CycCnte, 
        CycCnt_n10, CycCnt_n0, \PrState_RNO_2[4]\, N_5, N_199, 
        \PrState[3]_net_1\, \DelayCnt[0]_net_1\, N_192, N_163, 
        N_191, \Phase1Cnt[9]_net_1\, \Phase2Cnt[6]_net_1\, 
        \Phase1Cnt[10]_net_1\, \Phase1Cnt[4]_net_1\, 
        Phase1Cnt_n11, Phase1Cnt_n10, Phase1Cnt_n9, N_121, N_266, 
        N_113, N_4, Phase2Cnt_n13, Phase2Cnt_n12, Phase2Cnt_n11, 
        Phase2Cnt_n10, Phase2Cnt_n9, Phase1Cnt_n0, Phase2Cnt_n0, 
        \lvdsFifoRowRdOut\, \GND\, \VCC\, GND_0, VCC_0
         : std_logic;

begin 

    lvdsFifoRowRdOut <= \lvdsFifoRowRdOut\;

    \Phase1Cnt_RNI5DED1[5]\ : NOR2B
      port map(A => \Phase1Cnt[5]_net_1\, B => 
        \Phase1Cnt_RNI7MR51[4]_net_1\, Y => 
        \Phase1Cnt_RNI5DED1[5]_net_1\);
    
    \PrState[2]\ : DFN1C0
      port map(D => N_7, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[2]_net_1\);
    
    \Phase2Cnt_RNO[7]\ : OA1B
      port map(A => N_189, B => \Phase2Cnt[7]_net_1\, C => 
        Phase2Cnt_n7_0_i_0_0, Y => N_35);
    
    \PrState_RNO[0]\ : AO1C
      port map(A => N_171, B => \PrState_ns_0_0_0_a3_0_1[4]\, C
         => N_203, Y => \PrState_ns[4]\);
    
    \Phase1Cnt[1]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO[1]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[1]_net_1\);
    
    \Phase1Cnt_RNO[4]\ : NOR3A
      port map(A => \PrState[2]_net_1\, B => 
        \Phase1Cnt_RNI7MR51[4]_net_1\, C => N_251, Y => 
        \Phase1Cnt_RNO_0[4]_net_1\);
    
    \Phase2Cnt_RNO_1[10]\ : AO1C
      port map(A => \Phase2Cnt_RNIEA742[8]_net_1\, B => 
        \Phase2Cnt[9]_net_1\, C => Phase2Cnt_n10_0_0_0_a3_0, Y
         => N_215);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => N_161, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[0]_net_1\);
    
    \Phase2Cnt_RNO_2[10]\ : NOR2B
      port map(A => \Phase2Cnt[10]_net_1\, B => 
        \PrState[1]_net_1\, Y => Phase2Cnt_n10_0_0_0_a3_0);
    
    \Phase2Cnt_RNIHKMM[2]\ : NOR2B
      port map(A => \Phase2Cnt[2]_net_1\, B => N_135, Y => N_136);
    
    \Phase1Cnt[5]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO[5]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[5]_net_1\);
    
    \PrState_RNO[1]\ : AO1B
      port map(A => N_265, B => N_178, C => N_243, Y => N_4);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => Phase2Cnt_n0);
    
    \Phase2Cnt_RNIN7AU[1]\ : NOR3A
      port map(A => \PrState_ns_i_a3_i_0_o3_1[3]_net_1\, B => 
        \Phase2Cnt[2]_net_1\, C => \Phase2Cnt[1]_net_1\, Y => 
        \PrState_ns_i_a3_i_0_o3_3[3]\);
    
    \Phase2Cnt_RNIIL49[10]\ : NOR2B
      port map(A => \Phase2Cnt[10]_net_1\, B => 
        \Phase2Cnt[9]_net_1\, Y => \Phase2Cnt_RNIIL49[10]_net_1\);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_140, C => N_89, Y
         => N_336);
    
    \PrState_RNO_1[2]\ : AO1A
      port map(A => N_268, B => N_178, C => 
        \PrState_ns_0_i_0_0[2]\, Y => \PrState_ns_0_i_0_1[2]\);
    
    \Phase2Cnt[12]\ : DFN1C0
      port map(D => Phase2Cnt_n12, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[12]_net_1\);
    
    \CycCnt[10]\ : DFN1E1C0
      port map(D => CycCnt_n10, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => CycCnte, Q => \CycCnt[10]_net_1\);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => Phase2Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[0]_net_1\);
    
    \Phase2Cnt_RNO[14]\ : OAI1
      port map(A => N_266, B => Phase2Cnt_n14_0_i_i_a3_0_0, C => 
        N_244, Y => N_113);
    
    \Phase2Cnt[2]\ : DFN1C0
      port map(D => N_25, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[2]_net_1\);
    
    \PrState_RNO[2]\ : OA1B
      port map(A => N_171, B => \PrState_ns_0_i_0_a3_0_0[2]\, C
         => \PrState_ns_0_i_0_1[2]\, Y => N_7);
    
    \PrState_RNO_1[0]\ : OR2B
      port map(A => \PrState[0]_net_1\, B => LVDS_en_c, Y => 
        N_203);
    
    \Phase2Cnt_RNO_0[10]\ : OR2A
      port map(A => \Phase2Cnt[9]_net_1\, B => 
        \Phase2Cnt[10]_net_1\, Y => Phase2Cnt_n10_0_0_0_a3_0_0);
    
    \Phase1Cnt_RNITH5F[5]\ : NOR2
      port map(A => \Phase1Cnt[5]_net_1\, B => 
        \Phase1Cnt[6]_net_1\, Y => 
        \PrState_ns_i_a3_i_0_o3_1_1[3]\);
    
    \CycCnt_RNISV6R1[7]\ : OR2A
      port map(A => \CycCnt[7]_net_1\, B => N_416, Y => N_418);
    
    \Phase2Cnt[13]\ : DFN1C0
      port map(D => Phase2Cnt_n13, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[13]_net_1\);
    
    \Phase1Cnt_RNO[11]\ : XA1A
      port map(A => \Phase1Cnt[11]_net_1\, B => N_192, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n11);
    
    \DelayCnt_RNI6KGA[0]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_161);
    
    \PrState[4]\ : DFN1P0
      port map(D => \PrState_RNO_2[4]\, CLK => Sysclk_c, PRE => 
        sysrst_n_c, Q => N_89);
    
    \CycCnt_RNO[8]\ : XA1C
      port map(A => \CycCnt[8]_net_1\, B => N_418, C => N_89, Y
         => N_24_i_0);
    
    \Phase2Cnt_RNO[2]\ : XA1
      port map(A => N_135, B => \Phase2Cnt[2]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_25);
    
    \Phase1Cnt[11]\ : DFN1C0
      port map(D => Phase1Cnt_n11, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[11]_net_1\);
    
    \Phase1Cnt_RNO[9]\ : XA1A
      port map(A => \Phase1Cnt[9]_net_1\, B => N_163, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n9);
    
    \Phase2Cnt_RNIB81L1[6]\ : NOR3B
      port map(A => \Phase2Cnt[5]_net_1\, B => 
        \Phase2Cnt[6]_net_1\, C => N_138, Y => N_189);
    
    \Phase2Cnt_RNICMR51[4]\ : OR2B
      port map(A => \Phase2Cnt[4]_net_1\, B => N_137, Y => N_138);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \Phase1Cnt_RNO[7]\ : NOR3A
      port map(A => \PrState[2]_net_1\, B => N_254, C => 
        \Phase1Cnt_RNI47KS1[7]_net_1\, Y => 
        \Phase1Cnt_RNO_0[7]_net_1\);
    
    \PrState_ns_i_a3_i_0_a3_0_RNO[3]\ : OR2B
      port map(A => LVDS_en_c, B => \PrState[2]_net_1\, Y => 
        \PrState_ns_i_a3_i_0_a3_0_0[3]\);
    
    \PrState_RNI3F5T2[2]\ : OR2
      port map(A => N_268_tz, B => N_161, Y => N_268);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    \Phase2Cnt_RNIE39U[3]\ : NOR2B
      port map(A => \Phase2Cnt[3]_net_1\, B => N_136, Y => N_137);
    
    \Phase2Cnt_RNO[10]\ : OAI1
      port map(A => N_266, B => Phase2Cnt_n10_0_0_0_a3_0_0, C => 
        N_215, Y => Phase2Cnt_n10);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => Phase1Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[0]_net_1\);
    
    \CycCnt_RNO[7]\ : XA1C
      port map(A => \CycCnt[7]_net_1\, B => N_416, C => N_89, Y
         => N_22_i_0);
    
    \Phase1Cnt[2]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO[2]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[2]_net_1\);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_146, C => N_89, Y
         => N_16);
    
    \Phase2Cnt[3]\ : DFN1C0
      port map(D => N_27, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[3]_net_1\);
    
    \Phase1Cnt_RNI7MR51[4]\ : NOR2
      port map(A => N_147, B => N_144, Y => 
        \Phase1Cnt_RNI7MR51[4]_net_1\);
    
    \CycCnt_RNI5O0A2[9]\ : OR2A
      port map(A => \CycCnt[9]_net_1\, B => N_160, Y => N_165);
    
    \Phase2Cnt[7]\ : DFN1C0
      port map(D => N_35, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[7]_net_1\);
    
    \CycCnt_RNO_0[6]\ : AOI1
      port map(A => N_410, B => \CycCnt[5]_net_1\, C => 
        \CycCnt[6]_net_1\, Y => N_232);
    
    \Phase2Cnt_RNO_1[13]\ : AO1C
      port map(A => \Phase2Cnt_RNIEA742[8]_net_1\, B => 
        \Phase2Cnt_RNIJI7C[12]_net_1\, C => 
        Phase2Cnt_n13_0_0_0_a3_0, Y => N_221);
    
    \PrState_RNIJTE7[3]\ : OR2
      port map(A => \PrState[3]_net_1\, B => \PrState[2]_net_1\, 
        Y => N_202_1);
    
    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \lvdsFifoRowRdOut\);
    
    \Phase2Cnt_RNO_2[13]\ : NOR2B
      port map(A => \Phase2Cnt[13]_net_1\, B => 
        \PrState[1]_net_1\, Y => Phase2Cnt_n13_0_0_0_a3_0);
    
    \Phase2Cnt_RNO_0[7]\ : OR2A
      port map(A => \PrState[1]_net_1\, B => N_145, Y => 
        Phase2Cnt_n7_0_i_0_0);
    
    \Phase1Cnt_RNO_0[4]\ : OA1C
      port map(A => \Phase1Cnt[3]_net_1\, B => N_144, C => 
        \Phase1Cnt[4]_net_1\, Y => N_251);
    
    \Phase2Cnt[6]\ : DFN1C0
      port map(D => N_33, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[6]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \Phase1Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => Phase1Cnt_n0);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_20, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \Phase1Cnt_RNO_0[10]\ : OR2A
      port map(A => \Phase1Cnt[9]_net_1\, B => N_163, Y => N_191);
    
    \Phase2Cnt[10]\ : DFN1C0
      port map(D => Phase2Cnt_n10, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[10]_net_1\);
    
    \Phase1Cnt_RNIO68I[11]\ : NOR3C
      port map(A => \Phase1Cnt[0]_net_1\, B => 
        \Phase1Cnt[11]_net_1\, C => N_166, Y => 
        \PrState_ns_i_a3_i_0_o3_1_6[3]\);
    
    \PrState_RNIA26B[0]\ : OR2
      port map(A => \PrState[0]_net_1\, B => N_202_1, Y => 
        CycCntlde_0_0_a3_0);
    
    \Phase2Cnt_RNICURG[15]\ : NOR2
      port map(A => \Phase2Cnt[15]_net_1\, B => N_164, Y => N_168);
    
    \Phase2Cnt_RNIC7KS1[7]\ : NOR2
      port map(A => N_141, B => N_138, Y => N_145);
    
    \CycCnt_RNO_1[11]\ : NOR2A
      port map(A => \CycCnt[11]_net_1\, B => N_89, Y => 
        CycCnt_n11_0_0_0_a3_0);
    
    \Phase2Cnt_RNIL94F[1]\ : NOR2B
      port map(A => \Phase2Cnt[1]_net_1\, B => 
        \Phase2Cnt[0]_net_1\, Y => N_135);
    
    \Phase2Cnt_RNO_1[12]\ : AO1C
      port map(A => \Phase2Cnt_RNIEA742[8]_net_1\, B => 
        \Phase2Cnt_RNI24MA[11]_net_1\, C => 
        Phase2Cnt_n12_0_0_0_a3_0, Y => 
        \Phase2Cnt_RNO_1[12]_net_1\);
    
    \Phase2Cnt_RNO_0[13]\ : NOR2A
      port map(A => \Phase2Cnt_RNIJI7C[12]_net_1\, B => 
        \Phase2Cnt[13]_net_1\, Y => Phase2Cnt_n13_0_0_0_a3_0_0);
    
    \Phase1Cnt[3]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO_0[3]\, CLK => Sysclk_c, CLR
         => sysrst_n_c, Q => \Phase1Cnt[3]_net_1\);
    
    \Phase2Cnt_RNO_2[12]\ : NOR2B
      port map(A => \Phase2Cnt[12]_net_1\, B => 
        \PrState[1]_net_1\, Y => Phase2Cnt_n12_0_0_0_a3_0);
    
    \Phase1Cnt_RNIJ94F[1]\ : NOR2B
      port map(A => \Phase1Cnt[1]_net_1\, B => 
        \Phase1Cnt[0]_net_1\, Y => N_142);
    
    \PrState[1]\ : DFN1C0
      port map(D => N_4, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[1]_net_1\);
    
    \Phase1Cnt_RNIQ3BU[7]\ : NOR3
      port map(A => \Phase1Cnt[8]_net_1\, B => 
        \Phase1Cnt[7]_net_1\, C => N_147, Y => 
        \PrState_ns_i_a3_i_0_o3_1_5[3]\);
    
    \Phase2Cnt[14]\ : DFN1C0
      port map(D => N_113, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[14]_net_1\);
    
    \Phase1Cnt[7]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO_0[7]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[7]_net_1\);
    
    \Phase2Cnt_RNO[15]\ : AO1C
      port map(A => N_266, B => N_168, C => N_246, Y => N_121);
    
    \Phase1Cnt_RNO[2]\ : XA1
      port map(A => N_142, B => \Phase1Cnt[2]_net_1\, C => 
        \PrState[2]_net_1\, Y => \Phase1Cnt_RNO[2]_net_1\);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_337, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \PrState_RNO_0[0]\ : NOR2A
      port map(A => \PrState_ns_0_0_0_a3_0_0[4]\, B => N_178, Y
         => \PrState_ns_0_0_0_a3_0_1[4]\);
    
    \PrState_RNO_0[4]\ : OR3
      port map(A => \PrState[1]_net_1\, B => \PrState[0]_net_1\, 
        C => N_89, Y => \PrState_ns_i_0_0_a3_1[0]\);
    
    \Phase2Cnt_RNO_1[11]\ : AO1C
      port map(A => \Phase2Cnt_RNIEA742[8]_net_1\, B => 
        \Phase2Cnt_RNIIL49[10]_net_1\, C => 
        Phase2Cnt_n11_0_0_0_a3_0, Y => 
        \Phase2Cnt_RNO_1[11]_net_1\);
    
    \CycCnt_RNIIPIA2[10]\ : OR2A
      port map(A => \CycCnt[10]_net_1\, B => N_165, Y => N_171);
    
    \Phase2Cnt_RNO_2[11]\ : NOR2B
      port map(A => \Phase2Cnt[11]_net_1\, B => 
        \PrState[1]_net_1\, Y => Phase2Cnt_n11_0_0_0_a3_0);
    
    \Phase2Cnt_RNO_0[6]\ : OA1C
      port map(A => \Phase2Cnt[5]_net_1\, B => N_138, C => 
        \Phase2Cnt[6]_net_1\, Y => N_210);
    
    \Phase1Cnt[6]\ : DFN1C0
      port map(D => N_26, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[6]_net_1\);
    
    \Phase2Cnt[8]\ : DFN1C0
      port map(D => N_37, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[8]_net_1\);
    
    \Phase2Cnt[15]\ : DFN1C0
      port map(D => N_121, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[15]_net_1\);
    
    \CycCnt_RNI0SJ22[8]\ : OR2A
      port map(A => \CycCnt[8]_net_1\, B => N_418, Y => N_160);
    
    \Phase2Cnt_RNO_1[14]\ : OAI1
      port map(A => N_162, B => \Phase2Cnt_RNIEA742[8]_net_1\, C
         => Phase2Cnt_n14_0_i_i_a3_0, Y => N_244);
    
    \PrState_RNI6JU72[1]\ : OR2A
      port map(A => \PrState[1]_net_1\, B => 
        \Phase2Cnt_RNIEA742[8]_net_1\, Y => N_266);
    
    \Phase2Cnt_RNO_2[14]\ : NOR2B
      port map(A => \Phase2Cnt[14]_net_1\, B => 
        \PrState[1]_net_1\, Y => Phase2Cnt_n14_0_i_i_a3_0);
    
    \Phase1Cnt_RNO_0[7]\ : AOI1
      port map(A => \Phase1Cnt[6]_net_1\, B => 
        \Phase1Cnt_RNI5DED1[5]_net_1\, C => \Phase1Cnt[7]_net_1\, 
        Y => N_254);
    
    \Phase2Cnt_RNO[5]\ : XA1A
      port map(A => N_138, B => \Phase2Cnt[5]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_31);
    
    \Phase2Cnt_RNO_0[12]\ : NOR2A
      port map(A => \Phase2Cnt_RNI24MA[11]_net_1\, B => 
        \Phase2Cnt[12]_net_1\, Y => Phase2Cnt_n12_0_0_0_a3_0_0);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[0]_net_1\);
    
    \PrState_RNIVV043[4]\ : AO1D
      port map(A => CycCntlde_0_0_a3_0, B => N_178, C => N_89, Y
         => CycCnte);
    
    \Phase1Cnt_RNI5A742[8]\ : OR2B
      port map(A => \Phase1Cnt[8]_net_1\, B => 
        \Phase1Cnt_RNI47KS1[7]_net_1\, Y => N_163);
    
    \PrState_ns_i_a3_i_0_a3_0[3]\ : OR2
      port map(A => N_188, B => \PrState_ns_i_a3_i_0_a3_0_0[3]\, 
        Y => N_243);
    
    \PrState_RNITQKI2[2]\ : AOI1B
      port map(A => \PrState_ns_i_a3_i_0_o3_1_7[3]\, B => 
        \PrState_ns_i_a3_i_0_o3_1_6[3]\, C => \PrState[2]_net_1\, 
        Y => N_268_tz);
    
    \Phase2Cnt_RNI0HOM[7]\ : OR3C
      port map(A => \Phase2Cnt[5]_net_1\, B => 
        \Phase2Cnt[6]_net_1\, C => \Phase2Cnt[7]_net_1\, Y => 
        N_141);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_24_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \PrState_ns_i_a3_i_0_o3_1[3]\ : NAND2
      port map(A => \PrState_ns_i_a3_i_0_o3_1_6[3]\, B => 
        \PrState_ns_i_a3_i_0_o3_1_7[3]\, Y => N_188);
    
    \Phase2Cnt_RNO[8]\ : XA1
      port map(A => N_145, B => \Phase2Cnt[8]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_37);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_5, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    \Phase2Cnt_RNO_0[11]\ : NOR2A
      port map(A => \Phase2Cnt_RNIIL49[10]_net_1\, B => 
        \Phase2Cnt[11]_net_1\, Y => Phase2Cnt_n11_0_0_0_a3_0_0);
    
    \PrState[0]\ : DFN1C0
      port map(D => \PrState_ns[4]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[0]_net_1\);
    
    \CycCnt_RNIMFJT[3]\ : NOR2B
      port map(A => N_143, B => \CycCnt[3]_net_1\, Y => N_146);
    
    \Phase2Cnt_RNO[3]\ : XA1
      port map(A => N_136, B => \Phase2Cnt[3]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_27);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => N_89, Y => N_335);
    
    \Phase2Cnt_RNO_0[14]\ : OR2
      port map(A => \Phase2Cnt[14]_net_1\, B => N_162, Y => 
        Phase2Cnt_n14_0_i_i_a3_0_0);
    
    \Phase1Cnt[8]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO_0[8]\, CLK => Sysclk_c, CLR
         => sysrst_n_c, Q => \Phase1Cnt[8]_net_1\);
    
    \Phase1Cnt_RNIP15F[4]\ : OR2B
      port map(A => \Phase1Cnt[4]_net_1\, B => 
        \Phase1Cnt[3]_net_1\, Y => N_147);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    \Phase1Cnt_RNI47KS1[7]\ : NOR3C
      port map(A => \Phase1Cnt_RNI5DED1[5]_net_1\, B => 
        \Phase1Cnt[6]_net_1\, C => \Phase1Cnt[7]_net_1\, Y => 
        \Phase1Cnt_RNI47KS1[7]_net_1\);
    
    \Phase2Cnt_RNIEA742[8]\ : OR2B
      port map(A => \Phase2Cnt[8]_net_1\, B => N_145, Y => 
        \Phase2Cnt_RNIEA742[8]_net_1\);
    
    \PrState_RNO_0[2]\ : OR2
      port map(A => \CycCnt[11]_net_1\, B => N_268, Y => 
        \PrState_ns_0_i_0_a3_0_0[2]\);
    
    \Phase2Cnt_RNO[6]\ : NOR3A
      port map(A => \PrState[1]_net_1\, B => N_189, C => N_210, Y
         => N_33);
    
    \Phase1Cnt_RNO_0[11]\ : OR2A
      port map(A => N_166, B => N_163, Y => N_192);
    
    \Phase1Cnt_RNIGL49[10]\ : NOR2B
      port map(A => \Phase1Cnt[10]_net_1\, B => 
        \Phase1Cnt[9]_net_1\, Y => N_166);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_16, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \Phase1Cnt_RNO[10]\ : XA1A
      port map(A => \Phase1Cnt[10]_net_1\, B => N_191, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n10);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_410, C => N_89, Y
         => N_18);
    
    \PrState_RNO_2[2]\ : OAI1
      port map(A => N_268, B => \PrState[1]_net_1\, C => 
        LVDS_en_c, Y => \PrState_ns_0_i_0_0[2]\);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[1]_net_1\, C => \PrState[1]_net_1\, Y => N_23);
    
    \PrState_RNO[3]\ : OA1
      port map(A => N_89, B => N_199, C => LVDS_en_c, Y => N_5);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => N_89, B => \CycCnt[0]_net_1\, Y => CycCnt_n0);
    
    \Phase2Cnt[11]\ : DFN1C0
      port map(D => Phase2Cnt_n11, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[11]_net_1\);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_22_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \Phase2Cnt_RNO[11]\ : AO1C
      port map(A => N_266, B => Phase2Cnt_n11_0_0_0_a3_0_0, C => 
        \Phase2Cnt_RNO_1[11]_net_1\, Y => Phase2Cnt_n11);
    
    \Phase2Cnt_RNIOFAF[14]\ : OR2A
      port map(A => \Phase2Cnt[14]_net_1\, B => N_162, Y => N_164);
    
    \Phase2Cnt_RNO[4]\ : XA1
      port map(A => N_137, B => \Phase2Cnt[4]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_29);
    
    \Phase1Cnt_RNO[5]\ : XA1
      port map(A => \Phase1Cnt_RNI7MR51[4]_net_1\, B => 
        \Phase1Cnt[5]_net_1\, C => \PrState[2]_net_1\, Y => 
        \Phase1Cnt_RNO[5]_net_1\);
    
    \Phase2Cnt[4]\ : DFN1C0
      port map(D => N_29, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[4]_net_1\);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_335, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \Phase2Cnt[9]\ : DFN1C0
      port map(D => Phase2Cnt_n9, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[9]_net_1\);
    
    \Phase1Cnt_RNIC7LS1[1]\ : NOR3C
      port map(A => \PrState_ns_i_a3_i_0_o3_1_1[3]\, B => 
        \PrState_ns_i_a3_i_0_o3_1_0[3]\, C => 
        \PrState_ns_i_a3_i_0_o3_1_5[3]\, Y => 
        \PrState_ns_i_a3_i_0_o3_1_7[3]\);
    
    \CycCnt_RNO[10]\ : XA1C
      port map(A => \CycCnt[10]_net_1\, B => N_165, C => N_89, Y
         => CycCnt_n10);
    
    \CycCnt[11]\ : DFN1E1C0
      port map(D => CycCnt_n11, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => CycCnte, Q => \CycCnt[11]_net_1\);
    
    \Phase1Cnt[10]\ : DFN1C0
      port map(D => Phase1Cnt_n10, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[10]_net_1\);
    
    \Phase1Cnt_RNO[8]\ : XA1
      port map(A => \Phase1Cnt_RNI47KS1[7]_net_1\, B => 
        \Phase1Cnt[8]_net_1\, C => \PrState[2]_net_1\, Y => 
        \Phase1Cnt_RNO_0[8]\);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_160, C => N_89, Y
         => CycCnt_n9);
    
    \Phase2Cnt_RNI0M5F[4]\ : NOR2
      port map(A => \Phase2Cnt[4]_net_1\, B => 
        \Phase2Cnt[8]_net_1\, Y => 
        \PrState_ns_i_a3_i_0_o3_1[3]_net_1\);
    
    \PrState_RNI5T3A[1]\ : NOR2B
      port map(A => \PrState[1]_net_1\, B => LVDS_en_c, Y => 
        N_265);
    
    \Phase2Cnt_RNO_1[15]\ : NOR2B
      port map(A => \Phase2Cnt[15]_net_1\, B => 
        \PrState[1]_net_1\, Y => Phase2Cnt_n15_0_i_i_a3_0);
    
    \Phase1Cnt_RNO[3]\ : XA1A
      port map(A => N_144, B => \Phase1Cnt[3]_net_1\, C => 
        \PrState[2]_net_1\, Y => \Phase1Cnt_RNO_0[3]\);
    
    \Phase2Cnt_RNI51PD[13]\ : OR2B
      port map(A => \Phase2Cnt[13]_net_1\, B => 
        \Phase2Cnt_RNIJI7C[12]_net_1\, Y => N_162);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_143, C => N_89, Y
         => N_337);
    
    \Phase2Cnt_RNIJI7C[12]\ : NOR2B
      port map(A => \Phase2Cnt[12]_net_1\, B => 
        \Phase2Cnt_RNI24MA[11]_net_1\, Y => 
        \Phase2Cnt_RNIJI7C[12]_net_1\);
    
    WFO_RNIIRD5 : INV
      port map(A => \lvdsFifoRowRdOut\, Y => lvdsFifoRowRdOut_i);
    
    \CycCnt_RNIPNPE[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => \CycCnt[0]_net_1\, Y
         => N_140);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_23, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \CycCnt_RNO[11]\ : MX2
      port map(A => CycCnt_n11_0_0_0_a3_0_0, B => 
        CycCnt_n11_0_0_0_a3_0, S => N_171, Y => CycCnt_n11);
    
    \Phase1Cnt_RNIEKMM[2]\ : OR2B
      port map(A => \Phase1Cnt[2]_net_1\, B => N_142, Y => N_144);
    
    \Phase2Cnt_RNIEA742[1]\ : NOR3B
      port map(A => \PrState_ns_i_a3_i_0_o3_3[3]\, B => 
        \PrState_ns_i_a3_i_0_o3_2[3]\, C => N_141, Y => 
        \PrState_ns_i_a3_i_0_o3_5[3]\);
    
    \CycCnt_RNIP3QJ1[6]\ : OR3C
      port map(A => \CycCnt[5]_net_1\, B => N_410, C => 
        \CycCnt[6]_net_1\, Y => N_416);
    
    \CycCnt_RNIMB051[4]\ : NOR2B
      port map(A => N_146, B => \CycCnt[4]_net_1\, Y => N_410);
    
    \Phase1Cnt_RNO[6]\ : XA1
      port map(A => \Phase1Cnt_RNI5DED1[5]_net_1\, B => 
        \Phase1Cnt[6]_net_1\, C => \PrState[2]_net_1\, Y => N_26);
    
    \CycCnt_RNO[6]\ : NOR3A
      port map(A => N_416, B => N_232, C => N_89, Y => N_20);
    
    \Phase1Cnt[4]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO_0[4]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[4]_net_1\);
    
    \PrState_RNO[4]\ : OA1B
      port map(A => N_202_1, B => \PrState_ns_i_0_0_a3_1[0]\, C
         => LVDS_en_c, Y => \PrState_RNO_2[4]\);
    
    \Phase2Cnt_RNI24MA[11]\ : NOR2B
      port map(A => \Phase2Cnt[11]_net_1\, B => 
        \Phase2Cnt_RNIIL49[10]_net_1\, Y => 
        \Phase2Cnt_RNI24MA[11]_net_1\);
    
    \Phase1Cnt[9]\ : DFN1C0
      port map(D => Phase1Cnt_n9, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[9]_net_1\);
    
    \Phase2Cnt_RNO[13]\ : AO1C
      port map(A => N_266, B => Phase2Cnt_n13_0_0_0_a3_0_0, C => 
        N_221, Y => Phase2Cnt_n13);
    
    \CycCnt_RNO_0[11]\ : NOR3A
      port map(A => \CycCnt[10]_net_1\, B => N_89, C => 
        \CycCnt[11]_net_1\, Y => CycCnt_n11_0_0_0_a3_0_0);
    
    \PrState_RNO_0[3]\ : NOR2B
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_199);
    
    \Phase1Cnt_RNO[1]\ : XA1
      port map(A => \Phase1Cnt[0]_net_1\, B => 
        \Phase1Cnt[1]_net_1\, C => \PrState[2]_net_1\, Y => 
        \Phase1Cnt_RNO[1]_net_1\);
    
    \Phase2Cnt_RNO_0[15]\ : OAI1
      port map(A => N_164, B => \Phase2Cnt_RNIEA742[8]_net_1\, C
         => Phase2Cnt_n15_0_i_i_a3_0, Y => N_246);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_18, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    \Phase2Cnt_RNO[12]\ : AO1C
      port map(A => N_266, B => Phase2Cnt_n12_0_0_0_a3_0_0, C => 
        \Phase2Cnt_RNO_1[12]_net_1\, Y => Phase2Cnt_n12);
    
    \Phase2Cnt[5]\ : DFN1C0
      port map(D => N_31, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[5]_net_1\);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_336, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \Phase2Cnt_RNO[9]\ : XA1A
      port map(A => \Phase2Cnt[9]_net_1\, B => 
        \Phase2Cnt_RNIEA742[8]_net_1\, C => \PrState[1]_net_1\, Y
         => Phase2Cnt_n9);
    
    \CycCnt_RNINJ6M[2]\ : NOR2B
      port map(A => N_140, B => \CycCnt[2]_net_1\, Y => N_143);
    
    \Phase1Cnt_RNILH4F[1]\ : NOR2
      port map(A => \Phase1Cnt[1]_net_1\, B => 
        \Phase1Cnt[2]_net_1\, Y => 
        \PrState_ns_i_a3_i_0_o3_1_0[3]\);
    
    \Phase2Cnt_RNIQ83L2[15]\ : OR2B
      port map(A => \PrState_ns_i_a3_i_0_o3_5[3]\, B => N_168, Y
         => N_178);
    
    \PrState_RNO_2[0]\ : NOR2A
      port map(A => N_265, B => \CycCnt[11]_net_1\, Y => 
        \PrState_ns_0_0_0_a3_0_0[4]\);
    
    \Phase2Cnt_RNINH4F[3]\ : NOR2B
      port map(A => \Phase2Cnt[3]_net_1\, B => 
        \Phase2Cnt[0]_net_1\, Y => \PrState_ns_i_a3_i_0_o3_2[3]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ2 is

    port( lvds_fifoRd      : out   std_logic;
          sysrst_n_c       : in    std_logic;
          Sysclk_c         : in    std_logic;
          lvdsFifoRowRdOut : in    std_logic
        );

end WaveGenSingleZ2;

architecture DEF_ARCH of WaveGenSingleZ2 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XA1C
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

  component NOR3A
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component XA1B
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

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component AO1B
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

  component OR2
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

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OA1B
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

  component NOR3C
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

  component AX1E
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \PrState_ns_0_0_a2_0[2]\, N_78, N_67, 
        \PrState_ns_0_0_a2_0_0[4]\, \PrState_ns_0_i_0[1]\, N_150, 
        CycCntlde_0_a2_0_0, \PrState[0]_net_1\, 
        \PrState[2]_net_1\, \PrState[3]_net_1\, 
        \PrState_ns_0_0_a2_0[3]\, \PrState[1]_net_1\, 
        \PrState_ns_i_0_a2_0[0]\, \PrState_ns_0_0_a2_0_2[2]\, 
        \DelayCnt[0]_net_1\, \DelayCnt[1]_net_1\, 
        \PrState_ns_0_0_a2_0_0[2]\, \DelayCnt[3]_net_1\, 
        \PrState_ns_0_i_a2_1[1]\, \PrState[4]_net_1\, 
        \PrState_ns_0_i_a2_0_0[1]\, \PrState_ns_0_i_a2_0[1]\, 
        N_31, \Phase2Cnt[0]_net_1\, \Phase2Cnt[1]_net_1\, N_33, 
        N_116, N_117, N_35, N_37, \DelayCnt[2]_net_1\, N_69, N_39, 
        N_72, N_7, N_92, \CycCnt[9]_net_1\, N_74, N_186_i, 
        N_27_i_0, \CycCnt[8]_net_1\, N_70, N_25_i_0, 
        \CycCnt[7]_net_1\, N_68, N_23, N_192, N_21, 
        \CycCnt[5]_net_1\, N_47, N_19, \CycCnt[4]_net_1\, N_46, 
        N_17, \CycCnt[3]_net_1\, N_177, N_15, \CycCnt[2]_net_1\, 
        N_44, N_13, \CycCnt[0]_net_1\, \CycCnt[1]_net_1\, 
        \DelayCnt[4]_net_1\, CycCnt_n0, \CycCnt[6]_net_1\, 
        CycCnt_n9, N_79_i, N_73, \Phase2Cnt[2]_net_1\, 
        \Phase1Cnt[0]_net_1\, N_41, \PrState_ns[4]\, 
        \PrState_ns[3]\, N_90, \PrState_ns[2]\, N_129, 
        \PrState_RNO_3[4]\, CycCnte, NxState_0_sqmuxa, 
        DelayCnt_n0, Phase2Cnt_n0, \GND\, \VCC\, GND_0, VCC_0
         : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => lvds_fifoRd);
    
    \PrState_RNI9HE5[3]\ : NOR2
      port map(A => \PrState[4]_net_1\, B => \PrState[3]_net_1\, 
        Y => N_150);
    
    \PrState[2]\ : DFN1C0
      port map(D => \PrState_ns[2]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[2]_net_1\);
    
    \PrState_RNO_3[2]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[3]_net_1\, 
        Y => \PrState_ns_0_0_a2_0_0[2]\);
    
    \PrState_RNIOP58[0]\ : NOR3
      port map(A => \PrState[0]_net_1\, B => \PrState[2]_net_1\, 
        C => \PrState[3]_net_1\, Y => CycCntlde_0_a2_0_0);
    
    \Phase1Cnt_RNI25P7[0]\ : OR2B
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => N_67);
    
    \CycCnt_RNO_0[6]\ : AOI1
      port map(A => N_47, B => \CycCnt[5]_net_1\, C => 
        \CycCnt[6]_net_1\, Y => N_192);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \CycCnt_RNO[7]\ : XA1C
      port map(A => \CycCnt[7]_net_1\, B => N_68, C => 
        \PrState[4]_net_1\, Y => N_25_i_0);
    
    \PrState_RNO_0[0]\ : OR3A
      port map(A => \PrState_ns_0_0_a2_0_0[4]\, B => 
        \CycCnt[9]_net_1\, C => N_74, Y => N_92);
    
    \Phase2Cnt_RNO[2]\ : NOR3A
      port map(A => \PrState[1]_net_1\, B => N_116, C => N_117, Y
         => N_33);
    
    \PrState_RNO_4[2]\ : NOR3A
      port map(A => lvdsFifoRowRdOut, B => \DelayCnt[0]_net_1\, C
         => \DelayCnt[1]_net_1\, Y => \PrState_ns_0_0_a2_0_2[2]\);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[1]_net_1\, C => \PrState[1]_net_1\, Y => N_31);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_27_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_21, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_46, C => 
        \PrState[4]_net_1\, Y => N_19);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[0]_net_1\);
    
    \PrState_RNO_1[3]\ : OR3
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[4]_net_1\, Y => \PrState_ns_0_i_a2_1[1]\);
    
    \CycCnt_RNIATC42[8]\ : OR2A
      port map(A => \CycCnt[8]_net_1\, B => N_70, Y => N_74);
    
    \CycCnt_RNI5GOM[2]\ : NOR2B
      port map(A => N_44, B => \CycCnt[2]_net_1\, Y => N_177);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_74, C => 
        \PrState[4]_net_1\, Y => CycCnt_n9);
    
    \PrState[1]\ : DFN1C0
      port map(D => \PrState_ns[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[1]_net_1\);
    
    \CycCnt_RNO[6]\ : NOR3A
      port map(A => N_68, B => N_192, C => \PrState[4]_net_1\, Y
         => N_23);
    
    \PrState_RNO_0[2]\ : AOI1B
      port map(A => N_78, B => N_67, C => lvdsFifoRowRdOut, Y => 
        \PrState_ns_0_0_a2_0[2]\);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_15, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_177, C => 
        \PrState[4]_net_1\, Y => N_17);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_44, C => 
        \PrState[4]_net_1\, Y => N_15);
    
    \PrState_RNO[2]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_0[2]\, B => N_129, C => 
        N_186_i, Y => \PrState_ns[2]\);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => \PrState[4]_net_1\, B => \CycCnt[0]_net_1\, Y
         => CycCnt_n0);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_37, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \PrState_RNO_2[3]\ : OR2A
      port map(A => lvdsFifoRowRdOut, B => N_150, Y => 
        \PrState_ns_0_i_0[1]\);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_23, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \PrState_RNO_0[1]\ : NOR2B
      port map(A => \PrState[1]_net_1\, B => lvdsFifoRowRdOut, Y
         => \PrState_ns_0_0_a2_0[3]\);
    
    \PrState_RNIEM7Q[4]\ : AO1A
      port map(A => N_73, B => CycCntlde_0_a2_0_0, C => 
        \PrState[4]_net_1\, Y => CycCnte);
    
    \Phase2Cnt[2]\ : DFN1C0
      port map(D => N_33, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[2]_net_1\);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => NxState_0_sqmuxa, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[0]_net_1\);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_35, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \PrState_RNO_0[3]\ : OR2
      port map(A => \DelayCnt[3]_net_1\, B => 
        \PrState_ns_0_i_a2_0[1]\, Y => \PrState_ns_0_i_a2_0_0[1]\);
    
    DelayCnt_n2_0_i : XA1
      port map(A => \DelayCnt[2]_net_1\, B => N_69, C => 
        \PrState[3]_net_1\, Y => N_37);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_17, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => Phase2Cnt_n0);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => N_39, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[3]_net_1\);
    
    \PrState_RNO[1]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_0[3]\, B => N_73, C => 
        N_90, Y => \PrState_ns[3]\);
    
    \PrState[4]\ : DFN1P0
      port map(D => \PrState_RNO_3[4]\, CLK => Sysclk_c, PRE => 
        sysrst_n_c, Q => \PrState[4]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => \PrState[4]_net_1\, Y => N_13);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_13, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \Phase1Cnt_RNI25P7_0[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => NxState_0_sqmuxa);
    
    \PrState_RNIJS1I[1]\ : OR2A
      port map(A => \PrState[1]_net_1\, B => N_73, Y => N_78);
    
    \DelayCnt[4]\ : DFN1C0
      port map(D => N_41, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[4]_net_1\);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_31, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \CycCnt_RNIDH5F[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => \CycCnt[0]_net_1\, Y
         => N_44);
    
    \DelayCnt_RNI212A[4]\ : OR2A
      port map(A => \DelayCnt[4]_net_1\, B => \DelayCnt[2]_net_1\, 
        Y => \PrState_ns_0_i_a2_0[1]\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \PrState[0]\ : DFN1C0
      port map(D => \PrState_ns[4]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[0]_net_1\);
    
    \CycCnt_RNIC6PS1[7]\ : OR2A
      port map(A => \CycCnt[7]_net_1\, B => N_68, Y => N_70);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_19, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \PrState_RNO[3]\ : OA1B
      port map(A => \PrState_ns_0_i_a2_0_0[1]\, B => 
        \PrState_ns_0_i_a2_1[1]\, C => \PrState_ns_0_i_0[1]\, Y
         => N_7);
    
    \Phase2Cnt_RNO_0[2]\ : AOI1
      port map(A => \Phase2Cnt[1]_net_1\, B => 
        \Phase2Cnt[0]_net_1\, C => \Phase2Cnt[2]_net_1\, Y => 
        N_116);
    
    DelayCnt_n1_0_i_o2 : NOR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_69);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_25_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_7, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    DelayCnt_n1_0_i : XA1
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[3]_net_1\, Y => N_35);
    
    \Phase2Cnt_RNI1KAF[2]\ : OR3B
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[2]_net_1\, C => \Phase2Cnt[1]_net_1\, Y => 
        N_73);
    
    \PrState_RNO_1[2]\ : OR3A
      port map(A => N_67, B => \CycCnt[9]_net_1\, C => N_74, Y
         => N_129);
    
    \CycCnt_RNIOPU51[4]\ : NOR2B
      port map(A => N_46, B => \CycCnt[4]_net_1\, Y => N_47);
    
    \PrState_RNO[0]\ : AO1B
      port map(A => \PrState[0]_net_1\, B => lvdsFifoRowRdOut, C
         => N_92, Y => \PrState_ns[4]\);
    
    \Phase2Cnt_RNO_1[2]\ : NOR3C
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[2]_net_1\, C => \Phase2Cnt[1]_net_1\, Y => 
        N_117);
    
    \PrState_RNO_0[4]\ : NOR3
      port map(A => \PrState[0]_net_1\, B => \PrState[2]_net_1\, 
        C => \PrState[1]_net_1\, Y => \PrState_ns_i_0_a2_0[0]\);
    
    DelayCnt_n2_0_i_o2 : NOR2B
      port map(A => N_69, B => \DelayCnt[2]_net_1\, Y => N_72);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_47, C => 
        \PrState[4]_net_1\, Y => N_21);
    
    \CycCnt_RNIFJ5L1[6]\ : OR3C
      port map(A => \CycCnt[5]_net_1\, B => N_47, C => 
        \CycCnt[6]_net_1\, Y => N_68);
    
    \CycCnt_RNIUIBU[3]\ : NOR2B
      port map(A => N_177, B => \CycCnt[3]_net_1\, Y => N_46);
    
    \CycCnt_RNO[8]\ : XA1C
      port map(A => \CycCnt[8]_net_1\, B => N_70, C => 
        \PrState[4]_net_1\, Y => N_27_i_0);
    
    DelayCnt_n4_0_i_x2 : AX1E
      port map(A => \DelayCnt[3]_net_1\, B => N_72, C => 
        \DelayCnt[4]_net_1\, Y => N_79_i);
    
    \PrState_RNO_2[2]\ : OR3B
      port map(A => \PrState_ns_0_0_a2_0_0[2]\, B => 
        \PrState_ns_0_0_a2_0_2[2]\, C => \PrState_ns_0_i_a2_0[1]\, 
        Y => N_186_i);
    
    \PrState_RNO_1[1]\ : OR2B
      port map(A => NxState_0_sqmuxa, B => lvdsFifoRowRdOut, Y
         => N_90);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => Phase2Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[0]_net_1\);
    
    DelayCnt_n4_0_i : NOR2A
      port map(A => \PrState[3]_net_1\, B => N_79_i, Y => N_41);
    
    \PrState_RNO[4]\ : AOI1
      port map(A => \PrState_ns_i_0_a2_0[0]\, B => N_150, C => 
        lvdsFifoRowRdOut, Y => \PrState_RNO_3[4]\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    \PrState_RNO_1[0]\ : NOR2A
      port map(A => lvdsFifoRowRdOut, B => N_78, Y => 
        \PrState_ns_0_0_a2_0_0[4]\);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    \DelayCnt_RNO[0]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    
    DelayCnt_n3_0_i : XA1
      port map(A => \DelayCnt[3]_net_1\, B => N_72, C => 
        \PrState[3]_net_1\, Y => N_39);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ9 is

    port( FifoRowRdOut   : out   std_logic;
          SDramEn_c      : in    std_logic;
          FifoRowRdOut_i : out   std_logic;
          sysrst_n_c     : in    std_logic;
          Sysclk_c       : in    std_logic;
          FifoRowRdOut_0 : out   std_logic
        );

end WaveGenSingleZ9;

architecture DEF_ARCH of WaveGenSingleZ9 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AO1B
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

  component XA1
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

  component AOI1
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

  component NOR3C
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

  component NOR2A
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

  component OR2A
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

  component OR2B
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

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3
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

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component XA1C
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

  component OR3
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

  component INV
    port( A : in    std_logic := 'U';
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

  component OA1C
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

  component OR3B
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

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \PrState[2]_net_1\, \FifoRowRdOut_0\, 
        \PrState_ns_i_a3_i_0_a3_1_0[2]\, N_212, 
        \PrState_ns_0_0_0_a3_0_0[4]\, CycCnt_n10_0_0_0_a3_0_0, 
        \CycCnt[9]_net_1\, N_75, \CycCnt[10]_net_1\, 
        CycCnt_n10_0_0_0_a3_0, \PrState_ns_0_i_0_0[1]\, N_213, 
        CycCntlde_0_0_a3_0, \PrState[0]_net_1\, 
        \PrState[3]_net_1\, \PrState_ns_i_0_0_a3_0[0]\, 
        \PrState[1]_net_1\, \PrState_ns_i_a3_i_0_a2_8[3]\, 
        \Phase1Cnt[0]_net_1\, \PrState_ns_i_a3_i_0_a2_5[3]\, 
        \Phase1Cnt[8]_net_1\, \PrState_ns_i_a3_i_0_a2_7[3]\, 
        \PrState_ns_i_a3_i_0_a2_3[3]\, \Phase1Cnt[5]_net_1\, 
        \Phase1Cnt[4]_net_1\, \PrState_ns_i_a3_i_0_a2_6[3]\, 
        \Phase1Cnt[11]_net_1\, \Phase1Cnt[3]_net_1\, 
        \PrState_ns_i_a3_i_0_a2_1[3]\, \Phase1Cnt[9]_net_1\, 
        \Phase1Cnt[10]_net_1\, \Phase1Cnt[6]_net_1\, 
        \Phase1Cnt[7]_net_1\, \Phase1Cnt[1]_net_1\, 
        \Phase1Cnt[2]_net_1\, N_218, N_18, 
        \Phase2Cnt_RNI1D47[2]_net_1\, N_158, N_20, 
        \Phase2Cnt_RNIEPG9[0]_net_1\, N_159, N_13, 
        \Phase2Cnt[0]_net_1\, \Phase2Cnt[1]_net_1\, N_276_i_0, 
        N_277_i_0, N_105, \Phase1Cnt_RNO[3]_net_1\, N_107, 
        \Phase1Cnt_RNO[4]_net_1\, N_109, N_24, N_111, N_27, N_175, 
        N_115, \Phase1Cnt_RNO[7]_net_1\, \Phase1Cnt_RNO[8]_net_1\, 
        N_117, \Phase2Cnt_RNIS9TB[4]_net_1\, \Phase2Cnt[4]_net_1\, 
        N_123, N_153, N_204, N_154, N_7, N_152, N_9, N_14, 
        \DelayCnt[3]_net_1\, N_124, N_12, \DelayCnt[2]_net_1\, 
        N_120, N_10, \DelayCnt[0]_net_1\, \DelayCnt[1]_net_1\, 
        N_312, \CycCnt[0]_net_1\, \CycCnt[1]_net_1\, N_8, 
        \CycCnt[2]_net_1\, N_104, N_313, \CycCnt[3]_net_1\, N_106, 
        N_314, \CycCnt[4]_net_1\, N_108, N_315, \CycCnt[5]_net_1\, 
        N_110, N_316, \CycCnt[6]_net_1\, N_112, N_317_i_0, 
        \CycCnt[7]_net_1\, N_114, N_318_i_0, N_192, N_118, N_211, 
        \PrState_ns_i_a3_i_0_a3_0[2]\, N_343, \CycCnt[11]_net_1\, 
        CycCnt_n10, N_122, CycCnt_n11, CycCnte, \CycCnt[8]_net_1\, 
        CycCnt_n9, CycCnt_n0, DelayCnt_n0, \DelayCnt[4]_net_1\, 
        N_16, N_135_i, \PrState_RNO[4]_net_1\, 
        \Phase1Cnt_RNO_0[11]_net_1\, N_125, \Phase2Cnt[2]_net_1\, 
        N_119, \Phase2Cnt[3]_net_1\, Phase1Cnt_n11, Phase1Cnt_n10, 
        Phase1Cnt_n9, \PrState_ns[4]\, N_167, N_6, N_163, N_22, 
        Phase2Cnt_n0, Phase1Cnt_n0, \GND\, \VCC\, GND_0, VCC_0
         : std_logic;

begin 

    FifoRowRdOut_0 <= \FifoRowRdOut_0\;

    \PrState[2]\ : DFN1C0
      port map(D => N_7, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[2]_net_1\);
    
    \PrState_RNO[0]\ : AO1B
      port map(A => \PrState_ns_0_0_0_a3_0_0[4]\, B => N_212, C
         => N_167, Y => \PrState_ns[4]\);
    
    \Phase2Cnt_RNI4P47[3]\ : OR3C
      port map(A => \Phase2Cnt[1]_net_1\, B => 
        \Phase2Cnt[2]_net_1\, C => \Phase2Cnt[3]_net_1\, Y => 
        N_123);
    
    \Phase1Cnt[1]\ : DFN1C0
      port map(D => N_276_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \Phase1Cnt[1]_net_1\);
    
    \Phase1Cnt_RNO[4]\ : XA1
      port map(A => N_109, B => \Phase1Cnt[4]_net_1\, C => 
        \PrState[2]_net_1\, Y => \Phase1Cnt_RNO[4]_net_1\);
    
    \Phase1Cnt_RNIN9TB[4]\ : NOR2B
      port map(A => \Phase1Cnt[4]_net_1\, B => N_109, Y => N_111);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \CycCnt_RNI418J[4]\ : NOR2B
      port map(A => N_108, B => \CycCnt[4]_net_1\, Y => N_110);
    
    \Phase2Cnt_RNO_0[2]\ : AOI1
      port map(A => \Phase2Cnt[1]_net_1\, B => 
        \Phase2Cnt[0]_net_1\, C => \Phase2Cnt[2]_net_1\, Y => 
        N_158);
    
    \CycCnt_RNIPJHB[2]\ : NOR2B
      port map(A => N_104, B => \CycCnt[2]_net_1\, Y => N_106);
    
    \DelayCnt_RNIO1D8[4]\ : NOR3B
      port map(A => \DelayCnt[3]_net_1\, B => N_124, C => 
        \DelayCnt[4]_net_1\, Y => N_204);
    
    \Phase2Cnt_RNI1D47[2]\ : NOR3C
      port map(A => \Phase2Cnt[1]_net_1\, B => 
        \Phase2Cnt[2]_net_1\, C => \Phase2Cnt[0]_net_1\, Y => 
        \Phase2Cnt_RNI1D47[2]_net_1\);
    
    DelayCnt_n4_0_i_0_x2 : AX1E
      port map(A => \DelayCnt[3]_net_1\, B => N_124, C => 
        \DelayCnt[4]_net_1\, Y => N_135_i);
    
    \Phase1Cnt[5]\ : DFN1C0
      port map(D => N_24, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[5]_net_1\);
    
    \CycCnt_RNI13G61[9]\ : NOR2A
      port map(A => \CycCnt[9]_net_1\, B => N_118, Y => N_122);
    
    \PrState_RNO[1]\ : AO1C
      port map(A => N_218, B => \PrState_ns_i_a3_i_0_a3_0[2]\, C
         => N_163, Y => N_6);
    
    \CycCnt_RNO_0[10]\ : OR2A
      port map(A => \CycCnt[10]_net_1\, B => N_75, Y => 
        CycCnt_n10_0_0_0_a3_0);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => Phase2Cnt_n0);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_104, C => N_75, Y
         => N_8);
    
    \PrState_RNO_1[2]\ : OR2B
      port map(A => \PrState_ns_i_a3_i_0_a3_0[2]\, B => N_218, Y
         => N_152);
    
    \Phase1Cnt_RNIVKP4[6]\ : NOR2
      port map(A => \Phase1Cnt[6]_net_1\, B => 
        \Phase1Cnt[7]_net_1\, Y => \PrState_ns_i_a3_i_0_a2_3[3]\);
    
    \CycCnt[10]\ : DFN1E1C0
      port map(D => CycCnt_n10, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => CycCnte, Q => \CycCnt[10]_net_1\);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => Phase2Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[0]_net_1\);
    
    \PrState_RNICU17[0]\ : NOR3
      port map(A => \PrState[0]_net_1\, B => \PrState[2]_net_1\, 
        C => \PrState[3]_net_1\, Y => CycCntlde_0_0_a3_0);
    
    \Phase2Cnt[2]\ : DFN1C0
      port map(D => N_18, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[2]_net_1\);
    
    \PrState_RNO[2]\ : OR3C
      port map(A => N_153, B => N_152, C => N_154, Y => N_7);
    
    \Phase1Cnt_RNO[11]\ : XA1A
      port map(A => \Phase1Cnt[11]_net_1\, B => 
        \Phase1Cnt_RNO_0[11]_net_1\, C => \PrState[2]_net_1\, Y
         => Phase1Cnt_n11);
    
    \Phase1Cnt_RNIUC47[2]\ : OR2A
      port map(A => \Phase1Cnt[2]_net_1\, B => N_105, Y => N_107);
    
    \PrState[4]\ : DFN1P0
      port map(D => \PrState_RNO[4]_net_1\, CLK => Sysclk_c, PRE
         => sysrst_n_c, Q => N_75);
    
    \CycCnt_RNO[8]\ : NOR3B
      port map(A => N_192, B => N_118, C => N_75, Y => N_318_i_0);
    
    \Phase2Cnt_RNO[2]\ : NOR3A
      port map(A => \PrState[1]_net_1\, B => 
        \Phase2Cnt_RNI1D47[2]_net_1\, C => N_158, Y => N_18);
    
    \Phase1Cnt[11]\ : DFN1C0
      port map(D => Phase1Cnt_n11, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[11]_net_1\);
    
    \Phase1Cnt_RNO[9]\ : XA1A
      port map(A => \Phase1Cnt[9]_net_1\, B => N_119, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n9);
    
    \Phase1Cnt_RNIOPGC[8]\ : NOR3B
      port map(A => \Phase1Cnt[0]_net_1\, B => 
        \PrState_ns_i_a3_i_0_a2_5[3]\, C => \Phase1Cnt[8]_net_1\, 
        Y => \PrState_ns_i_a3_i_0_a2_8[3]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \Phase1Cnt_RNO[7]\ : XA1
      port map(A => N_115, B => \Phase1Cnt[7]_net_1\, C => 
        \PrState[2]_net_1\, Y => \Phase1Cnt_RNO[7]_net_1\);
    
    \CycCnt_RNIEQCF[3]\ : NOR2B
      port map(A => N_106, B => \CycCnt[3]_net_1\, Y => N_108);
    
    DelayCnt_n2_0_i_0_o2 : NOR2B
      port map(A => N_120, B => \DelayCnt[2]_net_1\, Y => N_124);
    
    DelayCnt_n2_0_i_0 : XA1
      port map(A => \DelayCnt[2]_net_1\, B => N_120, C => 
        \PrState[3]_net_1\, Y => N_12);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    \PrState_RNI4444[1]\ : OR2B
      port map(A => SDramEn_c, B => \PrState[1]_net_1\, Y => 
        N_211);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => Phase1Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[0]_net_1\);
    
    \CycCnt_RNO[7]\ : XA1C
      port map(A => \CycCnt[7]_net_1\, B => N_114, C => N_75, Y
         => N_317_i_0);
    
    \Phase1Cnt[2]\ : DFN1C0
      port map(D => N_277_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \Phase1Cnt[2]_net_1\);
    
    \Phase1Cnt_RNIQPI9[4]\ : NOR3A
      port map(A => \PrState_ns_i_a3_i_0_a2_3[3]\, B => 
        \Phase1Cnt[5]_net_1\, C => \Phase1Cnt[4]_net_1\, Y => 
        \PrState_ns_i_a3_i_0_a2_7[3]\);
    
    \Phase1Cnt_RNILJGL[8]\ : OR2B
      port map(A => \Phase1Cnt[8]_net_1\, B => N_117, Y => N_119);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_108, C => N_75, Y
         => N_314);
    
    \CycCnt_RNO_0[8]\ : AO1A
      port map(A => N_114, B => \CycCnt[7]_net_1\, C => 
        \CycCnt[8]_net_1\, Y => N_192);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_10, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \Phase2Cnt[3]\ : DFN1C0
      port map(D => N_20, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[3]_net_1\);
    
    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => FifoRowRdOut);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \Phase1Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => Phase1Cnt_n0);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_316, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \Phase1Cnt_RNI01J21[4]\ : OR3C
      port map(A => \PrState_ns_i_a3_i_0_a2_7[3]\, B => 
        \PrState_ns_i_a3_i_0_a2_6[3]\, C => 
        \PrState_ns_i_a3_i_0_a2_8[3]\, Y => N_218);
    
    \Phase1Cnt_RNIKMMG[6]\ : NOR3C
      port map(A => N_111, B => \Phase1Cnt[5]_net_1\, C => 
        \Phase1Cnt[6]_net_1\, Y => N_115);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_12, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \Phase1Cnt[3]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO[3]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[3]_net_1\);
    
    \PrState[1]\ : DFN1C0
      port map(D => N_6, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[1]_net_1\);
    
    \Phase1Cnt[7]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO[7]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[7]_net_1\);
    
    \Phase1Cnt_RNO[2]\ : XA1A
      port map(A => N_105, B => \Phase1Cnt[2]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_277_i_0);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_313, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \PrState_RNO_0[0]\ : OR2B
      port map(A => SDramEn_c, B => \PrState[0]_net_1\, Y => 
        N_167);
    
    \PrState_RNO_0[4]\ : OR3
      port map(A => \PrState[0]_net_1\, B => \PrState[2]_net_1\, 
        C => \PrState[1]_net_1\, Y => \PrState_ns_i_0_0_a3_0[0]\);
    
    \Phase1Cnt_RNIJ4O4[1]\ : OR2B
      port map(A => \Phase1Cnt[1]_net_1\, B => 
        \Phase1Cnt[0]_net_1\, Y => N_105);
    
    \CycCnt_RNIR73N[5]\ : NOR2B
      port map(A => N_110, B => \CycCnt[5]_net_1\, Y => N_112);
    
    \PrState_RNO_0[1]\ : OR2
      port map(A => \Phase2Cnt_RNIS9TB[4]_net_1\, B => N_211, Y
         => N_163);
    
    \Phase1Cnt[6]\ : DFN1C0
      port map(D => N_27, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[6]_net_1\);
    
    DelayCnt_n4_0_i_0 : NOR2A
      port map(A => \PrState[3]_net_1\, B => N_135_i, Y => N_16);
    
    \Phase1Cnt_RNIUON7[9]\ : NOR2
      port map(A => \Phase1Cnt[9]_net_1\, B => 
        \Phase1Cnt[10]_net_1\, Y => \PrState_ns_i_a3_i_0_a2_5[3]\);
    
    WFO_0_RNIRVM7 : INV
      port map(A => \FifoRowRdOut_0\, Y => FifoRowRdOut_i);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[0]_net_1\);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_318_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt_RNO_1[10]\ : NOR3A
      port map(A => \CycCnt[9]_net_1\, B => N_75, C => 
        \CycCnt[10]_net_1\, Y => CycCnt_n10_0_0_0_a3_0_0);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_9, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    \Phase1Cnt_RNIAPG9[3]\ : NOR2A
      port map(A => \Phase1Cnt[3]_net_1\, B => N_107, Y => N_109);
    
    \PrState[0]\ : DFN1C0
      port map(D => \PrState_ns[4]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[0]_net_1\);
    
    \Phase2Cnt_RNO[3]\ : NOR3A
      port map(A => \PrState[1]_net_1\, B => 
        \Phase2Cnt_RNIEPG9[0]_net_1\, C => N_159, Y => N_20);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => N_14, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[3]_net_1\);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => N_75, Y => N_312);
    
    \Phase1Cnt[8]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO[8]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[8]_net_1\);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    \PrState_RNO_0[2]\ : OR3C
      port map(A => \PrState[3]_net_1\, B => SDramEn_c, C => 
        N_204, Y => N_153);
    
    \Phase1Cnt_RNO_0[6]\ : AOI1
      port map(A => \Phase1Cnt[5]_net_1\, B => N_111, C => 
        \Phase1Cnt[6]_net_1\, Y => N_175);
    
    \PrState_RNO_3[2]\ : OA1A
      port map(A => N_212, B => \PrState[2]_net_1\, C => 
        \PrState_ns_0_0_0_a3_0_0[4]\, Y => 
        \PrState_ns_i_a3_i_0_a3_1_0[2]\);
    
    \Phase1Cnt_RNO_0[11]\ : OR2A
      port map(A => \Phase1Cnt[10]_net_1\, B => N_125, Y => 
        \Phase1Cnt_RNO_0[11]_net_1\);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_314, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \Phase1Cnt_RNO[10]\ : XA1A
      port map(A => \Phase1Cnt[10]_net_1\, B => N_125, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n10);
    
    DelayCnt_n1_0_i_0 : XA1
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[3]_net_1\, Y => N_10);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_110, C => N_75, Y
         => N_315);
    
    \PrState_RNO_2[2]\ : AO1C
      port map(A => N_218, B => N_212, C => 
        \PrState_ns_i_a3_i_0_a3_1_0[2]\, Y => N_154);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[1]_net_1\, C => \PrState[1]_net_1\, Y => N_13);
    
    \Phase2Cnt_RNO_0[3]\ : NOR2
      port map(A => \Phase2Cnt[3]_net_1\, B => 
        \Phase2Cnt_RNI1D47[2]_net_1\, Y => N_159);
    
    \PrState_RNO[3]\ : OA1C
      port map(A => N_204, B => N_75, C => 
        \PrState_ns_0_i_0_0[1]\, Y => N_9);
    
    \Phase1Cnt_RNIEDFC[11]\ : NOR3C
      port map(A => \Phase1Cnt[11]_net_1\, B => 
        \Phase1Cnt[3]_net_1\, C => \PrState_ns_i_a3_i_0_a2_1[3]\, 
        Y => \PrState_ns_i_a3_i_0_a2_6[3]\);
    
    \Phase1Cnt_RNI7OTN[9]\ : OR2A
      port map(A => \Phase1Cnt[9]_net_1\, B => N_119, Y => N_125);
    
    \PrState_RNI5844[2]\ : NOR2B
      port map(A => SDramEn_c, B => \PrState[2]_net_1\, Y => 
        \PrState_ns_i_a3_i_0_a3_0[2]\);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => N_75, B => \CycCnt[0]_net_1\, Y => CycCnt_n0);
    
    \CycCnt_RNI5DM7[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => \CycCnt[0]_net_1\, Y
         => N_104);
    
    \Phase2Cnt_RNIS9TB[4]\ : NOR3
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[4]_net_1\, C => N_123, Y => 
        \Phase2Cnt_RNIS9TB[4]_net_1\);
    
    \PrState_RNI0E1G[1]\ : NOR2A
      port map(A => \Phase2Cnt_RNIS9TB[4]_net_1\, B => N_211, Y
         => \PrState_ns_0_0_0_a3_0_0[4]\);
    
    \PrState_RNIPRAL[4]\ : AO1
      port map(A => CycCntlde_0_0_a3_0, B => 
        \Phase2Cnt_RNIS9TB[4]_net_1\, C => N_75, Y => CycCnte);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_317_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \Phase2Cnt_RNO[4]\ : XA1
      port map(A => \Phase2Cnt_RNIEPG9[0]_net_1\, B => 
        \Phase2Cnt[4]_net_1\, C => \PrState[1]_net_1\, Y => N_22);
    
    \Phase1Cnt_RNO[5]\ : XA1
      port map(A => N_111, B => \Phase1Cnt[5]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_24);
    
    \Phase1Cnt_RNI4J3J[7]\ : NOR2B
      port map(A => \Phase1Cnt[7]_net_1\, B => N_115, Y => N_117);
    
    \Phase2Cnt[4]\ : DFN1C0
      port map(D => N_22, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[4]_net_1\);
    
    \CycCnt_RNI6SK21[8]\ : OR3B
      port map(A => \CycCnt[7]_net_1\, B => \CycCnt[8]_net_1\, C
         => N_114, Y => N_118);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_312, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \CycCnt_RNO[10]\ : MX2A
      port map(A => CycCnt_n10_0_0_0_a3_0, B => 
        CycCnt_n10_0_0_0_a3_0_0, S => N_122, Y => CycCnt_n10);
    
    \CycCnt[11]\ : DFN1E1C0
      port map(D => CycCnt_n11, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => CycCnte, Q => \CycCnt[11]_net_1\);
    
    \Phase1Cnt[10]\ : DFN1C0
      port map(D => Phase1Cnt_n10, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[10]_net_1\);
    
    \Phase1Cnt_RNO[8]\ : XA1
      port map(A => N_117, B => \Phase1Cnt[8]_net_1\, C => 
        \PrState[2]_net_1\, Y => \Phase1Cnt_RNO[8]_net_1\);
    
    \CycCnt_RNI43MD1[10]\ : OR2B
      port map(A => N_122, B => \CycCnt[10]_net_1\, Y => N_343);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_118, C => N_75, Y
         => CycCnt_n9);
    
    \CycCnt_RNIJEUQ[6]\ : OR2B
      port map(A => N_112, B => \CycCnt[6]_net_1\, Y => N_114);
    
    \Phase1Cnt_RNO[3]\ : XA1A
      port map(A => N_107, B => \Phase1Cnt[3]_net_1\, C => 
        \PrState[2]_net_1\, Y => \Phase1Cnt_RNO[3]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_106, C => N_75, Y
         => N_313);
    
    \DelayCnt[4]\ : DFN1C0
      port map(D => N_16, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[4]_net_1\);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_13, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \CycCnt_RNO[11]\ : XA1C
      port map(A => \CycCnt[11]_net_1\, B => N_343, C => N_75, Y
         => CycCnt_n11);
    
    \Phase1Cnt_RNILCO4[1]\ : NOR2
      port map(A => \Phase1Cnt[1]_net_1\, B => 
        \Phase1Cnt[2]_net_1\, Y => \PrState_ns_i_a3_i_0_a2_1[3]\);
    
    WFO_0 : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \FifoRowRdOut_0\);
    
    \CycCnt_RNI87SK1[11]\ : NOR2
      port map(A => N_343, B => \CycCnt[11]_net_1\, Y => N_212);
    
    \PrState_RNI13N4[3]\ : OR2
      port map(A => \PrState[3]_net_1\, B => N_75, Y => N_213);
    
    \Phase1Cnt_RNO[6]\ : NOR3A
      port map(A => \PrState[2]_net_1\, B => N_175, C => N_115, Y
         => N_27);
    
    \CycCnt_RNO[6]\ : XA1B
      port map(A => \CycCnt[6]_net_1\, B => N_112, C => N_75, Y
         => N_316);
    
    \Phase1Cnt[4]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO[4]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \Phase1Cnt[4]_net_1\);
    
    \PrState_RNO[4]\ : OA1B
      port map(A => N_213, B => \PrState_ns_i_0_0_a3_0[0]\, C => 
        SDramEn_c, Y => \PrState_RNO[4]_net_1\);
    
    \Phase1Cnt[9]\ : DFN1C0
      port map(D => Phase1Cnt_n9, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[9]_net_1\);
    
    \PrState_RNO_0[3]\ : OR2B
      port map(A => SDramEn_c, B => N_213, Y => 
        \PrState_ns_0_i_0_0[1]\);
    
    DelayCnt_n3_0_i_0 : XA1
      port map(A => \DelayCnt[3]_net_1\, B => N_124, C => 
        \PrState[3]_net_1\, Y => N_14);
    
    DelayCnt_n0_0_0_a3_0_a3 : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    
    \Phase1Cnt_RNO[1]\ : XA1
      port map(A => \Phase1Cnt[0]_net_1\, B => 
        \Phase1Cnt[1]_net_1\, C => \PrState[2]_net_1\, Y => 
        N_276_i_0);
    
    DelayCnt_n1_0_i_0_o2 : NOR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_120);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_315, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_8, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \Phase2Cnt_RNIEPG9[0]\ : NOR2A
      port map(A => \Phase2Cnt[0]_net_1\, B => N_123, Y => 
        \Phase2Cnt_RNIEPG9[0]_net_1\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ8 is

    port( PrState_3      : in    std_logic;
          PrState_0      : in    std_logic_vector(4 to 4);
          interFifo_rd   : out   std_logic;
          sysrst_n_c     : in    std_logic;
          Sysclk_c       : in    std_logic;
          FifoRowRdOut   : in    std_logic;
          FifoRowRdOut_0 : in    std_logic
        );

end WaveGenSingleZ8;

architecture DEF_ARCH of WaveGenSingleZ8 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR2B
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

  component OR2A
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

  component OR2B
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

  component OR3A
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component XA1B
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

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
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

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OA1A
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

  component AO1D
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

    signal \PrState_ns_i_0_1[2]\, N_83, N_84, 
        \PrState_ns_i_0_a5_0[2]\, \PrState[3]_net_1\, 
        \PrState[2]_net_1\, N_141_i_0, \PrState_RNO_1[2]_net_1\, 
        N_143_i_0, \PrState_RNO_0[1]_net_1\, 
        \PrState_RNO_1[1]_net_1\, \Phase1Cnt_i[0]\, 
        \PrState[1]_net_1\, N_32_i_0, N_80, N_60, N_30_i_0, 
        \CycCnt[7]_net_1\, N_58, N_28, \CycCnt[6]_net_1\, N_57, 
        N_26, \CycCnt[5]_net_1\, N_39, N_24, \CycCnt[4]_net_1\, 
        N_37, N_22, \CycCnt[3]_net_1\, N_36, N_20, 
        \CycCnt[2]_net_1\, N_186, N_18, CycCnt_c0, 
        \CycCnt[1]_net_1\, CycCnt_n0, \CycCnt[8]_net_1\, 
        CycCnt_n9, \CycCnt[9]_net_1\, N_61, 
        \DelayCnt_RNI4KP3[0]_net_1\, \DelayCnt[0]_net_1\, N_62, 
        \Phase2Cnt[1]_net_1\, N_184_i, CycCnte, N_139_i_0, N_8, 
        N_6, N_4, \GND\, \VCC\, GND_0, VCC_0 : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => interFifo_rd);
    
    \PrState[2]\ : DFN1C0
      port map(D => N_141_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \PrState[2]_net_1\);
    
    \CycCnt_RNISBN4[2]\ : NOR2B
      port map(A => N_186, B => \CycCnt[2]_net_1\, Y => N_36);
    
    \PrState_RNO_3[2]\ : OR2
      port map(A => \PrState[2]_net_1\, B => 
        \DelayCnt_RNI4KP3[0]_net_1\, Y => N_83);
    
    \Phase2Cnt_RNIFU17[1]\ : OR2A
      port map(A => N_61, B => PrState_3, Y => CycCnte);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \Phase1Cnt_RNI0VL2[0]\ : OR2B
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt_i[0]\, Y
         => N_62);
    
    \CycCnt_RNO[7]\ : XA1C
      port map(A => \CycCnt[7]_net_1\, B => N_58, C => 
        PrState_0(4), Y => N_30_i_0);
    
    \PrState_RNO_4[2]\ : OR3A
      port map(A => \Phase1Cnt_i[0]\, B => \PrState[3]_net_1\, C
         => \PrState[1]_net_1\, Y => N_84);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => N_184_i, B => \Phase2Cnt[1]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_6);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_32_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_26, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_37, C => 
        PrState_0(4), Y => N_24);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => CycCnt_c0);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_60, C => PrState_3, 
        Y => CycCnt_n9);
    
    \PrState[1]\ : DFN1C0
      port map(D => N_143_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \PrState[1]_net_1\);
    
    \CycCnt_RNO[6]\ : XA1B
      port map(A => \CycCnt[6]_net_1\, B => N_57, C => 
        PrState_0(4), Y => N_28);
    
    \CycCnt_RNO_0[8]\ : AO1A
      port map(A => N_58, B => \CycCnt[7]_net_1\, C => 
        \CycCnt[8]_net_1\, Y => N_80);
    
    \PrState_RNO_0[2]\ : NOR2
      port map(A => \PrState[3]_net_1\, B => \PrState[2]_net_1\, 
        Y => \PrState_ns_i_0_a5_0[2]\);
    
    \CycCnt_RNI7P43[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => CycCnt_c0, Y => N_186);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_20, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_36, C => 
        PrState_0(4), Y => N_22);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_186, C => 
        PrState_0(4), Y => N_20);
    
    \CycCnt_RNI1SF9[5]\ : NOR2B
      port map(A => N_39, B => \CycCnt[5]_net_1\, Y => N_57);
    
    \PrState_RNO[2]\ : AOI1B
      port map(A => \PrState_ns_i_0_a5_0[2]\, B => 
        \PrState_RNO_1[2]_net_1\, C => \PrState_ns_i_0_1[2]\, Y
         => N_141_i_0);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => PrState_3, B => CycCnt_c0, Y => CycCnt_n0);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_28, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \PrState_RNO_0[1]\ : OR3A
      port map(A => \Phase2Cnt[1]_net_1\, B => N_184_i, C => 
        \PrState[2]_net_1\, Y => \PrState_RNO_0[1]_net_1\);
    
    \Phase1Cnt[0]\ : DFN1P0
      port map(D => N_62, CLK => Sysclk_c, PRE => sysrst_n_c, Q
         => \Phase1Cnt_i[0]\);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_22, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => N_184_i, Y => N_4);
    
    \PrState_RNO[1]\ : NOR3C
      port map(A => FifoRowRdOut_0, B => \PrState_RNO_0[1]_net_1\, 
        C => \PrState_RNO_1[1]_net_1\, Y => N_143_i_0);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => CycCnt_c0, B => \CycCnt[1]_net_1\, C => 
        PrState_0(4), Y => N_18);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_18, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_6, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => N_8, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[0]_net_1\);
    
    \DelayCnt_0_0_a2_i[0]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_8);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_24, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \PrState_RNO[3]\ : OA1A
      port map(A => \DelayCnt_RNI4KP3[0]_net_1\, B => PrState_3, 
        C => FifoRowRdOut, Y => N_139_i_0);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_30_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_139_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \PrState[3]_net_1\);
    
    \CycCnt_RNIFG9E[8]\ : OR3B
      port map(A => \CycCnt[7]_net_1\, B => \CycCnt[8]_net_1\, C
         => N_58, Y => N_60);
    
    \PrState_RNO_1[2]\ : AO1D
      port map(A => N_60, B => \CycCnt[9]_net_1\, C => N_61, Y
         => \PrState_RNO_1[2]_net_1\);
    
    \Phase2Cnt_RNIIVP3[1]\ : OR3B
      port map(A => \Phase2Cnt[1]_net_1\, B => \PrState[1]_net_1\, 
        C => N_184_i, Y => N_61);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_39, C => 
        PrState_0(4), Y => N_26);
    
    \CycCnt_RNI9TS7[4]\ : NOR2B
      port map(A => N_37, B => \CycCnt[4]_net_1\, Y => N_39);
    
    \CycCnt_RNO[8]\ : NOR3B
      port map(A => N_80, B => N_60, C => PrState_0(4), Y => 
        N_32_i_0);
    
    \PrState_RNO_2[2]\ : NOR3C
      port map(A => FifoRowRdOut_0, B => N_83, C => N_84, Y => 
        \PrState_ns_i_0_1[2]\);
    
    \PrState_RNO_1[1]\ : OR2A
      port map(A => N_62, B => \PrState[1]_net_1\, Y => 
        \PrState_RNO_1[1]_net_1\);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => N_4, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => N_184_i);
    
    \CycCnt_RNII2A6[3]\ : NOR2B
      port map(A => N_36, B => \CycCnt[3]_net_1\, Y => N_37);
    
    \DelayCnt_RNI4KP3[0]\ : OR2B
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => \DelayCnt_RNI4KP3[0]_net_1\);
    
    \CycCnt_RNIQU2B[6]\ : OR2B
      port map(A => N_57, B => \CycCnt[6]_net_1\, Y => N_58);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ1 is

    port( sysrst_n_c         : in    std_logic;
          Sysclk_c           : in    std_logic;
          LVDS_en_c          : in    std_logic;
          lvdsFifoRowRdOut   : in    std_logic;
          LVDS_data_0_sqmuxa : out   std_logic
        );

end WaveGenSingleZ1;

architecture DEF_ARCH of WaveGenSingleZ1 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3
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

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XA1C
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

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component XA1
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

  component XA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component AOI1B
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

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component CLKINT
    port( A : in    std_logic := 'U';
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

  component NOR3B
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

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \WFO_RNITNRC\, \PrState_ns_0_0_a2_0[2]\, N_77, N_67, 
        \PrState_ns_0_0_a2_0_0[4]\, \PrState_ns_0_i_0[1]\, N_149, 
        CycCntlde_0_a2_0_0, \PrState[0]_net_1\, 
        \PrState[2]_net_1\, \PrState[3]_net_1\, 
        \PrState_ns_0_0_a2_0_3[2]\, DelayCnt_n0, 
        \PrState_ns_0_0_a2_0_1[2]\, \DelayCnt[2]_net_1\, 
        \DelayCnt[3]_net_1\, \PrState_ns_0_i_a2_0[1]\, 
        \DelayCnt[4]_net_1\, \DelayCnt[1]_net_1\, 
        \PrState_ns_0_0_a2_0[3]\, \PrState[1]_net_1\, 
        \PrState_ns_i_0_a2_0[0]\, \PrState_ns_0_i_a2_3[1]\, 
        \DelayCnt[0]_net_1\, \PrState[4]_net_1\, 
        \PrState_ns_0_i_a2_2[1]\, N_31, \Phase2Cnt[0]_net_1\, 
        \Phase2Cnt[1]_net_1\, N_33, N_116, N_117, N_35, N_37, 
        N_69, N_39, N_72, N_7, N_92, \CycCnt[9]_net_1\, N_74, 
        N_186_i, N_27_i_0, N_112, N_25_i_0, \CycCnt[7]_net_1\, 
        N_68, N_23, \CycCnt[6]_net_1\, N_49, N_21, 
        \CycCnt[5]_net_1\, N_47, N_19, \CycCnt[4]_net_1\, N_46, 
        N_17, \CycCnt[3]_net_1\, N_177, N_15, \CycCnt[2]_net_1\, 
        N_44, N_13, \CycCnt[0]_net_1\, \CycCnt[1]_net_1\, 
        CycCnt_n0, \CycCnt[8]_net_1\, CycCnt_n9, CycCnte, N_73, 
        Data2frameEn, N_78_i, \Phase2Cnt[2]_net_1\, 
        \Phase1Cnt[0]_net_1\, N_41, \PrState_ns[4]\, 
        \PrState_ns[3]\, N_90, \PrState_ns[2]\, N_129, 
        \PrState_RNO_4[4]\, NxState_0_sqmuxa, Phase2Cnt_n0, \GND\, 
        \VCC\, GND_0, VCC_0 : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => Data2frameEn);
    
    \PrState_RNICMK2[0]\ : NOR3
      port map(A => \PrState[0]_net_1\, B => \PrState[2]_net_1\, 
        C => \PrState[3]_net_1\, Y => CycCntlde_0_a2_0_0);
    
    \Phase1Cnt_RNIIR78_0[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => NxState_0_sqmuxa);
    
    \PrState[2]\ : DFN1C0
      port map(D => \PrState_ns[2]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[2]_net_1\);
    
    \PrState_RNO_3[2]\ : NOR2
      port map(A => \DelayCnt[2]_net_1\, B => \DelayCnt[3]_net_1\, 
        Y => \PrState_ns_0_0_a2_0_1[2]\);
    
    \DelayCnt_RNIQAJ2[0]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    
    \CycCnt_RNIUOV21[8]\ : OR3B
      port map(A => \CycCnt[7]_net_1\, B => \CycCnt[8]_net_1\, C
         => N_68, Y => N_74);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \CycCnt_RNO[7]\ : XA1C
      port map(A => \CycCnt[7]_net_1\, B => N_68, C => 
        \PrState[4]_net_1\, Y => N_25_i_0);
    
    \PrState_RNO_0[0]\ : OR3A
      port map(A => \PrState_ns_0_0_a2_0_0[4]\, B => 
        \CycCnt[9]_net_1\, C => N_74, Y => N_92);
    
    \CycCnt_RNIEDGF[3]\ : NOR2B
      port map(A => N_177, B => \CycCnt[3]_net_1\, Y => N_46);
    
    \Phase2Cnt_RNO[2]\ : NOR3A
      port map(A => \PrState[1]_net_1\, B => N_116, C => N_117, Y
         => N_33);
    
    \PrState_RNO_4[2]\ : NOR2B
      port map(A => DelayCnt_n0, B => lvdsFifoRowRdOut, Y => 
        \PrState_ns_0_0_a2_0_3[2]\);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[1]_net_1\, C => \PrState[1]_net_1\, Y => N_31);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_27_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_21, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_46, C => 
        \PrState[4]_net_1\, Y => N_19);
    
    \Phase2Cnt_RNITQ7M[2]\ : OR3B
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[2]_net_1\, C => \Phase2Cnt[1]_net_1\, Y => 
        N_73);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[0]_net_1\);
    
    \CycCnt_RNISQCJ[4]\ : NOR2B
      port map(A => N_46, B => \CycCnt[4]_net_1\, Y => N_47);
    
    \PrState_RNO_1[3]\ : NOR2A
      port map(A => \PrState_ns_0_i_a2_0[1]\, B => 
        \DelayCnt[3]_net_1\, Y => \PrState_ns_0_i_a2_2[1]\);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_74, C => 
        \PrState[4]_net_1\, Y => CycCnt_n9);
    
    \PrState_RNIB24N[1]\ : OR2A
      port map(A => \PrState[1]_net_1\, B => N_73, Y => N_77);
    
    \PrState[1]\ : DFN1C0
      port map(D => \PrState_ns[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[1]_net_1\);
    
    \CycCnt_RNILUN7[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => \CycCnt[0]_net_1\, Y
         => N_44);
    
    \CycCnt_RNIBC9N[5]\ : NOR2B
      port map(A => N_47, B => \CycCnt[5]_net_1\, Y => N_49);
    
    \CycCnt_RNO[6]\ : XA1B
      port map(A => \CycCnt[6]_net_1\, B => N_49, C => 
        \PrState[4]_net_1\, Y => N_23);
    
    \CycCnt_RNO_0[8]\ : AO1A
      port map(A => N_68, B => \CycCnt[7]_net_1\, C => 
        \CycCnt[8]_net_1\, Y => N_112);
    
    \PrState_RNO_0[2]\ : AOI1B
      port map(A => N_77, B => N_67, C => lvdsFifoRowRdOut, Y => 
        \PrState_ns_0_0_a2_0[2]\);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_15, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_177, C => 
        \PrState[4]_net_1\, Y => N_17);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_44, C => 
        \PrState[4]_net_1\, Y => N_15);
    
    \PrState_RNO[2]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_0[2]\, B => N_129, C => 
        N_186_i, Y => \PrState_ns[2]\);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => \PrState[4]_net_1\, B => \CycCnt[0]_net_1\, Y
         => CycCnt_n0);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_37, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \PrState_RNO_2[3]\ : OR2A
      port map(A => lvdsFifoRowRdOut, B => N_149, Y => 
        \PrState_ns_0_i_0[1]\);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_23, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \PrState_RNO_0[1]\ : NOR2B
      port map(A => \PrState[1]_net_1\, B => lvdsFifoRowRdOut, Y
         => \PrState_ns_0_0_a2_0[3]\);
    
    \Phase2Cnt[2]\ : DFN1C0
      port map(D => N_33, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[2]_net_1\);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => NxState_0_sqmuxa, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[0]_net_1\);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_35, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \PrState_RNO_0[3]\ : NOR3
      port map(A => \DelayCnt[2]_net_1\, B => \DelayCnt[0]_net_1\, 
        C => \PrState[4]_net_1\, Y => \PrState_ns_0_i_a2_3[1]\);
    
    DelayCnt_n2_0_i : XA1
      port map(A => \DelayCnt[2]_net_1\, B => N_69, C => 
        \PrState[3]_net_1\, Y => N_37);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_17, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => Phase2Cnt_n0);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => N_39, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[3]_net_1\);
    
    \PrState_RNO[1]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_0[3]\, B => N_73, C => 
        N_90, Y => \PrState_ns[3]\);
    
    \PrState[4]\ : DFN1P0
      port map(D => \PrState_RNO_4[4]\, CLK => Sysclk_c, PRE => 
        sysrst_n_c, Q => \PrState[4]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CycCnt_RNIR16R[6]\ : OR2B
      port map(A => N_49, B => \CycCnt[6]_net_1\, Y => N_68);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => \PrState[4]_net_1\, Y => N_13);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_13, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \Phase1Cnt_RNIIR78[0]\ : OR2B
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => N_67);
    
    \CycCnt_RNI14KB[2]\ : NOR2B
      port map(A => N_44, B => \CycCnt[2]_net_1\, Y => N_177);
    
    \DelayCnt[4]\ : DFN1C0
      port map(D => N_41, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[4]_net_1\);
    
    \PrState_RNI1FO1[3]\ : NOR2
      port map(A => \PrState[4]_net_1\, B => \PrState[3]_net_1\, 
        Y => N_149);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_31, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \PrState[0]\ : DFN1C0
      port map(D => \PrState_ns[4]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[0]_net_1\);
    
    \PrState_RNIQOOP[4]\ : AO1A
      port map(A => N_73, B => CycCntlde_0_a2_0_0, C => 
        \PrState[4]_net_1\, Y => CycCnte);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_19, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \PrState_RNO[3]\ : AOI1
      port map(A => \PrState_ns_0_i_a2_3[1]\, B => 
        \PrState_ns_0_i_a2_2[1]\, C => \PrState_ns_0_i_0[1]\, Y
         => N_7);
    
    \Phase2Cnt_RNO_0[2]\ : AOI1
      port map(A => \Phase2Cnt[1]_net_1\, B => 
        \Phase2Cnt[0]_net_1\, C => \Phase2Cnt[2]_net_1\, Y => 
        N_116);
    
    DelayCnt_n1_0_i_o2 : NOR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_69);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_25_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_7, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    DelayCnt_n1_0_i : XA1
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[3]_net_1\, Y => N_35);
    
    WFO_RNITNRC_0 : CLKINT
      port map(A => \WFO_RNITNRC\, Y => LVDS_data_0_sqmuxa);
    
    \PrState_RNO_1[2]\ : OR3A
      port map(A => N_67, B => \CycCnt[9]_net_1\, C => N_74, Y
         => N_129);
    
    \PrState_RNO[0]\ : AO1B
      port map(A => lvdsFifoRowRdOut, B => \PrState[0]_net_1\, C
         => N_92, Y => \PrState_ns[4]\);
    
    \Phase2Cnt_RNO_1[2]\ : NOR3C
      port map(A => \Phase2Cnt[0]_net_1\, B => 
        \Phase2Cnt[2]_net_1\, C => \Phase2Cnt[1]_net_1\, Y => 
        N_117);
    
    \DelayCnt_RNIPQE3[4]\ : NOR2B
      port map(A => \DelayCnt[4]_net_1\, B => \DelayCnt[1]_net_1\, 
        Y => \PrState_ns_0_i_a2_0[1]\);
    
    \PrState_RNO_0[4]\ : NOR3
      port map(A => \PrState[0]_net_1\, B => \PrState[2]_net_1\, 
        C => \PrState[1]_net_1\, Y => \PrState_ns_i_0_a2_0[0]\);
    
    DelayCnt_n2_0_i_o2 : NOR2B
      port map(A => N_69, B => \DelayCnt[2]_net_1\, Y => N_72);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_47, C => 
        \PrState[4]_net_1\, Y => N_21);
    
    WFO_RNITNRC : NOR2B
      port map(A => LVDS_en_c, B => Data2frameEn, Y => 
        \WFO_RNITNRC\);
    
    \CycCnt_RNO[8]\ : NOR3B
      port map(A => N_112, B => N_74, C => \PrState[4]_net_1\, Y
         => N_27_i_0);
    
    DelayCnt_n4_0_i_x2 : AX1E
      port map(A => \DelayCnt[3]_net_1\, B => N_72, C => 
        \DelayCnt[4]_net_1\, Y => N_78_i);
    
    \PrState_RNO_2[2]\ : OR3C
      port map(A => \PrState_ns_0_0_a2_0_1[2]\, B => 
        \PrState_ns_0_i_a2_0[1]\, C => \PrState_ns_0_0_a2_0_3[2]\, 
        Y => N_186_i);
    
    \PrState_RNO_1[1]\ : OR2B
      port map(A => lvdsFifoRowRdOut, B => NxState_0_sqmuxa, Y
         => N_90);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => Phase2Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase2Cnt[0]_net_1\);
    
    DelayCnt_n4_0_i : NOR2A
      port map(A => \PrState[3]_net_1\, B => N_78_i, Y => N_41);
    
    \PrState_RNO[4]\ : AOI1
      port map(A => \PrState_ns_i_0_a2_0[0]\, B => N_149, C => 
        lvdsFifoRowRdOut, Y => \PrState_RNO_4[4]\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    \PrState_RNO_1[0]\ : NOR2A
      port map(A => lvdsFifoRowRdOut, B => N_77, Y => 
        \PrState_ns_0_0_a2_0_0[4]\);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    DelayCnt_n3_0_i : XA1
      port map(A => \DelayCnt[3]_net_1\, B => N_72, C => 
        \PrState[3]_net_1\, Y => N_39);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ0 is

    port( lvdsFifoRowRdOut_i : in    std_logic;
          ByteRdEn_c         : out   std_logic;
          sysrst_n_c         : in    std_logic;
          Sysclk_c           : in    std_logic;
          lvdsFifoRowRdOut   : in    std_logic
        );

end WaveGenSingleZ0;

architecture DEF_ARCH of WaveGenSingleZ0 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3C
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

  component OA1C
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

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component XA1A
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

  component NOR3A
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

  component XA1B
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

  component NOR3B
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

  component AOI1
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

  component OA1
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

  component AOI1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \PrState_ns_0_0_0[2]\, \PrState_ns_0_0_a2_1_3[2]\, 
        N_50, N_67, \PrState_ns_0_0_a2_0[2]\, \PrState[2]_net_1\, 
        \PrState_ns_0_0_a2_0_1[3]\, N_111_1, 
        \PrState_ns_0_i_0[1]\, \PrState[3]_net_1\, 
        \PrState[4]_net_1\, \PrState_ns_0_0_a2_1_1[2]\, 
        \PrState_ns_0_0_a2_1_0[2]\, \DelayCnt[3]_net_1\, 
        \DelayCnt[4]_net_1\, \DelayCnt[2]_net_1\, 
        \PrState_ns_0_i_a2_0_2[1]\, \PrState_ns_0_i_a2_0_1[1]\, 
        \CycCnt_5_i_o2_0[0]\, \PrState[0]_net_1\, 
        \Phase2Cnt[0]_net_1\, N_17, \DelayCnt[0]_net_1\, 
        \DelayCnt[1]_net_1\, N_19, N_21, N_51, N_26_i_0, 
        \Phase1Cnt[0]_net_1\, \Phase1Cnt[1]_net_1\, N_28_i_0, 
        N_44, \Phase1Cnt[4]_net_1\, N_30, N_45, 
        \Phase1Cnt[5]_net_1\, N_58, \PrState_ns[2]\, N_111, N_10, 
        N_53, \CycCnt[0]_net_1\, N_69, \PrState[1]_net_1\, N_36, 
        N_48, \Phase1Cnt[8]_net_1\, N_34, N_47, 
        \Phase1Cnt[7]_net_1\, N_32, N_181, \Phase1Cnt[6]_net_1\, 
        \PrState_ns[3]\, N_117, Phase1Cnt_n11, 
        \Phase1Cnt[11]_net_1\, N_55, N_49, \Phase1Cnt[10]_net_1\, 
        N_52, \Phase1Cnt_RNIVSCL[2]_net_1\, \Phase1Cnt[2]_net_1\, 
        N_42, N_7, \Phase1Cnt[3]_net_1\, \Phase1Cnt_RNO_0[2]\, 
        N_61, N_54, \Phase1Cnt[9]_net_1\, Phase1Cnt_n10, N_23, 
        N_14, N_6, Phase1Cnt_n9, Phase1Cnt_n0, DelayCnt_n0, \GND\, 
        \VCC\, GND_0, VCC_0 : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => ByteRdEn_c);
    
    \PrState[2]\ : DFN1C0
      port map(D => \PrState_ns[2]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[2]_net_1\);
    
    \PrState_RNO_3[2]\ : NOR3C
      port map(A => \PrState_ns_0_0_a2_1_1[2]\, B => 
        \PrState_ns_0_0_a2_1_0[2]\, C => lvdsFifoRowRdOut, Y => 
        \PrState_ns_0_0_a2_1_3[2]\);
    
    \Phase1Cnt_RNIBED6[11]\ : NOR2B
      port map(A => \Phase1Cnt[11]_net_1\, B => 
        \Phase1Cnt[10]_net_1\, Y => N_111_1);
    
    \Phase1Cnt_RNO_0[6]\ : OA1C
      port map(A => \Phase1Cnt[5]_net_1\, B => N_45, C => 
        \Phase1Cnt[6]_net_1\, Y => N_181);
    
    \Phase1Cnt[4]\ : DFN1C0
      port map(D => N_28_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \Phase1Cnt[4]_net_1\);
    
    \Phase1Cnt_RNO[4]\ : XA1
      port map(A => N_44, B => \Phase1Cnt[4]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_28_i_0);
    
    \PrState_RNO_0[0]\ : NOR2A
      port map(A => N_53, B => \CycCnt[0]_net_1\, Y => N_61);
    
    \Phase1Cnt_RNIO3A02[8]\ : OR2B
      port map(A => \Phase1Cnt[8]_net_1\, B => N_48, Y => N_49);
    
    \Phase1Cnt[1]\ : DFN1C0
      port map(D => N_26_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \Phase1Cnt[1]_net_1\);
    
    \Phase1Cnt[11]\ : DFN1C0
      port map(D => Phase1Cnt_n11, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[11]_net_1\);
    
    \PrState_RNIKCBB[1]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => N_53);
    
    \PrState_RNO_4[2]\ : OR3C
      port map(A => N_53, B => \CycCnt[0]_net_1\, C => 
        lvdsFifoRowRdOut, Y => N_67);
    
    \Phase1Cnt[5]\ : DFN1C0
      port map(D => N_30, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \Phase1Cnt_RNO[2]\ : XA1A
      port map(A => N_42, B => \Phase1Cnt[2]_net_1\, C => 
        \PrState[2]_net_1\, Y => \Phase1Cnt_RNO_0[2]\);
    
    \CycCnt[0]\ : DFN1C0
      port map(D => N_6, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \CycCnt[0]_net_1\);
    
    \PrState_RNO_1[3]\ : OAI1
      port map(A => \PrState[3]_net_1\, B => \PrState[4]_net_1\, 
        C => lvdsFifoRowRdOut, Y => \PrState_ns_0_i_0[1]\);
    
    \Phase1Cnt_RNO[1]\ : XA1
      port map(A => \Phase1Cnt[0]_net_1\, B => 
        \Phase1Cnt[1]_net_1\, C => \PrState[2]_net_1\, Y => 
        N_26_i_0);
    
    \Phase1Cnt_RNIVSCL[2]\ : NOR2A
      port map(A => \Phase1Cnt[2]_net_1\, B => N_42, Y => 
        \Phase1Cnt_RNIVSCL[2]_net_1\);
    
    \PrState[1]\ : DFN1C0
      port map(D => \PrState_ns[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[1]_net_1\);
    
    DelayCnt_n3_0_i_o2 : NOR2B
      port map(A => N_51, B => \DelayCnt[3]_net_1\, Y => N_54);
    
    \Phase1Cnt_RNO[6]\ : NOR3A
      port map(A => \PrState[2]_net_1\, B => N_181, C => N_47, Y
         => N_32);
    
    \Phase1Cnt_RNIST4P1[7]\ : NOR2B
      port map(A => \Phase1Cnt[7]_net_1\, B => N_47, Y => N_48);
    
    \PrState_RNO_0[2]\ : NOR2B
      port map(A => \PrState[2]_net_1\, B => lvdsFifoRowRdOut, Y
         => \PrState_ns_0_0_a2_0[2]\);
    
    \PrState_RNO[2]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_0[2]\, B => N_111, C => 
        \PrState_ns_0_0_0[2]\, Y => \PrState_ns[2]\);
    
    \CycCnt_RNO[0]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => N_58, C => 
        \PrState[4]_net_1\, Y => N_6);
    
    \DelayCnt[2]\ : DFN1C0
      port map(D => N_19, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[2]_net_1\);
    
    \PrState_RNO_2[3]\ : NOR2
      port map(A => \DelayCnt[2]_net_1\, B => \DelayCnt[3]_net_1\, 
        Y => \PrState_ns_0_i_a2_0_1[1]\);
    
    \PrState_RNO_0[1]\ : NOR3C
      port map(A => \PrState[2]_net_1\, B => N_111_1, C => 
        lvdsFifoRowRdOut, Y => \PrState_ns_0_0_a2_0_1[3]\);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => Phase1Cnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[0]_net_1\);
    
    \Phase1Cnt_RNO[8]\ : XA1
      port map(A => N_48, B => \Phase1Cnt[8]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_36);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_17, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \PrState_RNO_0[3]\ : NOR3B
      port map(A => \DelayCnt[4]_net_1\, B => 
        \PrState_ns_0_i_a2_0_1[1]\, C => \PrState[4]_net_1\, Y
         => \PrState_ns_0_i_a2_0_2[1]\);
    
    DelayCnt_n2_0_i : XA1
      port map(A => \DelayCnt[2]_net_1\, B => N_50, C => 
        \PrState[3]_net_1\, Y => N_19);
    
    \Phase1Cnt_RNO[10]\ : XA1
      port map(A => \Phase1Cnt[10]_net_1\, B => N_52, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n10);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => N_21, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[3]_net_1\);
    
    \PrState_RNO[1]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_0_1[3]\, B => N_117, C => 
        N_69, Y => \PrState_ns[3]\);
    
    \PrState[4]\ : DFN1P0
      port map(D => lvdsFifoRowRdOut_i, CLK => Sysclk_c, PRE => 
        sysrst_n_c, Q => \PrState[4]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \Phase1Cnt_RNI1SVH1[6]\ : NOR3B
      port map(A => \Phase1Cnt[5]_net_1\, B => 
        \Phase1Cnt[6]_net_1\, C => N_45, Y => N_47);
    
    \Phase1Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => Phase1Cnt_n0);
    
    \Phase1Cnt_RNIE4M31[4]\ : OR2B
      port map(A => \Phase1Cnt[4]_net_1\, B => N_44, Y => N_45);
    
    \Phase1Cnt[10]\ : DFN1C0
      port map(D => Phase1Cnt_n10, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[10]_net_1\);
    
    \DelayCnt[4]\ : DFN1C0
      port map(D => N_23, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[4]_net_1\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \PrState[0]\ : DFN1C0
      port map(D => N_14, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[0]_net_1\);
    
    \Phase1Cnt[6]\ : DFN1C0
      port map(D => N_32, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[6]_net_1\);
    
    \PrState_RNO_6[2]\ : NOR2A
      port map(A => \DelayCnt[4]_net_1\, B => \DelayCnt[2]_net_1\, 
        Y => \PrState_ns_0_0_a2_1_0[2]\);
    
    \PrState_RNO_5[2]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[3]_net_1\, 
        Y => \PrState_ns_0_0_a2_1_1[2]\);
    
    \Phase1Cnt_RNO[7]\ : XA1
      port map(A => N_47, B => \Phase1Cnt[7]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_34);
    
    \Phase1Cnt[7]\ : DFN1C0
      port map(D => N_34, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[7]_net_1\);
    
    \Phase1Cnt_RNO[9]\ : XA1A
      port map(A => N_49, B => \Phase1Cnt[9]_net_1\, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n9);
    
    \PrState_RNO[3]\ : AOI1
      port map(A => \PrState_ns_0_i_a2_0_2[1]\, B => N_50, C => 
        \PrState_ns_0_i_0[1]\, Y => N_10);
    
    \Phase1Cnt_RNILDF72[9]\ : NOR2A
      port map(A => \Phase1Cnt[9]_net_1\, B => N_49, Y => N_52);
    
    DelayCnt_n1_0_i_o2 : NOR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_50);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_10, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    \Phase1Cnt_RNO[3]\ : XA1
      port map(A => \Phase1Cnt_RNIVSCL[2]_net_1\, B => 
        \Phase1Cnt[3]_net_1\, C => \PrState[2]_net_1\, Y => N_7);
    
    \Phase1Cnt_RNI9F8E[1]\ : OR2B
      port map(A => \Phase1Cnt[1]_net_1\, B => 
        \Phase1Cnt[0]_net_1\, Y => N_42);
    
    DelayCnt_n1_0_i : XA1
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[3]_net_1\, Y => N_17);
    
    \Phase1Cnt[9]\ : DFN1C0
      port map(D => Phase1Cnt_n9, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \Phase1Cnt[9]_net_1\);
    
    \CycCnt_RNO_1[0]\ : OR2
      port map(A => \PrState[0]_net_1\, B => \Phase2Cnt[0]_net_1\, 
        Y => \CycCnt_5_i_o2_0[0]\);
    
    \PrState_RNO_1[2]\ : OR2B
      port map(A => N_117, B => N_111_1, Y => N_111);
    
    \PrState_RNO[0]\ : OA1
      port map(A => N_61, B => \PrState[0]_net_1\, C => 
        lvdsFifoRowRdOut, Y => N_14);
    
    DelayCnt_n2_0_i_o2 : NOR2B
      port map(A => N_50, B => \DelayCnt[2]_net_1\, Y => N_51);
    
    DelayCnt_n0_0_0_a2 : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    
    \Phase1Cnt_RNO_0[11]\ : OR2B
      port map(A => \Phase1Cnt[10]_net_1\, B => N_52, Y => N_55);
    
    \Phase1Cnt[3]\ : DFN1C0
      port map(D => N_7, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[3]_net_1\);
    
    \Phase1Cnt_RNO[5]\ : XA1A
      port map(A => N_45, B => \Phase1Cnt[5]_net_1\, C => 
        \PrState[2]_net_1\, Y => N_30);
    
    \CycCnt_RNO_0[0]\ : NOR3
      port map(A => \CycCnt_5_i_o2_0[0]\, B => \PrState[3]_net_1\, 
        C => \PrState[2]_net_1\, Y => N_58);
    
    \Phase1Cnt_RNO[11]\ : XA1A
      port map(A => \Phase1Cnt[11]_net_1\, B => N_55, C => 
        \PrState[2]_net_1\, Y => Phase1Cnt_n11);
    
    \Phase1Cnt_RNILDF72_0[9]\ : NOR2
      port map(A => \Phase1Cnt[9]_net_1\, B => N_49, Y => N_117);
    
    \PrState_RNO_2[2]\ : AOI1B
      port map(A => \PrState_ns_0_0_a2_1_3[2]\, B => N_50, C => 
        N_67, Y => \PrState_ns_0_0_0[2]\);
    
    \PrState_RNO_1[1]\ : OR3C
      port map(A => \Phase2Cnt[0]_net_1\, B => \PrState[1]_net_1\, 
        C => lvdsFifoRowRdOut, Y => N_69);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => N_53, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[0]_net_1\);
    
    \Phase1Cnt_RNIMEHS[3]\ : NOR2B
      port map(A => \Phase1Cnt[3]_net_1\, B => 
        \Phase1Cnt_RNIVSCL[2]_net_1\, Y => N_44);
    
    DelayCnt_n4_0_i : XA1
      port map(A => \DelayCnt[4]_net_1\, B => N_54, C => 
        \PrState[3]_net_1\, Y => N_23);
    
    \Phase1Cnt[8]\ : DFN1C0
      port map(D => N_36, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[8]_net_1\);
    
    \Phase1Cnt[2]\ : DFN1C0
      port map(D => \Phase1Cnt_RNO_0[2]\, CLK => Sysclk_c, CLR
         => sysrst_n_c, Q => \Phase1Cnt[2]_net_1\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    DelayCnt_n3_0_i : XA1
      port map(A => \DelayCnt[3]_net_1\, B => N_51, C => 
        \PrState[3]_net_1\, Y => N_21);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ5 is

    port( sysrst_n_c         : in    std_logic;
          Sysclk_c           : in    std_logic;
          SDramEn_c          : in    std_logic;
          FifoRowRdOut       : in    std_logic;
          FifoRowRdOut_0     : in    std_logic;
          Data2Fifo_0_sqmuxa : out   std_logic
        );

end WaveGenSingleZ5;

architecture DEF_ARCH of WaveGenSingleZ5 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3C
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

  component AOI1
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

  component CLKINT
    port( A : in    std_logic := 'U';
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

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component AO1D
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

  component OR3C
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

  component AO1
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

  component NOR2
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

  component OA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
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

  component XAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component AOI1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

    signal \WFO_RNI7I77\, \PrState_ns_i_0_a2_0[0]\, 
        \PrState[1]_net_1\, \PrState[2]_net_1\, 
        \PrState_ns_0_0_o2_5[2]\, \CycCnt[6]_net_1\, 
        \CycCnt[5]_net_1\, \PrState_ns_0_0_o2_3[2]\, 
        \PrState_ns_0_0_o2_4[2]\, \CycCnt[2]_net_1\, 
        \PrState_ns_0_0_o2_1[2]\, \CycCnt[9]_net_1\, 
        \CycCnt[7]_net_1\, \CycCnt[8]_net_1\, \CycCnt[3]_net_1\, 
        \CycCnt[4]_net_1\, \PrState_ns_0_i_0[1]\, N_41, 
        \PrState[3]_net_1\, \PrState_ns_0_0_a2_1_2_0[2]\, 
        \DelayCnt[1]_net_1\, \DelayCnt[3]_net_1\, \DelayCnt_i[2]\, 
        \PrState_ns_0_i_a2_1[1]\, \PrState_ns_0_i_a2_0_0[1]\, 
        \DelayCnt[0]_net_1\, CycCntlde_0_a2_1, \PrState[0]_net_1\, 
        \PrState_ns_0_0_a2_1_2[2]\, DelayCnt_n0, N_17, N_19, N_26, 
        N_37, N_29_i_0, N_177, \CycCnt[0]_net_1\, 
        \CycCnt[1]_net_1\, N_178, N_9, N_22, N_13, N_24, 
        N_181_i_0, N_202, N_185, N_11, N_180, N_183, N_43_2, N_15, 
        N_197, N_179, N_23, N_175, \Phase2Cnt_RNIJ9UC[1]_net_1\, 
        \PrState_ns_0_0_0[2]\, \PrState_ns_0_0_a2_0_0[2]\, 
        \Phase1Cnt[0]_net_1\, \PrState_ns[2]\, N_169, CycCnte, 
        \PrState_RNO_1[4]\, \PrState_ns[4]\, N_27, CycCnt_n9, 
        CycCnt_n0, Data2fifoEN, N_39, N_28, N_21, N_14, N_7, 
        N_159_i_0, \Phase2Cnt[1]_net_1\, N_5, \GND\, \VCC\, GND_0, 
        VCC_0 : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => Data2fifoEN);
    
    \PrState[2]\ : DFN1C0
      port map(D => \PrState_ns[2]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[2]_net_1\);
    
    \PrState_RNO_3[2]\ : NOR3C
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[3]_net_1\, 
        C => \DelayCnt_i[2]\, Y => \PrState_ns_0_0_a2_1_2_0[2]\);
    
    \PrState_RNIVLS9[0]\ : OR3
      port map(A => \PrState[3]_net_1\, B => \PrState[0]_net_1\, 
        C => \PrState[2]_net_1\, Y => CycCntlde_0_a2_1);
    
    \CycCnt_RNO_0[6]\ : AOI1
      port map(A => N_24, B => \CycCnt[5]_net_1\, C => 
        \CycCnt[6]_net_1\, Y => N_197);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    WFO_RNI7I77_0 : CLKINT
      port map(A => \WFO_RNI7I77\, Y => Data2Fifo_0_sqmuxa);
    
    \CycCnt_RNO[7]\ : XA1B
      port map(A => \CycCnt[7]_net_1\, B => N_183, C => N_43_2, Y
         => N_180);
    
    \PrState_RNO_0[0]\ : OR2B
      port map(A => FifoRowRdOut_0, B => \PrState[0]_net_1\, Y
         => N_169);
    
    \CycCnt_RNIGS6A1[6]\ : NOR3C
      port map(A => \CycCnt[5]_net_1\, B => N_24, C => 
        \CycCnt[6]_net_1\, Y => N_183);
    
    \CycCnt_RNIRA1C[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => \CycCnt[0]_net_1\, Y
         => N_29_i_0);
    
    \Phase2Cnt_RNO[1]\ : XA1
      port map(A => N_159_i_0, B => \Phase2Cnt[1]_net_1\, C => 
        \PrState[1]_net_1\, Y => N_7);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_181_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_13, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_23, C => N_43_2, Y
         => N_179);
    
    WFO_RNI7I77 : NOR2B
      port map(A => SDramEn_c, B => Data2fifoEN, Y => 
        \WFO_RNI7I77\);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[0]_net_1\);
    
    \PrState_RNIKH4Q[4]\ : AO1D
      port map(A => CycCntlde_0_a2_1, B => 
        \Phase2Cnt_RNIJ9UC[1]_net_1\, C => N_41, Y => CycCnte);
    
    \PrState_RNO_1[3]\ : NOR2A
      port map(A => \DelayCnt_i[2]\, B => \DelayCnt[0]_net_1\, Y
         => \PrState_ns_0_i_a2_0_0[1]\);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_185, C => N_43_2, Y
         => CycCnt_n9);
    
    \CycCnt_RNIPV9M1[8]\ : OR3C
      port map(A => \CycCnt[7]_net_1\, B => N_183, C => 
        \CycCnt[8]_net_1\, Y => N_185);
    
    \PrState[1]\ : DFN1C0
      port map(D => N_14, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[1]_net_1\);
    
    \CycCnt_RNO[6]\ : NOR3
      port map(A => N_197, B => N_43_2, C => N_183, Y => N_15);
    
    \CycCnt_RNO_0[8]\ : AO1
      port map(A => N_183, B => \CycCnt[7]_net_1\, C => 
        \CycCnt[8]_net_1\, Y => N_202);
    
    \PrState_RNO_0[2]\ : AO1B
      port map(A => \PrState_ns_0_0_a2_1_2[2]\, B => 
        \PrState_ns_0_0_a2_0_0[2]\, C => FifoRowRdOut_0, Y => 
        \PrState_ns_0_0_0[2]\);
    
    \CycCnt_RNIA62I[2]\ : NOR2B
      port map(A => N_29_i_0, B => \CycCnt[2]_net_1\, Y => N_22);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_178, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_22, C => N_41, Y
         => N_9);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_29_i_0, C => N_41, 
        Y => N_178);
    
    \PrState_RNO[2]\ : AO1B
      port map(A => N_175, B => N_37, C => \PrState_ns_0_0_0[2]\, 
        Y => \PrState_ns[2]\);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => N_41, B => \CycCnt[0]_net_1\, Y => CycCnt_n0);
    
    \DelayCnt[2]\ : DFN1P0
      port map(D => N_19, CLK => Sysclk_c, PRE => sysrst_n_c, Q
         => \DelayCnt_i[2]\);
    
    \CycCnt_RNI933C[8]\ : NOR2B
      port map(A => \CycCnt[7]_net_1\, B => \CycCnt[8]_net_1\, Y
         => \PrState_ns_0_0_o2_3[2]\);
    
    \PrState_RNO_2[3]\ : OA1
      port map(A => N_41, B => \PrState[3]_net_1\, C => 
        FifoRowRdOut_0, Y => \PrState_ns_0_i_0[1]\);
    
    \Phase1Cnt_RNIU1N9[0]\ : NOR2A
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => N_27);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_15, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \PrState_RNO_0[1]\ : NOR2B
      port map(A => \PrState[1]_net_1\, B => 
        \Phase2Cnt_RNIJ9UC[1]_net_1\, Y => N_39);
    
    \Phase1Cnt[0]\ : DFN1C0
      port map(D => N_27, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase1Cnt[0]_net_1\);
    
    \Phase2Cnt_RNIJ9UC[1]\ : OR2A
      port map(A => \Phase2Cnt[1]_net_1\, B => N_159_i_0, Y => 
        \Phase2Cnt_RNIJ9UC[1]_net_1\);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_17, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \PrState_RNO_0[3]\ : NOR3B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[3]_net_1\, 
        C => N_41, Y => \PrState_ns_0_i_a2_1[1]\);
    
    DelayCnt_n2_0_i : XAI1
      port map(A => \DelayCnt_i[2]\, B => N_26, C => 
        \PrState[3]_net_1\, Y => N_19);
    
    \CycCnt_RNIEM5O[6]\ : NOR3C
      port map(A => \CycCnt[6]_net_1\, B => \CycCnt[5]_net_1\, C
         => \PrState_ns_0_0_o2_3[2]\, Y => 
        \PrState_ns_0_0_o2_5[2]\);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_9, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \Phase2Cnt_RNO[0]\ : NOR2A
      port map(A => \PrState[1]_net_1\, B => N_159_i_0, Y => N_5);
    
    \DelayCnt[3]\ : DFN1C0
      port map(D => N_21, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[3]_net_1\);
    
    \PrState_RNO[1]\ : OA1
      port map(A => N_27, B => N_39, C => FifoRowRdOut, Y => N_14);
    
    \PrState[4]\ : DFN1P0
      port map(D => \PrState_RNO_1[4]\, CLK => Sysclk_c, PRE => 
        sysrst_n_c, Q => N_41);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => \CycCnt[0]_net_1\, B => \CycCnt[1]_net_1\, C
         => N_41, Y => N_177);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_177, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \DelayCnt_RNISJ8B[0]\ : NOR2A
      port map(A => \PrState[3]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => DelayCnt_n0);
    
    \PrState_RNI1MS9[0]\ : OR3
      port map(A => N_41, B => \PrState[3]_net_1\, C => 
        \PrState[0]_net_1\, Y => N_43_2);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_7, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => DelayCnt_n0, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \DelayCnt[0]_net_1\);
    
    \PrState[0]\ : DFN1C0
      port map(D => \PrState_ns[4]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \PrState[0]_net_1\);
    
    \CycCnt_RNIB94U[4]\ : NOR2B
      port map(A => N_23, B => \CycCnt[4]_net_1\, Y => N_24);
    
    \CycCnt_RNIFNBS1[6]\ : OR3C
      port map(A => \PrState_ns_0_0_o2_5[2]\, B => 
        \PrState_ns_0_0_o2_4[2]\, C => N_29_i_0, Y => N_37);
    
    \CycCnt_RNI6M4O[9]\ : NOR3B
      port map(A => \CycCnt[2]_net_1\, B => 
        \PrState_ns_0_0_o2_1[2]\, C => \CycCnt[9]_net_1\, Y => 
        \PrState_ns_0_0_o2_4[2]\);
    
    \PrState_RNIDRUN[1]\ : NOR3B
      port map(A => \PrState[1]_net_1\, B => FifoRowRdOut_0, C
         => \Phase2Cnt_RNIJ9UC[1]_net_1\, Y => N_175);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_179, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \PrState_RNO[3]\ : AOI1B
      port map(A => \PrState_ns_0_i_a2_1[1]\, B => 
        \PrState_ns_0_i_a2_0_0[1]\, C => \PrState_ns_0_i_0[1]\, Y
         => N_11);
    
    DelayCnt_n1_0_i_o2 : OR2B
      port map(A => \DelayCnt[1]_net_1\, B => \DelayCnt[0]_net_1\, 
        Y => N_26);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_180, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \PrState[3]\ : DFN1C0
      port map(D => N_11, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \PrState[3]_net_1\);
    
    DelayCnt_n1_0_i : XA1
      port map(A => \DelayCnt[0]_net_1\, B => \DelayCnt[1]_net_1\, 
        C => \PrState[3]_net_1\, Y => N_17);
    
    \PrState_RNO_1[2]\ : OR2B
      port map(A => \PrState_ns_0_0_a2_1_2_0[2]\, B => 
        DelayCnt_n0, Y => \PrState_ns_0_0_a2_1_2[2]\);
    
    \PrState_RNO[0]\ : AO1C
      port map(A => N_37, B => N_175, C => N_169, Y => 
        \PrState_ns[4]\);
    
    \PrState_RNO_0[4]\ : OR2
      port map(A => \PrState[1]_net_1\, B => \PrState[2]_net_1\, 
        Y => \PrState_ns_i_0_a2_0[0]\);
    
    DelayCnt_n2_0_i_o2 : NOR2
      port map(A => N_26, B => \DelayCnt_i[2]\, Y => N_28);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_24, C => N_41, Y
         => N_13);
    
    \CycCnt_RNO[8]\ : NOR3B
      port map(A => N_202, B => N_185, C => N_41, Y => N_181_i_0);
    
    \CycCnt_RNIQ53O[3]\ : NOR2B
      port map(A => N_22, B => \CycCnt[3]_net_1\, Y => N_23);
    
    \PrState_RNO_2[2]\ : OR2B
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt[0]_net_1\, 
        Y => \PrState_ns_0_0_a2_0_0[2]\);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => N_5, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => N_159_i_0);
    
    \PrState_RNO[4]\ : OA1B
      port map(A => N_43_2, B => \PrState_ns_i_0_a2_0[0]\, C => 
        FifoRowRdOut, Y => \PrState_RNO_1[4]\);
    
    \CycCnt_RNI132C[3]\ : NOR2B
      port map(A => \CycCnt[3]_net_1\, B => \CycCnt[4]_net_1\, Y
         => \PrState_ns_0_0_o2_1[2]\);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    DelayCnt_n3_0_i : XA1
      port map(A => \DelayCnt[3]_net_1\, B => N_28, C => 
        \PrState[3]_net_1\, Y => N_21);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity WaveGenSingleZ6 is

    port( PrState_2      : in    std_logic;
          PrState_0      : in    std_logic_vector(4 to 4);
          Data2accEn     : out   std_logic;
          sysrst_n_c     : in    std_logic;
          Sysclk_c       : in    std_logic;
          FifoRowRdOut   : in    std_logic;
          FifoRowRdOut_0 : in    std_logic
        );

end WaveGenSingleZ6;

architecture DEF_ARCH of WaveGenSingleZ6 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AOI1B
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

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
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

  component XA1B
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component OA1C
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

  component NOR3A
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

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component NOR3B
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

    signal \PrState_ns_i_0_1[2]\, N_65, \PrState[2]_net_1\, 
        \PrState_ns_i_0_0[2]\, \PrState_ns_i_0_a5_0_0[2]\, 
        \PrState_i[3]\, \PrState_ns_i_0_a5_0[2]\, 
        \Phase1Cnt_i[0]\, \PrState_i[1]\, N_20, CycCnt_c0, 
        \CycCnt[1]_net_1\, N_22, \CycCnt[2]_net_1\, N_194, N_24, 
        \CycCnt[3]_net_1\, N_38, N_26, \CycCnt[4]_net_1\, N_39, 
        N_28, \CycCnt[5]_net_1\, N_41, N_30, N_60, N_212, 
        N_32_i_0, \CycCnt[7]_net_1\, N_34_i_0, N_82, N_62, 
        N_147_i_0, N_202, N_201, N_145_i_0, N_196, N_64, 
        \Phase2Cnt[1]_net_1\, N_192_i, CycCnt_n9, 
        \CycCnt[9]_net_1\, N_4, N_6, N_8, N_188_i, N_10, 
        \DelayCnt[1]_net_1\, N_143_i_0, CycCnte, N_63, 
        \CycCnt[8]_net_1\, \CycCnt[6]_net_1\, CycCnt_n0, \GND\, 
        \VCC\, GND_0, VCC_0 : std_logic;

begin 


    WFO : DFN1C0
      port map(D => \PrState[2]_net_1\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => Data2accEn);
    
    \PrState[2]\ : DFN1C0
      port map(D => N_145_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \PrState[2]_net_1\);
    
    \PrState_RNO_3[2]\ : AOI1B
      port map(A => \PrState_ns_i_0_a5_0_0[2]\, B => 
        \PrState_i[3]\, C => FifoRowRdOut_0, Y => 
        \PrState_ns_i_0_0[2]\);
    
    \CycCnt_RNO_0[6]\ : AOI1
      port map(A => N_41, B => \CycCnt[5]_net_1\, C => 
        \CycCnt[6]_net_1\, Y => N_212);
    
    \CycCnt[9]\ : DFN1E1C0
      port map(D => CycCnt_n9, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[9]_net_1\);
    
    \CycCnt_RNO[7]\ : XA1C
      port map(A => \CycCnt[7]_net_1\, B => N_60, C => PrState_2, 
        Y => N_32_i_0);
    
    \PrState_RNO_4[2]\ : NOR2B
      port map(A => \Phase1Cnt_i[0]\, B => \PrState_i[1]\, Y => 
        \PrState_ns_i_0_a5_0_0[2]\);
    
    \Phase2Cnt_RNO[1]\ : XA1B
      port map(A => N_192_i, B => \Phase2Cnt[1]_net_1\, C => 
        \PrState_i[1]\, Y => N_6);
    
    \Phase2Cnt_RNI289H[1]\ : OR2
      port map(A => PrState_2, B => N_63, Y => CycCnte);
    
    \CycCnt[8]\ : DFN1E1C0
      port map(D => N_34_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[8]_net_1\);
    
    \CycCnt[5]\ : DFN1E1C0
      port map(D => N_28, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[5]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \DelayCnt_4_i[0]\ : NOR2
      port map(A => \PrState_i[3]\, B => N_188_i, Y => N_8);
    
    \CycCnt_RNO[4]\ : XA1B
      port map(A => \CycCnt[4]_net_1\, B => N_39, C => 
        PrState_0(4), Y => N_26);
    
    \CycCnt_RNI4BDO[8]\ : OR3B
      port map(A => \CycCnt[7]_net_1\, B => \CycCnt[8]_net_1\, C
         => N_60, Y => N_62);
    
    \CycCnt[0]\ : DFN1E1C0
      port map(D => CycCnt_n0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => CycCnt_c0);
    
    \CycCnt_RNI3E48[2]\ : NOR2B
      port map(A => N_194, B => \CycCnt[2]_net_1\, Y => N_38);
    
    \DelayCnt_RNIB6DH[1]\ : OA1C
      port map(A => \DelayCnt[1]_net_1\, B => N_188_i, C => 
        \PrState_i[3]\, Y => N_65);
    
    \CycCnt_RNO[9]\ : XA1C
      port map(A => \CycCnt[9]_net_1\, B => N_62, C => PrState_2, 
        Y => CycCnt_n9);
    
    \PrState[1]\ : DFN1P0
      port map(D => N_147_i_0, CLK => Sysclk_c, PRE => sysrst_n_c, 
        Q => \PrState_i[1]\);
    
    \CycCnt_RNO[6]\ : NOR3A
      port map(A => N_60, B => N_212, C => PrState_2, Y => N_30);
    
    \CycCnt_RNO_0[8]\ : AO1A
      port map(A => N_60, B => \CycCnt[7]_net_1\, C => 
        \CycCnt[8]_net_1\, Y => N_82);
    
    \PrState_RNO_0[2]\ : NOR2A
      port map(A => \PrState_i[3]\, B => \PrState[2]_net_1\, Y
         => \PrState_ns_i_0_a5_0[2]\);
    
    \CycCnt[2]\ : DFN1E1C0
      port map(D => N_22, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[2]_net_1\);
    
    \CycCnt_RNO[3]\ : XA1B
      port map(A => \CycCnt[3]_net_1\, B => N_38, C => 
        PrState_0(4), Y => N_24);
    
    \CycCnt_RNO[2]\ : XA1B
      port map(A => \CycCnt[2]_net_1\, B => N_194, C => 
        PrState_0(4), Y => N_22);
    
    \PrState_RNO[2]\ : AOI1B
      port map(A => \PrState_ns_i_0_a5_0[2]\, B => N_196, C => 
        \PrState_ns_i_0_1[2]\, Y => N_145_i_0);
    
    \CycCnt_RNO[0]\ : NOR2
      port map(A => PrState_2, B => CycCnt_c0, Y => CycCnt_n0);
    
    \CycCnt_RNI1KD5[1]\ : NOR2B
      port map(A => \CycCnt[1]_net_1\, B => CycCnt_c0, Y => N_194);
    
    \CycCnt[6]\ : DFN1E1C0
      port map(D => N_30, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[6]_net_1\);
    
    \PrState_RNO_0[1]\ : OR3A
      port map(A => \Phase2Cnt[1]_net_1\, B => N_192_i, C => 
        \PrState[2]_net_1\, Y => N_202);
    
    \Phase1Cnt[0]\ : DFN1P0
      port map(D => N_64, CLK => Sysclk_c, PRE => sysrst_n_c, Q
         => \Phase1Cnt_i[0]\);
    
    \DelayCnt[1]\ : DFN1C0
      port map(D => N_10, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \DelayCnt[1]_net_1\);
    
    \CycCnt[3]\ : DFN1E1C0
      port map(D => N_24, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[3]_net_1\);
    
    \Phase2Cnt_RNO[0]\ : NOR2
      port map(A => \PrState_i[1]\, B => N_192_i, Y => N_4);
    
    \PrState_RNO[1]\ : OR3C
      port map(A => FifoRowRdOut_0, B => N_202, C => N_201, Y => 
        N_147_i_0);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CycCnt_RNO[1]\ : XA1B
      port map(A => CycCnt_c0, B => \CycCnt[1]_net_1\, C => 
        PrState_0(4), Y => N_20);
    
    \CycCnt[1]\ : DFN1E1C0
      port map(D => N_20, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[1]_net_1\);
    
    \Phase1Cnt_RNI0GP8[0]\ : OR2B
      port map(A => \PrState[2]_net_1\, B => \Phase1Cnt_i[0]\, Y
         => N_64);
    
    \CycCnt_RNI68RA[3]\ : NOR2B
      port map(A => N_38, B => \CycCnt[3]_net_1\, Y => N_39);
    
    \Phase2Cnt[1]\ : DFN1C0
      port map(D => N_6, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => \Phase2Cnt[1]_net_1\);
    
    \DelayCnt[0]\ : DFN1C0
      port map(D => N_8, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => N_188_i);
    
    \CycCnt[4]\ : DFN1E1C0
      port map(D => N_26, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => CycCnte, Q => \CycCnt[4]_net_1\);
    
    \PrState_RNO[3]\ : OAI1
      port map(A => N_65, B => PrState_2, C => FifoRowRdOut, Y
         => N_143_i_0);
    
    \DelayCnt_4_i[1]\ : XA1B
      port map(A => \DelayCnt[1]_net_1\, B => N_188_i, C => 
        \PrState_i[3]\, Y => N_10);
    
    \CycCnt[7]\ : DFN1E1C0
      port map(D => N_32_i_0, CLK => Sysclk_c, CLR => sysrst_n_c, 
        E => CycCnte, Q => \CycCnt[7]_net_1\);
    
    \PrState[3]\ : DFN1P0
      port map(D => N_143_i_0, CLK => Sysclk_c, PRE => sysrst_n_c, 
        Q => \PrState_i[3]\);
    
    \Phase2Cnt_RNI591E[1]\ : NOR3A
      port map(A => \Phase2Cnt[1]_net_1\, B => N_192_i, C => 
        \PrState_i[1]\, Y => N_63);
    
    \PrState_RNO_1[2]\ : OAI1
      port map(A => \CycCnt[9]_net_1\, B => N_62, C => N_63, Y
         => N_196);
    
    \CycCnt_RNO[5]\ : XA1B
      port map(A => \CycCnt[5]_net_1\, B => N_41, C => PrState_2, 
        Y => N_28);
    
    \CycCnt_RNILMVI[6]\ : OR3C
      port map(A => \CycCnt[5]_net_1\, B => N_41, C => 
        \CycCnt[6]_net_1\, Y => N_60);
    
    \CycCnt_RNO[8]\ : NOR3B
      port map(A => N_82, B => N_62, C => PrState_2, Y => 
        N_34_i_0);
    
    \PrState_RNO_2[2]\ : OA1A
      port map(A => N_65, B => \PrState[2]_net_1\, C => 
        \PrState_ns_i_0_0[2]\, Y => \PrState_ns_i_0_1[2]\);
    
    \PrState_RNO_1[1]\ : OR2B
      port map(A => \PrState_i[1]\, B => N_64, Y => N_201);
    
    \Phase2Cnt[0]\ : DFN1C0
      port map(D => N_4, CLK => Sysclk_c, CLR => sysrst_n_c, Q
         => N_192_i);
    
    \CycCnt_RNIA2ID[4]\ : NOR2B
      port map(A => N_39, B => \CycCnt[4]_net_1\, Y => N_41);
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity Main_ctl4SD is

    port( Sysclk      : in    std_logic;
          sysrst_n    : in    std_logic;
          SDramEn     : in    std_logic;
          LVDS_en     : in    std_logic;
          Adc_en      : in    std_logic;
          LVDSRdOk    : in    std_logic;
          Data_fifoIN : in    std_logic_vector(71 downto 0);
          Data_AccIn  : in    std_logic_vector(71 downto 0);
          Data2ACC    : out   std_logic_vector(71 downto 0);
          Data2Fifo   : out   std_logic_vector(71 downto 0);
          LVDS_data   : out   std_logic_vector(71 downto 0);
          fifo_rd     : out   std_logic;
          fifo_rst_n  : out   std_logic;
          ByteRdEn    : out   std_logic;
          Fifo_wr     : out   std_logic
        );

end Main_ctl4SD;

architecture DEF_ARCH of Main_ctl4SD is 

  component INBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
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

  component XA1
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

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component WaveGenSingleZ7
    port( Fifo_wr_c      : out   std_logic;
          sysrst_n_c     : in    std_logic := 'U';
          Sysclk_c       : in    std_logic := 'U';
          FifoRowRdOut   : in    std_logic := 'U';
          FifoRowRdOut_0 : in    std_logic := 'U'
        );
  end component;

  component AO1
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

  component INV
    port( A : in    std_logic := 'U';
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

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component WaveGenSingleZ4
    port( PrState_4      : out   std_logic;
          PrState_0      : out   std_logic_vector(4 to 4);
          latch_en       : out   std_logic;
          FifoRowRdOut   : in    std_logic := 'U';
          FifoRowRdOut_0 : in    std_logic := 'U';
          sysrst_n_c     : in    std_logic := 'U';
          FifoRowRdOut_i : in    std_logic := 'U';
          Sysclk_c       : in    std_logic := 'U'
        );
  end component;

  component WaveGenSingleZ3
    port( sysrst_n_c         : in    std_logic := 'U';
          Sysclk_c           : in    std_logic := 'U';
          LVDS_en_c          : in    std_logic := 'U';
          lvdsFifoRowRdOut   : out   std_logic;
          lvdsFifoRowRdOut_i : out   std_logic
        );
  end component;

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component WaveGenSingleZ2
    port( lvds_fifoRd      : out   std_logic;
          sysrst_n_c       : in    std_logic := 'U';
          Sysclk_c         : in    std_logic := 'U';
          lvdsFifoRowRdOut : in    std_logic := 'U'
        );
  end component;

  component WaveGenSingleZ9
    port( FifoRowRdOut   : out   std_logic;
          SDramEn_c      : in    std_logic := 'U';
          FifoRowRdOut_i : out   std_logic;
          sysrst_n_c     : in    std_logic := 'U';
          Sysclk_c       : in    std_logic := 'U';
          FifoRowRdOut_0 : out   std_logic
        );
  end component;

  component WaveGenSingleZ8
    port( PrState_3      : in    std_logic := 'U';
          PrState_0      : in    std_logic_vector(4 to 4) := (others => 'U');
          interFifo_rd   : out   std_logic;
          sysrst_n_c     : in    std_logic := 'U';
          Sysclk_c       : in    std_logic := 'U';
          FifoRowRdOut   : in    std_logic := 'U';
          FifoRowRdOut_0 : in    std_logic := 'U'
        );
  end component;

  component WaveGenSingleZ1
    port( sysrst_n_c         : in    std_logic := 'U';
          Sysclk_c           : in    std_logic := 'U';
          LVDS_en_c          : in    std_logic := 'U';
          lvdsFifoRowRdOut   : in    std_logic := 'U';
          LVDS_data_0_sqmuxa : out   std_logic
        );
  end component;

  component WaveGenSingleZ0
    port( lvdsFifoRowRdOut_i : in    std_logic := 'U';
          ByteRdEn_c         : out   std_logic;
          sysrst_n_c         : in    std_logic := 'U';
          Sysclk_c           : in    std_logic := 'U';
          lvdsFifoRowRdOut   : in    std_logic := 'U'
        );
  end component;

  component WaveGenSingleZ5
    port( sysrst_n_c         : in    std_logic := 'U';
          Sysclk_c           : in    std_logic := 'U';
          SDramEn_c          : in    std_logic := 'U';
          FifoRowRdOut       : in    std_logic := 'U';
          FifoRowRdOut_0     : in    std_logic := 'U';
          Data2Fifo_0_sqmuxa : out   std_logic
        );
  end component;

  component WaveGenSingleZ6
    port( PrState_2      : in    std_logic := 'U';
          PrState_0      : in    std_logic_vector(4 to 4) := (others => 'U');
          Data2accEn     : out   std_logic;
          sysrst_n_c     : in    std_logic := 'U';
          Sysclk_c       : in    std_logic := 'U';
          FifoRowRdOut   : in    std_logic := 'U';
          FifoRowRdOut_0 : in    std_logic := 'U'
        );
  end component;

  component CLKBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
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

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \VCC\, FifoRowRdOut, interFifo_rd, Data2accEn, 
        latch_en, lvdsFifoRowRdOut, lvds_fifoRd, 
        \addSel[0]_net_1\, \addSel[1]_net_1\, \ChSel[0]_net_1\, 
        \ChSel[1]_net_1\, \sdramENReg\, \notfirstFrame\, 
        Data2Fifo_0_sqmuxa, LVDS_data_0_sqmuxa, \latch4acc[3]\, 
        \intData2acc[60]\, \intData2acc[16]_net_1\, 
        \intData2acc[17]_net_1\, \intData2acc[18]_net_1\, 
        fifo_rst_n_4, \intData2acc[9]\, \intData2acc[24]\, 
        \intData2acc[40]\, \ChSel_3[0]\, \ChSel_3[1]\, 
        \addSel_2[0]\, \addSel_2[1]\, \latch_data[18]_net_1\, 
        \latch_data[19]_net_1\, \latch_data[20]_net_1\, 
        \latch_data[21]_net_1\, \latch_data[22]_net_1\, 
        \latch_data[23]_net_1\, \latch_data[24]_net_1\, 
        \latch_data[25]_net_1\, \latch_data[26]_net_1\, 
        \latch_data[27]_net_1\, \latch_data[28]_net_1\, 
        \latch_data[29]_net_1\, \latch_data[30]_net_1\, 
        \latch_data[31]_net_1\, \latch_data[32]_net_1\, 
        \latch_data[33]_net_1\, \latch_data[34]_net_1\, 
        \latch_data[35]_net_1\, \latch_data[36]_net_1\, 
        \latch_data[37]_net_1\, \latch_data[38]_net_1\, 
        \latch_data[39]_net_1\, \latch_data[40]_net_1\, 
        \latch_data[41]_net_1\, \latch_data[42]_net_1\, 
        \latch_data[43]_net_1\, \latch_data[44]_net_1\, 
        \latch_data[45]_net_1\, \latch_data[46]_net_1\, 
        \latch_data[47]_net_1\, \latch_data[48]_net_1\, 
        \latch_data[49]_net_1\, \latch_data[50]_net_1\, 
        \latch_data[51]_net_1\, \latch_data[52]_net_1\, 
        \latch_data[53]_net_1\, \latch_data[54]_net_1\, 
        \latch_data[55]_net_1\, \latch_data[56]_net_1\, 
        \latch_data[57]_net_1\, \latch_data[58]_net_1\, 
        \latch_data[59]_net_1\, \latch_data[60]_net_1\, 
        \latch_data[61]_net_1\, \latch_data[62]_net_1\, 
        \latch_data[63]_net_1\, \latch_data[64]_net_1\, 
        \latch_data[65]_net_1\, \latch_data[66]_net_1\, 
        \latch_data[67]_net_1\, \latch_data[68]_net_1\, 
        \latch_data[69]_net_1\, \latch_data[70]_net_1\, 
        \latch_data[71]_net_1\, \latch_data[0]_net_1\, 
        \latch_data[1]_net_1\, \latch_data[2]_net_1\, 
        \latch_data[3]_net_1\, \latch_data[4]_net_1\, 
        \latch_data[5]_net_1\, \latch_data[6]_net_1\, 
        \latch_data[7]_net_1\, \latch_data[8]_net_1\, 
        \latch_data[9]_net_1\, \latch_data[10]_net_1\, 
        \latch_data[11]_net_1\, \latch_data[12]_net_1\, 
        \latch_data[13]_net_1\, \latch_data[14]_net_1\, 
        \latch_data[15]_net_1\, \latch_data[16]_net_1\, 
        \latch_data[17]_net_1\, \latch4acc_RNO[12]_net_1\, N_8, 
        N_10, N_12, N_14, \latch_data_RNO[64]_net_1\, 
        \latch_data_RNO[65]_net_1\, \latch_data_RNO[66]_net_1\, 
        \latch_data_RNO[67]_net_1\, \latch_data_RNO[60]_net_1\, 
        \latch_data_RNO[61]_net_1\, \latch_data_RNO[62]_net_1\, 
        \latch_data_RNO[63]_net_1\, \latch_data_RNO[56]_net_1\, 
        \latch_data_RNO[57]_net_1\, \latch_data_RNO[58]_net_1\, 
        \latch_data_RNO[59]_net_1\, \latch_data_RNO[25]_net_1\, 
        \latch_data_RNO[35]_net_1\, \latch_data_RNO[54]_net_1\, 
        \latch_data_RNO[55]_net_1\, N_15, 
        \latch_data_RNO[24]_net_1\, \latch_data_RNO[34]_net_1\, 
        \latch_data_RNO[52]_net_1\, \latch_data_RNO[53]_net_1\, 
        \latch_data_RNO[23]_net_1\, \latch_data_RNO[33]_net_1\, 
        \latch_data_RNO[50]_net_1\, \latch_data_RNO[51]_net_1\, 
        \latch_data_RNO[22]_net_1\, \latch_data_RNO[32]_net_1\, 
        \latch_data_RNO[48]_net_1\, \latch_data_RNO[49]_net_1\, 
        \latch_data_RNO[21]_net_1\, \latch_data_RNO[31]_net_1\, 
        \latch_data_RNO[46]_net_1\, \latch_data_RNO[47]_net_1\, 
        \latch_data_RNO[20]_net_1\, \latch_data_RNO[30]_net_1\, 
        \latch_data_RNO[44]_net_1\, \latch_data_RNO[45]_net_1\, 
        \latch_data_RNO[19]_net_1\, \latch_data_RNO[29]_net_1\, 
        \latch_data_RNO[42]_net_1\, \latch_data_RNO[43]_net_1\, 
        \latch_data_RNO[18]_net_1\, \latch_data_RNO[28]_net_1\, 
        \latch_data_RNO[40]_net_1\, \latch_data_RNO[41]_net_1\, 
        \ChSel_RNIBBA1_1[1]_net_1\, \latch_data_RNO[17]_net_1\, 
        \latch_data_RNO[27]_net_1\, \latch_data_RNO[38]_net_1\, 
        \latch_data_RNO[39]_net_1\, \latch_data_RNO[16]_net_1\, 
        \latch_data_RNO[26]_net_1\, \latch_data_RNO[36]_net_1\, 
        \latch_data_RNO[37]_net_1\, \ChSel_RNIBBA1_0[1]_net_1\, 
        \latch_data_RNO[12]_net_1\, \latch_data_RNO[13]_net_1\, 
        \latch_data_RNO[14]_net_1\, \latch_data_RNO[15]_net_1\, 
        \latch_data_RNO[8]_net_1\, \latch_data_RNO[9]_net_1\, 
        \latch_data_RNO[10]_net_1\, \latch_data_RNO[11]_net_1\, 
        \latch_data_RNO[4]_net_1\, \latch_data_RNO[5]_net_1\, 
        \latch_data_RNO[6]_net_1\, \latch_data_RNO[7]_net_1\, 
        \latch_data_RNO[0]_net_1\, \latch_data_RNO[1]_net_1\, 
        \latch_data_RNO[2]_net_1\, \latch_data_RNO[3]_net_1\, 
        \ChSel_RNIBBA1_2[1]_net_1\, \latchGen.PrState[4]\, 
        Sysclk_c, sysrst_n_c, SDramEn_c, LVDS_en_c, Adc_en_c, 
        LVDSRdOk_c, \Data_fifoIN_c[0]\, \Data_fifoIN_c[1]\, 
        \Data_fifoIN_c[2]\, \Data_fifoIN_c[3]\, 
        \Data_fifoIN_c[4]\, \Data_fifoIN_c[5]\, 
        \Data_fifoIN_c[6]\, \Data_fifoIN_c[7]\, 
        \Data_fifoIN_c[8]\, \Data_fifoIN_c[9]\, 
        \Data_fifoIN_c[10]\, \Data_fifoIN_c[11]\, 
        \Data_fifoIN_c[12]\, \Data_fifoIN_c[13]\, 
        \Data_fifoIN_c[14]\, \Data_fifoIN_c[15]\, 
        \Data_fifoIN_c[16]\, \Data_fifoIN_c[17]\, 
        \Data_fifoIN_c[18]\, \Data_fifoIN_c[19]\, 
        \Data_fifoIN_c[20]\, \Data_fifoIN_c[21]\, 
        \Data_fifoIN_c[22]\, \Data_fifoIN_c[23]\, 
        \Data_fifoIN_c[24]\, \Data_fifoIN_c[25]\, 
        \Data_fifoIN_c[26]\, \Data_fifoIN_c[27]\, 
        \Data_fifoIN_c[28]\, \Data_fifoIN_c[29]\, 
        \Data_fifoIN_c[30]\, \Data_fifoIN_c[31]\, 
        \Data_fifoIN_c[32]\, \Data_fifoIN_c[33]\, 
        \Data_fifoIN_c[34]\, \Data_fifoIN_c[35]\, 
        \Data_fifoIN_c[36]\, \Data_fifoIN_c[37]\, 
        \Data_fifoIN_c[38]\, \Data_fifoIN_c[39]\, 
        \Data_fifoIN_c[40]\, \Data_fifoIN_c[41]\, 
        \Data_fifoIN_c[42]\, \Data_fifoIN_c[43]\, 
        \Data_fifoIN_c[44]\, \Data_fifoIN_c[45]\, 
        \Data_fifoIN_c[46]\, \Data_fifoIN_c[47]\, 
        \Data_fifoIN_c[48]\, \Data_fifoIN_c[49]\, 
        \Data_fifoIN_c[50]\, \Data_fifoIN_c[51]\, 
        \Data_fifoIN_c[52]\, \Data_fifoIN_c[53]\, 
        \Data_fifoIN_c[54]\, \Data_fifoIN_c[55]\, 
        \Data_fifoIN_c[56]\, \Data_fifoIN_c[57]\, 
        \Data_fifoIN_c[58]\, \Data_fifoIN_c[59]\, 
        \Data_fifoIN_c[60]\, \Data_fifoIN_c[61]\, 
        \Data_fifoIN_c[62]\, \Data_fifoIN_c[63]\, 
        \Data_fifoIN_c[64]\, \Data_fifoIN_c[65]\, 
        \Data_fifoIN_c[66]\, \Data_fifoIN_c[67]\, 
        \Data_fifoIN_c[68]\, \Data_fifoIN_c[69]\, 
        \Data_fifoIN_c[70]\, \Data_fifoIN_c[71]\, 
        \Data_AccIn_c[0]\, \Data_AccIn_c[1]\, \Data_AccIn_c[2]\, 
        \Data_AccIn_c[3]\, \Data_AccIn_c[4]\, \Data_AccIn_c[5]\, 
        \Data_AccIn_c[6]\, \Data_AccIn_c[7]\, \Data_AccIn_c[8]\, 
        \Data_AccIn_c[9]\, \Data_AccIn_c[10]\, \Data_AccIn_c[11]\, 
        \Data_AccIn_c[12]\, \Data_AccIn_c[13]\, 
        \Data_AccIn_c[14]\, \Data_AccIn_c[15]\, 
        \Data_AccIn_c[16]\, \Data_AccIn_c[17]\, 
        \Data_AccIn_c[18]\, \Data_AccIn_c[19]\, 
        \Data_AccIn_c[20]\, \Data_AccIn_c[21]\, 
        \Data_AccIn_c[22]\, \Data_AccIn_c[23]\, 
        \Data_AccIn_c[24]\, \Data_AccIn_c[25]\, 
        \Data_AccIn_c[26]\, \Data_AccIn_c[27]\, 
        \Data_AccIn_c[28]\, \Data_AccIn_c[29]\, 
        \Data_AccIn_c[30]\, \Data_AccIn_c[31]\, 
        \Data_AccIn_c[32]\, \Data_AccIn_c[33]\, 
        \Data_AccIn_c[34]\, \Data_AccIn_c[35]\, 
        \Data_AccIn_c[36]\, \Data_AccIn_c[37]\, 
        \Data_AccIn_c[38]\, \Data_AccIn_c[39]\, 
        \Data_AccIn_c[40]\, \Data_AccIn_c[41]\, 
        \Data_AccIn_c[42]\, \Data_AccIn_c[43]\, 
        \Data_AccIn_c[44]\, \Data_AccIn_c[45]\, 
        \Data_AccIn_c[46]\, \Data_AccIn_c[47]\, 
        \Data_AccIn_c[48]\, \Data_AccIn_c[49]\, 
        \Data_AccIn_c[50]\, \Data_AccIn_c[51]\, 
        \Data_AccIn_c[52]\, \Data_AccIn_c[53]\, 
        \Data_AccIn_c[54]\, \Data_AccIn_c[55]\, 
        \Data_AccIn_c[56]\, \Data_AccIn_c[57]\, 
        \Data_AccIn_c[58]\, \Data_AccIn_c[59]\, 
        \Data_AccIn_c[60]\, \Data_AccIn_c[61]\, 
        \Data_AccIn_c[62]\, \Data_AccIn_c[63]\, 
        \Data_AccIn_c[64]\, \Data_AccIn_c[65]\, 
        \Data_AccIn_c[66]\, \Data_AccIn_c[67]\, 
        \Data_AccIn_c[68]\, \Data_AccIn_c[69]\, 
        \Data_AccIn_c[70]\, \Data_AccIn_c[71]\, 
        \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, \Data2ACC_1_c[16]\, 
        \Data2ACC_1_c[17]\, \Data2ACC_1_c[18]\, 
        \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, 
        \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        \Data2ACC_1_c_c_c_c_c_c[60]\, \GND\, \Data2Fifo_c[0]\, 
        \Data2Fifo_c[1]\, \Data2Fifo_c[2]\, \Data2Fifo_c[3]\, 
        \Data2Fifo_c[4]\, \Data2Fifo_c[5]\, \Data2Fifo_c[6]\, 
        \Data2Fifo_c[7]\, \Data2Fifo_c[8]\, \Data2Fifo_c[9]\, 
        \Data2Fifo_c[10]\, \Data2Fifo_c[11]\, \Data2Fifo_c[12]\, 
        \Data2Fifo_c[13]\, \Data2Fifo_c[14]\, \Data2Fifo_c[15]\, 
        \Data2Fifo_c[16]\, \Data2Fifo_c[17]\, \Data2Fifo_c[18]\, 
        \Data2Fifo_c[19]\, \Data2Fifo_c[20]\, \Data2Fifo_c[21]\, 
        \Data2Fifo_c[22]\, \Data2Fifo_c[23]\, \Data2Fifo_c[24]\, 
        \Data2Fifo_c[25]\, \Data2Fifo_c[26]\, \Data2Fifo_c[27]\, 
        \Data2Fifo_c[28]\, \Data2Fifo_c[29]\, \Data2Fifo_c[30]\, 
        \Data2Fifo_c[31]\, \Data2Fifo_c[32]\, \Data2Fifo_c[33]\, 
        \Data2Fifo_c[34]\, \Data2Fifo_c[35]\, \Data2Fifo_c[36]\, 
        \Data2Fifo_c[37]\, \Data2Fifo_c[38]\, \Data2Fifo_c[39]\, 
        \Data2Fifo_c[40]\, \Data2Fifo_c[41]\, \Data2Fifo_c[42]\, 
        \Data2Fifo_c[43]\, \Data2Fifo_c[44]\, \Data2Fifo_c[45]\, 
        \Data2Fifo_c[46]\, \Data2Fifo_c[47]\, \Data2Fifo_c[48]\, 
        \Data2Fifo_c[49]\, \Data2Fifo_c[50]\, \Data2Fifo_c[51]\, 
        \Data2Fifo_c[52]\, \Data2Fifo_c[53]\, \Data2Fifo_c[54]\, 
        \Data2Fifo_c[55]\, \Data2Fifo_c[56]\, \Data2Fifo_c[57]\, 
        \Data2Fifo_c[58]\, \Data2Fifo_c[59]\, \Data2Fifo_c[60]\, 
        \Data2Fifo_c[61]\, \Data2Fifo_c[62]\, \Data2Fifo_c[63]\, 
        \Data2Fifo_c[64]\, \Data2Fifo_c[65]\, \Data2Fifo_c[66]\, 
        \Data2Fifo_c[67]\, \Data2Fifo_c[68]\, \Data2Fifo_c[69]\, 
        \Data2Fifo_c[70]\, \Data2Fifo_c[71]\, \LVDS_data_c[0]\, 
        \LVDS_data_c[1]\, \LVDS_data_c[2]\, \LVDS_data_c[3]\, 
        \LVDS_data_c[4]\, \LVDS_data_c[5]\, \LVDS_data_c[6]\, 
        \LVDS_data_c[7]\, \LVDS_data_c[8]\, \LVDS_data_c[9]\, 
        \LVDS_data_c[10]\, \LVDS_data_c[11]\, \LVDS_data_c[12]\, 
        \LVDS_data_c[13]\, \LVDS_data_c[14]\, \LVDS_data_c[15]\, 
        \LVDS_data_c[16]\, \LVDS_data_c[17]\, \LVDS_data_c[18]\, 
        \LVDS_data_c[19]\, \LVDS_data_c[20]\, \LVDS_data_c[21]\, 
        \LVDS_data_c[22]\, \LVDS_data_c[23]\, \LVDS_data_c[24]\, 
        \LVDS_data_c[25]\, \LVDS_data_c[26]\, \LVDS_data_c[27]\, 
        \LVDS_data_c[28]\, \LVDS_data_c[29]\, \LVDS_data_c[30]\, 
        \LVDS_data_c[31]\, \LVDS_data_c[32]\, \LVDS_data_c[33]\, 
        \LVDS_data_c[34]\, \LVDS_data_c[35]\, \LVDS_data_c[36]\, 
        \LVDS_data_c[37]\, \LVDS_data_c[38]\, \LVDS_data_c[39]\, 
        \LVDS_data_c[40]\, \LVDS_data_c[41]\, \LVDS_data_c[42]\, 
        \LVDS_data_c[43]\, \LVDS_data_c[44]\, \LVDS_data_c[45]\, 
        \LVDS_data_c[46]\, \LVDS_data_c[47]\, \LVDS_data_c[48]\, 
        \LVDS_data_c[49]\, \LVDS_data_c[50]\, \LVDS_data_c[51]\, 
        \LVDS_data_c[52]\, \LVDS_data_c[53]\, \LVDS_data_c[54]\, 
        \LVDS_data_c[55]\, \LVDS_data_c[56]\, \LVDS_data_c[57]\, 
        \LVDS_data_c[58]\, \LVDS_data_c[59]\, \LVDS_data_c[60]\, 
        \LVDS_data_c[61]\, \LVDS_data_c[62]\, \LVDS_data_c[63]\, 
        \LVDS_data_c[64]\, \LVDS_data_c[65]\, \LVDS_data_c[66]\, 
        \LVDS_data_c[67]\, \LVDS_data_c[68]\, \LVDS_data_c[69]\, 
        \LVDS_data_c[70]\, \LVDS_data_c[71]\, fifo_rd_c, 
        fifo_rst_n_c, ByteRdEn_c, Fifo_wr_c, intData2acc_3_sqmuxa, 
        intData2acc_2_sqmuxa, N_1059, N_1055, 
        notfirstFrame_1_sqmuxa, LVDSRdOk_c_i, lvdsFifoRowRdOut_i, 
        FifoRowRdOut_i, \SDramEn_pad\, \latchGen.PrState_0[4]\, 
        FifoRowRdOut_0, GND_0, VCC_0 : std_logic;

    for all : WaveGenSingleZ7
	Use entity work.WaveGenSingleZ7(DEF_ARCH);
    for all : WaveGenSingleZ4
	Use entity work.WaveGenSingleZ4(DEF_ARCH);
    for all : WaveGenSingleZ3
	Use entity work.WaveGenSingleZ3(DEF_ARCH);
    for all : WaveGenSingleZ2
	Use entity work.WaveGenSingleZ2(DEF_ARCH);
    for all : WaveGenSingleZ9
	Use entity work.WaveGenSingleZ9(DEF_ARCH);
    for all : WaveGenSingleZ8
	Use entity work.WaveGenSingleZ8(DEF_ARCH);
    for all : WaveGenSingleZ1
	Use entity work.WaveGenSingleZ1(DEF_ARCH);
    for all : WaveGenSingleZ0
	Use entity work.WaveGenSingleZ0(DEF_ARCH);
    for all : WaveGenSingleZ5
	Use entity work.WaveGenSingleZ5(DEF_ARCH);
    for all : WaveGenSingleZ6
	Use entity work.WaveGenSingleZ6(DEF_ARCH);
begin 


    \Data_fifoIN_pad[26]\ : INBUF
      port map(PAD => Data_fifoIN(26), Y => \Data_fifoIN_c[26]\);
    
    \Data2Fifo[35]\ : DFN1E1C0
      port map(D => \latch_data[35]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[35]\);
    
    \Data_AccIn_pad[36]\ : INBUF
      port map(PAD => Data_AccIn(36), Y => \Data_AccIn_c[36]\);
    
    \ChSel_RNO[1]\ : XA1
      port map(A => \ChSel[0]_net_1\, B => \ChSel[1]_net_1\, C
         => latch_en, Y => \ChSel_3[1]\);
    
    \Data2Fifo_pad[18]\ : OUTBUF
      port map(D => \Data2Fifo_c[18]\, PAD => Data2Fifo(18));
    
    \latch_data[57]\ : DFN1E1C0
      port map(D => \latch_data_RNO[57]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[57]_net_1\);
    
    \LVDS_data[34]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[34]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[34]\);
    
    \Data2ACC_pad[8]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(8));
    
    \Data2Fifo_pad[21]\ : OUTBUF
      port map(D => \Data2Fifo_c[21]\, PAD => Data2Fifo(21));
    
    \Data_fifoIN_pad[69]\ : INBUF
      port map(PAD => Data_fifoIN(69), Y => \Data_fifoIN_c[69]\);
    
    \Data_AccIn_pad[71]\ : INBUF
      port map(PAD => Data_AccIn(71), Y => \Data_AccIn_c[71]\);
    
    \LVDS_data[61]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[61]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[61]\);
    
    \latch_data_RNO[25]\ : MX2
      port map(A => \Data_AccIn_c[25]\, B => 
        \latch_data[25]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[25]_net_1\);
    
    \Data_fifoIN_pad[8]\ : INBUF
      port map(PAD => Data_fifoIN(8), Y => \Data_fifoIN_c[8]\);
    
    fifo_rst_n_pad : OUTBUF
      port map(D => fifo_rst_n_c, PAD => fifo_rst_n);
    
    \latch_data[22]\ : DFN1E1C0
      port map(D => \latch_data_RNO[22]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[22]_net_1\);
    
    \Data_fifoIN_pad[13]\ : INBUF
      port map(PAD => Data_fifoIN(13), Y => \Data_fifoIN_c[13]\);
    
    \latch_data[26]\ : DFN1E1C0
      port map(D => \latch_data_RNO[26]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[26]_net_1\);
    
    \Data2Fifo[14]\ : DFN1E1C0
      port map(D => \latch_data[14]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[14]\);
    
    \Data_AccIn_pad[66]\ : INBUF
      port map(PAD => Data_AccIn(66), Y => \Data_AccIn_c[66]\);
    
    \latch_data[5]\ : DFN1E1C0
      port map(D => \latch_data_RNO[5]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[5]_net_1\);
    
    \Data2Fifo_pad[56]\ : OUTBUF
      port map(D => \Data2Fifo_c[56]\, PAD => Data2Fifo(56));
    
    ByteRdEn_pad : OUTBUF
      port map(D => ByteRdEn_c, PAD => ByteRdEn);
    
    fifo_wrGen : WaveGenSingleZ7
      port map(Fifo_wr_c => Fifo_wr_c, sysrst_n_c => sysrst_n_c, 
        Sysclk_c => Sysclk_c, FifoRowRdOut => FifoRowRdOut, 
        FifoRowRdOut_0 => FifoRowRdOut_0);
    
    \Data2Fifo[17]\ : DFN1E1C0
      port map(D => \latch_data[17]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[17]\);
    
    \Data2ACC_pad[5]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(5));
    
    \Data2Fifo[34]\ : DFN1E1C0
      port map(D => \latch_data[34]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[34]\);
    
    \Data2ACC_pad[27]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(27));
    
    \Data2Fifo[41]\ : DFN1E1C0
      port map(D => \latch_data[41]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[41]\);
    
    \Data2ACC_pad[34]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(34));
    
    \latch_data_RNO[45]\ : MX2
      port map(A => \Data_AccIn_c[45]\, B => 
        \latch_data[45]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[45]_net_1\);
    
    \latch_data_RNO[1]\ : MX2
      port map(A => \Data_AccIn_c[1]\, B => \latch_data[1]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[1]_net_1\);
    
    \latch_data[38]\ : DFN1E1C0
      port map(D => \latch_data_RNO[38]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[38]_net_1\);
    
    \Data2Fifo[37]\ : DFN1E1C0
      port map(D => \latch_data[37]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[37]\);
    
    \Data2Fifo[61]\ : DFN1E1C0
      port map(D => \latch_data[61]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[61]\);
    
    \latch4acc_RNO[12]\ : AO1
      port map(A => SDramEn_c, B => Data2accEn, C => 
        \latch4acc[3]\, Y => \latch4acc_RNO[12]_net_1\);
    
    \LVDS_data[67]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[67]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[67]\);
    
    \LVDS_data[33]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[33]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[33]\);
    
    \Data2ACC_pad[44]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(44));
    
    \latch_data_RNO[58]\ : MX2
      port map(A => \Data_AccIn_c[58]\, B => 
        \latch_data[58]_net_1\, S => N_15, Y => 
        \latch_data_RNO[58]_net_1\);
    
    \Data_AccIn_pad[17]\ : INBUF
      port map(PAD => Data_AccIn(17), Y => \Data_AccIn_c[17]\);
    
    fifo_rst_n_RNO : OR2
      port map(A => SDramEn_c, B => LVDS_en_c, Y => fifo_rst_n_4);
    
    \LVDS_data_pad[47]\ : OUTBUF
      port map(D => \LVDS_data_c[47]\, PAD => LVDS_data(47));
    
    \Data_AccIn_pad[7]\ : INBUF
      port map(PAD => Data_AccIn(7), Y => \Data_AccIn_c[7]\);
    
    \Data2Fifo[20]\ : DFN1E1C0
      port map(D => \latch_data[20]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[20]\);
    
    \latch_data[25]\ : DFN1E1C0
      port map(D => \latch_data_RNO[25]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[25]_net_1\);
    
    \LVDS_data[22]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[22]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[22]\);
    
    \LVDS_data_pad[49]\ : OUTBUF
      port map(D => \LVDS_data_c[49]\, PAD => LVDS_data(49));
    
    \latch_data_RNO[38]\ : MX2
      port map(A => \Data_AccIn_c[38]\, B => 
        \latch_data[38]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[38]_net_1\);
    
    notfirstFrame_RNO : INV
      port map(A => LVDSRdOk_c, Y => LVDSRdOk_c_i);
    
    \Data2ACC_pad[12]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(12));
    
    \latch_data[61]\ : DFN1E1C0
      port map(D => \latch_data_RNO[61]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[61]_net_1\);
    
    \LVDS_data_pad[8]\ : OUTBUF
      port map(D => \LVDS_data_c[8]\, PAD => LVDS_data(8));
    
    \Data_fifoIN_pad[45]\ : INBUF
      port map(PAD => Data_fifoIN(45), Y => \Data_fifoIN_c[45]\);
    
    \Data2ACC_pad[58]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c[60]\, PAD => 
        Data2ACC(58));
    
    \LVDS_data_pad[2]\ : OUTBUF
      port map(D => \LVDS_data_c[2]\, PAD => LVDS_data(2));
    
    \LVDS_data[55]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[55]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[55]\);
    
    \Data2ACC_pad[39]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(39));
    
    \latch_data_RNO[65]\ : MX2
      port map(A => \Data_AccIn_c[65]\, B => 
        \latch_data[65]_net_1\, S => N_15, Y => 
        \latch_data_RNO[65]_net_1\);
    
    \Data_fifoIN_pad[36]\ : INBUF
      port map(PAD => Data_fifoIN(36), Y => \Data_fifoIN_c[36]\);
    
    \LVDS_data_pad[66]\ : OUTBUF
      port map(D => \LVDS_data_c[66]\, PAD => LVDS_data(66));
    
    \latch_data_RNO[71]\ : MX2
      port map(A => \Data_AccIn_c[71]\, B => 
        \latch_data[71]_net_1\, S => N_15, Y => N_14);
    
    \LVDS_data_pad[28]\ : OUTBUF
      port map(D => \LVDS_data_c[28]\, PAD => LVDS_data(28));
    
    \latch_data[34]\ : DFN1E1C0
      port map(D => \latch_data_RNO[34]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[34]_net_1\);
    
    \Data_AccIn_pad[4]\ : INBUF
      port map(PAD => Data_AccIn(4), Y => \Data_AccIn_c[4]\);
    
    \LVDS_data_pad[38]\ : OUTBUF
      port map(D => \LVDS_data_c[38]\, PAD => LVDS_data(38));
    
    \Data2Fifo[48]\ : DFN1E1C0
      port map(D => \latch_data[48]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[48]\);
    
    \LVDS_data[5]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[5]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[5]\);
    
    \LVDS_data_pad[17]\ : OUTBUF
      port map(D => \LVDS_data_c[17]\, PAD => LVDS_data(17));
    
    \Data2ACC_pad[49]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(49));
    
    \LVDS_data[58]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[58]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[58]\);
    
    \LVDS_data[42]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[42]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[42]\);
    
    \LVDS_data[69]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[69]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[69]\);
    
    \LVDS_data_pad[19]\ : OUTBUF
      port map(D => \LVDS_data_c[19]\, PAD => LVDS_data(19));
    
    \LVDS_data[6]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[6]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[6]\);
    
    \Data2Fifo[68]\ : DFN1E1C0
      port map(D => \latch_data[68]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[68]\);
    
    \latch_data[53]\ : DFN1E1C0
      port map(D => \latch_data_RNO[53]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[53]_net_1\);
    
    \intData2acc[18]\ : DFN1E0C0
      port map(D => \latch4acc[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => N_1059, Q => \intData2acc[18]_net_1\);
    
    \Data_AccIn_pad[19]\ : INBUF
      port map(PAD => Data_AccIn(19), Y => \Data_AccIn_c[19]\);
    
    \Data_AccIn_pad[1]\ : INBUF
      port map(PAD => Data_AccIn(1), Y => \Data_AccIn_c[1]\);
    
    \Data_fifoIN_pad[50]\ : INBUF
      port map(PAD => Data_fifoIN(50), Y => \Data_fifoIN_c[50]\);
    
    \Data2Fifo_pad[1]\ : OUTBUF
      port map(D => \Data2Fifo_c[1]\, PAD => Data2Fifo(1));
    
    \Data2Fifo_pad[41]\ : OUTBUF
      port map(D => \Data2Fifo_c[41]\, PAD => Data2Fifo(41));
    
    \latch_data[50]\ : DFN1E1C0
      port map(D => \latch_data_RNO[50]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[50]_net_1\);
    
    \LVDS_data_pad[9]\ : OUTBUF
      port map(D => \LVDS_data_c[9]\, PAD => LVDS_data(9));
    
    \Data_AccIn_pad[33]\ : INBUF
      port map(PAD => Data_AccIn(33), Y => \Data_AccIn_c[33]\);
    
    \LVDS_data[15]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[15]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[15]\);
    
    \Data_fifoIN_pad[11]\ : INBUF
      port map(PAD => Data_fifoIN(11), Y => \Data_fifoIN_c[11]\);
    
    \Data2Fifo[56]\ : DFN1E1C0
      port map(D => \latch_data[56]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[56]\);
    
    \Data2Fifo[8]\ : DFN1E1C0
      port map(D => \latch_data[8]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[8]\);
    
    \Data_fifoIN_pad[1]\ : INBUF
      port map(PAD => Data_fifoIN(1), Y => \Data_fifoIN_c[1]\);
    
    \ChSel_RNO[0]\ : NOR2A
      port map(A => latch_en, B => \ChSel[0]_net_1\, Y => 
        \ChSel_3[0]\);
    
    \LVDS_data[18]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[18]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[18]\);
    
    \Data2Fifo_pad[53]\ : OUTBUF
      port map(D => \Data2Fifo_c[53]\, PAD => Data2Fifo(53));
    
    \Data2Fifo_pad[34]\ : OUTBUF
      port map(D => \Data2Fifo_c[34]\, PAD => Data2Fifo(34));
    
    \Data_AccIn_pad[63]\ : INBUF
      port map(PAD => Data_AccIn(63), Y => \Data_AccIn_c[63]\);
    
    \Data2Fifo_pad[61]\ : OUTBUF
      port map(D => \Data2Fifo_c[61]\, PAD => Data2Fifo(61));
    
    \latch_data[21]\ : DFN1E1C0
      port map(D => \latch_data_RNO[21]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[21]_net_1\);
    
    \LVDS_data_pad[57]\ : OUTBUF
      port map(D => \LVDS_data_c[57]\, PAD => LVDS_data(57));
    
    \Data_AccIn_pad[25]\ : INBUF
      port map(PAD => Data_AccIn(25), Y => \Data_AccIn_c[25]\);
    
    \Data_fifoIN_pad[49]\ : INBUF
      port map(PAD => Data_fifoIN(49), Y => \Data_fifoIN_c[49]\);
    
    \LVDS_data_pad[63]\ : OUTBUF
      port map(D => \LVDS_data_c[63]\, PAD => LVDS_data(63));
    
    \Data_fifoIN_pad[18]\ : INBUF
      port map(PAD => Data_fifoIN(18), Y => \Data_fifoIN_c[18]\);
    
    \LVDS_data_pad[59]\ : OUTBUF
      port map(D => \LVDS_data_c[59]\, PAD => LVDS_data(59));
    
    \LVDS_data_pad[21]\ : OUTBUF
      port map(D => \LVDS_data_c[21]\, PAD => LVDS_data(21));
    
    \Data2ACC_pad[61]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c[60]\, PAD => 
        Data2ACC(61));
    
    \Data_fifoIN_pad[71]\ : INBUF
      port map(PAD => Data_fifoIN(71), Y => \Data_fifoIN_c[71]\);
    
    \LVDS_data_pad[31]\ : OUTBUF
      port map(D => \LVDS_data_c[31]\, PAD => LVDS_data(31));
    
    \LVDS_data[70]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[70]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[70]\);
    
    \Data2ACC_pad[66]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(66));
    
    \Data2ACC_pad[4]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(4));
    
    \Data_AccIn_pad[34]\ : INBUF
      port map(PAD => Data_AccIn(34), Y => \Data_AccIn_c[34]\);
    
    \Data2ACC_pad[55]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(55));
    
    \Data2Fifo_pad[37]\ : OUTBUF
      port map(D => \Data2Fifo_c[37]\, PAD => Data2Fifo(37));
    
    notfirstFrame : DFN1E0C0
      port map(D => LVDSRdOk_c_i, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => notfirstFrame_1_sqmuxa, Q => 
        \notfirstFrame\);
    
    \ChSel[0]\ : DFN1C0
      port map(D => \ChSel_3[0]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \ChSel[0]_net_1\);
    
    \Data2Fifo[10]\ : DFN1E1C0
      port map(D => \latch_data[10]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[10]\);
    
    \Data_fifoIN_pad[53]\ : INBUF
      port map(PAD => Data_fifoIN(53), Y => \Data_fifoIN_c[53]\);
    
    \Data_AccIn_pad[45]\ : INBUF
      port map(PAD => Data_AccIn(45), Y => \Data_AccIn_c[45]\);
    
    \Data2ACC_pad[3]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(3));
    
    \Data2Fifo[30]\ : DFN1E1C0
      port map(D => \latch_data[30]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[30]\);
    
    \Data2Fifo[4]\ : DFN1E1C0
      port map(D => \latch_data[4]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[4]\);
    
    \Data_AccIn_pad[64]\ : INBUF
      port map(PAD => Data_AccIn(64), Y => \Data_AccIn_c[64]\);
    
    \Data2ACC_pad[21]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(21));
    
    \Data2Fifo_pad[6]\ : OUTBUF
      port map(D => \Data2Fifo_c[6]\, PAD => Data2Fifo(6));
    
    \Data2Fifo[2]\ : DFN1E1C0
      port map(D => \latch_data[2]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[2]\);
    
    \LVDS_data_pad[46]\ : OUTBUF
      port map(D => \LVDS_data_c[46]\, PAD => LVDS_data(46));
    
    \Data2Fifo[1]\ : DFN1E1C0
      port map(D => \latch_data[1]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[1]\);
    
    \latch_data[68]\ : DFN1E1C0
      port map(D => N_8, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => SDramEn_c, Q => \latch_data[68]_net_1\);
    
    \Data2ACC_pad[26]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(26));
    
    \LVDS_data[60]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[60]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[60]\);
    
    \latch_data_RNO[19]\ : MX2
      port map(A => \Data_AccIn_c[19]\, B => 
        \latch_data[19]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[19]_net_1\);
    
    \addSel_RNIDDRE_0[1]\ : OR3A
      port map(A => SDramEn_c, B => \addSel[1]_net_1\, C => 
        \addSel[0]_net_1\, Y => N_1055);
    
    \Data_AccIn_pad[70]\ : INBUF
      port map(PAD => Data_AccIn(70), Y => \Data_AccIn_c[70]\);
    
    \Data2ACC_pad[9]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(9));
    
    \LVDS_data[66]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[66]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[66]\);
    
    \Data2Fifo_pad[36]\ : OUTBUF
      port map(D => \Data2Fifo_c[36]\, PAD => Data2Fifo(36));
    
    \Data_AccIn_pad[28]\ : INBUF
      port map(PAD => Data_AccIn(28), Y => \Data_AccIn_c[28]\);
    
    \intData2acc_RNIVV5F[3]\ : NOR3C
      port map(A => FifoRowRdOut, B => \notfirstFrame\, C => 
        \intData2acc[9]\, Y => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\);
    
    \Data2Fifo_pad[29]\ : OUTBUF
      port map(D => \Data2Fifo_c[29]\, PAD => Data2Fifo(29));
    
    \LVDS_data_pad[16]\ : OUTBUF
      port map(D => \LVDS_data_c[16]\, PAD => LVDS_data(16));
    
    \Data2ACC_pad[2]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(2));
    
    \Data_fifoIN_pad[6]\ : INBUF
      port map(PAD => Data_fifoIN(6), Y => \Data_fifoIN_c[6]\);
    
    \Data_AccIn_pad[55]\ : INBUF
      port map(PAD => Data_AccIn(55), Y => \Data_AccIn_c[55]\);
    
    \Data2Fifo[26]\ : DFN1E1C0
      port map(D => \latch_data[26]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[26]\);
    
    \Data_fifoIN_pad[60]\ : INBUF
      port map(PAD => Data_fifoIN(60), Y => \Data_fifoIN_c[60]\);
    
    \Data2Fifo_pad[50]\ : OUTBUF
      port map(D => \Data2Fifo_c[50]\, PAD => Data2Fifo(50));
    
    \Data2Fifo[51]\ : DFN1E1C0
      port map(D => \latch_data[51]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[51]\);
    
    \LVDS_data_pad[20]\ : OUTBUF
      port map(D => \LVDS_data_c[20]\, PAD => LVDS_data(20));
    
    \Data_fifoIN_pad[24]\ : INBUF
      port map(PAD => Data_fifoIN(24), Y => \Data_fifoIN_c[24]\);
    
    \ChSel_RNIBBA1_2[1]\ : OR2
      port map(A => \ChSel[1]_net_1\, B => \ChSel[0]_net_1\, Y
         => \ChSel_RNIBBA1_2[1]_net_1\);
    
    \addSel_RNIDDRE[1]\ : OR3B
      port map(A => SDramEn_c, B => \addSel[0]_net_1\, C => 
        \addSel[1]_net_1\, Y => N_1059);
    
    \LVDS_data_pad[30]\ : OUTBUF
      port map(D => \LVDS_data_c[30]\, PAD => LVDS_data(30));
    
    \Data2ACC_pad[53]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(53));
    
    \latch_data[64]\ : DFN1E1C0
      port map(D => \latch_data_RNO[64]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[64]_net_1\);
    
    \Data_fifoIN_pad[17]\ : INBUF
      port map(PAD => Data_fifoIN(17), Y => \Data_fifoIN_c[17]\);
    
    \Data_AccIn_pad[21]\ : INBUF
      port map(PAD => Data_AccIn(21), Y => \Data_AccIn_c[21]\);
    
    \latch_data[70]\ : DFN1E1C0
      port map(D => N_12, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => SDramEn_c, Q => \latch_data[70]_net_1\);
    
    \latch_data[59]\ : DFN1E1C0
      port map(D => \latch_data_RNO[59]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[59]_net_1\);
    
    \Data_fifoIN_pad[12]\ : INBUF
      port map(PAD => Data_fifoIN(12), Y => \Data_fifoIN_c[12]\);
    
    \Data2ACC_pad[64]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(64));
    
    \Data2ACC_pad[17]\ : OUTBUF
      port map(D => \Data2ACC_1_c[17]\, PAD => Data2ACC(17));
    
    \Data_AccIn_pad[48]\ : INBUF
      port map(PAD => Data_AccIn(48), Y => \Data_AccIn_c[48]\);
    
    \latch_data[17]\ : DFN1E1C0
      port map(D => \latch_data_RNO[17]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[17]_net_1\);
    
    \Data2ACC_pad[38]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(38));
    
    \Data2ACC_pad[70]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(70));
    
    \Data2Fifo_pad[14]\ : OUTBUF
      port map(D => \Data2Fifo_c[14]\, PAD => Data2Fifo(14));
    
    \latch_data_RNO[59]\ : MX2
      port map(A => \Data_AccIn_c[59]\, B => 
        \latch_data[59]_net_1\, S => N_15, Y => 
        \latch_data_RNO[59]_net_1\);
    
    \LVDS_data_pad[43]\ : OUTBUF
      port map(D => \LVDS_data_c[43]\, PAD => LVDS_data(43));
    
    \LVDS_data[32]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[32]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[32]\);
    
    \Data2Fifo_pad[28]\ : OUTBUF
      port map(D => \Data2Fifo_c[28]\, PAD => Data2Fifo(28));
    
    \LVDS_data_pad[62]\ : OUTBUF
      port map(D => \LVDS_data_c[62]\, PAD => LVDS_data(62));
    
    GND_i : GND
      port map(Y => \GND\);
    
    \LVDS_data[54]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[54]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[54]\);
    
    \Data2Fifo_pad[55]\ : OUTBUF
      port map(D => \Data2Fifo_c[55]\, PAD => Data2Fifo(55));
    
    \Data2ACC_pad[48]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(48));
    
    \latch_data[28]\ : DFN1E1C0
      port map(D => \latch_data_RNO[28]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[28]_net_1\);
    
    \Data_fifoIN_pad[51]\ : INBUF
      port map(PAD => Data_fifoIN(51), Y => \Data_fifoIN_c[51]\);
    
    \Data_AccIn_pad[41]\ : INBUF
      port map(PAD => Data_AccIn(41), Y => \Data_AccIn_c[41]\);
    
    \Data2Fifo[58]\ : DFN1E1C0
      port map(D => \latch_data[58]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[58]\);
    
    \latch_data_RNO[39]\ : MX2
      port map(A => \Data_AccIn_c[39]\, B => 
        \latch_data[39]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[39]_net_1\);
    
    \latch_data_RNO[24]\ : MX2
      port map(A => \Data_AccIn_c[24]\, B => 
        \latch_data[24]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[24]_net_1\);
    
    Adc_en_pad : INBUF
      port map(PAD => Adc_en, Y => Adc_en_c);
    
    \Data2ACC_pad[69]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(69));
    
    \LVDS_data_pad[56]\ : OUTBUF
      port map(D => \LVDS_data_c[56]\, PAD => LVDS_data(56));
    
    \intData2acc_RNIHE9E[36]\ : NOR3C
      port map(A => FifoRowRdOut, B => \notfirstFrame\, C => 
        \intData2acc[40]\, Y => 
        \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\);
    
    \Data2Fifo[43]\ : DFN1E1C0
      port map(D => \latch_data[43]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[43]\);
    
    \Data2Fifo_pad[17]\ : OUTBUF
      port map(D => \Data2Fifo_c[17]\, PAD => Data2Fifo(17));
    
    \Data2Fifo[0]\ : DFN1E1C0
      port map(D => \latch_data[0]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[0]\);
    
    \Data2ACC_pad[24]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(24));
    
    \latch_data[6]\ : DFN1E1C0
      port map(D => \latch_data_RNO[6]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[6]_net_1\);
    
    \latch_data_RNO[21]\ : MX2
      port map(A => \Data_AccIn_c[21]\, B => 
        \latch_data[21]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[21]_net_1\);
    
    \LVDS_data_pad[13]\ : OUTBUF
      port map(D => \LVDS_data_c[13]\, PAD => LVDS_data(13));
    
    \Data2Fifo[63]\ : DFN1E1C0
      port map(D => \latch_data[63]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[63]\);
    
    \latch_data_RNO[27]\ : MX2
      port map(A => \Data_AccIn_c[27]\, B => 
        \latch_data[27]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[27]_net_1\);
    
    \intData2acc_RNIAA9E[22]\ : NOR3C
      port map(A => FifoRowRdOut, B => \notfirstFrame\, C => 
        \intData2acc[24]\, Y => 
        \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\);
    
    \Data2Fifo_pad[52]\ : OUTBUF
      port map(D => \Data2Fifo_c[52]\, PAD => Data2Fifo(52));
    
    \Data_AccIn_pad[58]\ : INBUF
      port map(PAD => Data_AccIn(58), Y => \Data_AccIn_c[58]\);
    
    \latch_data_RNO[44]\ : MX2
      port map(A => \Data_AccIn_c[44]\, B => 
        \latch_data[44]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[44]_net_1\);
    
    \latch_data_RNO[26]\ : MX2
      port map(A => \Data_AccIn_c[26]\, B => 
        \latch_data[26]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[26]_net_1\);
    
    \Data_fifoIN_pad[58]\ : INBUF
      port map(PAD => Data_fifoIN(58), Y => \Data_fifoIN_c[58]\);
    
    \Data_fifoIN_pad[34]\ : INBUF
      port map(PAD => Data_fifoIN(34), Y => \Data_fifoIN_c[34]\);
    
    \Data_fifoIN_pad[2]\ : INBUF
      port map(PAD => Data_fifoIN(2), Y => \Data_fifoIN_c[2]\);
    
    \Data_fifoIN_pad[63]\ : INBUF
      port map(PAD => Data_fifoIN(63), Y => \Data_fifoIN_c[63]\);
    
    \ChSel_RNIBBA1_0[1]\ : OR2A
      port map(A => \ChSel[1]_net_1\, B => \ChSel[0]_net_1\, Y
         => \ChSel_RNIBBA1_0[1]_net_1\);
    
    \LVDS_data[21]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[21]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[21]\);
    
    latchGen : WaveGenSingleZ4
      port map(PrState_4 => \latchGen.PrState[4]\, PrState_0(4)
         => \latchGen.PrState_0[4]\, latch_en => latch_en, 
        FifoRowRdOut => FifoRowRdOut, FifoRowRdOut_0 => 
        FifoRowRdOut_0, sysrst_n_c => sysrst_n_c, FifoRowRdOut_i
         => FifoRowRdOut_i, Sysclk_c => Sysclk_c);
    
    \latch_data[24]\ : DFN1E1C0
      port map(D => \latch_data_RNO[24]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[24]_net_1\);
    
    \Data_fifoIN_pad[25]\ : INBUF
      port map(PAD => Data_fifoIN(25), Y => \Data_fifoIN_c[25]\);
    
    \LVDS_data[14]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[14]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[14]\);
    
    \LVDS_data[53]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[53]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[53]\);
    
    \latch_data[52]\ : DFN1E1C0
      port map(D => \latch_data_RNO[52]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[52]_net_1\);
    
    \latch_data_RNO[41]\ : MX2
      port map(A => \Data_AccIn_c[41]\, B => 
        \latch_data[41]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[41]_net_1\);
    
    \latch_data_RNO[0]\ : MX2
      port map(A => \Data_AccIn_c[0]\, B => \latch_data[0]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[0]_net_1\);
    
    \Data2Fifo_pad[49]\ : OUTBUF
      port map(D => \Data2Fifo_c[49]\, PAD => Data2Fifo(49));
    
    \Data2Fifo_pad[33]\ : OUTBUF
      port map(D => \Data2Fifo_c[33]\, PAD => Data2Fifo(33));
    
    \latch_data_RNO[47]\ : MX2
      port map(A => \Data_AccIn_c[47]\, B => 
        \latch_data[47]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[47]_net_1\);
    
    \latch_data[56]\ : DFN1E1C0
      port map(D => \latch_data_RNO[56]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[56]_net_1\);
    
    \Data2Fifo_pad[3]\ : OUTBUF
      port map(D => \Data2Fifo_c[3]\, PAD => Data2Fifo(3));
    
    \latch_data_RNO[13]\ : MX2
      port map(A => \Data_AccIn_c[13]\, B => 
        \latch_data[13]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[13]_net_1\);
    
    \latch_data_RNO[10]\ : MX2
      port map(A => \Data_AccIn_c[10]\, B => 
        \latch_data[10]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[10]_net_1\);
    
    \Data_AccIn_pad[51]\ : INBUF
      port map(PAD => Data_AccIn(51), Y => \Data_AccIn_c[51]\);
    
    \Data2ACC_pad[29]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(29));
    
    lvdsFifoRowRdOutEnGen : WaveGenSingleZ3
      port map(sysrst_n_c => sysrst_n_c, Sysclk_c => Sysclk_c, 
        LVDS_en_c => LVDS_en_c, lvdsFifoRowRdOut => 
        lvdsFifoRowRdOut, lvdsFifoRowRdOut_i => 
        lvdsFifoRowRdOut_i);
    
    \latch_data_RNO[46]\ : MX2
      port map(A => \Data_AccIn_c[46]\, B => 
        \latch_data[46]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[46]_net_1\);
    
    sdramENReg : DFN1C0
      port map(D => SDramEn_c, CLK => Sysclk_c, CLR => sysrst_n_c, 
        Q => \sdramENReg\);
    
    \LVDS_data[65]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[65]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[65]\);
    
    \Data_AccIn_pad[37]\ : INBUF
      port map(PAD => Data_AccIn(37), Y => \Data_AccIn_c[37]\);
    
    \LVDS_data[0]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[0]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[0]\);
    
    \LVDS_data_pad[7]\ : OUTBUF
      port map(D => \LVDS_data_c[7]\, PAD => LVDS_data(7));
    
    \latch_data_RNO[64]\ : MX2
      port map(A => \Data_AccIn_c[64]\, B => 
        \latch_data[64]_net_1\, S => N_15, Y => 
        \latch_data_RNO[64]_net_1\);
    
    \LVDS_data[41]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[41]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[41]\);
    
    \latch_data[0]\ : DFN1E1C0
      port map(D => \latch_data_RNO[0]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[0]_net_1\);
    
    \Data2Fifo_pad[16]\ : OUTBUF
      port map(D => \Data2Fifo_c[16]\, PAD => Data2Fifo(16));
    
    \latch_data[3]\ : DFN1E1C0
      port map(D => \latch_data_RNO[3]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[3]_net_1\);
    
    \Data2Fifo[16]\ : DFN1E1C0
      port map(D => \latch_data[16]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[16]\);
    
    \LVDS_data[27]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[27]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[27]\);
    
    \Data2Fifo[21]\ : DFN1E1C0
      port map(D => \latch_data[21]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[21]\);
    
    \latch_data[13]\ : DFN1E1C0
      port map(D => \latch_data_RNO[13]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[13]_net_1\);
    
    \LVDS_data[68]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[68]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[68]\);
    
    \latch_data_RNO[61]\ : MX2
      port map(A => \Data_AccIn_c[61]\, B => 
        \latch_data[61]_net_1\, S => N_15, Y => 
        \latch_data_RNO[61]_net_1\);
    
    \LVDS_data_pad[53]\ : OUTBUF
      port map(D => \LVDS_data_c[53]\, PAD => LVDS_data(53));
    
    \latch_data_RNO[67]\ : MX2
      port map(A => \Data_AccIn_c[67]\, B => 
        \latch_data[67]_net_1\, S => N_15, Y => 
        \latch_data_RNO[67]_net_1\);
    
    \Data2ACC_pad[50]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(50));
    
    \Data2ACC_pad[35]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(35));
    
    \Data2Fifo_pad[69]\ : OUTBUF
      port map(D => \Data2Fifo_c[69]\, PAD => Data2Fifo(69));
    
    \latch_data[2]\ : DFN1E1C0
      port map(D => \latch_data_RNO[2]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[2]_net_1\);
    
    \Data_fifoIN_pad[16]\ : INBUF
      port map(PAD => Data_fifoIN(16), Y => \Data_fifoIN_c[16]\);
    
    \Data2Fifo[36]\ : DFN1E1C0
      port map(D => \latch_data[36]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[36]\);
    
    \Data_AccIn_pad[67]\ : INBUF
      port map(PAD => Data_AccIn(67), Y => \Data_AccIn_c[67]\);
    
    \latch_data[55]\ : DFN1E1C0
      port map(D => \latch_data_RNO[55]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[55]_net_1\);
    
    \LVDS_data[1]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[1]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[1]\);
    
    \latch_data[10]\ : DFN1E1C0
      port map(D => \latch_data_RNO[10]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[10]_net_1\);
    
    \LVDS_data[13]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[13]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[13]\);
    
    \latch_data_RNO[66]\ : MX2
      port map(A => \Data_AccIn_c[66]\, B => 
        \latch_data[66]_net_1\, S => N_15, Y => 
        \latch_data_RNO[66]_net_1\);
    
    \Data_AccIn_pad[22]\ : INBUF
      port map(PAD => Data_AccIn(22), Y => \Data_AccIn_c[22]\);
    
    \Data2Fifo_pad[48]\ : OUTBUF
      port map(D => \Data2Fifo_c[48]\, PAD => Data2Fifo(48));
    
    \Data_fifoIN_pad[40]\ : INBUF
      port map(PAD => Data_fifoIN(40), Y => \Data_fifoIN_c[40]\);
    
    \Data2ACC_pad[45]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(45));
    
    \LVDS_data[47]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[47]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[47]\);
    
    \Data_AccIn_pad[39]\ : INBUF
      port map(PAD => Data_AccIn(39), Y => \Data_AccIn_c[39]\);
    
    fifo_rd_pad : OUTBUF
      port map(D => fifo_rd_c, PAD => fifo_rd);
    
    \LVDS_data_pad[65]\ : OUTBUF
      port map(D => \LVDS_data_c[65]\, PAD => LVDS_data(65));
    
    \LVDS_data[29]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[29]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[29]\);
    
    \Data_AccIn_pad[8]\ : INBUF
      port map(PAD => Data_AccIn(8), Y => \Data_AccIn_c[8]\);
    
    \intData2acc_RNO[36]\ : NOR3B
      port map(A => SDramEn_c, B => \addSel[1]_net_1\, C => 
        \addSel[0]_net_1\, Y => intData2acc_2_sqmuxa);
    
    \intData2acc[36]\ : DFN1E1C0
      port map(D => \latch4acc[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => intData2acc_2_sqmuxa, Q => 
        \intData2acc[40]\);
    
    \latch_data_RNO[53]\ : MX2
      port map(A => \Data_AccIn_c[53]\, B => 
        \latch_data[53]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[53]_net_1\);
    
    \latch_data_RNO[50]\ : MX2
      port map(A => \Data_AccIn_c[50]\, B => 
        \latch_data[50]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[50]_net_1\);
    
    \Data_fifoIN_pad[35]\ : INBUF
      port map(PAD => Data_fifoIN(35), Y => \Data_fifoIN_c[35]\);
    
    \Data_fifoIN_pad[29]\ : INBUF
      port map(PAD => Data_fifoIN(29), Y => \Data_fifoIN_c[29]\);
    
    \Data2Fifo[28]\ : DFN1E1C0
      port map(D => \latch_data[28]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[28]\);
    
    \LVDS_data_pad[42]\ : OUTBUF
      port map(D => \LVDS_data_c[42]\, PAD => LVDS_data(42));
    
    \latch_data_RNO[7]\ : MX2
      port map(A => \Data_AccIn_c[7]\, B => \latch_data[7]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[7]_net_1\);
    
    \latch_data_RNO[33]\ : MX2
      port map(A => \Data_AccIn_c[33]\, B => 
        \latch_data[33]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[33]_net_1\);
    
    \latch_data_RNO[30]\ : MX2
      port map(A => \Data_AccIn_c[30]\, B => 
        \latch_data[30]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[30]_net_1\);
    
    \Data_fifoIN_pad[57]\ : INBUF
      port map(PAD => Data_fifoIN(57), Y => \Data_fifoIN_c[57]\);
    
    \Data_AccIn_pad[42]\ : INBUF
      port map(PAD => Data_AccIn(42), Y => \Data_AccIn_c[42]\);
    
    \Data_AccIn_pad[69]\ : INBUF
      port map(PAD => Data_AccIn(69), Y => \Data_AccIn_c[69]\);
    
    \Data2Fifo_pad[68]\ : OUTBUF
      port map(D => \Data2Fifo_c[68]\, PAD => Data2Fifo(68));
    
    \Data_fifoIN_pad[61]\ : INBUF
      port map(PAD => Data_fifoIN(61), Y => \Data_fifoIN_c[61]\);
    
    \Data2ACC_pad[11]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(11));
    
    \Data_fifoIN_pad[52]\ : INBUF
      port map(PAD => Data_fifoIN(52), Y => \Data_fifoIN_c[52]\);
    
    \latch_data[47]\ : DFN1E1C0
      port map(D => \latch_data_RNO[47]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[47]_net_1\);
    
    \LVDS_data[49]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[49]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[49]\);
    
    \Data2ACC_pad[16]\ : OUTBUF
      port map(D => \Data2ACC_1_c[16]\, PAD => Data2ACC(16));
    
    \Data2Fifo_pad[30]\ : OUTBUF
      port map(D => \Data2Fifo_c[30]\, PAD => Data2Fifo(30));
    
    \Data_AccIn_pad[9]\ : INBUF
      port map(PAD => Data_AccIn(9), Y => \Data_AccIn_c[9]\);
    
    \Data_AccIn_pad[15]\ : INBUF
      port map(PAD => Data_AccIn(15), Y => \Data_AccIn_c[15]\);
    
    lvds_fifoRdGen : WaveGenSingleZ2
      port map(lvds_fifoRd => lvds_fifoRd, sysrst_n_c => 
        sysrst_n_c, Sysclk_c => Sysclk_c, lvdsFifoRowRdOut => 
        lvdsFifoRowRdOut);
    
    \LVDS_data_pad[12]\ : OUTBUF
      port map(D => \LVDS_data_c[12]\, PAD => LVDS_data(12));
    
    \Data2ACC_pad[33]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(33));
    
    \Data_AccIn_pad[6]\ : INBUF
      port map(PAD => Data_AccIn(6), Y => \Data_AccIn_c[6]\);
    
    \Data_fifoIN_pad[68]\ : INBUF
      port map(PAD => Data_fifoIN(68), Y => \Data_fifoIN_c[68]\);
    
    \Data_AccIn_pad[20]\ : INBUF
      port map(PAD => Data_AccIn(20), Y => \Data_AccIn_c[20]\);
    
    \latch_data[51]\ : DFN1E1C0
      port map(D => \latch_data_RNO[51]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[51]_net_1\);
    
    \Data2ACC_pad[52]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(52));
    
    \latch_data_RNO[4]\ : MX2
      port map(A => \Data_AccIn_c[4]\, B => \latch_data[4]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[4]_net_1\);
    
    \Data2ACC_pad[43]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(43));
    
    \LVDS_data[3]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[3]\);
    
    \Data2ACC_pad[0]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(0));
    
    \latch_data_RNO[15]\ : MX2
      port map(A => \Data_AccIn_c[15]\, B => 
        \latch_data[15]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[15]_net_1\);
    
    \Data2Fifo_pad[13]\ : OUTBUF
      port map(D => \Data2Fifo_c[13]\, PAD => Data2Fifo(13));
    
    \LVDS_data_pad[27]\ : OUTBUF
      port map(D => \LVDS_data_c[27]\, PAD => LVDS_data(27));
    
    \Data_fifoIN_pad[43]\ : INBUF
      port map(PAD => Data_fifoIN(43), Y => \Data_fifoIN_c[43]\);
    
    \Data_AccIn_pad[52]\ : INBUF
      port map(PAD => Data_AccIn(52), Y => \Data_AccIn_c[52]\);
    
    \Data2Fifo[70]\ : DFN1E1C0
      port map(D => \latch_data[70]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[70]\);
    
    \addSel_RNO[0]\ : NOR2A
      port map(A => Adc_en_c, B => \addSel[0]_net_1\, Y => 
        \addSel_2[0]\);
    
    \LVDS_data_pad[37]\ : OUTBUF
      port map(D => \LVDS_data_c[37]\, PAD => LVDS_data(37));
    
    \LVDS_data_pad[29]\ : OUTBUF
      port map(D => \LVDS_data_c[29]\, PAD => LVDS_data(29));
    
    \LVDS_data_pad[71]\ : OUTBUF
      port map(D => \LVDS_data_c[71]\, PAD => LVDS_data(71));
    
    \LVDS_data_pad[39]\ : OUTBUF
      port map(D => \LVDS_data_c[39]\, PAD => LVDS_data(39));
    
    \Data2Fifo_pad[35]\ : OUTBUF
      port map(D => \Data2Fifo_c[35]\, PAD => Data2Fifo(35));
    
    FifoRowRdOutGen : WaveGenSingleZ9
      port map(FifoRowRdOut => FifoRowRdOut, SDramEn_c => 
        SDramEn_c, FifoRowRdOut_i => FifoRowRdOut_i, sysrst_n_c
         => sysrst_n_c, Sysclk_c => Sysclk_c, FifoRowRdOut_0 => 
        FifoRowRdOut_0);
    
    \Data2Fifo_pad[51]\ : OUTBUF
      port map(D => \Data2Fifo_c[51]\, PAD => Data2Fifo(51));
    
    \Data2Fifo[11]\ : DFN1E1C0
      port map(D => \latch_data[11]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[11]\);
    
    \latch_data_RNO[22]\ : MX2
      port map(A => \Data_AccIn_c[22]\, B => 
        \latch_data[22]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[22]_net_1\);
    
    \Data_fifoIN_pad[39]\ : INBUF
      port map(PAD => Data_fifoIN(39), Y => \Data_fifoIN_c[39]\);
    
    \Data2ACC_pad[68]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(68));
    
    \Data2Fifo[31]\ : DFN1E1C0
      port map(D => \latch_data[31]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[31]\);
    
    \Data_AccIn_pad[40]\ : INBUF
      port map(PAD => Data_AccIn(40), Y => \Data_AccIn_c[40]\);
    
    \LVDS_data_pad[52]\ : OUTBUF
      port map(D => \LVDS_data_c[52]\, PAD => LVDS_data(52));
    
    \Data_AccIn_pad[26]\ : INBUF
      port map(PAD => Data_AccIn(26), Y => \Data_AccIn_c[26]\);
    
    \Data2Fifo_pad[32]\ : OUTBUF
      port map(D => \Data2Fifo_c[32]\, PAD => Data2Fifo(32));
    
    \Data2Fifo[53]\ : DFN1E1C0
      port map(D => \latch_data[53]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[53]\);
    
    \Data_fifoIN_pad[4]\ : INBUF
      port map(PAD => Data_fifoIN(4), Y => \Data_fifoIN_c[4]\);
    
    \latch_data_RNO[42]\ : MX2
      port map(A => \Data_AccIn_c[42]\, B => 
        \latch_data[42]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[42]_net_1\);
    
    \Data_AccIn_pad[18]\ : INBUF
      port map(PAD => Data_AccIn(18), Y => \Data_AccIn_c[18]\);
    
    \latch_data[19]\ : DFN1E1C0
      port map(D => \latch_data_RNO[19]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[19]_net_1\);
    
    \LVDS_data[20]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[20]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[20]\);
    
    \Data2Fifo[49]\ : DFN1E1C0
      port map(D => \latch_data[49]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[49]\);
    
    \latch_data_RNO[8]\ : MX2
      port map(A => \Data_AccIn_c[8]\, B => \latch_data[8]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[8]_net_1\);
    
    \latch_data[43]\ : DFN1E1C0
      port map(D => \latch_data_RNO[43]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[43]_net_1\);
    
    \Data2Fifo[69]\ : DFN1E1C0
      port map(D => \latch_data[69]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[69]\);
    
    \LVDS_data_pad[45]\ : OUTBUF
      port map(D => \LVDS_data_c[45]\, PAD => LVDS_data(45));
    
    \LVDS_data_pad[64]\ : OUTBUF
      port map(D => \LVDS_data_c[64]\, PAD => LVDS_data(64));
    
    \latch_data[37]\ : DFN1E1C0
      port map(D => \latch_data_RNO[37]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[37]_net_1\);
    
    \LVDS_data[26]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[26]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[26]\);
    
    \Data2Fifo[18]\ : DFN1E1C0
      port map(D => \latch_data[18]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[18]\);
    
    \Data2ACC_pad[14]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(14));
    
    \latch_data_RNO[55]\ : MX2
      port map(A => \Data_AccIn_c[55]\, B => 
        \latch_data[55]_net_1\, S => N_15, Y => 
        \latch_data_RNO[55]_net_1\);
    
    \addSel[1]\ : DFN1C0
      port map(D => \addSel_2[1]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \addSel[1]_net_1\);
    
    \Data2ACC_pad[28]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(28));
    
    \Data_AccIn_pad[11]\ : INBUF
      port map(PAD => Data_AccIn(11), Y => \Data_AccIn_c[11]\);
    
    \latch_data[40]\ : DFN1E1C0
      port map(D => \latch_data_RNO[40]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[40]_net_1\);
    
    \Data_fifoIN_pad[56]\ : INBUF
      port map(PAD => Data_fifoIN(56), Y => \Data_fifoIN_c[56]\);
    
    \Data_AccIn_pad[46]\ : INBUF
      port map(PAD => Data_AccIn(46), Y => \Data_AccIn_c[46]\);
    
    \Data2Fifo[38]\ : DFN1E1C0
      port map(D => \latch_data[38]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[38]\);
    
    \latch_data[1]\ : DFN1E1C0
      port map(D => \latch_data_RNO[1]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[1]_net_1\);
    
    \LVDS_data[31]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[31]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[31]\);
    
    \latch_data_RNO[35]\ : MX2
      port map(A => \Data_AccIn_c[35]\, B => 
        \latch_data[35]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[35]_net_1\);
    
    \Data_AccIn_pad[50]\ : INBUF
      port map(PAD => Data_AccIn(50), Y => \Data_AccIn_c[50]\);
    
    \LVDS_data[40]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[40]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[40]\);
    
    \latch_data_RNO[62]\ : MX2
      port map(A => \Data_AccIn_c[62]\, B => 
        \latch_data[62]_net_1\, S => N_15, Y => 
        \latch_data_RNO[62]_net_1\);
    
    fifo_rd_pad_RNO : OR2
      port map(A => lvds_fifoRd, B => interFifo_rd, Y => 
        fifo_rd_c);
    
    \latch_data[7]\ : DFN1E1C0
      port map(D => \latch_data_RNO[7]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[7]_net_1\);
    
    \Data_fifoIN_pad[67]\ : INBUF
      port map(PAD => Data_fifoIN(67), Y => \Data_fifoIN_c[67]\);
    
    \Data2Fifo[6]\ : DFN1E1C0
      port map(D => \latch_data[6]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[6]\);
    
    \addSel_RNO[1]\ : XA1
      port map(A => \addSel[0]_net_1\, B => \addSel[1]_net_1\, C
         => Adc_en_c, Y => \addSel_2[1]\);
    
    \Data2Fifo_pad[24]\ : OUTBUF
      port map(D => \Data2Fifo_c[24]\, PAD => Data2Fifo(24));
    
    \LVDS_data_pad[15]\ : OUTBUF
      port map(D => \LVDS_data_c[15]\, PAD => LVDS_data(15));
    
    \LVDS_data[64]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[64]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[64]\);
    
    \LVDS_data[46]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[46]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[46]\);
    
    \intData2acc_RNO[56]\ : NOR3C
      port map(A => SDramEn_c, B => \addSel[1]_net_1\, C => 
        \addSel[0]_net_1\, Y => intData2acc_3_sqmuxa);
    
    \LVDS_data[52]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[52]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[52]\);
    
    \LVDS_data_pad[70]\ : OUTBUF
      port map(D => \LVDS_data_c[70]\, PAD => LVDS_data(70));
    
    \Data_fifoIN_pad[62]\ : INBUF
      port map(PAD => Data_fifoIN(62), Y => \Data_fifoIN_c[62]\);
    
    \Data2ACC_pad[19]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(19));
    
    \Data2Fifo_pad[10]\ : OUTBUF
      port map(D => \Data2Fifo_c[10]\, PAD => Data2Fifo(10));
    
    \Data_fifoIN_pad[41]\ : INBUF
      port map(PAD => Data_fifoIN(41), Y => \Data_fifoIN_c[41]\);
    
    \Data2ACC_pad[30]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(30));
    
    \Data_AccIn_pad[5]\ : INBUF
      port map(PAD => Data_AccIn(5), Y => \Data_AccIn_c[5]\);
    
    \LVDS_data[37]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[37]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[37]\);
    
    \Data2ACC_pad[40]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(40));
    
    \Data2Fifo_pad[27]\ : OUTBUF
      port map(D => \Data2Fifo_c[27]\, PAD => Data2Fifo(27));
    
    \Data_fifoIN_pad[5]\ : INBUF
      port map(PAD => Data_fifoIN(5), Y => \Data_fifoIN_c[5]\);
    
    \Data_AccIn_pad[56]\ : INBUF
      port map(PAD => Data_AccIn(56), Y => \Data_AccIn_c[56]\);
    
    \Data2Fifo[42]\ : DFN1E1C0
      port map(D => \latch_data[42]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[42]\);
    
    \Data2ACC_pad[65]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(65));
    
    \latch_data[71]\ : DFN1E1C0
      port map(D => N_14, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => SDramEn_c, Q => \latch_data[71]_net_1\);
    
    \latch_data[12]\ : DFN1E1C0
      port map(D => \latch_data_RNO[12]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[12]_net_1\);
    
    \Data2Fifo[62]\ : DFN1E1C0
      port map(D => \latch_data[62]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[62]\);
    
    \latch_data[58]\ : DFN1E1C0
      port map(D => \latch_data_RNO[58]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[58]_net_1\);
    
    \latch_data[16]\ : DFN1E1C0
      port map(D => \latch_data_RNO[16]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[16]_net_1\);
    
    Fifo_wr_pad : OUTBUF
      port map(D => Fifo_wr_c, PAD => Fifo_wr);
    
    \Data_fifoIN_pad[48]\ : INBUF
      port map(PAD => Data_fifoIN(48), Y => \Data_fifoIN_c[48]\);
    
    \LVDS_data[63]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[63]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[63]\);
    
    \Data2Fifo_pad[0]\ : OUTBUF
      port map(D => \Data2Fifo_c[0]\, PAD => Data2Fifo(0));
    
    \LVDS_data[12]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[12]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[12]\);
    
    \Data2Fifo_pad[15]\ : OUTBUF
      port map(D => \Data2Fifo_c[15]\, PAD => Data2Fifo(15));
    
    \Data2ACC_pad[7]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(7));
    
    \LVDS_data_pad[26]\ : OUTBUF
      port map(D => \LVDS_data_c[26]\, PAD => LVDS_data(26));
    
    \Data_fifoIN_pad[14]\ : INBUF
      port map(PAD => Data_fifoIN(14), Y => \Data_fifoIN_c[14]\);
    
    \LVDS_data_pad[55]\ : OUTBUF
      port map(D => \LVDS_data_c[55]\, PAD => LVDS_data(55));
    
    \latch_data_RNO[28]\ : MX2
      port map(A => \Data_AccIn_c[28]\, B => 
        \latch_data[28]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[28]_net_1\);
    
    \LVDS_data_pad[36]\ : OUTBUF
      port map(D => \LVDS_data_c[36]\, PAD => LVDS_data(36));
    
    \Data_AccIn_pad[23]\ : INBUF
      port map(PAD => Data_AccIn(23), Y => \Data_AccIn_c[23]\);
    
    \LVDS_data[39]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[39]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[39]\);
    
    \latch_data[33]\ : DFN1E1C0
      port map(D => \latch_data_RNO[33]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[33]_net_1\);
    
    fifo_rdGen : WaveGenSingleZ8
      port map(PrState_3 => \latchGen.PrState[4]\, PrState_0(4)
         => \latchGen.PrState_0[4]\, interFifo_rd => interFifo_rd, 
        sysrst_n_c => sysrst_n_c, Sysclk_c => Sysclk_c, 
        FifoRowRdOut => FifoRowRdOut, FifoRowRdOut_0 => 
        FifoRowRdOut_0);
    
    \Data2Fifo[45]\ : DFN1E1C0
      port map(D => \latch_data[45]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[45]\);
    
    \latch_data_RNO[9]\ : MX2
      port map(A => \Data_AccIn_c[9]\, B => \latch_data[9]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[9]_net_1\);
    
    \Data2Fifo[23]\ : DFN1E1C0
      port map(D => \latch_data[23]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[23]\);
    
    \LVDS_data_pad[68]\ : OUTBUF
      port map(D => \LVDS_data_c[68]\, PAD => LVDS_data(68));
    
    \latch_data_RNO[3]\ : MX2
      port map(A => \Data_AccIn_c[3]\, B => \latch_data[3]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[3]_net_1\);
    
    \Data2Fifo[65]\ : DFN1E1C0
      port map(D => \latch_data[65]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[65]\);
    
    \Data2Fifo_pad[26]\ : OUTBUF
      port map(D => \Data2Fifo_c[26]\, PAD => Data2Fifo(26));
    
    \Data2ACC_pad[25]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(25));
    
    \Data2Fifo_pad[12]\ : OUTBUF
      port map(D => \Data2Fifo_c[12]\, PAD => Data2Fifo(12));
    
    \Data2Fifo[9]\ : DFN1E1C0
      port map(D => \latch_data[9]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[9]\);
    
    \latch_data[30]\ : DFN1E1C0
      port map(D => \latch_data_RNO[30]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[30]_net_1\);
    
    \latch_data[54]\ : DFN1E1C0
      port map(D => \latch_data_RNO[54]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[54]_net_1\);
    
    \latch_data[15]\ : DFN1E1C0
      port map(D => \latch_data_RNO[15]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[15]_net_1\);
    
    \latch_data_RNO[48]\ : MX2
      port map(A => \Data_AccIn_c[48]\, B => 
        \latch_data[48]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[48]_net_1\);
    
    \Data_fifoIN_pad[20]\ : INBUF
      port map(PAD => Data_fifoIN(20), Y => \Data_fifoIN_c[20]\);
    
    \Data2ACC_pad_RNO[16]\ : NOR3C
      port map(A => FifoRowRdOut, B => \notfirstFrame\, C => 
        \intData2acc[16]_net_1\, Y => \Data2ACC_1_c[16]\);
    
    \Data2ACC_pad[57]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c[60]\, PAD => 
        Data2ACC(57));
    
    \LVDS_data[25]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[25]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[25]\);
    
    data2lvdsENGen : WaveGenSingleZ1
      port map(sysrst_n_c => sysrst_n_c, Sysclk_c => Sysclk_c, 
        LVDS_en_c => LVDS_en_c, lvdsFifoRowRdOut => 
        lvdsFifoRowRdOut, LVDS_data_0_sqmuxa => 
        LVDS_data_0_sqmuxa);
    
    \LVDS_data_pad[44]\ : OUTBUF
      port map(D => \LVDS_data_c[44]\, PAD => LVDS_data(44));
    
    \Data2Fifo_pad[44]\ : OUTBUF
      port map(D => \Data2Fifo_c[44]\, PAD => Data2Fifo(44));
    
    \Data_AccIn_pad[43]\ : INBUF
      port map(PAD => Data_AccIn(43), Y => \Data_AccIn_c[43]\);
    
    \Data2ACC_pad[32]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(32));
    
    \LVDS_data[9]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[9]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[9]\);
    
    \Data2Fifo[44]\ : DFN1E1C0
      port map(D => \latch_data[44]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[44]\);
    
    \Data2Fifo_pad[70]\ : OUTBUF
      port map(D => \Data2Fifo_c[70]\, PAD => Data2Fifo(70));
    
    \Data2ACC_pad[63]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(63));
    
    \Data_AccIn_pad[12]\ : INBUF
      port map(PAD => Data_AccIn(12), Y => \Data_AccIn_c[12]\);
    
    \Data2Fifo[64]\ : DFN1E1C0
      port map(D => \latch_data[64]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[64]\);
    
    \Data2Fifo[47]\ : DFN1E1C0
      port map(D => \latch_data[47]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[47]\);
    
    \Data2ACC_pad[42]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(42));
    
    \Data_AccIn_pad[24]\ : INBUF
      port map(PAD => Data_AccIn(24), Y => \Data_AccIn_c[24]\);
    
    \LVDS_data[28]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[28]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[28]\);
    
    \Data_fifoIN_pad[0]\ : INBUF
      port map(PAD => Data_fifoIN(0), Y => \Data_fifoIN_c[0]\);
    
    \Data2Fifo_pad[31]\ : OUTBUF
      port map(D => \Data2Fifo_c[31]\, PAD => Data2Fifo(31));
    
    \Data_fifoIN_pad[66]\ : INBUF
      port map(PAD => Data_fifoIN(66), Y => \Data_fifoIN_c[66]\);
    
    \latch_data[49]\ : DFN1E1C0
      port map(D => \latch_data_RNO[49]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[49]_net_1\);
    
    \latch_data_RNO[68]\ : MX2
      port map(A => \Data_AccIn_c[68]\, B => 
        \latch_data[68]_net_1\, S => N_15, Y => N_8);
    
    \Data2Fifo[67]\ : DFN1E1C0
      port map(D => \latch_data[67]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[67]\);
    
    \Data2Fifo[5]\ : DFN1E1C0
      port map(D => \latch_data[5]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[5]\);
    
    \LVDS_data[45]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[45]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[45]\);
    
    \LVDS_data_pad[14]\ : OUTBUF
      port map(D => \LVDS_data_c[14]\, PAD => LVDS_data(14));
    
    \Data2Fifo[7]\ : DFN1E1C0
      port map(D => \latch_data[7]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[7]\);
    
    \Data2Fifo_pad[47]\ : OUTBUF
      port map(D => \Data2Fifo_c[47]\, PAD => Data2Fifo(47));
    
    \LVDS_data_pad[23]\ : OUTBUF
      port map(D => \LVDS_data_c[23]\, PAD => LVDS_data(23));
    
    \LVDS_data_pad[33]\ : OUTBUF
      port map(D => \LVDS_data_c[33]\, PAD => LVDS_data(33));
    
    \Data2Fifo_pad[64]\ : OUTBUF
      port map(D => \Data2Fifo_c[64]\, PAD => Data2Fifo(64));
    
    \latch_data[67]\ : DFN1E1C0
      port map(D => \latch_data_RNO[67]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[67]_net_1\);
    
    \LVDS_data_pad[1]\ : OUTBUF
      port map(D => \LVDS_data_c[1]\, PAD => LVDS_data(1));
    
    \Data_fifoIN_pad[47]\ : INBUF
      port map(PAD => Data_fifoIN(47), Y => \Data_fifoIN_c[47]\);
    
    \LVDS_data_pad[61]\ : OUTBUF
      port map(D => \LVDS_data_c[61]\, PAD => LVDS_data(61));
    
    \LVDS_data[48]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[48]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[48]\);
    
    \Data_fifoIN_pad[15]\ : INBUF
      port map(PAD => Data_fifoIN(15), Y => \Data_fifoIN_c[15]\);
    
    \LVDS_data_pad[6]\ : OUTBUF
      port map(D => \LVDS_data_c[6]\, PAD => LVDS_data(6));
    
    \Data_fifoIN_pad[42]\ : INBUF
      port map(PAD => Data_fifoIN(42), Y => \Data_fifoIN_c[42]\);
    
    \Data_AccIn_pad[53]\ : INBUF
      port map(PAD => Data_AccIn(53), Y => \Data_AccIn_c[53]\);
    
    \Data2Fifo_pad[59]\ : OUTBUF
      port map(D => \Data2Fifo_c[59]\, PAD => Data2Fifo(59));
    
    \latch_data_RNO[5]\ : MX2
      port map(A => \Data_AccIn_c[5]\, B => \latch_data[5]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[5]_net_1\);
    
    \intData2acc[16]\ : DFN1E0C0
      port map(D => \latch4acc[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => N_1055, Q => \intData2acc[16]_net_1\);
    
    \Data_AccIn_pad[44]\ : INBUF
      port map(PAD => Data_AccIn(44), Y => \Data_AccIn_c[44]\);
    
    \Data2ACC_pad[23]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(23));
    
    \Data2ACC_pad[71]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(71));
    
    \Data_fifoIN_pad[30]\ : INBUF
      port map(PAD => Data_fifoIN(30), Y => \Data_fifoIN_c[30]\);
    
    \Data2Fifo[59]\ : DFN1E1C0
      port map(D => \latch_data[59]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[59]\);
    
    \latch_data[11]\ : DFN1E1C0
      port map(D => \latch_data_RNO[11]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[11]_net_1\);
    
    \Data2Fifo_pad[67]\ : OUTBUF
      port map(D => \Data2Fifo_c[67]\, PAD => Data2Fifo(67));
    
    \Data_fifoIN_pad[23]\ : INBUF
      port map(PAD => Data_fifoIN(23), Y => \Data_fifoIN_c[23]\);
    
    \Data_AccIn_pad[35]\ : INBUF
      port map(PAD => Data_AccIn(35), Y => \Data_AccIn_c[35]\);
    
    \Data_fifoIN_pad[7]\ : INBUF
      port map(PAD => Data_fifoIN(7), Y => \Data_fifoIN_c[7]\);
    
    byteRdEnGen : WaveGenSingleZ0
      port map(lvdsFifoRowRdOut_i => lvdsFifoRowRdOut_i, 
        ByteRdEn_c => ByteRdEn_c, sysrst_n_c => sysrst_n_c, 
        Sysclk_c => Sysclk_c, lvdsFifoRowRdOut => 
        lvdsFifoRowRdOut);
    
    \Data2Fifo_pad[46]\ : OUTBUF
      port map(D => \Data2Fifo_c[46]\, PAD => Data2Fifo(46));
    
    \LVDS_data[30]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[30]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[30]\);
    
    \latch_data_RNO[14]\ : MX2
      port map(A => \Data_AccIn_c[14]\, B => 
        \latch_data[14]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[14]_net_1\);
    
    \latch_data_RNO[70]\ : MX2
      port map(A => \Data_AccIn_c[70]\, B => 
        \latch_data[70]_net_1\, S => N_15, Y => N_12);
    
    \Data_AccIn_pad[10]\ : INBUF
      port map(PAD => Data_AccIn(10), Y => \Data_AccIn_c[10]\);
    
    \LVDS_data_pad[54]\ : OUTBUF
      port map(D => \LVDS_data_c[54]\, PAD => LVDS_data(54));
    
    \Data2Fifo_pad[23]\ : OUTBUF
      port map(D => \Data2Fifo_c[23]\, PAD => Data2Fifo(23));
    
    \Data2Fifo[13]\ : DFN1E1C0
      port map(D => \latch_data[13]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[13]\);
    
    \LVDS_data[36]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[36]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[36]\);
    
    \Data2Fifo_pad[4]\ : OUTBUF
      port map(D => \Data2Fifo_c[4]\, PAD => Data2Fifo(4));
    
    \LVDS_data_pad[48]\ : OUTBUF
      port map(D => \LVDS_data_c[48]\, PAD => LVDS_data(48));
    
    \latch_data[42]\ : DFN1E1C0
      port map(D => \latch_data_RNO[42]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[42]_net_1\);
    
    \Data_AccIn_pad[65]\ : INBUF
      port map(PAD => Data_AccIn(65), Y => \Data_AccIn_c[65]\);
    
    \latch_data_RNO[11]\ : MX2
      port map(A => \Data_AccIn_c[11]\, B => 
        \latch_data[11]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[11]_net_1\);
    
    \Data2Fifo[33]\ : DFN1E1C0
      port map(D => \latch_data[33]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[33]\);
    
    \Data2Fifo_pad[58]\ : OUTBUF
      port map(D => \Data2Fifo_c[58]\, PAD => Data2Fifo(58));
    
    \latch_data_RNO[17]\ : MX2
      port map(A => \Data_AccIn_c[17]\, B => 
        \latch_data[17]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[17]_net_1\);
    
    \latch_data[46]\ : DFN1E1C0
      port map(D => \latch_data_RNO[46]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[46]_net_1\);
    
    \Data2ACC_pad[18]\ : OUTBUF
      port map(D => \Data2ACC_1_c[18]\, PAD => Data2ACC(18));
    
    \Data_AccIn_pad[54]\ : INBUF
      port map(PAD => Data_AccIn(54), Y => \Data_AccIn_c[54]\);
    
    \intData2acc[22]\ : DFN1E0C0
      port map(D => \latch4acc[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => N_1059, Q => \intData2acc[24]\);
    
    \LVDS_data[7]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[7]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[7]\);
    
    \Data2Fifo_pad[2]\ : OUTBUF
      port map(D => \Data2Fifo_c[2]\, PAD => Data2Fifo(2));
    
    \latch_data_RNO[16]\ : MX2
      port map(A => \Data_AccIn_c[16]\, B => 
        \latch_data[16]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[16]_net_1\);
    
    \Data2Fifo[71]\ : DFN1E1C0
      port map(D => \latch_data[71]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[71]\);
    
    \latch_data[27]\ : DFN1E1C0
      port map(D => \latch_data_RNO[27]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[27]_net_1\);
    
    \Data2Fifo_pad[66]\ : OUTBUF
      port map(D => \Data2Fifo_c[66]\, PAD => Data2Fifo(66));
    
    \latch_data[39]\ : DFN1E1C0
      port map(D => \latch_data_RNO[39]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[39]_net_1\);
    
    \latch_data[9]\ : DFN1E1C0
      port map(D => \latch_data_RNO[9]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[9]_net_1\);
    
    \LVDS_data_pad[18]\ : OUTBUF
      port map(D => \LVDS_data_c[18]\, PAD => LVDS_data(18));
    
    \Data_fifoIN_pad[19]\ : INBUF
      port map(PAD => Data_fifoIN(19), Y => \Data_fifoIN_c[19]\);
    
    \LVDS_data_pad[5]\ : OUTBUF
      port map(D => \LVDS_data_c[5]\, PAD => LVDS_data(5));
    
    \Data_fifoIN_pad[9]\ : INBUF
      port map(PAD => Data_fifoIN(9), Y => \Data_fifoIN_c[9]\);
    
    \Data_fifoIN_pad[54]\ : INBUF
      port map(PAD => Data_fifoIN(54), Y => \Data_fifoIN_c[54]\);
    
    LVDS_en_pad : INBUF
      port map(PAD => LVDS_en, Y => LVDS_en_c);
    
    \LVDS_data_pad[60]\ : OUTBUF
      port map(D => \LVDS_data_c[60]\, PAD => LVDS_data(60));
    
    \latch_data[63]\ : DFN1E1C0
      port map(D => \latch_data_RNO[63]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[63]_net_1\);
    
    \Data2ACC_pad[60]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c[60]\, PAD => 
        Data2ACC(60));
    
    \Data_AccIn_pad[16]\ : INBUF
      port map(PAD => Data_AccIn(16), Y => \Data_AccIn_c[16]\);
    
    \Data2Fifo[52]\ : DFN1E1C0
      port map(D => \latch_data[52]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[52]\);
    
    Data2fifoENGen : WaveGenSingleZ5
      port map(sysrst_n_c => sysrst_n_c, Sysclk_c => Sysclk_c, 
        SDramEn_c => SDramEn_c, FifoRowRdOut => FifoRowRdOut, 
        FifoRowRdOut_0 => FifoRowRdOut_0, Data2Fifo_0_sqmuxa => 
        Data2Fifo_0_sqmuxa);
    
    \latch_data[45]\ : DFN1E1C0
      port map(D => \latch_data_RNO[45]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[45]_net_1\);
    
    \Data_AccIn_pad[38]\ : INBUF
      port map(PAD => Data_AccIn(38), Y => \Data_AccIn_c[38]\);
    
    \latch_data[60]\ : DFN1E1C0
      port map(D => \latch_data_RNO[60]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[60]_net_1\);
    
    \latch_data[4]\ : DFN1E1C0
      port map(D => \latch_data_RNO[4]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[4]_net_1\);
    
    \Data_fifoIN_pad[33]\ : INBUF
      port map(PAD => Data_fifoIN(33), Y => \Data_fifoIN_c[33]\);
    
    \Data2Fifo_pad[11]\ : OUTBUF
      port map(D => \Data2Fifo_c[11]\, PAD => Data2Fifo(11));
    
    \latch_data_RNO[54]\ : MX2
      port map(A => \Data_AccIn_c[54]\, B => 
        \latch_data[54]_net_1\, S => N_15, Y => 
        \latch_data_RNO[54]_net_1\);
    
    Data2accEnGen : WaveGenSingleZ6
      port map(PrState_2 => \latchGen.PrState[4]\, PrState_0(4)
         => \latchGen.PrState_0[4]\, Data2accEn => Data2accEn, 
        sysrst_n_c => sysrst_n_c, Sysclk_c => Sysclk_c, 
        FifoRowRdOut => FifoRowRdOut, FifoRowRdOut_0 => 
        FifoRowRdOut_0);
    
    \Data2ACC_pad[51]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(51));
    
    \Data2Fifo_pad[7]\ : OUTBUF
      port map(D => \Data2Fifo_c[7]\, PAD => Data2Fifo(7));
    
    \Data2Fifo[40]\ : DFN1E1C0
      port map(D => \latch_data[40]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[40]\);
    
    \LVDS_data_pad[22]\ : OUTBUF
      port map(D => \LVDS_data_c[22]\, PAD => LVDS_data(22));
    
    \latch_data_RNO[34]\ : MX2
      port map(A => \Data_AccIn_c[34]\, B => 
        \latch_data[34]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[34]_net_1\);
    
    \Data2Fifo_pad[5]\ : OUTBUF
      port map(D => \Data2Fifo_c[5]\, PAD => Data2Fifo(5));
    
    \Data_fifoIN_pad[46]\ : INBUF
      port map(PAD => Data_fifoIN(46), Y => \Data_fifoIN_c[46]\);
    
    \LVDS_data[51]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[51]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[51]\);
    
    \LVDS_data_pad[32]\ : OUTBUF
      port map(D => \LVDS_data_c[32]\, PAD => LVDS_data(32));
    
    \Data2ACC_pad[56]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c[60]\, PAD => 
        Data2ACC(56));
    
    \Data_fifoIN_pad[21]\ : INBUF
      port map(PAD => Data_fifoIN(21), Y => \Data_fifoIN_c[21]\);
    
    \Data2Fifo[60]\ : DFN1E1C0
      port map(D => \latch_data[60]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[60]\);
    
    \latch_data_RNO[51]\ : MX2
      port map(A => \Data_AccIn_c[51]\, B => 
        \latch_data[51]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[51]_net_1\);
    
    \Data_AccIn_pad[31]\ : INBUF
      port map(PAD => Data_AccIn(31), Y => \Data_AccIn_c[31]\);
    
    \Data2Fifo[55]\ : DFN1E1C0
      port map(D => \latch_data[55]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[55]\);
    
    \LVDS_data_pad[41]\ : OUTBUF
      port map(D => \LVDS_data_c[41]\, PAD => LVDS_data(41));
    
    \latch_data_RNO[57]\ : MX2
      port map(A => \Data_AccIn_c[57]\, B => 
        \latch_data[57]_net_1\, S => N_15, Y => 
        \latch_data_RNO[57]_net_1\);
    
    \Data2Fifo[3]\ : DFN1E1C0
      port map(D => \latch_data[3]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[3]\);
    
    \Data_AccIn_pad[68]\ : INBUF
      port map(PAD => Data_AccIn(68), Y => \Data_AccIn_c[68]\);
    
    \LVDS_data[62]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[62]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[62]\);
    
    \Data2ACC_pad[20]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(20));
    
    \latch_data_RNO[31]\ : MX2
      port map(A => \Data_AccIn_c[31]\, B => 
        \latch_data[31]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[31]_net_1\);
    
    \latch_data_RNO[56]\ : MX2
      port map(A => \Data_AccIn_c[56]\, B => 
        \latch_data[56]_net_1\, S => N_15, Y => 
        \latch_data_RNO[56]_net_1\);
    
    \latch_data_RNO[37]\ : MX2
      port map(A => \Data_AccIn_c[37]\, B => 
        \latch_data[37]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[37]_net_1\);
    
    \Data2Fifo[29]\ : DFN1E1C0
      port map(D => \latch_data[29]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[29]\);
    
    \latch_data_RNO[29]\ : MX2
      port map(A => \Data_AccIn_c[29]\, B => 
        \latch_data[29]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[29]_net_1\);
    
    \LVDS_data_pad[58]\ : OUTBUF
      port map(D => \LVDS_data_c[58]\, PAD => LVDS_data(58));
    
    sysrst_n_pad : CLKBUF
      port map(PAD => sysrst_n, Y => sysrst_n_c);
    
    \Data2Fifo_pad[20]\ : OUTBUF
      port map(D => \Data2Fifo_c[20]\, PAD => Data2Fifo(20));
    
    \Data2Fifo_pad[43]\ : OUTBUF
      port map(D => \Data2Fifo_c[43]\, PAD => Data2Fifo(43));
    
    LVDSRdOk_pad : INBUF
      port map(PAD => LVDSRdOk, Y => LVDSRdOk_c);
    
    \latch_data_RNO[36]\ : MX2
      port map(A => \Data_AccIn_c[36]\, B => 
        \latch_data[36]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[36]_net_1\);
    
    \Data_AccIn_pad[27]\ : INBUF
      port map(PAD => Data_AccIn(27), Y => \Data_AccIn_c[27]\);
    
    \Data2ACC_pad[37]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(37));
    
    SDramEn_pad_RNIMSO1 : CLKINT
      port map(A => \SDramEn_pad\, Y => SDramEn_c);
    
    GND_i_0 : GND
      port map(Y => GND_0);
    
    \Data_AccIn_pad[61]\ : INBUF
      port map(PAD => Data_AccIn(61), Y => \Data_AccIn_c[61]\);
    
    \latch_data[32]\ : DFN1E1C0
      port map(D => \latch_data_RNO[32]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[32]_net_1\);
    
    \LVDS_data_pad[11]\ : OUTBUF
      port map(D => \LVDS_data_c[11]\, PAD => LVDS_data(11));
    
    \latch4acc[12]\ : DFN1C0
      port map(D => \latch4acc_RNO[12]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, Q => \latch4acc[3]\);
    
    \Data_fifoIN_pad[28]\ : INBUF
      port map(PAD => Data_fifoIN(28), Y => \Data_fifoIN_c[28]\);
    
    \LVDS_data[57]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[57]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[57]\);
    
    \latch_data[36]\ : DFN1E1C0
      port map(D => \latch_data_RNO[36]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[36]_net_1\);
    
    \Data2ACC_pad[15]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(15));
    
    \latch_data[18]\ : DFN1E1C0
      port map(D => \latch_data_RNO[18]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[18]_net_1\);
    
    \Data2Fifo[54]\ : DFN1E1C0
      port map(D => \latch_data[54]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[54]\);
    
    \Data2ACC_pad[47]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(47));
    
    notfirstFrame_RNO_0 : OA1C
      port map(A => \sdramENReg\, B => SDramEn_c, C => LVDSRdOk_c, 
        Y => notfirstFrame_1_sqmuxa);
    
    \latch_data[23]\ : DFN1E1C0
      port map(D => \latch_data_RNO[23]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[23]_net_1\);
    
    \latch_data_RNO[49]\ : MX2
      port map(A => \Data_AccIn_c[49]\, B => 
        \latch_data[49]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[49]_net_1\);
    
    \LVDS_data[24]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[24]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[24]\);
    
    SDramEn_pad : INBUF
      port map(PAD => SDramEn, Y => \SDramEn_pad\);
    
    \LVDS_data[11]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[11]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[11]\);
    
    \Data2ACC_pad[1]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(1));
    
    \Data_fifoIN_pad[55]\ : INBUF
      port map(PAD => Data_fifoIN(55), Y => \Data_fifoIN_c[55]\);
    
    \Data2Fifo[57]\ : DFN1E1C0
      port map(D => \latch_data[57]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[57]\);
    
    \LVDS_data[35]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[35]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[35]\);
    
    \Data2ACC_pad[62]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c[60]\, PAD => 
        Data2ACC(62));
    
    \latch_data_RNO[6]\ : MX2
      port map(A => \Data_AccIn_c[6]\, B => \latch_data[6]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[6]_net_1\);
    
    \latch_data[20]\ : DFN1E1C0
      port map(D => \latch_data_RNO[20]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[20]_net_1\);
    
    \latch_data[41]\ : DFN1E1C0
      port map(D => \latch_data_RNO[41]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[41]_net_1\);
    
    \Data2Fifo_pad[63]\ : OUTBUF
      port map(D => \Data2Fifo_c[63]\, PAD => Data2Fifo(63));
    
    \ChSel_RNIBBA1[1]\ : OR2B
      port map(A => \ChSel[1]_net_1\, B => \ChSel[0]_net_1\, Y
         => N_15);
    
    \Data_AccIn_pad[47]\ : INBUF
      port map(PAD => Data_AccIn(47), Y => \Data_AccIn_c[47]\);
    
    \intData2acc_RNINM9E[56]\ : NOR3C
      port map(A => FifoRowRdOut, B => \notfirstFrame\, C => 
        \intData2acc[60]\, Y => \Data2ACC_1_c_c_c_c_c_c[60]\);
    
    \Data2Fifo_pad[25]\ : OUTBUF
      port map(D => \Data2Fifo_c[25]\, PAD => Data2Fifo(25));
    
    \LVDS_data[38]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[38]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[38]\);
    
    \LVDS_data[44]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[44]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[44]\);
    
    \Data_AccIn_pad[29]\ : INBUF
      port map(PAD => Data_AccIn(29), Y => \Data_AccIn_c[29]\);
    
    \LVDS_data[59]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[59]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[59]\);
    
    \latch_data[35]\ : DFN1E1C0
      port map(D => \latch_data_RNO[35]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[35]_net_1\);
    
    \Data2Fifo_pad[39]\ : OUTBUF
      port map(D => \Data2Fifo_c[39]\, PAD => Data2Fifo(39));
    
    \latch_data_RNO[69]\ : MX2
      port map(A => \Data_AccIn_c[69]\, B => 
        \latch_data[69]_net_1\, S => N_15, Y => N_10);
    
    \latch_data[14]\ : DFN1E1C0
      port map(D => \latch_data_RNO[14]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[14]_net_1\);
    
    \Data_fifoIN_pad[31]\ : INBUF
      port map(PAD => Data_fifoIN(31), Y => \Data_fifoIN_c[31]\);
    
    \LVDS_data[17]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[17]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[17]\);
    
    \Data_AccIn_pad[13]\ : INBUF
      port map(PAD => Data_AccIn(13), Y => \Data_AccIn_c[13]\);
    
    \Data2Fifo_pad[71]\ : OUTBUF
      port map(D => \Data2Fifo_c[71]\, PAD => Data2Fifo(71));
    
    \Data2Fifo[22]\ : DFN1E1C0
      port map(D => \latch_data[22]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[22]\);
    
    \LVDS_data_pad[40]\ : OUTBUF
      port map(D => \LVDS_data_c[40]\, PAD => LVDS_data(40));
    
    \LVDS_data[23]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[23]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[23]\);
    
    \LVDS_data_pad[51]\ : OUTBUF
      port map(D => \LVDS_data_c[51]\, PAD => LVDS_data(51));
    
    \Data2Fifo_pad[22]\ : OUTBUF
      port map(D => \Data2Fifo_c[22]\, PAD => Data2Fifo(22));
    
    \Data_AccIn_pad[0]\ : INBUF
      port map(PAD => Data_AccIn(0), Y => \Data_AccIn_c[0]\);
    
    \Data_fifoIN_pad[64]\ : INBUF
      port map(PAD => Data_fifoIN(64), Y => \Data_fifoIN_c[64]\);
    
    \Data2ACC_pad[54]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(54));
    
    \Data2ACC_pad[22]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c[28]\, PAD => 
        Data2ACC(22));
    
    \ChSel[1]\ : DFN1C0
      port map(D => \ChSel_3[1]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \ChSel[1]_net_1\);
    
    \latch_data[8]\ : DFN1E1C0
      port map(D => \latch_data_RNO[8]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[8]_net_1\);
    
    \LVDS_data_pad[3]\ : OUTBUF
      port map(D => \LVDS_data_c[3]\, PAD => LVDS_data(3));
    
    \latch_data_RNO[2]\ : MX2
      port map(A => \Data_AccIn_c[2]\, B => \latch_data[2]_net_1\, 
        S => \ChSel_RNIBBA1_2[1]_net_1\, Y => 
        \latch_data_RNO[2]_net_1\);
    
    \Data_AccIn_pad[49]\ : INBUF
      port map(PAD => Data_AccIn(49), Y => \Data_AccIn_c[49]\);
    
    \LVDS_data_pad[25]\ : OUTBUF
      port map(D => \LVDS_data_c[25]\, PAD => LVDS_data(25));
    
    \latch_data_RNO[12]\ : MX2
      port map(A => \Data_AccIn_c[12]\, B => 
        \latch_data[12]_net_1\, S => \ChSel_RNIBBA1_2[1]_net_1\, 
        Y => \latch_data_RNO[12]_net_1\);
    
    \Data_AccIn_pad[57]\ : INBUF
      port map(PAD => Data_AccIn(57), Y => \Data_AccIn_c[57]\);
    
    \Data2Fifo_pad[9]\ : OUTBUF
      port map(D => \Data2Fifo_c[9]\, PAD => Data2Fifo(9));
    
    \Data2ACC_pad[13]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(13));
    
    \LVDS_data_pad[4]\ : OUTBUF
      port map(D => \LVDS_data_c[4]\, PAD => LVDS_data(4));
    
    \Data_fifoIN_pad[38]\ : INBUF
      port map(PAD => Data_fifoIN(38), Y => \Data_fifoIN_c[38]\);
    
    \LVDS_data_pad[35]\ : OUTBUF
      port map(D => \LVDS_data_c[35]\, PAD => LVDS_data(35));
    
    \LVDS_data[43]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[43]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[43]\);
    
    \latch_data[69]\ : DFN1E1C0
      port map(D => N_10, CLK => Sysclk_c, CLR => sysrst_n_c, E
         => SDramEn_c, Q => \latch_data[69]_net_1\);
    
    \LVDS_data_pad[10]\ : OUTBUF
      port map(D => \LVDS_data_c[10]\, PAD => LVDS_data(10));
    
    \LVDS_data[19]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[19]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[19]\);
    
    \Data2Fifo_pad[40]\ : OUTBUF
      port map(D => \Data2Fifo_c[40]\, PAD => Data2Fifo(40));
    
    \Data2Fifo[25]\ : DFN1E1C0
      port map(D => \latch_data[25]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[25]\);
    
    \Data_fifoIN_pad[3]\ : INBUF
      port map(PAD => Data_fifoIN(3), Y => \Data_fifoIN_c[3]\);
    
    \Data2Fifo_pad[38]\ : OUTBUF
      port map(D => \Data2Fifo_c[38]\, PAD => Data2Fifo(38));
    
    \Data_fifoIN_pad[59]\ : INBUF
      port map(PAD => Data_fifoIN(59), Y => \Data_fifoIN_c[59]\);
    
    \addSel[0]\ : DFN1C0
      port map(D => \addSel_2[0]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => \addSel[0]_net_1\);
    
    \Data_fifoIN_pad[27]\ : INBUF
      port map(PAD => Data_fifoIN(27), Y => \Data_fifoIN_c[27]\);
    
    \Data2ACC_pad[59]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(59));
    
    \LVDS_data[2]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[2]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[2]\);
    
    \Data_AccIn_pad[32]\ : INBUF
      port map(PAD => Data_AccIn(32), Y => \Data_AccIn_c[32]\);
    
    \Data_AccIn_pad[14]\ : INBUF
      port map(PAD => Data_AccIn(14), Y => \Data_AccIn_c[14]\);
    
    \Data2Fifo[19]\ : DFN1E1C0
      port map(D => \latch_data[19]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[19]\);
    
    \Data_fifoIN_pad[22]\ : INBUF
      port map(PAD => Data_fifoIN(22), Y => \Data_fifoIN_c[22]\);
    
    \intData2acc[3]\ : DFN1E0C0
      port map(D => \latch4acc[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => N_1055, Q => \intData2acc[9]\);
    
    \Data2ACC_pad[6]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c[3]\, PAD => 
        Data2ACC(6));
    
    VCC_i_0 : VCC
      port map(Y => VCC_0);
    
    \latch_data_RNO[23]\ : MX2
      port map(A => \Data_AccIn_c[23]\, B => 
        \latch_data[23]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[23]_net_1\);
    
    \latch_data_RNO[20]\ : MX2
      port map(A => \Data_AccIn_c[20]\, B => 
        \latch_data[20]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[20]_net_1\);
    
    \Data2Fifo_pad[8]\ : OUTBUF
      port map(D => \Data2Fifo_c[8]\, PAD => Data2Fifo(8));
    
    \fifo_rst_n\ : DFN1C0
      port map(D => fifo_rst_n_4, CLK => Sysclk_c, CLR => 
        sysrst_n_c, Q => fifo_rst_n_c);
    
    Sysclk_pad : CLKBUF
      port map(PAD => Sysclk, Y => Sysclk_c);
    
    \Data2Fifo[39]\ : DFN1E1C0
      port map(D => \latch_data[39]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[39]\);
    
    \latch_data[31]\ : DFN1E1C0
      port map(D => \latch_data_RNO[31]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[31]_net_1\);
    
    \Data_AccIn_pad[59]\ : INBUF
      port map(PAD => Data_AccIn(59), Y => \Data_AccIn_c[59]\);
    
    \Data2Fifo[24]\ : DFN1E1C0
      port map(D => \latch_data[24]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[24]\);
    
    \Data2Fifo_pad[60]\ : OUTBUF
      port map(D => \Data2Fifo_c[60]\, PAD => Data2Fifo(60));
    
    \Data_AccIn_pad[62]\ : INBUF
      port map(PAD => Data_AccIn(62), Y => \Data_AccIn_c[62]\);
    
    \Data2Fifo_pad[45]\ : OUTBUF
      port map(D => \Data2Fifo_c[45]\, PAD => Data2Fifo(45));
    
    \latch_data_RNO[43]\ : MX2
      port map(A => \Data_AccIn_c[43]\, B => 
        \latch_data[43]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[43]_net_1\);
    
    \Data2Fifo[27]\ : DFN1E1C0
      port map(D => \latch_data[27]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[27]\);
    
    \latch_data_RNO[40]\ : MX2
      port map(A => \Data_AccIn_c[40]\, B => 
        \latch_data[40]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[40]_net_1\);
    
    \Data2Fifo[46]\ : DFN1E1C0
      port map(D => \latch_data[46]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[46]\);
    
    \LVDS_data_pad[50]\ : OUTBUF
      port map(D => \LVDS_data_c[50]\, PAD => LVDS_data(50));
    
    \Data2Fifo[66]\ : DFN1E1C0
      port map(D => \latch_data[66]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[66]\);
    
    \latch_data_RNO[52]\ : MX2
      port map(A => \Data_AccIn_c[52]\, B => 
        \latch_data[52]_net_1\, S => \ChSel_RNIBBA1_0[1]_net_1\, 
        Y => \latch_data_RNO[52]_net_1\);
    
    \Data_fifoIN_pad[65]\ : INBUF
      port map(PAD => Data_fifoIN(65), Y => \Data_fifoIN_c[65]\);
    
    \LVDS_data[4]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[4]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[4]\);
    
    \Data_AccIn_pad[3]\ : INBUF
      port map(PAD => Data_AccIn(3), Y => \Data_AccIn_c[3]\);
    
    \LVDS_data_pad[67]\ : OUTBUF
      port map(D => \LVDS_data_c[67]\, PAD => LVDS_data(67));
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \Data2ACC_pad[31]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(31));
    
    \LVDS_data[50]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[50]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[50]\);
    
    \latch_data_RNO[32]\ : MX2
      port map(A => \Data_AccIn_c[32]\, B => 
        \latch_data[32]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[32]_net_1\);
    
    \Data_fifoIN_pad[10]\ : INBUF
      port map(PAD => Data_fifoIN(10), Y => \Data_fifoIN_c[10]\);
    
    \LVDS_data_pad[69]\ : OUTBUF
      port map(D => \LVDS_data_c[69]\, PAD => LVDS_data(69));
    
    \intData2acc[17]\ : DFN1E0C0
      port map(D => \latch4acc[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => N_1055, Q => \intData2acc[17]_net_1\);
    
    \Data2Fifo_pad[42]\ : OUTBUF
      port map(D => \Data2Fifo_c[42]\, PAD => Data2Fifo(42));
    
    \latch_data[29]\ : DFN1E1C0
      port map(D => \latch_data_RNO[29]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[29]_net_1\);
    
    \ChSel_RNIBBA1_1[1]\ : OR2A
      port map(A => \ChSel[0]_net_1\, B => \ChSel[1]_net_1\, Y
         => \ChSel_RNIBBA1_1[1]_net_1\);
    
    \Data2Fifo[50]\ : DFN1E1C0
      port map(D => \latch_data[50]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[50]\);
    
    \latch_data[62]\ : DFN1E1C0
      port map(D => \latch_data_RNO[62]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[62]_net_1\);
    
    \latch_data[48]\ : DFN1E1C0
      port map(D => \latch_data_RNO[48]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[48]_net_1\);
    
    \Data2ACC_pad[36]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(36));
    
    \Data_AccIn_pad[2]\ : INBUF
      port map(PAD => Data_AccIn(2), Y => \Data_AccIn_c[2]\);
    
    \latch_data[66]\ : DFN1E1C0
      port map(D => \latch_data_RNO[66]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[66]_net_1\);
    
    \LVDS_data[56]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[56]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[56]\);
    
    \latch_data_RNO[63]\ : MX2
      port map(A => \Data_AccIn_c[63]\, B => 
        \latch_data[63]_net_1\, S => N_15, Y => 
        \latch_data_RNO[63]_net_1\);
    
    \Data2Fifo_pad[65]\ : OUTBUF
      port map(D => \Data2Fifo_c[65]\, PAD => Data2Fifo(65));
    
    \latch_data_RNO[60]\ : MX2
      port map(A => \Data_AccIn_c[60]\, B => 
        \latch_data[60]_net_1\, S => N_15, Y => 
        \latch_data_RNO[60]_net_1\);
    
    \Data2ACC_pad[41]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(41));
    
    \Data2Fifo_pad[54]\ : OUTBUF
      port map(D => \Data2Fifo_c[54]\, PAD => Data2Fifo(54));
    
    \Data2Fifo_pad[19]\ : OUTBUF
      port map(D => \Data2Fifo_c[19]\, PAD => Data2Fifo(19));
    
    \Data2Fifo[12]\ : DFN1E1C0
      port map(D => \latch_data[12]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[12]\);
    
    \Data_AccIn_pad[30]\ : INBUF
      port map(PAD => Data_AccIn(30), Y => \Data_AccIn_c[30]\);
    
    \Data_fifoIN_pad[37]\ : INBUF
      port map(PAD => Data_fifoIN(37), Y => \Data_fifoIN_c[37]\);
    
    \Data2ACC_pad[46]\ : OUTBUF
      port map(D => \Data2ACC_1_c_c_c_c_c_c_c_c_c_c_c_c_c[44]\, 
        PAD => Data2ACC(46));
    
    \Data_fifoIN_pad[32]\ : INBUF
      port map(PAD => Data_fifoIN(32), Y => \Data_fifoIN_c[32]\);
    
    \Data2Fifo[32]\ : DFN1E1C0
      port map(D => \latch_data[32]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[32]\);
    
    \intData2acc[56]\ : DFN1E1C0
      port map(D => \latch4acc[3]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => intData2acc_3_sqmuxa, Q => 
        \intData2acc[60]\);
    
    \LVDS_data[8]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[8]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[8]\);
    
    \LVDS_data[71]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[71]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[71]\);
    
    \Data2ACC_pad_RNO[18]\ : NOR3C
      port map(A => FifoRowRdOut, B => \notfirstFrame\, C => 
        \intData2acc[18]_net_1\, Y => \Data2ACC_1_c[18]\);
    
    \Data_fifoIN_pad[70]\ : INBUF
      port map(PAD => Data_fifoIN(70), Y => \Data_fifoIN_c[70]\);
    
    \Data2Fifo_pad[62]\ : OUTBUF
      port map(D => \Data2Fifo_c[62]\, PAD => Data2Fifo(62));
    
    \Data2ACC_pad_RNO[17]\ : NOR3C
      port map(A => FifoRowRdOut, B => \notfirstFrame\, C => 
        \intData2acc[17]_net_1\, Y => \Data2ACC_1_c[17]\);
    
    \Data2ACC_pad[10]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(10));
    
    \Data2Fifo_pad[57]\ : OUTBUF
      port map(D => \Data2Fifo_c[57]\, PAD => Data2Fifo(57));
    
    \Data_AccIn_pad[60]\ : INBUF
      port map(PAD => Data_AccIn(60), Y => \Data_AccIn_c[60]\);
    
    \LVDS_data_pad[24]\ : OUTBUF
      port map(D => \LVDS_data_c[24]\, PAD => LVDS_data(24));
    
    \LVDS_data[10]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[10]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[10]\);
    
    \latch_data[44]\ : DFN1E1C0
      port map(D => \latch_data_RNO[44]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[44]_net_1\);
    
    \Data_fifoIN_pad[44]\ : INBUF
      port map(PAD => Data_fifoIN(44), Y => \Data_fifoIN_c[44]\);
    
    \latch_data_RNO[18]\ : MX2
      port map(A => \Data_AccIn_c[18]\, B => 
        \latch_data[18]_net_1\, S => \ChSel_RNIBBA1_1[1]_net_1\, 
        Y => \latch_data_RNO[18]_net_1\);
    
    \latch_data[65]\ : DFN1E1C0
      port map(D => \latch_data_RNO[65]_net_1\, CLK => Sysclk_c, 
        CLR => sysrst_n_c, E => SDramEn_c, Q => 
        \latch_data[65]_net_1\);
    
    \LVDS_data_pad[34]\ : OUTBUF
      port map(D => \LVDS_data_c[34]\, PAD => LVDS_data(34));
    
    \Data2Fifo[15]\ : DFN1E1C0
      port map(D => \latch_data[15]_net_1\, CLK => Sysclk_c, CLR
         => sysrst_n_c, E => Data2Fifo_0_sqmuxa, Q => 
        \Data2Fifo_c[15]\);
    
    \Data2ACC_pad[67]\ : OUTBUF
      port map(D => \GND\, PAD => Data2ACC(67));
    
    \LVDS_data_pad[0]\ : OUTBUF
      port map(D => \LVDS_data_c[0]\, PAD => LVDS_data(0));
    
    \LVDS_data[16]\ : DFN1E1C0
      port map(D => \Data_fifoIN_c[16]\, CLK => Sysclk_c, CLR => 
        sysrst_n_c, E => LVDS_data_0_sqmuxa, Q => 
        \LVDS_data_c[16]\);
    

end DEF_ARCH; 
