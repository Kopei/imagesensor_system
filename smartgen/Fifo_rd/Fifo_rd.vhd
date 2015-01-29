-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity Fifo_rd is 
    port( DATA : in std_logic_vector(71 downto 0); Q : out 
        std_logic_vector(71 downto 0);WE, RE, CLK : in std_logic
        ;  FULL, EMPTY : out std_logic;  RESET : in std_logic;  
        AFULL : out std_logic) ;
end Fifo_rd;


architecture DEF_ARCH of  Fifo_rd is

    component DFN1E1C0
        port(D, CLK, CLR, E : in std_logic := 'U'; Q : out 
        std_logic) ;
    end component;

    component INV
        port(A : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component NOR3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AND2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AO1
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component XOR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component XNOR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DFN1C0
        port(D, CLK, CLR : in std_logic := 'U'; Q : out std_logic
        ) ;
    end component;

    component AND2A
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AND3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component NAND3A
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component RAM512X18
    generic (MEMORYFILE:string := "");

        port(RADDR8, RADDR7, RADDR6, RADDR5, RADDR4, RADDR3, 
        RADDR2, RADDR1, RADDR0, WADDR8, WADDR7, WADDR6, WADDR5, 
        WADDR4, WADDR3, WADDR2, WADDR1, WADDR0, WD17, WD16, WD15, 
        WD14, WD13, WD12, WD11, WD10, WD9, WD8, WD7, WD6, WD5, 
        WD4, WD3, WD2, WD1, WD0, RW0, RW1, WW0, WW1, PIPE, REN, 
        WEN, RCLK, WCLK, RESET : in std_logic := 'U'; RD17, RD16, 
        RD15, RD14, RD13, RD12, RD11, RD10, RD9, RD8, RD7, RD6, 
        RD5, RD4, RD3, RD2, RD1, RD0 : out std_logic) ;
    end component;

    component OA1C
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OR2A
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AO1C
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OR3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component NOR3A
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component NAND2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component OA1A
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AOI1
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DFN1P0
        port(D, CLK, PRE : in std_logic := 'U'; Q : out std_logic
        ) ;
    end component;

    component NOR2A
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component VCC
        port( Y : out std_logic);
    end component;

    component GND
        port( Y : out std_logic);
    end component;

    signal FULL_1_net, EMPTY_1_net, MEM_RADDR_0_net, 
        RBINNXTSHIFT_0_net, MEM_WADDR_0_net, WBINNXTSHIFT_0_net, 
        MEM_RADDR_1_net, RBINNXTSHIFT_1_net, MEM_WADDR_1_net, 
        WBINNXTSHIFT_1_net, MEM_RADDR_2_net, RBINNXTSHIFT_2_net, 
        MEM_WADDR_2_net, WBINNXTSHIFT_2_net, MEM_RADDR_3_net, 
        RBINNXTSHIFT_3_net, MEM_WADDR_3_net, WBINNXTSHIFT_3_net, 
        MEM_RADDR_4_net, RBINNXTSHIFT_4_net, MEM_WADDR_4_net, 
        WBINNXTSHIFT_4_net, FULLINT, MEMORYWE, MEMWENEG, 
        WDIFF_0_net, WDIFF_1_net, WDIFF_2_net, WDIFF_3_net, 
        WDIFF_4_net, AFVALCONST_0_net, AFVALCONST_3_net, 
        WGRY_0_net, WGRY_1_net, WGRY_2_net, WGRY_3_net, 
        WGRY_4_net, EMPTYINT, MEMORYRE, MEMRENEG, DVLDI, DVLDX, 
        RGRY_0_net, RGRY_1_net, RGRY_2_net, RGRY_3_net, 
        RGRY_4_net, QXI_0_net, QXI_1_net, QXI_2_net, QXI_3_net, 
        QXI_4_net, QXI_5_net, QXI_6_net, QXI_7_net, QXI_8_net, 
        QXI_9_net, QXI_10_net, QXI_11_net, QXI_12_net, QXI_13_net, 
        QXI_14_net, QXI_15_net, QXI_16_net, QXI_17_net, 
        QXI_18_net, QXI_19_net, QXI_20_net, QXI_21_net, 
        QXI_22_net, QXI_23_net, QXI_24_net, QXI_25_net, 
        QXI_26_net, QXI_27_net, QXI_28_net, QXI_29_net, 
        QXI_30_net, QXI_31_net, QXI_32_net, QXI_33_net, 
        QXI_34_net, QXI_35_net, QXI_36_net, QXI_37_net, 
        QXI_38_net, QXI_39_net, QXI_40_net, QXI_41_net, 
        QXI_42_net, QXI_43_net, QXI_44_net, QXI_45_net, 
        QXI_46_net, QXI_47_net, QXI_48_net, QXI_49_net, 
        QXI_50_net, QXI_51_net, QXI_52_net, QXI_53_net, 
        QXI_54_net, QXI_55_net, QXI_56_net, QXI_57_net, 
        QXI_58_net, QXI_59_net, QXI_60_net, QXI_61_net, 
        QXI_62_net, QXI_63_net, QXI_64_net, QXI_65_net, 
        QXI_66_net, QXI_67_net, QXI_68_net, QXI_69_net, 
        QXI_70_net, QXI_71_net, NAND2_1_Y, AOI1_0_Y, OR2_0_Y, 
        AND2_6_Y, NOR3_0_Y, NAND3A_1_Y, OR2A_1_Y, AO1C_0_Y, 
        NOR3A_0_Y, OR2A_0_Y, NAND3A_0_Y, OA1A_0_Y, AND2A_0_Y, 
        OA1C_0_Y, XNOR2_4_Y, XNOR2_1_Y, XOR2_19_Y, XOR2_17_Y, 
        XOR2_12_Y, XOR2_30_Y, XOR2_27_Y, AND2_18_Y, AND2_3_Y, 
        AND2_1_Y, AND2_23_Y, XOR2_22_Y, XOR2_18_Y, XOR2_11_Y, 
        XOR2_35_Y, XOR2_33_Y, AND2_10_Y, AO1_10_Y, AND2_12_Y, 
        AND2_11_Y, AND2_5_Y, AO1_9_Y, AND2_30_Y, AND2_8_Y, 
        AO1_0_Y, AO1_4_Y, AO1_3_Y, XOR2_0_Y, XOR2_13_Y, XOR2_32_Y, 
        XOR2_16_Y, AND2A_1_Y, XOR2_8_Y, XOR2_15_Y, XOR2_24_Y, 
        XOR2_25_Y, XOR2_34_Y, AND2_13_Y, AND2_4_Y, AND2_21_Y, 
        AND2_0_Y, XOR2_31_Y, XOR2_2_Y, XOR2_4_Y, XOR2_1_Y, 
        XOR2_5_Y, AND2_20_Y, AO1_11_Y, AND2_24_Y, AND2_32_Y, 
        AND2_27_Y, AO1_12_Y, AND2_15_Y, AND2_28_Y, AO1_8_Y, 
        AO1_13_Y, AO1_5_Y, XOR2_29_Y, XOR2_10_Y, XOR2_28_Y, 
        XOR2_36_Y, NAND2_0_Y, NOR2A_0_Y, INV_1_Y, INV_4_Y, 
        INV_2_Y, INV_0_Y, INV_3_Y, AND2_22_Y, AND2_17_Y, AND2_2_Y, 
        AND2_31_Y, AND2_9_Y, AND2_29_Y, XOR2_6_Y, XOR2_7_Y, 
        XOR2_3_Y, XOR2_26_Y, AND2_26_Y, AO1_2_Y, AND2_16_Y, 
        AO1_1_Y, AND2_19_Y, AND2_14_Y, OR3_0_Y, AO1_7_Y, AO1_6_Y, 
        XOR2_14_Y, XOR2_20_Y, XOR2_9_Y, XOR2_21_Y, AND2_7_Y, 
        XOR2_23_Y, XNOR2_0_Y, XNOR2_7_Y, XNOR2_9_Y, XNOR2_8_Y, 
        AND3_0_Y, AND2_25_Y, XNOR2_10_Y, XNOR2_3_Y, XNOR2_2_Y, 
        XNOR2_5_Y, XNOR2_6_Y, AND3_1_Y, VCC_1_net, GND_1_net : std_logic ;
    begin   

    VCC_1_net <= AFVALCONST_3_net;
    GND_1_net <= AFVALCONST_0_net;
    FULL <= FULL_1_net;
    
    EMPTY <= EMPTY_1_net;
    
    VCC_2_net : VCC port map(Y => AFVALCONST_3_net);
    GND_2_net : GND port map(Y => AFVALCONST_0_net);
    DFN1E1C0_Q_27_inst : DFN1E1C0
      port map(D => QXI_27_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(27));
    INV_0 : INV
      port map(A => MEM_RADDR_4_net, Y => INV_0_Y);
    NOR3_0 : NOR3
      port map(A => OA1A_0_Y, B => AND2A_0_Y, C => OA1C_0_Y, Y => 
        NOR3_0_Y);
    AND2_2 : AND2
      port map(A => INV_1_Y, B => INV_3_Y, Y => AND2_2_Y);
    DFN1E1C0_Q_23_inst : DFN1E1C0
      port map(D => QXI_23_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(23));
    AND2_20 : AND2
      port map(A => XOR2_31_Y, B => XOR2_2_Y, Y => AND2_20_Y);
    DFN1E1C0_Q_69_inst : DFN1E1C0
      port map(D => QXI_69_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(69));
    AO1_11 : AO1
      port map(A => XOR2_1_Y, B => AND2_4_Y, C => AND2_21_Y, Y => 
        AO1_11_Y);
    AND2_11 : AND2
      port map(A => AND2_10_Y, B => AND2_12_Y, Y => AND2_11_Y);
    AND2_22 : AND2
      port map(A => WBINNXTSHIFT_1_net, B => INV_1_Y, Y => 
        AND2_22_Y);
    XOR2_WBINNXTSHIFT_2_inst : XOR2
      port map(A => XOR2_13_Y, B => AO1_0_Y, Y => 
        WBINNXTSHIFT_2_net);
    XNOR2_9 : XNOR2
      port map(A => MEM_RADDR_2_net, B => WBINNXTSHIFT_2_net, 
        Y => XNOR2_9_Y);
    DFN1C0_FULL : DFN1C0
      port map(D => FULLINT, CLK => CLK, CLR => RESET, Q => 
        FULL_1_net);
    XOR2_19 : XOR2
      port map(A => WBINNXTSHIFT_0_net, B => WBINNXTSHIFT_1_net, 
        Y => XOR2_19_Y);
    XOR2_23 : XOR2
      port map(A => MEM_RADDR_4_net, B => WBINNXTSHIFT_4_net, 
        Y => XOR2_23_Y);
    XOR2_1 : XOR2
      port map(A => MEM_RADDR_3_net, B => GND_1_net, Y => 
        XOR2_1_Y);
    DFN1E1C0_Q_1_inst : DFN1E1C0
      port map(D => QXI_1_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(1));
    DFN1E1C0_Q_67_inst : DFN1E1C0
      port map(D => QXI_67_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(67));
    DFN1E1C0_Q_4_inst : DFN1E1C0
      port map(D => QXI_4_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(4));
    DFN1E1C0_Q_63_inst : DFN1E1C0
      port map(D => QXI_63_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(63));
    INV_1 : INV
      port map(A => MEM_RADDR_1_net, Y => INV_1_Y);
    DFN1E1C0_Q_7_inst : DFN1E1C0
      port map(D => QXI_7_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(7));
    XOR2_RBINNXTSHIFT_0_inst : XOR2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        RBINNXTSHIFT_0_net);
    AO1_7 : AO1
      port map(A => XOR2_7_Y, B => OR3_0_Y, C => AND2_31_Y, Y => 
        AO1_7_Y);
    AND2_18 : AND2
      port map(A => MEM_WADDR_1_net, B => GND_1_net, Y => 
        AND2_18_Y);
    AND2_15 : AND2
      port map(A => AND2_32_Y, B => XOR2_5_Y, Y => AND2_15_Y);
    AND2_1 : AND2
      port map(A => MEM_WADDR_3_net, B => GND_1_net, Y => 
        AND2_1_Y);
    DFN1C0_MEM_WADDR_0_inst : DFN1C0
      port map(D => WBINNXTSHIFT_0_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_0_net);
    DFN1C0_MEM_WADDR_3_inst : DFN1C0
      port map(D => WBINNXTSHIFT_3_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_3_net);
    DFN1C0_MEM_RADDR_1_inst : DFN1C0
      port map(D => RBINNXTSHIFT_1_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_1_net);
    DFN1E1C0_Q_56_inst : DFN1E1C0
      port map(D => QXI_56_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(56));
    AO1_8 : AO1
      port map(A => XOR2_2_Y, B => AND2_28_Y, C => AND2_13_Y, 
        Y => AO1_8_Y);
    AND2_10 : AND2
      port map(A => XOR2_22_Y, B => XOR2_18_Y, Y => AND2_10_Y);
    AND2_7 : AND2
      port map(A => AND3_0_Y, B => XNOR2_8_Y, Y => AND2_7_Y);
    XOR2_20 : XOR2
      port map(A => WBINNXTSHIFT_2_net, B => INV_4_Y, Y => 
        XOR2_20_Y);
    AND2_12 : AND2
      port map(A => XOR2_11_Y, B => XOR2_35_Y, Y => AND2_12_Y);
    AND2A_1 : AND2A
      port map(A => EMPTY_1_net, B => RE, Y => AND2A_1_Y);
    XOR2_WBINNXTSHIFT_0_inst : XOR2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => 
        WBINNXTSHIFT_0_net);
    DFN1C0_MEM_WADDR_4_inst : DFN1C0
      port map(D => WBINNXTSHIFT_4_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_4_net);
    AND2_EMPTYINT : AND2
      port map(A => AND2_25_Y, B => XNOR2_10_Y, Y => EMPTYINT);
    XOR2_24 : XOR2
      port map(A => RBINNXTSHIFT_2_net, B => RBINNXTSHIFT_3_net, 
        Y => XOR2_24_Y);
    XOR2_21 : XOR2
      port map(A => WBINNXTSHIFT_4_net, B => INV_0_Y, Y => 
        XOR2_21_Y);
    DFN1E1C0_Q_25_inst : DFN1E1C0
      port map(D => QXI_25_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(25));
    DFN1E1C0_Q_24_inst : DFN1E1C0
      port map(D => QXI_24_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(24));
    DFN1E1C0_Q_48_inst : DFN1E1C0
      port map(D => QXI_48_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(48));
    XOR2_16 : XOR2
      port map(A => MEM_WADDR_4_net, B => GND_1_net, Y => 
        XOR2_16_Y);
    OR2_0 : OR2
      port map(A => AOI1_0_Y, B => FULL_1_net, Y => OR2_0_Y);
    DFN1E1C0_Q_65_inst : DFN1E1C0
      port map(D => QXI_65_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(65));
    MEMWEBUBBLE : INV
      port map(A => MEMORYWE, Y => MEMWENEG);
    AND2_6 : AND2
      port map(A => XNOR2_4_Y, B => XNOR2_1_Y, Y => AND2_6_Y);
    DFN1E1C0_Q_64_inst : DFN1E1C0
      port map(D => QXI_64_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(64));
    AND3_0 : AND3
      port map(A => XNOR2_0_Y, B => XNOR2_7_Y, C => XNOR2_9_Y, 
        Y => AND3_0_Y);
    DFN1C0_MEM_RADDR_2_inst : DFN1C0
      port map(D => RBINNXTSHIFT_2_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_2_net);
    DFN1C0_RGRY_2_inst : DFN1C0
      port map(D => XOR2_24_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_2_net);
    XOR2_33 : XOR2
      port map(A => MEM_WADDR_4_net, B => GND_1_net, Y => 
        XOR2_33_Y);
    INV_3 : INV
      port map(A => NOR2A_0_Y, Y => INV_3_Y);
    XNOR2_2 : XNOR2
      port map(A => RBINNXTSHIFT_1_net, B => MEM_WADDR_1_net, 
        Y => XNOR2_2_Y);
    XOR2_4 : XOR2
      port map(A => MEM_RADDR_2_net, B => GND_1_net, Y => 
        XOR2_4_Y);
    XOR2_WDIFF_0_inst : XOR2
      port map(A => WBINNXTSHIFT_0_net, B => MEM_RADDR_0_net, 
        Y => WDIFF_0_net);
    AND3_1 : AND3
      port map(A => XNOR2_3_Y, B => XNOR2_2_Y, C => XNOR2_5_Y, 
        Y => AND3_1_Y);
    AND2_24 : AND2
      port map(A => XOR2_4_Y, B => XOR2_1_Y, Y => AND2_24_Y);
    DFN1E1C0_Q_51_inst : DFN1E1C0
      port map(D => QXI_51_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(51));
    XNOR2_0 : XNOR2
      port map(A => MEM_RADDR_0_net, B => WBINNXTSHIFT_0_net, 
        Y => XNOR2_0_Y);
    AND2_31 : AND2
      port map(A => WBINNXTSHIFT_2_net, B => INV_4_Y, Y => 
        AND2_31_Y);
    DFN1E1C0_Q_38_inst : DFN1E1C0
      port map(D => QXI_38_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(38));
    DFN1E1C0_Q_71_inst : DFN1E1C0
      port map(D => QXI_71_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(71));
    XOR2_18 : XOR2
      port map(A => MEM_WADDR_1_net, B => GND_1_net, Y => 
        XOR2_18_Y);
    DFN1E1C0_Q_50_inst : DFN1E1C0
      port map(D => QXI_50_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(50));
    DFN1E1C0_Q_70_inst : DFN1E1C0
      port map(D => QXI_70_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(70));
    XOR2_RBINNXTSHIFT_4_inst : XOR2
      port map(A => XOR2_36_Y, B => AO1_5_Y, Y => 
        RBINNXTSHIFT_4_net);
    DFN1E1C0_Q_18_inst : DFN1E1C0
      port map(D => QXI_18_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(18));
    DFN1C0_RGRY_1_inst : DFN1C0
      port map(D => XOR2_15_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_1_net);
    DFN1C0_WGRY_3_inst : DFN1C0
      port map(D => XOR2_30_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_3_net);
    XOR2_8 : XOR2
      port map(A => RBINNXTSHIFT_0_net, B => RBINNXTSHIFT_1_net, 
        Y => XOR2_8_Y);
    DFN1E1C0_Q_6_inst : DFN1E1C0
      port map(D => QXI_6_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(6));
    NAND3A_0 : NAND3A
      port map(A => WDIFF_1_net, B => AFVALCONST_0_net, C => 
        OR2A_1_Y, Y => NAND3A_0_Y);
    RAM512X18_QXI_71_inst : RAM512X18
      port map(RADDR8 => GND_1_net, RADDR7 => GND_1_net, 
        RADDR6 => GND_1_net, RADDR5 => GND_1_net, RADDR4 => 
        GND_1_net, RADDR3 => MEM_RADDR_3_net, RADDR2 => 
        MEM_RADDR_2_net, RADDR1 => MEM_RADDR_1_net, RADDR0 => 
        MEM_RADDR_0_net, WADDR8 => GND_1_net, WADDR7 => GND_1_net, 
        WADDR6 => GND_1_net, WADDR5 => GND_1_net, WADDR4 => 
        GND_1_net, WADDR3 => MEM_WADDR_3_net, WADDR2 => 
        MEM_WADDR_2_net, WADDR1 => MEM_WADDR_1_net, WADDR0 => 
        MEM_WADDR_0_net, WD17 => DATA(71), WD16 => DATA(70), 
        WD15 => DATA(69), WD14 => DATA(68), WD13 => DATA(67), 
        WD12 => DATA(66), WD11 => DATA(65), WD10 => DATA(64), 
        WD9 => DATA(63), WD8 => DATA(62), WD7 => DATA(61), WD6 => 
        DATA(60), WD5 => DATA(59), WD4 => DATA(58), WD3 => 
        DATA(57), WD2 => DATA(56), WD1 => DATA(55), WD0 => 
        DATA(54), RW0 => GND_1_net, RW1 => VCC_1_net, WW0 => 
        GND_1_net, WW1 => VCC_1_net, PIPE => GND_1_net, REN => 
        MEMRENEG, WEN => MEMWENEG, RCLK => CLK, WCLK => CLK, 
        RESET => RESET, RD17 => QXI_71_net, RD16 => QXI_70_net, 
        RD15 => QXI_69_net, RD14 => QXI_68_net, RD13 => 
        QXI_67_net, RD12 => QXI_66_net, RD11 => QXI_65_net, 
        RD10 => QXI_64_net, RD9 => QXI_63_net, RD8 => QXI_62_net, 
        RD7 => QXI_61_net, RD6 => QXI_60_net, RD5 => QXI_59_net, 
        RD4 => QXI_58_net, RD3 => QXI_57_net, RD2 => QXI_56_net, 
        RD1 => QXI_55_net, RD0 => QXI_54_net);
    XOR2_30 : XOR2
      port map(A => WBINNXTSHIFT_3_net, B => WBINNXTSHIFT_4_net, 
        Y => XOR2_30_Y);
    DFN1E1C0_Q_46_inst : DFN1E1C0
      port map(D => QXI_46_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(46));
    MEMREBUBBLE : INV
      port map(A => MEMORYRE, Y => MEMRENEG);
    AND2_29 : AND2
      port map(A => WBINNXTSHIFT_4_net, B => INV_0_Y, Y => 
        AND2_29_Y);
    DFN1C0_MEM_RADDR_4_inst : DFN1C0
      port map(D => RBINNXTSHIFT_4_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_4_net);
    XOR2_34 : XOR2
      port map(A => RBINNXTSHIFT_4_net, B => GND_1_net, Y => 
        XOR2_34_Y);
    XOR2_31 : XOR2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        XOR2_31_Y);
    AND2_3 : AND2
      port map(A => MEM_WADDR_2_net, B => GND_1_net, Y => 
        AND2_3_Y);
    AND2_30 : AND2
      port map(A => AND2_11_Y, B => XOR2_33_Y, Y => AND2_30_Y);
    XOR2_WBINNXTSHIFT_4_inst : XOR2
      port map(A => XOR2_16_Y, B => AO1_3_Y, Y => 
        WBINNXTSHIFT_4_net);
    XNOR2_6 : XNOR2
      port map(A => RBINNXTSHIFT_3_net, B => MEM_WADDR_3_net, 
        Y => XNOR2_6_Y);
    AND2_14 : AND2
      port map(A => AND2_26_Y, B => XOR2_3_Y, Y => AND2_14_Y);
    INV_4 : INV
      port map(A => MEM_RADDR_2_net, Y => INV_4_Y);
    OA1C_0 : OA1C
      port map(A => AFVALCONST_3_net, B => WDIFF_3_net, C => 
        AFVALCONST_0_net, Y => OA1C_0_Y);
    AND2_32 : AND2
      port map(A => AND2_20_Y, B => AND2_24_Y, Y => AND2_32_Y);
    OR2A_1 : OR2A
      port map(A => WDIFF_2_net, B => AFVALCONST_0_net, Y => 
        OR2A_1_Y);
    DFN1E1C0_Q_52_inst : DFN1E1C0
      port map(D => QXI_52_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(52));
    AO1_2 : AO1
      port map(A => XOR2_26_Y, B => AND2_9_Y, C => AND2_29_Y, 
        Y => AO1_2_Y);
    DFN1C0_WGRY_0_inst : DFN1C0
      port map(D => XOR2_19_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_0_net);
    AND2_26 : AND2
      port map(A => XOR2_6_Y, B => XOR2_7_Y, Y => AND2_26_Y);
    XOR2_9 : XOR2
      port map(A => WBINNXTSHIFT_3_net, B => INV_2_Y, Y => 
        XOR2_9_Y);
    XOR2_WDIFF_2_inst : XOR2
      port map(A => XOR2_20_Y, B => OR3_0_Y, Y => WDIFF_2_net);
    AND2_23 : AND2
      port map(A => MEM_WADDR_4_net, B => GND_1_net, Y => 
        AND2_23_Y);
    DFN1E1C0_Q_36_inst : DFN1E1C0
      port map(D => QXI_36_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(36));
    XNOR2_4 : XNOR2
      port map(A => AFVALCONST_3_net, B => WDIFF_3_net, Y => 
        XNOR2_4_Y);
    XOR2_5 : XOR2
      port map(A => MEM_RADDR_4_net, B => GND_1_net, Y => 
        XOR2_5_Y);
    AND2_19 : AND2
      port map(A => AND2_26_Y, B => AND2_16_Y, Y => AND2_19_Y);
    DFN1E1C0_Q_59_inst : DFN1E1C0
      port map(D => QXI_59_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(59));
    DFN1E1C0_Q_0_inst : DFN1E1C0
      port map(D => QXI_0_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(0));
    XOR2_22 : XOR2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => 
        XOR2_22_Y);
    DFN1E1C0_Q_16_inst : DFN1E1C0
      port map(D => QXI_16_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(16));
    AO1_1 : AO1
      port map(A => AND2_16_Y, B => AO1_7_Y, C => AO1_2_Y, Y => 
        AO1_1_Y);
    XOR2_13 : XOR2
      port map(A => MEM_WADDR_2_net, B => GND_1_net, Y => 
        XOR2_13_Y);
    DFN1E1C0_Q_57_inst : DFN1E1C0
      port map(D => QXI_57_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(57));
    DFN1E1C0_Q_41_inst : DFN1E1C0
      port map(D => QXI_41_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(41));
    AO1_3 : AO1
      port map(A => AND2_12_Y, B => AO1_0_Y, C => AO1_10_Y, Y => 
        AO1_3_Y);
    DFN1E1C0_Q_53_inst : DFN1E1C0
      port map(D => QXI_53_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(53));
    XOR2_RBINNXTSHIFT_3_inst : XOR2
      port map(A => XOR2_28_Y, B => AO1_13_Y, Y => 
        RBINNXTSHIFT_3_net);
    DFN1E1C0_Q_40_inst : DFN1E1C0
      port map(D => QXI_40_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(40));
    AO1C_0 : AO1C
      port map(A => AFVALCONST_0_net, B => WDIFF_1_net, C => 
        AFVALCONST_0_net, Y => AO1C_0_Y);
    AND2_16 : AND2
      port map(A => XOR2_3_Y, B => XOR2_26_Y, Y => AND2_16_Y);
    XOR2_WDIFF_3_inst : XOR2
      port map(A => XOR2_9_Y, B => AO1_7_Y, Y => WDIFF_3_net);
    AND2_13 : AND2
      port map(A => MEM_RADDR_1_net, B => GND_1_net, Y => 
        AND2_13_Y);
    XOR2_10 : XOR2
      port map(A => MEM_RADDR_2_net, B => GND_1_net, Y => 
        XOR2_10_Y);
    XNOR2_1 : XNOR2
      port map(A => AFVALCONST_0_net, B => WDIFF_4_net, Y => 
        XNOR2_1_Y);
    DFN1C0_RGRY_4_inst : DFN1C0
      port map(D => XOR2_34_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_4_net);
    DFN1C0_MEM_WADDR_2_inst : DFN1C0
      port map(D => WBINNXTSHIFT_2_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_2_net);
    XOR2_27 : XOR2
      port map(A => WBINNXTSHIFT_4_net, B => GND_1_net, Y => 
        XOR2_27_Y);
    AND2_MEMORYRE : AND2
      port map(A => NAND2_1_Y, B => RE, Y => MEMORYRE);
    XOR2_7 : XOR2
      port map(A => WBINNXTSHIFT_2_net, B => INV_4_Y, Y => 
        XOR2_7_Y);
    AND2_5 : AND2
      port map(A => AND2_10_Y, B => XOR2_11_Y, Y => AND2_5_Y);
    XOR2_WBINNXTSHIFT_3_inst : XOR2
      port map(A => XOR2_32_Y, B => AO1_4_Y, Y => 
        WBINNXTSHIFT_3_net);
    XOR2_14 : XOR2
      port map(A => WBINNXTSHIFT_1_net, B => INV_1_Y, Y => 
        XOR2_14_Y);
    XNOR2_3 : XNOR2
      port map(A => RBINNXTSHIFT_0_net, B => MEM_WADDR_0_net, 
        Y => XNOR2_3_Y);
    XOR2_11 : XOR2
      port map(A => MEM_WADDR_2_net, B => GND_1_net, Y => 
        XOR2_11_Y);
    DFN1E1C0_Q_31_inst : DFN1E1C0
      port map(D => QXI_31_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(31));
    XOR2_25 : XOR2
      port map(A => RBINNXTSHIFT_3_net, B => RBINNXTSHIFT_4_net, 
        Y => XOR2_25_Y);
    DFN1E1C0_Q_28_inst : DFN1E1C0
      port map(D => QXI_28_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(28));
    DFN1E1C0_Q_30_inst : DFN1E1C0
      port map(D => QXI_30_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(30));
    DFN1E1C0_Q_42_inst : DFN1E1C0
      port map(D => QXI_42_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(42));
    DFN1E1C0_Q_11_inst : DFN1E1C0
      port map(D => QXI_11_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(11));
    AO1_6 : AO1
      port map(A => XOR2_3_Y, B => AO1_7_Y, C => AND2_9_Y, Y => 
        AO1_6_Y);
    DFN1E1C0_Q_10_inst : DFN1E1C0
      port map(D => QXI_10_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(10));
    DFN1C0_MEM_RADDR_3_inst : DFN1C0
      port map(D => RBINNXTSHIFT_3_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_3_net);
    AO1_12 : AO1
      port map(A => XOR2_5_Y, B => AO1_5_Y, C => AND2_0_Y, Y => 
        AO1_12_Y);
    XOR2_32 : XOR2
      port map(A => MEM_WADDR_3_net, B => GND_1_net, Y => 
        XOR2_32_Y);
    DFN1E1C0_Q_55_inst : DFN1E1C0
      port map(D => QXI_55_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(55));
    DFN1E1C0_Q_68_inst : DFN1E1C0
      port map(D => QXI_68_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(68));
    OR3_0 : OR3
      port map(A => AND2_22_Y, B => AND2_17_Y, C => AND2_2_Y, 
        Y => OR3_0_Y);
    DFN1E1C0_Q_54_inst : DFN1E1C0
      port map(D => QXI_54_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(54));
    AND2_9 : AND2
      port map(A => WBINNXTSHIFT_3_net, B => INV_2_Y, Y => 
        AND2_9_Y);
    DFN1E1C0_Q_49_inst : DFN1E1C0
      port map(D => QXI_49_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(49));
    DFN1E1C0_Q_9_inst : DFN1E1C0
      port map(D => QXI_9_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(9));
    DFN1E1C0_Q_5_inst : DFN1E1C0
      port map(D => QXI_5_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(5));
    NOR3A_0 : NOR3A
      port map(A => OR2A_1_Y, B => AO1C_0_Y, C => WDIFF_0_net, 
        Y => NOR3A_0_Y);
    DFN1C0_AFULL : DFN1C0
      port map(D => OR2_0_Y, CLK => CLK, CLR => RESET, Q => AFULL);
    INV_2 : INV
      port map(A => MEM_RADDR_3_net, Y => INV_2_Y);
    AO1_9 : AO1
      port map(A => XOR2_33_Y, B => AO1_3_Y, C => AND2_23_Y, Y => 
        AO1_9_Y);
    NAND3A_1 : NAND3A
      port map(A => NOR3A_0_Y, B => OR2A_0_Y, C => NAND3A_0_Y, 
        Y => NAND3A_1_Y);
    DFN1C0_DVLDX : DFN1C0
      port map(D => DVLDI, CLK => CLK, CLR => RESET, Q => DVLDX);
    NAND2_0 : NAND2
      port map(A => FULL_1_net, B => VCC_1_net, Y => NAND2_0_Y);
    DFN1E1C0_Q_32_inst : DFN1E1C0
      port map(D => QXI_32_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(32));
    DFN1E1C0_Q_47_inst : DFN1E1C0
      port map(D => QXI_47_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(47));
    DFN1E1C0_Q_43_inst : DFN1E1C0
      port map(D => QXI_43_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(43));
    AND2_27 : AND2
      port map(A => AND2_20_Y, B => XOR2_4_Y, Y => AND2_27_Y);
    DFN1C0_DVLDI : DFN1C0
      port map(D => AND2A_1_Y, CLK => CLK, CLR => RESET, Q => 
        DVLDI);
    XNOR2_10 : XNOR2
      port map(A => RBINNXTSHIFT_4_net, B => MEM_WADDR_4_net, 
        Y => XNOR2_10_Y);
    DFN1E1C0_Q_12_inst : DFN1E1C0
      port map(D => QXI_12_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(12));
    AND2_MEMORYWE : AND2
      port map(A => NAND2_0_Y, B => WE, Y => MEMORYWE);
    DFN1C0_WGRY_2_inst : DFN1C0
      port map(D => XOR2_12_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_2_net);
    AO1_0 : AO1
      port map(A => XOR2_18_Y, B => AND2_8_Y, C => AND2_18_Y, 
        Y => AO1_0_Y);
    XOR2_29 : XOR2
      port map(A => MEM_RADDR_1_net, B => GND_1_net, Y => 
        XOR2_29_Y);
    DFN1E1C0_Q_26_inst : DFN1E1C0
      port map(D => QXI_26_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(26));
    XOR2_2 : XOR2
      port map(A => MEM_RADDR_1_net, B => GND_1_net, Y => 
        XOR2_2_Y);
    DFN1E1C0_Q_39_inst : DFN1E1C0
      port map(D => QXI_39_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(39));
    AND2A_0 : AND2A
      port map(A => AFVALCONST_0_net, B => WDIFF_4_net, Y => 
        AND2A_0_Y);
    XNOR2_WDIFF_1_inst : XNOR2
      port map(A => XOR2_14_Y, B => NOR2A_0_Y, Y => WDIFF_1_net);
    OA1A_0 : OA1A
      port map(A => AFVALCONST_3_net, B => WDIFF_3_net, C => 
        WDIFF_4_net, Y => OA1A_0_Y);
    AOI1_0 : AOI1
      port map(A => AND2_6_Y, B => NAND3A_1_Y, C => NOR3_0_Y, 
        Y => AOI1_0_Y);
    DFN1E1C0_Q_19_inst : DFN1E1C0
      port map(D => QXI_19_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(19));
    AO1_10 : AO1
      port map(A => XOR2_35_Y, B => AND2_3_Y, C => AND2_1_Y, Y => 
        AO1_10_Y);
    XOR2_35 : XOR2
      port map(A => MEM_WADDR_3_net, B => GND_1_net, Y => 
        XOR2_35_Y);
    DFN1E1C0_Q_37_inst : DFN1E1C0
      port map(D => QXI_37_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(37));
    DFN1C0_WGRY_1_inst : DFN1C0
      port map(D => XOR2_17_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_1_net);
    DFN1P0_EMPTY : DFN1P0
      port map(D => EMPTYINT, CLK => CLK, PRE => RESET, Q => 
        EMPTY_1_net);
    DFN1E1C0_Q_3_inst : DFN1E1C0
      port map(D => QXI_3_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(3));
    DFN1E1C0_Q_33_inst : DFN1E1C0
      port map(D => QXI_33_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(33));
    DFN1E1C0_Q_66_inst : DFN1E1C0
      port map(D => QXI_66_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(66));
    AND2_0 : AND2
      port map(A => MEM_RADDR_4_net, B => GND_1_net, Y => 
        AND2_0_Y);
    AND2_17 : AND2
      port map(A => WBINNXTSHIFT_1_net, B => INV_3_Y, Y => 
        AND2_17_Y);
    DFN1E1C0_Q_17_inst : DFN1E1C0
      port map(D => QXI_17_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(17));
    NOR2A_0 : NOR2A
      port map(A => MEM_RADDR_0_net, B => WBINNXTSHIFT_0_net, 
        Y => NOR2A_0_Y);
    XOR2_6 : XOR2
      port map(A => WBINNXTSHIFT_1_net, B => INV_1_Y, Y => 
        XOR2_6_Y);
    AO1_13 : AO1
      port map(A => XOR2_4_Y, B => AO1_8_Y, C => AND2_4_Y, Y => 
        AO1_13_Y);
    DFN1E1C0_Q_13_inst : DFN1E1C0
      port map(D => QXI_13_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(13));
    DFN1E1C0_Q_45_inst : DFN1E1C0
      port map(D => QXI_45_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(45));
    OR2A_0 : OR2A
      port map(A => AFVALCONST_0_net, B => WDIFF_2_net, Y => 
        OR2A_0_Y);
    XNOR2_7 : XNOR2
      port map(A => MEM_RADDR_1_net, B => WBINNXTSHIFT_1_net, 
        Y => XNOR2_7_Y);
    XOR2_12 : XOR2
      port map(A => WBINNXTSHIFT_2_net, B => WBINNXTSHIFT_3_net, 
        Y => XOR2_12_Y);
    DFN1E1C0_Q_44_inst : DFN1E1C0
      port map(D => QXI_44_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(44));
    XOR2_26 : XOR2
      port map(A => WBINNXTSHIFT_4_net, B => INV_0_Y, Y => 
        XOR2_26_Y);
    AND2_4 : AND2
      port map(A => MEM_RADDR_2_net, B => GND_1_net, Y => 
        AND2_4_Y);
    DFN1E1C0_Q_21_inst : DFN1E1C0
      port map(D => QXI_21_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(21));
    AND2_FULLINT : AND2
      port map(A => AND2_7_Y, B => XOR2_23_Y, Y => FULLINT);
    DFN1E1C0_Q_2_inst : DFN1E1C0
      port map(D => QXI_2_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(2));
    DFN1E1C0_Q_20_inst : DFN1E1C0
      port map(D => QXI_20_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(20));
    XNOR2_5 : XNOR2
      port map(A => RBINNXTSHIFT_2_net, B => MEM_WADDR_2_net, 
        Y => XNOR2_5_Y);
    AO1_5 : AO1
      port map(A => AND2_24_Y, B => AO1_8_Y, C => AO1_11_Y, Y => 
        AO1_5_Y);
    XOR2_WDIFF_4_inst : XOR2
      port map(A => XOR2_21_Y, B => AO1_6_Y, Y => WDIFF_4_net);
    DFN1C0_RGRY_3_inst : DFN1C0
      port map(D => XOR2_25_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_3_net);
    AND2_8 : AND2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => AND2_8_Y);
    XOR2_3 : XOR2
      port map(A => WBINNXTSHIFT_3_net, B => INV_2_Y, Y => 
        XOR2_3_Y);
    DFN1E1C0_Q_61_inst : DFN1E1C0
      port map(D => QXI_61_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(61));
    DFN1E1C0_Q_35_inst : DFN1E1C0
      port map(D => QXI_35_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(35));
    DFN1E1C0_Q_34_inst : DFN1E1C0
      port map(D => QXI_34_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(34));
    DFN1C0_MEM_WADDR_1_inst : DFN1C0
      port map(D => WBINNXTSHIFT_1_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_1_net);
    XOR2_RBINNXTSHIFT_1_inst : XOR2
      port map(A => XOR2_29_Y, B => AND2_28_Y, Y => 
        RBINNXTSHIFT_1_net);
    DFN1E1C0_Q_60_inst : DFN1E1C0
      port map(D => QXI_60_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(60));
    XOR2_17 : XOR2
      port map(A => WBINNXTSHIFT_1_net, B => WBINNXTSHIFT_2_net, 
        Y => XOR2_17_Y);
    XOR2_28 : XOR2
      port map(A => MEM_RADDR_3_net, B => GND_1_net, Y => 
        XOR2_28_Y);
    DFN1E1C0_Q_15_inst : DFN1E1C0
      port map(D => QXI_15_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(15));
    DFN1E1C0_Q_14_inst : DFN1E1C0
      port map(D => QXI_14_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(14));
    RAM512X18_QXI_35_inst : RAM512X18
      port map(RADDR8 => GND_1_net, RADDR7 => GND_1_net, 
        RADDR6 => GND_1_net, RADDR5 => GND_1_net, RADDR4 => 
        GND_1_net, RADDR3 => MEM_RADDR_3_net, RADDR2 => 
        MEM_RADDR_2_net, RADDR1 => MEM_RADDR_1_net, RADDR0 => 
        MEM_RADDR_0_net, WADDR8 => GND_1_net, WADDR7 => GND_1_net, 
        WADDR6 => GND_1_net, WADDR5 => GND_1_net, WADDR4 => 
        GND_1_net, WADDR3 => MEM_WADDR_3_net, WADDR2 => 
        MEM_WADDR_2_net, WADDR1 => MEM_WADDR_1_net, WADDR0 => 
        MEM_WADDR_0_net, WD17 => DATA(35), WD16 => DATA(34), 
        WD15 => DATA(33), WD14 => DATA(32), WD13 => DATA(31), 
        WD12 => DATA(30), WD11 => DATA(29), WD10 => DATA(28), 
        WD9 => DATA(27), WD8 => DATA(26), WD7 => DATA(25), WD6 => 
        DATA(24), WD5 => DATA(23), WD4 => DATA(22), WD3 => 
        DATA(21), WD2 => DATA(20), WD1 => DATA(19), WD0 => 
        DATA(18), RW0 => GND_1_net, RW1 => VCC_1_net, WW0 => 
        GND_1_net, WW1 => VCC_1_net, PIPE => GND_1_net, REN => 
        MEMRENEG, WEN => MEMWENEG, RCLK => CLK, WCLK => CLK, 
        RESET => RESET, RD17 => QXI_35_net, RD16 => QXI_34_net, 
        RD15 => QXI_33_net, RD14 => QXI_32_net, RD13 => 
        QXI_31_net, RD12 => QXI_30_net, RD11 => QXI_29_net, 
        RD10 => QXI_28_net, RD9 => QXI_27_net, RD8 => QXI_26_net, 
        RD7 => QXI_25_net, RD6 => QXI_24_net, RD5 => QXI_23_net, 
        RD4 => QXI_22_net, RD3 => QXI_21_net, RD2 => QXI_20_net, 
        RD1 => QXI_19_net, RD0 => QXI_18_net);
    XOR2_15 : XOR2
      port map(A => RBINNXTSHIFT_1_net, B => RBINNXTSHIFT_2_net, 
        Y => XOR2_15_Y);
    DFN1C0_MEM_RADDR_0_inst : DFN1C0
      port map(D => RBINNXTSHIFT_0_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_0_net);
    DFN1E1C0_Q_22_inst : DFN1E1C0
      port map(D => QXI_22_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(22));
    DFN1E1C0_Q_8_inst : DFN1E1C0
      port map(D => QXI_8_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(8));
    RAM512X18_QXI_53_inst : RAM512X18
      port map(RADDR8 => GND_1_net, RADDR7 => GND_1_net, 
        RADDR6 => GND_1_net, RADDR5 => GND_1_net, RADDR4 => 
        GND_1_net, RADDR3 => MEM_RADDR_3_net, RADDR2 => 
        MEM_RADDR_2_net, RADDR1 => MEM_RADDR_1_net, RADDR0 => 
        MEM_RADDR_0_net, WADDR8 => GND_1_net, WADDR7 => GND_1_net, 
        WADDR6 => GND_1_net, WADDR5 => GND_1_net, WADDR4 => 
        GND_1_net, WADDR3 => MEM_WADDR_3_net, WADDR2 => 
        MEM_WADDR_2_net, WADDR1 => MEM_WADDR_1_net, WADDR0 => 
        MEM_WADDR_0_net, WD17 => DATA(53), WD16 => DATA(52), 
        WD15 => DATA(51), WD14 => DATA(50), WD13 => DATA(49), 
        WD12 => DATA(48), WD11 => DATA(47), WD10 => DATA(46), 
        WD9 => DATA(45), WD8 => DATA(44), WD7 => DATA(43), WD6 => 
        DATA(42), WD5 => DATA(41), WD4 => DATA(40), WD3 => 
        DATA(39), WD2 => DATA(38), WD1 => DATA(37), WD0 => 
        DATA(36), RW0 => GND_1_net, RW1 => VCC_1_net, WW0 => 
        GND_1_net, WW1 => VCC_1_net, PIPE => GND_1_net, REN => 
        MEMRENEG, WEN => MEMWENEG, RCLK => CLK, WCLK => CLK, 
        RESET => RESET, RD17 => QXI_53_net, RD16 => QXI_52_net, 
        RD15 => QXI_51_net, RD14 => QXI_50_net, RD13 => 
        QXI_49_net, RD12 => QXI_48_net, RD11 => QXI_47_net, 
        RD10 => QXI_46_net, RD9 => QXI_45_net, RD8 => QXI_44_net, 
        RD7 => QXI_43_net, RD6 => QXI_42_net, RD5 => QXI_41_net, 
        RD4 => QXI_40_net, RD3 => QXI_39_net, RD2 => QXI_38_net, 
        RD1 => QXI_37_net, RD0 => QXI_36_net);
    DFN1C0_RGRY_0_inst : DFN1C0
      port map(D => XOR2_8_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_0_net);
    AND2_21 : AND2
      port map(A => MEM_RADDR_3_net, B => GND_1_net, Y => 
        AND2_21_Y);
    XOR2_WBINNXTSHIFT_1_inst : XOR2
      port map(A => XOR2_0_Y, B => AND2_8_Y, Y => 
        WBINNXTSHIFT_1_net);
    DFN1C0_WGRY_4_inst : DFN1C0
      port map(D => XOR2_27_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_4_net);
    XOR2_0 : XOR2
      port map(A => MEM_WADDR_1_net, B => GND_1_net, Y => 
        XOR2_0_Y);
    NAND2_1 : NAND2
      port map(A => EMPTY_1_net, B => VCC_1_net, Y => NAND2_1_Y);
    AO1_4 : AO1
      port map(A => XOR2_11_Y, B => AO1_0_Y, C => AND2_3_Y, Y => 
        AO1_4_Y);
    RAM512X18_QXI_17_inst : RAM512X18
      port map(RADDR8 => GND_1_net, RADDR7 => GND_1_net, 
        RADDR6 => GND_1_net, RADDR5 => GND_1_net, RADDR4 => 
        GND_1_net, RADDR3 => MEM_RADDR_3_net, RADDR2 => 
        MEM_RADDR_2_net, RADDR1 => MEM_RADDR_1_net, RADDR0 => 
        MEM_RADDR_0_net, WADDR8 => GND_1_net, WADDR7 => GND_1_net, 
        WADDR6 => GND_1_net, WADDR5 => GND_1_net, WADDR4 => 
        GND_1_net, WADDR3 => MEM_WADDR_3_net, WADDR2 => 
        MEM_WADDR_2_net, WADDR1 => MEM_WADDR_1_net, WADDR0 => 
        MEM_WADDR_0_net, WD17 => DATA(17), WD16 => DATA(16), 
        WD15 => DATA(15), WD14 => DATA(14), WD13 => DATA(13), 
        WD12 => DATA(12), WD11 => DATA(11), WD10 => DATA(10), 
        WD9 => DATA(9), WD8 => DATA(8), WD7 => DATA(7), WD6 => 
        DATA(6), WD5 => DATA(5), WD4 => DATA(4), WD3 => DATA(3), 
        WD2 => DATA(2), WD1 => DATA(1), WD0 => DATA(0), RW0 => 
        GND_1_net, RW1 => VCC_1_net, WW0 => GND_1_net, WW1 => 
        VCC_1_net, PIPE => GND_1_net, REN => MEMRENEG, WEN => 
        MEMWENEG, RCLK => CLK, WCLK => CLK, RESET => RESET, 
        RD17 => QXI_17_net, RD16 => QXI_16_net, RD15 => 
        QXI_15_net, RD14 => QXI_14_net, RD13 => QXI_13_net, 
        RD12 => QXI_12_net, RD11 => QXI_11_net, RD10 => 
        QXI_10_net, RD9 => QXI_9_net, RD8 => QXI_8_net, RD7 => 
        QXI_7_net, RD6 => QXI_6_net, RD5 => QXI_5_net, RD4 => 
        QXI_4_net, RD3 => QXI_3_net, RD2 => QXI_2_net, RD1 => 
        QXI_1_net, RD0 => QXI_0_net);
    DFN1E1C0_Q_62_inst : DFN1E1C0
      port map(D => QXI_62_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(62));
    XOR2_RBINNXTSHIFT_2_inst : XOR2
      port map(A => XOR2_10_Y, B => AO1_8_Y, Y => 
        RBINNXTSHIFT_2_net);
    DFN1E1C0_Q_29_inst : DFN1E1C0
      port map(D => QXI_29_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(29));
    DFN1E1C0_Q_58_inst : DFN1E1C0
      port map(D => QXI_58_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(58));
    XOR2_36 : XOR2
      port map(A => MEM_RADDR_4_net, B => GND_1_net, Y => 
        XOR2_36_Y);
    XNOR2_8 : XNOR2
      port map(A => MEM_RADDR_3_net, B => WBINNXTSHIFT_3_net, 
        Y => XNOR2_8_Y);
    AND2_28 : AND2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        AND2_28_Y);
    AND2_25 : AND2
      port map(A => AND3_1_Y, B => XNOR2_6_Y, Y => AND2_25_Y);
