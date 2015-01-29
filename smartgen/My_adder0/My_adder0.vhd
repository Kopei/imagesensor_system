-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity My_adder0 is 
    port( DataA : in std_logic_vector(17 downto 0); DataB : in 
        std_logic_vector(17 downto 0); Sum : out 
        std_logic_vector(17 downto 0)) ;
end My_adder0;


architecture DEF_ARCH of  My_adder0 is

    component XOR3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component MAJ3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AND2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component XOR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    signal Carry_0_net, Carry_1_net, Carry_2_net, Carry_3_net, 
        Carry_4_net, Carry_5_net, Carry_6_net, Carry_7_net, 
        Carry_8_net, Carry_9_net, Carry_10_net, Carry_11_net, 
        Carry_12_net, Carry_13_net, Carry_14_net, Carry_15_net, 
        Carry_16_net : std_logic ;
    begin   

    XOR3_Sum_15_inst : XOR3
      port map(A => DataA(15), B => DataB(15), C => Carry_14_net, 
        Y => Sum(15));
    MAJ3_Carry_10_inst : MAJ3
      port map(A => Carry_9_net, B => DataA(10), C => DataB(10), 
        Y => Carry_10_net);
    XOR3_Sum_12_inst : XOR3
      port map(A => DataA(12), B => DataB(12), C => Carry_11_net, 
        Y => Sum(12));
    XOR3_Sum_6_inst : XOR3
      port map(A => DataA(6), B => DataB(6), C => Carry_5_net, 
        Y => Sum(6));
    XOR3_Sum_10_inst : XOR3
      port map(A => DataA(10), B => DataB(10), C => Carry_9_net, 
        Y => Sum(10));
    MAJ3_Carry_4_inst : MAJ3
      port map(A => Carry_3_net, B => DataA(4), C => DataB(4), 
        Y => Carry_4_net);
    XOR3_Sum_9_inst : XOR3
      port map(A => DataA(9), B => DataB(9), C => Carry_8_net, 
        Y => Sum(9));
    XOR3_Sum_7_inst : XOR3
      port map(A => DataA(7), B => DataB(7), C => Carry_6_net, 
        Y => Sum(7));
    AND2_Carry_0_inst : AND2
      port map(A => DataA(0), B => DataB(0), Y => Carry_0_net);
    MAJ3_Carry_9_inst : MAJ3
      port map(A => Carry_8_net, B => DataA(9), C => DataB(9), 
        Y => Carry_9_net);
    MAJ3_Carry_15_inst : MAJ3
      port map(A => Carry_14_net, B => DataA(15), C => DataB(15), 
        Y => Carry_15_net);
    XOR3_Sum_11_inst : XOR3
      port map(A => DataA(11), B => DataB(11), C => Carry_10_net, 
        Y => Sum(11));
    XOR3_Sum_1_inst : XOR3
      port map(A => DataA(1), B => DataB(1), C => Carry_0_net, 
        Y => Sum(1));
    XOR3_Sum_3_inst : XOR3
      port map(A => DataA(3), B => DataB(3), C => Carry_2_net, 
        Y => Sum(3));
    XOR3_Sum_13_inst : XOR3
      port map(A => DataA(13), B => DataB(13), C => Carry_12_net, 
        Y => Sum(13));
    XOR2_Sum_0_inst : XOR2
      port map(A => DataA(0), B => DataB(0), Y => Sum(0));
    XOR3_Sum_8_inst : XOR3
      port map(A => DataA(8), B => DataB(8), C => Carry_7_net, 
        Y => Sum(8));
    XOR3_Sum_14_inst : XOR3
      port map(A => DataA(14), B => DataB(14), C => Carry_13_net, 
        Y => Sum(14));
    MAJ3_Carry_1_inst : MAJ3
      port map(A => Carry_0_net, B => DataA(1), C => DataB(1), 
        Y => Carry_1_net);
    XOR3_Sum_2_inst : XOR3
      port map(A => DataA(2), B => DataB(2), C => Carry_1_net, 
        Y => Sum(2));
    XOR3_Sum_4_inst : XOR3
      port map(A => DataA(4), B => DataB(4), C => Carry_3_net, 
        Y => Sum(4));
    MAJ3_Carry_12_inst : MAJ3
      port map(A => Carry_11_net, B => DataA(12), C => DataB(12), 
        Y => Carry_12_net);
    MAJ3_Carry_14_inst : MAJ3
      port map(A => Carry_13_net, B => DataA(14), C => DataB(14), 
        Y => Carry_14_net);
    MAJ3_Carry_16_inst : MAJ3
      port map(A => Carry_15_net, B => DataA(16), C => DataB(16), 
        Y => Carry_16_net);
    MAJ3_Carry_2_inst : MAJ3
      port map(A => Carry_1_net, B => DataA(2), C => DataB(2), 
        Y => Carry_2_net);
    MAJ3_Carry_3_inst : MAJ3
      port map(A => Carry_2_net, B => DataA(3), C => DataB(3), 
        Y => Carry_3_net);
    MAJ3_Carry_13_inst : MAJ3
      port map(A => Carry_12_net, B => DataA(13), C => DataB(13), 
        Y => Carry_13_net);
    MAJ3_Carry_6_inst : MAJ3
      port map(A => Carry_5_net, B => DataA(6), C => DataB(6), 
        Y => Carry_6_net);
    MAJ3_Carry_7_inst : MAJ3
      port map(A => Carry_6_net, B => DataA(7), C => DataB(7), 
        Y => Carry_7_net);
    MAJ3_Carry_11_inst : MAJ3
      port map(A => Carry_10_net, B => DataA(11), C => DataB(11), 
        Y => Carry_11_net);
    XOR3_Sum_5_inst : XOR3
      port map(A => DataA(5), B => DataB(5), C => Carry_4_net, 
        Y => Sum(5));
    XOR3_Sum_17_inst : XOR3
      port map(A => DataA(17), B => DataB(17), C => Carry_16_net, 
        Y => Sum(17));
    MAJ3_Carry_5_inst : MAJ3
      port map(A => Carry_4_net, B => DataA(5), C => DataB(5), 
        Y => Carry_5_net);
    MAJ3_Carry_8_inst : MAJ3
      port map(A => Carry_7_net, B => DataA(8), C => DataB(8), 
        Y => Carry_8_net);
    XOR3_Sum_16_inst : XOR3
      port map(A => DataA(16), B => DataB(16), C => Carry_15_net, 
        Y => Sum(16));
end DEF_ARCH;

-- _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


-- _GEN_File_Contents_

-- Version:9.1.0.18
-- ACTGENU_CALL:1
-- BATCH:T
-- FAM:ProASIC3
-- OUTFORMAT:VHDL
-- LPMTYPE:LPM_ADD_SUB
-- LPM_HINT:RIPADD
-- INSERT_PAD:NO
-- INSERT_IOREG:NO
-- GEN_BHV_VHDL_VAL:T
-- GEN_BHV_VERILOG_VAL:F
-- MGNTIMER:F
-- MGNCMPL:T
-- DESDIR:D:/Actelprj/smart_top/smartgen\My_adder0
-- GEN_BEHV_MODULE:T
-- SMARTGEN_DIE:M1IS8X8M2
-- SMARTGEN_PACKAGE:fg484
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- CI_POLARITY:2
-- CO_POLARITY:2
-- WIDTH:18
-- DEBUG:0

-- _End_Comments_

