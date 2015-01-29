-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity Cnt4Ref is

    port( Aclr   : in    std_logic;
          Clock  : in    std_logic;
          Q      : out   std_logic_vector(5 downto 0);
          Enable : in    std_logic
        );

end Cnt4Ref;

architecture DEF_ARCH of Cnt4Ref is 

  component DFN1E1C1
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component DFN1C1
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

  component AND2
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

  component AND3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal NU_1, NU_2, NU_3, NU_4, NU_5, NU_6, NU_0_1, NU_0_1_2, 
        NU_3_4, NU_3_4_5, INV_1_Y, XOR2_3_Y, AND2_2_Y, XOR2_0_Y, 
        AND2_1_Y, XOR2_1_Y, AND2_0_Y, XOR2_2_Y, INV_0_Y
         : std_logic;

begin 

    Q(5) <= NU_6;
    Q(4) <= NU_5;
    Q(3) <= NU_4;
    Q(2) <= NU_3;
    Q(1) <= NU_2;
    Q(0) <= NU_1;

    DFN1E1C1_NU_1 : DFN1E1C1
      port map(D => INV_1_Y, CLK => Clock, CLR => Aclr, E => 
        Enable, Q => NU_1);
    
    DFN1C1_NU_6 : DFN1C1
      port map(D => XOR2_3_Y, CLK => Clock, CLR => Aclr, Q => 
        NU_6);
    
    XOR2_1 : XOR2
      port map(A => NU_2, B => AND2_0_Y, Y => XOR2_1_Y);
    
    AND2_0 : AND2
      port map(A => Enable, B => NU_1, Y => AND2_0_Y);
    
    DFN1E1C1_NU_5 : DFN1E1C1
      port map(D => XOR2_0_Y, CLK => Clock, CLR => Aclr, E => 
        NU_0_1_2, Q => NU_5);
    
    INV_0 : INV
      port map(A => NU_3, Y => INV_0_Y);
    
    DFN1C1_NU_2 : DFN1C1
      port map(D => XOR2_1_Y, CLK => Clock, CLR => Aclr, Q => 
        NU_2);
    
    AND2_1 : AND2
      port map(A => NU_3, B => NU_4, Y => AND2_1_Y);
    
    U_AND2_0_1 : AND2
      port map(A => Enable, B => NU_1, Y => NU_0_1);
    
    XOR2_0 : XOR2
      port map(A => NU_5, B => AND2_1_Y, Y => XOR2_0_Y);
    
    XOR2_2 : XOR2
      port map(A => NU_4, B => NU_3, Y => XOR2_2_Y);
    
    INV_1 : INV
      port map(A => NU_1, Y => INV_1_Y);
    
    U_AND3_3_4_5 : AND3
      port map(A => NU_3, B => NU_4, C => NU_5, Y => NU_3_4_5);
    
    DFN1E1C1_NU_3 : DFN1E1C1
      port map(D => INV_0_Y, CLK => Clock, CLR => Aclr, E => 
        NU_0_1_2, Q => NU_3);
    
    AND2_2 : AND2
      port map(A => NU_0_1_2, B => NU_3_4_5, Y => AND2_2_Y);
    
    XOR2_3 : XOR2
      port map(A => NU_6, B => AND2_2_Y, Y => XOR2_3_Y);
    
    DFN1E1C1_NU_4 : DFN1E1C1
      port map(D => XOR2_2_Y, CLK => Clock, CLR => Aclr, E => 
        NU_0_1_2, Q => NU_4);
    
    U_AND3_0_1_2 : AND3
      port map(A => Enable, B => NU_1, C => NU_2, Y => NU_0_1_2);
    
    U_AND2_3_4 : AND2
      port map(A => NU_3, B => NU_4, Y => NU_3_4);
    

end DEF_ARCH; 

-- _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


-- _GEN_File_Contents_

-- Version:9.1.0.18
-- ACTGENU_CALL:1
-- BATCH:T
-- FAM:ProASIC3
-- OUTFORMAT:VHDL
-- LPMTYPE:LPM_COUNTER
-- LPM_HINT:COMPCNT
-- INSERT_PAD:NO
-- INSERT_IOREG:NO
-- GEN_BHV_VHDL_VAL:F
-- GEN_BHV_VERILOG_VAL:F
-- MGNTIMER:F
-- MGNCMPL:T
-- DESDIR:D:/Actelprj/smart_top/smartgen\Cnt4Ref
-- GEN_BEHV_MODULE:T
-- SMARTGEN_DIE:M1IS8X8M2
-- SMARTGEN_PACKAGE:fg484
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- WIDTH:6
-- DIRECTION:UP
-- CLR_POLARITY:1
-- LD_POLARITY:2
-- EN_POLARITY:1
-- UPDOWN_POLARITY:2
-- CLK_EDGE:RISE
-- CLR_FANIN:MANUAL
-- CLR_VAL:1
-- CLK_FANIN:MANUAL
-- CLK_VAL:1
-- LD_FANIN:AUTO
-- LD_VAL:12
-- UPDOWN_FANIN:AUTO
-- UPDOWN_VAL:12
-- TCNT_POLARITY:2
-- SET_POLARITY:2
-- SET_FANIN:MANUAL
-- SET_VAL:1

-- _End_Comments_