end DEF_ARCH;

-- _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


-- _GEN_File_Contents_

-- Version:9.1.0.18
-- ACTGENU_CALL:1
-- BATCH:T
-- FAM:ProASIC3
-- OUTFORMAT:VHDL
-- LPMTYPE:LPM_SOFTFIFO
-- LPM_HINT:MEMFF
-- INSERT_PAD:NO
-- INSERT_IOREG:NO
-- GEN_BHV_VHDL_VAL:F
-- GEN_BHV_VERILOG_VAL:F
-- MGNTIMER:F
-- MGNCMPL:T
-- DESDIR:D:/Actelprj/smart_top/smartgen\Fifo_rd
-- GEN_BEHV_MODULE:T
-- SMARTGEN_DIE:M1IS8X8M2
-- SMARTGEN_PACKAGE:fg484
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- WWIDTH:72
-- WDEPTH:16
-- RWIDTH:72
-- RDEPTH:16
-- CLKS:1
-- CLOCK_PN:CLK
-- WCLK_EDGE:RISE
-- ACLR_PN:RESET
-- RESET_POLARITY:0
-- INIT_RAM:F
-- WE_POLARITY:1
-- RE_POLARITY:1
-- FF_PN:FULL
-- AF_PN:AFULL
-- WACK_PN:WACK
-- OVRFLOW_PN:OVERFLOW
-- WRCNT_PN:WRCNT
-- WE_PN:WE
-- EF_PN:EMPTY
-- AE_PN:AEMPTY
-- DVLD_PN:DVLD
-- UDRFLOW_PN:UNDERFLOW
-- RDCNT_PN:RDCNT
-- RE_PN:RE
-- CONTROLLERONLY:F
-- FSTOP:YES
-- ESTOP:YES
-- WRITEACK:NO
-- OVERFLOW:NO
-- WRCOUNT:NO
-- DATAVALID:NO
-- UNDERFLOW:NO
-- RDCOUNT:NO
-- AF_PORT_PN:AFVAL
-- AE_PORT_PN:AEVAL
-- AFFLAG:STATIC
-- AEFLAG:NONE
-- AFVAL:8
-- DATA_IN_PN:DATA
-- DATA_OUT_PN:Q
-- CASCADE:0

-- _End_Comments_

