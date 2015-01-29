-- Version: 9.1 9.1.0.18

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity ByteData is 
    port( DATA : in std_logic_vector(7 downto 0); Q : out 
        std_logic_vector(7 downto 0);WE, RE, CLK : in std_logic;  
        FULL, EMPTY : out std_logic;  RESET : in std_logic) ;
end ByteData;


architecture DEF_ARCH of  ByteData is

    component AND2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AND3
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component XNOR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AO1
        port(A, B, C : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component XOR2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DFN1C0
        port(D, CLK, CLR : in std_logic := 'U'; Q : out std_logic
        ) ;
    end component;

    component RAM4K9
    generic (MEMORYFILE:string := "");

        port(ADDRA11, ADDRA10, ADDRA9, ADDRA8, ADDRA7, ADDRA6, 
        ADDRA5, ADDRA4, ADDRA3, ADDRA2, ADDRA1, ADDRA0, ADDRB11, 
        ADDRB10, ADDRB9, ADDRB8, ADDRB7, ADDRB6, ADDRB5, ADDRB4, 
        ADDRB3, ADDRB2, ADDRB1, ADDRB0, DINA8, DINA7, DINA6, 
        DINA5, DINA4, DINA3, DINA2, DINA1, DINA0, DINB8, DINB7, 
        DINB6, DINB5, DINB4, DINB3, DINB2, DINB1, DINB0, WIDTHA0, 
        WIDTHA1, WIDTHB0, WIDTHB1, PIPEA, PIPEB, WMODEA, WMODEB, 
        BLKA, BLKB, WENA, WENB, CLKA, CLKB, RESET : in std_logic := 
        'U'; DOUTA8, DOUTA7, DOUTA6, DOUTA5, DOUTA4, DOUTA3, 
        DOUTA2, DOUTA1, DOUTA0, DOUTB8, DOUTB7, DOUTB6, DOUTB5, 
        DOUTB4, DOUTB3, DOUTB2, DOUTB1, DOUTB0 : out std_logic) ;
    end component;

    component DFN1E1C0
        port(D, CLK, CLR, E : in std_logic := 'U'; Q : out 
        std_logic) ;
    end component;

    component INV
        port(A : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component NAND2
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component AND2A
        port(A, B : in std_logic := 'U'; Y : out std_logic) ;
    end component;

    component DFN1P0
        port(D, CLK, PRE : in std_logic := 'U'; Q : out std_logic
        ) ;
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
        WBINNXTSHIFT_4_net, MEM_RADDR_5_net, RBINNXTSHIFT_5_net, 
        MEM_WADDR_5_net, WBINNXTSHIFT_5_net, MEM_RADDR_6_net, 
        RBINNXTSHIFT_6_net, MEM_WADDR_6_net, WBINNXTSHIFT_6_net, 
        MEM_RADDR_7_net, RBINNXTSHIFT_7_net, MEM_WADDR_7_net, 
        WBINNXTSHIFT_7_net, MEM_RADDR_8_net, RBINNXTSHIFT_8_net, 
        MEM_WADDR_8_net, WBINNXTSHIFT_8_net, MEM_RADDR_9_net, 
        RBINNXTSHIFT_9_net, MEM_WADDR_9_net, WBINNXTSHIFT_9_net, 
        MEM_RADDR_10_net, RBINNXTSHIFT_10_net, MEM_WADDR_10_net, 
        WBINNXTSHIFT_10_net, MEM_RADDR_11_net, 
        RBINNXTSHIFT_11_net, MEM_WADDR_11_net, 
        WBINNXTSHIFT_11_net, MEM_RADDR_12_net, 
        RBINNXTSHIFT_12_net, MEM_WADDR_12_net, 
        WBINNXTSHIFT_12_net, FULLINT, MEMORYWE, MEMWENEG, 
        WGRY_0_net, WGRY_1_net, WGRY_2_net, WGRY_3_net, 
        WGRY_4_net, WGRY_5_net, WGRY_6_net, WGRY_7_net, 
        WGRY_8_net, WGRY_9_net, WGRY_10_net, WGRY_11_net, 
        WGRY_12_net, EMPTYINT, MEMORYRE, MEMRENEG, DVLDI, DVLDX, 
        RGRY_0_net, RGRY_1_net, RGRY_2_net, RGRY_3_net, 
        RGRY_4_net, RGRY_5_net, RGRY_6_net, RGRY_7_net, 
        RGRY_8_net, RGRY_9_net, RGRY_10_net, RGRY_11_net, 
        RGRY_12_net, QXI_0_net, QXI_1_net, QXI_2_net, QXI_3_net, 
        QXI_4_net, QXI_5_net, QXI_6_net, QXI_7_net, XOR2_13_Y, 
        XOR2_21_Y, XOR2_42_Y, XOR2_43_Y, XOR2_64_Y, XOR2_70_Y, 
        XOR2_56_Y, XOR2_18_Y, XOR2_55_Y, XOR2_32_Y, XOR2_67_Y, 
        XOR2_5_Y, XOR2_33_Y, AND2_35_Y, AND2_15_Y, AND2_46_Y, 
        AND2_4_Y, AND2_14_Y, AND2_1_Y, AND2_30_Y, AND2_24_Y, 
        AND2_33_Y, AND2_26_Y, AND2_32_Y, AND2_57_Y, XOR2_57_Y, 
        XOR2_6_Y, XOR2_9_Y, XOR2_3_Y, XOR2_10_Y, XOR2_23_Y, 
        XOR2_53_Y, XOR2_4_Y, XOR2_14_Y, XOR2_65_Y, XOR2_50_Y, 
        XOR2_7_Y, XOR2_71_Y, AND2_16_Y, AO1_30_Y, AND2_53_Y, 
        AO1_8_Y, AND2_19_Y, AO1_37_Y, AND2_31_Y, AO1_32_Y, 
        AND2_48_Y, AO1_15_Y, AND2_41_Y, AND2_60_Y, AO1_33_Y, 
        AND2_3_Y, AO1_0_Y, AND2_56_Y, AND2_0_Y, AND2_63_Y, 
        AND2_36_Y, AND2_64_Y, AND2_11_Y, AND2_34_Y, AND2_28_Y, 
        AND2_38_Y, AND2_62_Y, AO1_31_Y, AND2_47_Y, AND2_61_Y, 
        AO1_14_Y, AO1_24_Y, AO1_6_Y, AO1_11_Y, AO1_2_Y, AO1_21_Y, 
        AO1_18_Y, AO1_7_Y, AO1_16_Y, AO1_36_Y, AO1_34_Y, 
        XOR2_36_Y, XOR2_34_Y, XOR2_51_Y, XOR2_72_Y, XOR2_20_Y, 
        XOR2_68_Y, XOR2_63_Y, XOR2_73_Y, XOR2_8_Y, XOR2_29_Y, 
        XOR2_76_Y, XOR2_74_Y, NAND2_1_Y, XOR2_31_Y, XOR2_26_Y, 
        XOR2_17_Y, XOR2_54_Y, XOR2_46_Y, XOR2_28_Y, XOR2_37_Y, 
        XOR2_44_Y, XOR2_45_Y, XOR2_15_Y, XOR2_39_Y, XOR2_2_Y, 
        XOR2_52_Y, AND2_45_Y, AND2_9_Y, AND2_6_Y, AND2_49_Y, 
        AND2_10_Y, AND2_52_Y, AND2_13_Y, AND2_58_Y, AND2_50_Y, 
        AND2_2_Y, AND2_5_Y, AND2_23_Y, XOR2_35_Y, XOR2_30_Y, 
        XOR2_16_Y, XOR2_66_Y, XOR2_62_Y, XOR2_58_Y, XOR2_0_Y, 
        XOR2_47_Y, XOR2_19_Y, XOR2_41_Y, XOR2_60_Y, XOR2_22_Y, 
        XOR2_25_Y, AND2_55_Y, AO1_20_Y, AND2_54_Y, AO1_3_Y, 
        AND2_59_Y, AO1_4_Y, AND2_44_Y, AO1_17_Y, AND2_8_Y, 
        AO1_35_Y, AND2_12_Y, AND2_29_Y, AO1_23_Y, AND2_25_Y, 
        AO1_28_Y, AND2_43_Y, AND2_40_Y, AND2_21_Y, AND2_20_Y, 
        AND2_22_Y, AND2_7_Y, AND2_37_Y, AND2_42_Y, AND2_51_Y, 
        AND2_18_Y, AO1_22_Y, AND2_39_Y, AND2_27_Y, AO1_1_Y, 
        AO1_26_Y, AO1_25_Y, AO1_19_Y, AO1_9_Y, AO1_10_Y, AO1_5_Y, 
        AO1_27_Y, AO1_12_Y, AO1_29_Y, AO1_13_Y, XOR2_48_Y, 
        XOR2_11_Y, XOR2_69_Y, XOR2_75_Y, XOR2_38_Y, XOR2_59_Y, 
        XOR2_24_Y, XOR2_1_Y, XOR2_61_Y, XOR2_27_Y, XOR2_49_Y, 
        XOR2_12_Y, RAM4K9_QXI_0_DOUTA0, RAM4K9_QXI_1_DOUTA0, 
        RAM4K9_QXI_2_DOUTA0, RAM4K9_QXI_3_DOUTA0, 
        RAM4K9_QXI_4_DOUTA0, RAM4K9_QXI_5_DOUTA0, 
        RAM4K9_QXI_6_DOUTA0, RAM4K9_QXI_7_DOUTA0, AND3_0_Y, 
        XNOR2_22_Y, XNOR2_12_Y, XNOR2_7_Y, XNOR2_13_Y, XNOR2_14_Y, 
        XNOR2_24_Y, XNOR2_10_Y, XNOR2_18_Y, XNOR2_20_Y, 
        XNOR2_16_Y, XNOR2_9_Y, XNOR2_23_Y, XNOR2_4_Y, AND3_7_Y, 
        AND3_8_Y, AND2_17_Y, AND3_9_Y, AND3_6_Y, AND2A_0_Y, 
        AND3_1_Y, XOR2_40_Y, XNOR2_1_Y, XNOR2_17_Y, XNOR2_21_Y, 
        XNOR2_19_Y, XNOR2_0_Y, XNOR2_5_Y, XNOR2_15_Y, XNOR2_8_Y, 
        XNOR2_2_Y, XNOR2_3_Y, XNOR2_6_Y, XNOR2_11_Y, AND3_5_Y, 
        AND3_2_Y, AND2_65_Y, AND3_4_Y, AND3_3_Y, NAND2_0_Y, 
        VCC_1_net, GND_1_net : std_logic ;
    begin   

    FULL <= FULL_1_net;
    
    EMPTY <= EMPTY_1_net;
    
    VCC_2_net : VCC port map(Y => VCC_1_net);
    GND_2_net : GND port map(Y => GND_1_net);
    AND2_2 : AND2
      port map(A => MEM_WADDR_10_net, B => GND_1_net, Y => 
        AND2_2_Y);
    AND3_6 : AND3
      port map(A => XNOR2_14_Y, B => XNOR2_24_Y, C => XNOR2_10_Y, 
        Y => AND3_6_Y);
    AND2_20 : AND2
      port map(A => AND2_29_Y, B => AND2_59_Y, Y => AND2_20_Y);
    XNOR2_13 : XNOR2
      port map(A => RBINNXTSHIFT_2_net, B => MEM_WADDR_2_net, 
        Y => XNOR2_13_Y);
    AO1_11 : AO1
      port map(A => XOR2_10_Y, B => AO1_6_Y, C => AND2_4_Y, Y => 
        AO1_11_Y);
    AND2_11 : AND2
      port map(A => AND2_16_Y, B => XOR2_9_Y, Y => AND2_11_Y);
    XOR2_WBINNXTSHIFT_2_inst : XOR2
      port map(A => XOR2_11_Y, B => AO1_1_Y, Y => 
        WBINNXTSHIFT_2_net);
    AND2_22 : AND2
      port map(A => AND2_40_Y, B => AND2_8_Y, Y => AND2_22_Y);
    DFN1C0_RGRY_9_inst : DFN1C0
      port map(D => XOR2_32_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_9_net);
    DFN1C0_FULL : DFN1C0
      port map(D => FULLINT, CLK => CLK, CLR => RESET, Q => 
        FULL_1_net);
    XNOR2_9 : XNOR2
      port map(A => RBINNXTSHIFT_9_net, B => MEM_WADDR_9_net, 
        Y => XNOR2_9_Y);
    XOR2_19 : XOR2
      port map(A => MEM_WADDR_8_net, B => GND_1_net, Y => 
        XOR2_19_Y);
    AND2_44 : AND2
      port map(A => XOR2_0_Y, B => XOR2_47_Y, Y => AND2_44_Y);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(6), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_6_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_6_net);
    AO1_31 : AO1
      port map(A => XOR2_71_Y, B => AO1_34_Y, C => AND2_57_Y, 
        Y => AO1_31_Y);
    XOR2_1 : XOR2
      port map(A => MEM_WADDR_8_net, B => GND_1_net, Y => 
        XOR2_1_Y);
    XOR2_23 : XOR2
      port map(A => MEM_RADDR_5_net, B => GND_1_net, Y => 
        XOR2_23_Y);
    DFN1E1C0_Q_1_inst : DFN1E1C0
      port map(D => QXI_1_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(1));
    DFN1E1C0_Q_4_inst : DFN1E1C0
      port map(D => QXI_4_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(4));
    DFN1E1C0_Q_7_inst : DFN1E1C0
      port map(D => QXI_7_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(7));
    XOR2_47 : XOR2
      port map(A => MEM_WADDR_7_net, B => GND_1_net, Y => 
        XOR2_47_Y);
    XOR2_38 : XOR2
      port map(A => MEM_WADDR_5_net, B => GND_1_net, Y => 
        XOR2_38_Y);
    XOR2_RBINNXTSHIFT_0_inst : XOR2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        RBINNXTSHIFT_0_net);
    AO1_7 : AO1
      port map(A => XOR2_14_Y, B => AO1_18_Y, C => AND2_24_Y, 
        Y => AO1_7_Y);
    DFN1C0_WGRY_6_inst : DFN1C0
      port map(D => XOR2_37_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_6_net);
    AND2_18 : AND2
      port map(A => AND2_22_Y, B => XOR2_60_Y, Y => AND2_18_Y);
    AND2_15 : AND2
      port map(A => MEM_RADDR_2_net, B => GND_1_net, Y => 
        AND2_15_Y);
    AO1_25 : AO1
      port map(A => AND2_54_Y, B => AO1_1_Y, C => AO1_20_Y, Y => 
        AO1_25_Y);
    XOR2_45 : XOR2
      port map(A => WBINNXTSHIFT_8_net, B => WBINNXTSHIFT_9_net, 
        Y => XOR2_45_Y);
    XOR2_RBINNXTSHIFT_9_inst : XOR2
      port map(A => XOR2_8_Y, B => AO1_7_Y, Y => 
        RBINNXTSHIFT_9_net);
    AND2_1 : AND2
      port map(A => MEM_RADDR_6_net, B => GND_1_net, Y => 
        AND2_1_Y);
    DFN1C0_MEM_WADDR_0_inst : DFN1C0
      port map(D => WBINNXTSHIFT_0_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_0_net);
    XNOR2_21 : XNOR2
      port map(A => MEM_RADDR_2_net, B => WBINNXTSHIFT_2_net, 
        Y => XNOR2_21_Y);
    AND2_49 : AND2
      port map(A => MEM_WADDR_4_net, B => GND_1_net, Y => 
        AND2_49_Y);
    DFN1C0_MEM_WADDR_3_inst : DFN1C0
      port map(D => WBINNXTSHIFT_3_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_3_net);
    DFN1C0_MEM_RADDR_1_inst : DFN1C0
      port map(D => RBINNXTSHIFT_1_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_1_net);
    AO1_8 : AO1
      port map(A => XOR2_23_Y, B => AND2_4_Y, C => AND2_14_Y, 
        Y => AO1_8_Y);
    AND2_10 : AND2
      port map(A => MEM_WADDR_5_net, B => GND_1_net, Y => 
        AND2_10_Y);
    AND2_7 : AND2
      port map(A => AND2_55_Y, B => XOR2_16_Y, Y => AND2_7_Y);
    XOR2_20 : XOR2
      port map(A => MEM_RADDR_5_net, B => GND_1_net, Y => 
        XOR2_20_Y);
    XOR2_63 : XOR2
      port map(A => MEM_RADDR_7_net, B => GND_1_net, Y => 
        XOR2_63_Y);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(2), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_2_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_2_net);
    AND2_12 : AND2
      port map(A => XOR2_60_Y, B => XOR2_22_Y, Y => AND2_12_Y);
    DFN1C0_WGRY_5_inst : DFN1C0
      port map(D => XOR2_28_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_5_net);
    XOR2_52 : XOR2
      port map(A => WBINNXTSHIFT_12_net, B => GND_1_net, Y => 
        XOR2_52_Y);
    AND2_61 : AND2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        AND2_61_Y);
    XOR2_WBINNXTSHIFT_0_inst : XOR2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => 
        WBINNXTSHIFT_0_net);
    DFN1C0_MEM_WADDR_4_inst : DFN1C0
      port map(D => WBINNXTSHIFT_4_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_4_net);
    AO1_15 : AO1
      port map(A => XOR2_7_Y, B => AND2_26_Y, C => AND2_32_Y, 
        Y => AO1_15_Y);
    DFN1C0_WGRY_7_inst : DFN1C0
      port map(D => XOR2_44_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_7_net);
    DFN1C0_MEM_WADDR_12_inst : DFN1C0
      port map(D => WBINNXTSHIFT_12_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_12_net);
    AND2_EMPTYINT : AND2
      port map(A => AND3_0_Y, B => XNOR2_22_Y, Y => EMPTYINT);
    XOR2_24 : XOR2
      port map(A => MEM_WADDR_7_net, B => GND_1_net, Y => 
        XOR2_24_Y);
    AND2_57 : AND2
      port map(A => MEM_RADDR_12_net, B => GND_1_net, Y => 
        AND2_57_Y);
    XOR2_21 : XOR2
      port map(A => RBINNXTSHIFT_1_net, B => RBINNXTSHIFT_2_net, 
        Y => XOR2_21_Y);
    AO1_35 : AO1
      port map(A => XOR2_22_Y, B => AND2_2_Y, C => AND2_5_Y, Y => 
        AO1_35_Y);
    XOR2_WBINNXTSHIFT_9_inst : XOR2
      port map(A => XOR2_61_Y, B => AO1_27_Y, Y => 
        WBINNXTSHIFT_9_net);
    AND2_46 : AND2
      port map(A => MEM_RADDR_3_net, B => GND_1_net, Y => 
        AND2_46_Y);
    XOR2_RBINNXTSHIFT_8_inst : XOR2
      port map(A => XOR2_73_Y, B => AO1_18_Y, Y => 
        RBINNXTSHIFT_8_net);
    XOR2_16 : XOR2
      port map(A => MEM_WADDR_2_net, B => GND_1_net, Y => 
        XOR2_16_Y);
    XOR2_60 : XOR2
      port map(A => MEM_WADDR_10_net, B => GND_1_net, Y => 
        XOR2_60_Y);
    AND2_65 : AND2
      port map(A => XNOR2_6_Y, B => XNOR2_11_Y, Y => AND2_65_Y);
    AND2_43 : AND2
      port map(A => AND2_8_Y, B => AND2_12_Y, Y => AND2_43_Y);
    AO1_24 : AO1
      port map(A => XOR2_9_Y, B => AO1_14_Y, C => AND2_15_Y, Y => 
        AO1_24_Y);
    AND3_3 : AND3
      port map(A => XNOR2_19_Y, B => XNOR2_0_Y, C => XNOR2_5_Y, 
        Y => AND3_3_Y);
    MEMWEBUBBLE : INV
      port map(A => MEMORYWE, Y => MEMWENEG);
    AND2_6 : AND2
      port map(A => MEM_WADDR_3_net, B => GND_1_net, Y => 
        AND2_6_Y);
    XOR2_64 : XOR2
      port map(A => RBINNXTSHIFT_4_net, B => RBINNXTSHIFT_5_net, 
        Y => XOR2_64_Y);
    AND3_0 : AND3
      port map(A => XNOR2_9_Y, B => AND3_8_Y, C => AND2_17_Y, 
        Y => AND3_0_Y);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(1), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_1_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_1_net);
    DFN1C0_MEM_RADDR_2_inst : DFN1C0
      port map(D => RBINNXTSHIFT_2_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_2_net);
    AND2_60 : AND2
      port map(A => AND2_16_Y, B => AND2_53_Y, Y => AND2_60_Y);
    XOR2_61 : XOR2
      port map(A => MEM_WADDR_9_net, B => GND_1_net, Y => 
        XOR2_61_Y);
    XOR2_57 : XOR2
      port map(A => MEM_RADDR_0_net, B => MEMORYRE, Y => 
        XOR2_57_Y);
    DFN1C0_RGRY_2_inst : DFN1C0
      port map(D => XOR2_42_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_2_net);
    AND2_62 : AND2
      port map(A => AND2_64_Y, B => XOR2_50_Y, Y => AND2_62_Y);
    XOR2_33 : XOR2
      port map(A => RBINNXTSHIFT_12_net, B => GND_1_net, Y => 
        XOR2_33_Y);
    XNOR2_2 : XNOR2
      port map(A => MEM_RADDR_8_net, B => WBINNXTSHIFT_8_net, 
        Y => XNOR2_2_Y);
    XNOR2_19 : XNOR2
      port map(A => MEM_RADDR_3_net, B => WBINNXTSHIFT_3_net, 
        Y => XNOR2_19_Y);
    XOR2_49 : XOR2
      port map(A => MEM_WADDR_11_net, B => GND_1_net, Y => 
        XOR2_49_Y);
    XOR2_WBINNXTSHIFT_8_inst : XOR2
      port map(A => XOR2_1_Y, B => AO1_5_Y, Y => 
        WBINNXTSHIFT_8_net);
    AO1_14 : AO1
      port map(A => XOR2_6_Y, B => AND2_61_Y, C => AND2_35_Y, 
        Y => AO1_14_Y);
    XOR2_4 : XOR2
      port map(A => MEM_RADDR_7_net, B => GND_1_net, Y => 
        XOR2_4_Y);
    AND3_1 : AND3
      port map(A => XNOR2_3_Y, B => AND3_2_Y, C => AND2_65_Y, 
        Y => AND3_1_Y);
    XOR2_55 : XOR2
      port map(A => RBINNXTSHIFT_8_net, B => RBINNXTSHIFT_9_net, 
        Y => XOR2_55_Y);
    AND2_24 : AND2
      port map(A => MEM_RADDR_8_net, B => GND_1_net, Y => 
        AND2_24_Y);
    XOR2_72 : XOR2
      port map(A => MEM_RADDR_4_net, B => GND_1_net, Y => 
        XOR2_72_Y);
    XNOR2_0 : XNOR2
      port map(A => MEM_RADDR_4_net, B => WBINNXTSHIFT_4_net, 
        Y => XNOR2_0_Y);
    AND2_31 : AND2
      port map(A => XOR2_53_Y, B => XOR2_4_Y, Y => AND2_31_Y);
    DFN1C0_MEM_WADDR_10_inst : DFN1C0
      port map(D => WBINNXTSHIFT_10_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_10_net);
    AO1_34 : AO1
      port map(A => AND2_56_Y, B => AO1_18_Y, C => AO1_0_Y, Y => 
        AO1_34_Y);
    XOR2_RBINNXTSHIFT_12_inst : XOR2
      port map(A => XOR2_74_Y, B => AO1_34_Y, Y => 
        RBINNXTSHIFT_12_net);
    XOR2_18 : XOR2
      port map(A => RBINNXTSHIFT_7_net, B => RBINNXTSHIFT_8_net, 
        Y => XOR2_18_Y);
    DFN1C0_RGRY_11_inst : DFN1C0
      port map(D => XOR2_5_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_11_net);
    XOR2_RBINNXTSHIFT_4_inst : XOR2
      port map(A => XOR2_72_Y, B => AO1_6_Y, Y => 
        RBINNXTSHIFT_4_net);
    DFN1C0_MEM_WADDR_8_inst : DFN1C0
      port map(D => WBINNXTSHIFT_8_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_8_net);
    DFN1C0_RGRY_1_inst : DFN1C0
      port map(D => XOR2_21_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_1_net);
    DFN1C0_WGRY_3_inst : DFN1C0
      port map(D => XOR2_54_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_3_net);
    XOR2_8 : XOR2
      port map(A => MEM_RADDR_9_net, B => GND_1_net, Y => 
        XOR2_8_Y);
    DFN1E1C0_Q_6_inst : DFN1E1C0
      port map(D => QXI_6_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(6));
    XOR2_RBINNXTSHIFT_6_inst : XOR2
      port map(A => XOR2_68_Y, B => AO1_2_Y, Y => 
        RBINNXTSHIFT_6_net);
    XOR2_30 : XOR2
      port map(A => MEM_WADDR_1_net, B => GND_1_net, Y => 
        XOR2_30_Y);
    AND2_38 : AND2
      port map(A => AND2_0_Y, B => XOR2_14_Y, Y => AND2_38_Y);
    AND2_35 : AND2
      port map(A => MEM_RADDR_1_net, B => GND_1_net, Y => 
        AND2_35_Y);
    MEMREBUBBLE : INV
      port map(A => MEMORYRE, Y => MEMRENEG);
    DFN1C0_WGRY_11_inst : DFN1C0
      port map(D => XOR2_2_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_11_net);
    DFN1C0_MEM_WADDR_7_inst : DFN1C0
      port map(D => WBINNXTSHIFT_7_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_7_net);
    AND2_29 : AND2
      port map(A => AND2_55_Y, B => AND2_54_Y, Y => AND2_29_Y);
    DFN1C0_MEM_RADDR_4_inst : DFN1C0
      port map(D => RBINNXTSHIFT_4_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_4_net);
    XOR2_WBINNXTSHIFT_12_inst : XOR2
      port map(A => XOR2_12_Y, B => AO1_13_Y, Y => 
        WBINNXTSHIFT_12_net);
    XOR2_34 : XOR2
      port map(A => MEM_RADDR_2_net, B => GND_1_net, Y => 
        XOR2_34_Y);
    XOR2_31 : XOR2
      port map(A => WBINNXTSHIFT_0_net, B => WBINNXTSHIFT_1_net, 
        Y => XOR2_31_Y);
    AND2_3 : AND2
      port map(A => AND2_19_Y, B => AND2_31_Y, Y => AND2_3_Y);
    DFN1C0_MEM_WADDR_11_inst : DFN1C0
      port map(D => WBINNXTSHIFT_11_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_11_net);
    AND2_30 : AND2
      port map(A => MEM_RADDR_7_net, B => GND_1_net, Y => 
        AND2_30_Y);
    XOR2_WBINNXTSHIFT_4_inst : XOR2
      port map(A => XOR2_75_Y, B => AO1_25_Y, Y => 
        WBINNXTSHIFT_4_net);
    XNOR2_6 : XNOR2
      port map(A => MEM_RADDR_10_net, B => WBINNXTSHIFT_10_net, 
        Y => XNOR2_6_Y);
    AND2_14 : AND2
      port map(A => MEM_RADDR_5_net, B => GND_1_net, Y => 
        AND2_14_Y);
    AND2_32 : AND2
      port map(A => MEM_RADDR_11_net, B => GND_1_net, Y => 
        AND2_32_Y);
    XOR2_WBINNXTSHIFT_6_inst : XOR2
      port map(A => XOR2_59_Y, B => AO1_9_Y, Y => 
        WBINNXTSHIFT_6_net);
    DFN1C0_MEM_RADDR_5_inst : DFN1C0
      port map(D => RBINNXTSHIFT_5_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_5_net);
    AND3_8 : AND3
      port map(A => AND3_9_Y, B => AND3_7_Y, C => AND3_6_Y, Y => 
        AND3_8_Y);
    XOR2_46 : XOR2
      port map(A => WBINNXTSHIFT_4_net, B => WBINNXTSHIFT_5_net, 
        Y => XOR2_46_Y);
    XNOR2_11 : XNOR2
      port map(A => MEM_RADDR_11_net, B => WBINNXTSHIFT_11_net, 
        Y => XNOR2_11_Y);
    AO1_2 : AO1
      port map(A => AND2_19_Y, B => AO1_6_Y, C => AO1_8_Y, Y => 
        AO1_2_Y);
    DFN1C0_MEM_RADDR_8_inst : DFN1C0
      port map(D => RBINNXTSHIFT_8_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_8_net);
    DFN1C0_WGRY_0_inst : DFN1C0
      port map(D => XOR2_31_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_0_net);
    XOR2_75 : XOR2
      port map(A => MEM_WADDR_4_net, B => GND_1_net, Y => 
        XOR2_75_Y);
    AND2_26 : AND2
      port map(A => MEM_RADDR_10_net, B => GND_1_net, Y => 
        AND2_26_Y);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(7), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_7_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_7_net);
    XOR2_9 : XOR2
      port map(A => MEM_RADDR_2_net, B => GND_1_net, Y => 
        XOR2_9_Y);
    AND3_5 : AND3
      port map(A => XNOR2_1_Y, B => XNOR2_17_Y, C => XNOR2_21_Y, 
        Y => AND3_5_Y);
    XOR2_59 : XOR2
      port map(A => MEM_WADDR_6_net, B => GND_1_net, Y => 
        XOR2_59_Y);
    AND2_23 : AND2
      port map(A => MEM_WADDR_12_net, B => GND_1_net, Y => 
        AND2_23_Y);
    XNOR2_4 : XNOR2
      port map(A => RBINNXTSHIFT_11_net, B => MEM_WADDR_11_net, 
        Y => XNOR2_4_Y);
    DFN1C0_MEM_WADDR_9_inst : DFN1C0
      port map(D => WBINNXTSHIFT_9_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_9_net);
    DFN1C0_RGRY_8_inst : DFN1C0
      port map(D => XOR2_55_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_8_net);
    XOR2_5 : XOR2
      port map(A => RBINNXTSHIFT_11_net, B => RBINNXTSHIFT_12_net, 
        Y => XOR2_5_Y);
    XNOR2_20 : XNOR2
      port map(A => RBINNXTSHIFT_7_net, B => MEM_WADDR_7_net, 
        Y => XNOR2_20_Y);
    AO1_28 : AO1
      port map(A => AND2_12_Y, B => AO1_17_Y, C => AO1_35_Y, Y => 
        AO1_28_Y);
    AND2_19 : AND2
      port map(A => XOR2_10_Y, B => XOR2_23_Y, Y => AND2_19_Y);
    DFN1C0_MEM_RADDR_6_inst : DFN1C0
      port map(D => RBINNXTSHIFT_6_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_6_net);
    DFN1E1C0_Q_0_inst : DFN1E1C0
      port map(D => QXI_0_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(0));
    XOR2_22 : XOR2
      port map(A => MEM_WADDR_11_net, B => GND_1_net, Y => 
        XOR2_22_Y);
    AO1_1 : AO1
      port map(A => XOR2_30_Y, B => AND2_27_Y, C => AND2_45_Y, 
        Y => AO1_1_Y);
    XOR2_13 : XOR2
      port map(A => RBINNXTSHIFT_0_net, B => RBINNXTSHIFT_1_net, 
        Y => XOR2_13_Y);
    XNOR2_18 : XNOR2
      port map(A => RBINNXTSHIFT_6_net, B => MEM_WADDR_6_net, 
        Y => XNOR2_18_Y);
    AND2_51 : AND2
      port map(A => AND2_40_Y, B => XOR2_19_Y, Y => AND2_51_Y);
    AO1_3 : AO1
      port map(A => XOR2_58_Y, B => AND2_49_Y, C => AND2_10_Y, 
        Y => AO1_3_Y);
    AND2_64 : AND2
      port map(A => AND2_0_Y, B => AND2_48_Y, Y => AND2_64_Y);
    AND2_47 : AND2
      port map(A => AND2_63_Y, B => XOR2_71_Y, Y => AND2_47_Y);
    AO1_18 : AO1
      port map(A => AND2_3_Y, B => AO1_6_Y, C => AO1_33_Y, Y => 
        AO1_18_Y);
    XOR2_48 : XOR2
      port map(A => MEM_WADDR_1_net, B => GND_1_net, Y => 
        XOR2_48_Y);
    XOR2_RBINNXTSHIFT_3_inst : XOR2
      port map(A => XOR2_51_Y, B => AO1_24_Y, Y => 
        RBINNXTSHIFT_3_net);
    DFN1C0_MEM_RADDR_7_inst : DFN1C0
      port map(D => RBINNXTSHIFT_7_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_7_net);
    AND2_16 : AND2
      port map(A => XOR2_57_Y, B => XOR2_6_Y, Y => AND2_16_Y);
    DFN1C0_WGRY_9_inst : DFN1C0
      port map(D => XOR2_15_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_9_net);
    XOR2_62 : XOR2
      port map(A => MEM_WADDR_4_net, B => GND_1_net, Y => 
        XOR2_62_Y);
    AND2_13 : AND2
      port map(A => MEM_WADDR_7_net, B => GND_1_net, Y => 
        AND2_13_Y);
    XOR2_10 : XOR2
      port map(A => MEM_RADDR_4_net, B => GND_1_net, Y => 
        XOR2_10_Y);
    XNOR2_1 : XNOR2
      port map(A => MEM_RADDR_0_net, B => WBINNXTSHIFT_0_net, 
        Y => XNOR2_1_Y);
    AND2_58 : AND2
      port map(A => MEM_WADDR_8_net, B => GND_1_net, Y => 
        AND2_58_Y);
    AND2_55 : AND2
      port map(A => XOR2_35_Y, B => XOR2_30_Y, Y => AND2_55_Y);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(0), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_0_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_0_net);
    DFN1C0_RGRY_4_inst : DFN1C0
      port map(D => XOR2_64_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_4_net);
    DFN1C0_MEM_WADDR_2_inst : DFN1C0
      port map(D => WBINNXTSHIFT_2_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_2_net);
    XOR2_27 : XOR2
      port map(A => MEM_WADDR_10_net, B => GND_1_net, Y => 
        XOR2_27_Y);
    AND2_MEMORYRE : AND2
      port map(A => NAND2_1_Y, B => RE, Y => MEMORYRE);
    XOR2_7 : XOR2
      port map(A => MEM_RADDR_11_net, B => GND_1_net, Y => 
        XOR2_7_Y);
    AND2_5 : AND2
      port map(A => MEM_WADDR_11_net, B => GND_1_net, Y => 
        AND2_5_Y);
    XOR2_WBINNXTSHIFT_3_inst : XOR2
      port map(A => XOR2_69_Y, B => AO1_26_Y, Y => 
        WBINNXTSHIFT_3_net);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(4), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_4_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_4_net);
    XOR2_56 : XOR2
      port map(A => RBINNXTSHIFT_6_net, B => RBINNXTSHIFT_7_net, 
        Y => XOR2_56_Y);
    XOR2_14 : XOR2
      port map(A => MEM_RADDR_8_net, B => GND_1_net, Y => 
        XOR2_14_Y);
    AND2_50 : AND2
      port map(A => MEM_WADDR_9_net, B => GND_1_net, Y => 
        AND2_50_Y);
    XNOR2_3 : XNOR2
      port map(A => MEM_RADDR_9_net, B => WBINNXTSHIFT_9_net, 
        Y => XNOR2_3_Y);
    XOR2_11 : XOR2
      port map(A => MEM_WADDR_2_net, B => GND_1_net, Y => 
        XOR2_11_Y);
    XNOR2_22 : XNOR2
      port map(A => RBINNXTSHIFT_12_net, B => MEM_WADDR_12_net, 
        Y => XNOR2_22_Y);
    AND2_52 : AND2
      port map(A => MEM_WADDR_6_net, B => GND_1_net, Y => 
        AND2_52_Y);
    XOR2_25 : XOR2
      port map(A => MEM_WADDR_12_net, B => GND_1_net, Y => 
        XOR2_25_Y);
    XNOR2_15 : XNOR2
      port map(A => MEM_RADDR_6_net, B => WBINNXTSHIFT_6_net, 
        Y => XNOR2_15_Y);
    AO1_22 : AO1
      port map(A => XOR2_25_Y, B => AO1_13_Y, C => AND2_23_Y, 
        Y => AO1_22_Y);
    AND2_34 : AND2
      port map(A => AND2_60_Y, B => XOR2_10_Y, Y => AND2_34_Y);
    AO1_6 : AO1
      port map(A => AND2_53_Y, B => AO1_14_Y, C => AO1_30_Y, Y => 
        AO1_6_Y);
    DFN1C0_MEM_RADDR_3_inst : DFN1C0
      port map(D => RBINNXTSHIFT_3_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_3_net);
    XOR2_67 : XOR2
      port map(A => RBINNXTSHIFT_10_net, B => RBINNXTSHIFT_11_net, 
        Y => XOR2_67_Y);
    AND2_63 : AND2
      port map(A => AND2_0_Y, B => AND2_56_Y, Y => AND2_63_Y);
    AND3_2 : AND3
      port map(A => AND3_4_Y, B => AND3_5_Y, C => AND3_3_Y, Y => 
        AND3_2_Y);
    AO1_12 : AO1
      port map(A => AND2_8_Y, B => AO1_5_Y, C => AO1_17_Y, Y => 
        AO1_12_Y);
    XOR2_32 : XOR2
      port map(A => RBINNXTSHIFT_9_net, B => RBINNXTSHIFT_10_net, 
        Y => XOR2_32_Y);
    AND2_9 : AND2
      port map(A => MEM_WADDR_2_net, B => GND_1_net, Y => 
        AND2_9_Y);
    DFN1E1C0_Q_5_inst : DFN1E1C0
      port map(D => QXI_5_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(5));
    XOR2_65 : XOR2
      port map(A => MEM_RADDR_9_net, B => GND_1_net, Y => 
        XOR2_65_Y);
    XOR2_58 : XOR2
      port map(A => MEM_WADDR_5_net, B => GND_1_net, Y => 
        XOR2_58_Y);
    AO1_32 : AO1
      port map(A => XOR2_65_Y, B => AND2_24_Y, C => AND2_33_Y, 
        Y => AO1_32_Y);
    XOR2_43 : XOR2
      port map(A => RBINNXTSHIFT_3_net, B => RBINNXTSHIFT_4_net, 
        Y => XOR2_43_Y);
    AO1_9 : AO1
      port map(A => AND2_59_Y, B => AO1_25_Y, C => AO1_3_Y, Y => 
        AO1_9_Y);
    DFN1C0_DVLDX : DFN1C0
      port map(D => DVLDI, CLK => CLK, CLR => RESET, Q => DVLDX);
    AND2_39 : AND2
      port map(A => AND2_21_Y, B => XOR2_25_Y, Y => AND2_39_Y);
    NAND2_0 : NAND2
      port map(A => FULL_1_net, B => VCC_1_net, Y => NAND2_0_Y);
    DFN1C0_RGRY_6_inst : DFN1C0
      port map(D => XOR2_56_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_6_net);
    XOR2_76 : XOR2
      port map(A => MEM_RADDR_11_net, B => GND_1_net, Y => 
        XOR2_76_Y);
    AND2_27 : AND2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => 
        AND2_27_Y);
    DFN1C0_DVLDI : DFN1C0
      port map(D => AND2A_0_Y, CLK => CLK, CLR => RESET, Q => 
        DVLDI);
    XNOR2_10 : XNOR2
      port map(A => RBINNXTSHIFT_5_net, B => MEM_WADDR_5_net, 
        Y => XNOR2_10_Y);
    AND2_MEMORYWE : AND2
      port map(A => NAND2_0_Y, B => WE, Y => MEMORYWE);
    AO1_20 : AO1
      port map(A => XOR2_66_Y, B => AND2_9_Y, C => AND2_6_Y, Y => 
        AO1_20_Y);
    DFN1C0_WGRY_2_inst : DFN1C0
      port map(D => XOR2_17_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_2_net);
    AO1_0 : AO1
      port map(A => AND2_41_Y, B => AO1_32_Y, C => AO1_15_Y, Y => 
        AO1_0_Y);
    XOR2_29 : XOR2
      port map(A => MEM_RADDR_10_net, B => GND_1_net, Y => 
        XOR2_29_Y);
    XOR2_40 : XOR2
      port map(A => MEM_RADDR_12_net, B => WBINNXTSHIFT_12_net, 
        Y => XOR2_40_Y);
    XOR2_2 : XOR2
      port map(A => WBINNXTSHIFT_11_net, B => WBINNXTSHIFT_12_net, 
        Y => XOR2_2_Y);
    DFN1C0_RGRY_5_inst : DFN1C0
      port map(D => XOR2_70_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_5_net);
    AND2_36 : AND2
      port map(A => AND2_60_Y, B => AND2_19_Y, Y => AND2_36_Y);
    XOR2_37 : XOR2
      port map(A => WBINNXTSHIFT_6_net, B => WBINNXTSHIFT_7_net, 
        Y => XOR2_37_Y);
    AND2A_0 : AND2A
      port map(A => EMPTY_1_net, B => RE, Y => AND2A_0_Y);
    AO1_26 : AO1
      port map(A => XOR2_16_Y, B => AO1_1_Y, C => AND2_9_Y, Y => 
        AO1_26_Y);
    DFN1C0_WGRY_10_inst : DFN1C0
      port map(D => XOR2_39_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_10_net);
    DFN1C0_RGRY_7_inst : DFN1C0
      port map(D => XOR2_18_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_7_net);
    AND3_9 : AND3
      port map(A => XNOR2_18_Y, B => XNOR2_20_Y, C => XNOR2_16_Y, 
        Y => AND3_9_Y);
    XOR2_RBINNXTSHIFT_5_inst : XOR2
      port map(A => XOR2_20_Y, B => AO1_11_Y, Y => 
        RBINNXTSHIFT_5_net);
    AO1_23 : AO1
      port map(A => AND2_44_Y, B => AO1_3_Y, C => AO1_4_Y, Y => 
        AO1_23_Y);
    AND2_33 : AND2
      port map(A => MEM_RADDR_9_net, B => GND_1_net, Y => 
        AND2_33_Y);
    XOR2_44 : XOR2
      port map(A => WBINNXTSHIFT_7_net, B => WBINNXTSHIFT_8_net, 
        Y => XOR2_44_Y);
    AO1_10 : AO1
      port map(A => XOR2_0_Y, B => AO1_9_Y, C => AND2_52_Y, Y => 
        AO1_10_Y);
    XOR2_41 : XOR2
      port map(A => MEM_WADDR_9_net, B => GND_1_net, Y => 
        XOR2_41_Y);
    XOR2_35 : XOR2
      port map(A => MEM_WADDR_0_net, B => MEMORYWE, Y => 
        XOR2_35_Y);
    XNOR2_24 : XNOR2
      port map(A => RBINNXTSHIFT_4_net, B => MEM_WADDR_4_net, 
        Y => XNOR2_24_Y);
    XOR2_RBINNXTSHIFT_10_inst : XOR2
      port map(A => XOR2_29_Y, B => AO1_16_Y, Y => 
        RBINNXTSHIFT_10_net);
    DFN1C0_WGRY_1_inst : DFN1C0
      port map(D => XOR2_26_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_1_net);
    DFN1P0_EMPTY : DFN1P0
      port map(D => EMPTYINT, CLK => CLK, PRE => RESET, Q => 
        EMPTY_1_net);
    DFN1E1C0_Q_3_inst : DFN1E1C0
      port map(D => QXI_3_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(3));
    AO1_30 : AO1
      port map(A => XOR2_3_Y, B => AND2_15_Y, C => AND2_46_Y, 
        Y => AO1_30_Y);
    XOR2_RBINNXTSHIFT_7_inst : XOR2
      port map(A => XOR2_63_Y, B => AO1_21_Y, Y => 
        RBINNXTSHIFT_7_net);
    AND2_41 : AND2
      port map(A => XOR2_50_Y, B => XOR2_7_Y, Y => AND2_41_Y);
    AND2_0 : AND2
      port map(A => AND2_60_Y, B => AND2_3_Y, Y => AND2_0_Y);
    XOR2_69 : XOR2
      port map(A => MEM_WADDR_3_net, B => GND_1_net, Y => 
        XOR2_69_Y);
    DFN1C0_RGRY_12_inst : DFN1C0
      port map(D => XOR2_33_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_12_net);
    AO1_16 : AO1
      port map(A => AND2_48_Y, B => AO1_18_Y, C => AO1_32_Y, Y => 
        AO1_16_Y);
    AND2_17 : AND2
      port map(A => XNOR2_23_Y, B => XNOR2_4_Y, Y => AND2_17_Y);
    AO1_29 : AO1
      port map(A => XOR2_60_Y, B => AO1_12_Y, C => AND2_2_Y, Y => 
        AO1_29_Y);
    XOR2_6 : XOR2
      port map(A => MEM_RADDR_1_net, B => GND_1_net, Y => 
        XOR2_6_Y);
    DFN1C0_WGRY_12_inst : DFN1C0
      port map(D => XOR2_52_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_12_net);
    AND2_54 : AND2
      port map(A => XOR2_16_Y, B => XOR2_66_Y, Y => AND2_54_Y);
    AO1_13 : AO1
      port map(A => AND2_43_Y, B => AO1_5_Y, C => AO1_28_Y, Y => 
        AO1_13_Y);
    DFN1C0_MEM_WADDR_6_inst : DFN1C0
      port map(D => WBINNXTSHIFT_6_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_6_net);
    XOR2_WBINNXTSHIFT_5_inst : XOR2
      port map(A => XOR2_38_Y, B => AO1_19_Y, Y => 
        WBINNXTSHIFT_5_net);
    AO1_36 : AO1
      port map(A => XOR2_50_Y, B => AO1_16_Y, C => AND2_26_Y, 
        Y => AO1_36_Y);
    XOR2_53 : XOR2
      port map(A => MEM_RADDR_6_net, B => GND_1_net, Y => 
        XOR2_53_Y);
    XNOR2_23 : XNOR2
      port map(A => RBINNXTSHIFT_10_net, B => MEM_WADDR_10_net, 
        Y => XNOR2_23_Y);
    XOR2_WBINNXTSHIFT_10_inst : XOR2
      port map(A => XOR2_27_Y, B => AO1_12_Y, Y => 
        WBINNXTSHIFT_10_net);
    AO1_33 : AO1
      port map(A => AND2_31_Y, B => AO1_8_Y, C => AO1_37_Y, Y => 
        AO1_33_Y);
    XNOR2_12 : XNOR2
      port map(A => RBINNXTSHIFT_0_net, B => MEM_WADDR_0_net, 
        Y => XNOR2_12_Y);
    XOR2_12 : XOR2
      port map(A => MEM_WADDR_12_net, B => GND_1_net, Y => 
        XOR2_12_Y);
    XNOR2_7 : XNOR2
      port map(A => RBINNXTSHIFT_1_net, B => MEM_WADDR_1_net, 
        Y => XNOR2_7_Y);
    AND2_48 : AND2
      port map(A => XOR2_14_Y, B => XOR2_65_Y, Y => AND2_48_Y);
    AND2_45 : AND2
      port map(A => MEM_WADDR_1_net, B => GND_1_net, Y => 
        AND2_45_Y);
    AO1_19 : AO1
      port map(A => XOR2_62_Y, B => AO1_25_Y, C => AND2_49_Y, 
        Y => AO1_19_Y);
    XOR2_WBINNXTSHIFT_7_inst : XOR2
      port map(A => XOR2_24_Y, B => AO1_10_Y, Y => 
        WBINNXTSHIFT_7_net);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(5), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_5_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_5_net);
    DFN1C0_MEM_RADDR_12_inst : DFN1C0
      port map(D => RBINNXTSHIFT_12_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_12_net);
    XOR2_26 : XOR2
      port map(A => WBINNXTSHIFT_1_net, B => WBINNXTSHIFT_2_net, 
        Y => XOR2_26_Y);
    AND2_59 : AND2
      port map(A => XOR2_62_Y, B => XOR2_58_Y, Y => AND2_59_Y);
    DFN1C0_RGRY_10_inst : DFN1C0
      port map(D => XOR2_67_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_10_net);
    AND2_4 : AND2
      port map(A => MEM_RADDR_4_net, B => GND_1_net, Y => 
        AND2_4_Y);
    AND2_FULLINT : AND2
      port map(A => AND3_1_Y, B => XOR2_40_Y, Y => FULLINT);
    AND2_40 : AND2
      port map(A => AND2_29_Y, B => AND2_25_Y, Y => AND2_40_Y);
    XOR2_50 : XOR2
      port map(A => MEM_RADDR_10_net, B => GND_1_net, Y => 
        XOR2_50_Y);
    AND2_42 : AND2
      port map(A => AND2_20_Y, B => XOR2_0_Y, Y => AND2_42_Y);
    DFN1E1C0_Q_2_inst : DFN1E1C0
      port map(D => QXI_2_net, CLK => CLK, CLR => RESET, E => 
        DVLDI, Q => Q(2));
    DFN1C0_WGRY_8_inst : DFN1C0
      port map(D => XOR2_45_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_8_net);
    XNOR2_5 : XNOR2
      port map(A => MEM_RADDR_5_net, B => WBINNXTSHIFT_5_net, 
        Y => XNOR2_5_Y);
    AO1_5 : AO1
      port map(A => AND2_25_Y, B => AO1_25_Y, C => AO1_23_Y, Y => 
        AO1_5_Y);
    XNOR2_16 : XNOR2
      port map(A => RBINNXTSHIFT_8_net, B => MEM_WADDR_8_net, 
        Y => XNOR2_16_Y);
    DFN1C0_RGRY_3_inst : DFN1C0
      port map(D => XOR2_43_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_3_net);
    XOR2_39 : XOR2
      port map(A => WBINNXTSHIFT_10_net, B => WBINNXTSHIFT_11_net, 
        Y => XOR2_39_Y);
    AND2_8 : AND2
      port map(A => XOR2_19_Y, B => XOR2_41_Y, Y => AND2_8_Y);
    XOR2_3 : XOR2
      port map(A => MEM_RADDR_3_net, B => GND_1_net, Y => 
        XOR2_3_Y);
    XOR2_54 : XOR2
      port map(A => WBINNXTSHIFT_3_net, B => WBINNXTSHIFT_4_net, 
        Y => XOR2_54_Y);
    XOR2_RBINNXTSHIFT_11_inst : XOR2
      port map(A => XOR2_76_Y, B => AO1_36_Y, Y => 
        RBINNXTSHIFT_11_net);
    AO1_27 : AO1
      port map(A => XOR2_19_Y, B => AO1_5_Y, C => AND2_58_Y, Y => 
        AO1_27_Y);
    XOR2_51 : XOR2
      port map(A => MEM_RADDR_3_net, B => GND_1_net, Y => 
        XOR2_51_Y);
    XOR2_66 : XOR2
      port map(A => MEM_WADDR_3_net, B => GND_1_net, Y => 
        XOR2_66_Y);
    AND2_56 : AND2
      port map(A => AND2_48_Y, B => AND2_41_Y, Y => AND2_56_Y);
    DFN1C0_MEM_WADDR_1_inst : DFN1C0
      port map(D => WBINNXTSHIFT_1_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_1_net);
    XOR2_RBINNXTSHIFT_1_inst : XOR2
      port map(A => XOR2_36_Y, B => AND2_61_Y, Y => 
        RBINNXTSHIFT_1_net);
    XOR2_17 : XOR2
      port map(A => WBINNXTSHIFT_2_net, B => WBINNXTSHIFT_3_net, 
        Y => XOR2_17_Y);
    XOR2_73 : XOR2
      port map(A => MEM_RADDR_8_net, B => GND_1_net, Y => 
        XOR2_73_Y);
    AND2_53 : AND2
      port map(A => XOR2_9_Y, B => XOR2_3_Y, Y => AND2_53_Y);
    AND3_7 : AND3
      port map(A => XNOR2_12_Y, B => XNOR2_7_Y, C => XNOR2_13_Y, 
        Y => AND3_7_Y);
    XOR2_28 : XOR2
      port map(A => WBINNXTSHIFT_5_net, B => WBINNXTSHIFT_6_net, 
        Y => XOR2_28_Y);
    DFN1C0_MEM_WADDR_5_inst : DFN1C0
      port map(D => WBINNXTSHIFT_5_net, CLK => CLK, CLR => RESET, 
        Q => MEM_WADDR_5_net);
    XOR2_15 : XOR2
      port map(A => WBINNXTSHIFT_9_net, B => WBINNXTSHIFT_10_net, 
        Y => XOR2_15_Y);
    DFN1C0_MEM_RADDR_0_inst : DFN1C0
      port map(D => RBINNXTSHIFT_0_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_0_net);
    AO1_17 : AO1
      port map(A => XOR2_41_Y, B => AND2_58_Y, C => AND2_50_Y, 
        Y => AO1_17_Y);
    XNOR2_17 : XNOR2
      port map(A => MEM_RADDR_1_net, B => WBINNXTSHIFT_1_net, 
        Y => XNOR2_17_Y);
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
        MEM_RADDR_0_net, DINA8 => GND_1_net, DINA7 => GND_1_net, 
        DINA6 => GND_1_net, DINA5 => GND_1_net, DINA4 => 
        GND_1_net, DINA3 => GND_1_net, DINA2 => GND_1_net, 
        DINA1 => GND_1_net, DINA0 => DATA(3), DINB8 => GND_1_net, 
        DINB7 => GND_1_net, DINB6 => GND_1_net, DINB5 => 
        GND_1_net, DINB4 => GND_1_net, DINB3 => GND_1_net, 
        DINB2 => GND_1_net, DINB1 => GND_1_net, DINB0 => 
        GND_1_net, WIDTHA0 => GND_1_net, WIDTHA1 => GND_1_net, 
        WIDTHB0 => GND_1_net, WIDTHB1 => GND_1_net, PIPEA => 
        GND_1_net, PIPEB => GND_1_net, WMODEA => GND_1_net, 
        WMODEB => GND_1_net, BLKA => MEMWENEG, BLKB => MEMRENEG, 
        WENA => GND_1_net, WENB => VCC_1_net, CLKA => CLK, 
        CLKB => CLK, RESET => RESET, DOUTA8 => OPEN , DOUTA7 => 
        OPEN , DOUTA6 => OPEN , DOUTA5 => OPEN , DOUTA4 => OPEN , 
        DOUTA3 => OPEN , DOUTA2 => OPEN , DOUTA1 => OPEN , 
        DOUTA0 => RAM4K9_QXI_3_DOUTA0, DOUTB8 => OPEN , DOUTB7 => 
        OPEN , DOUTB6 => OPEN , DOUTB5 => OPEN , DOUTB4 => OPEN , 
        DOUTB3 => OPEN , DOUTB2 => OPEN , DOUTB1 => OPEN , 
        DOUTB0 => QXI_3_net);
    DFN1C0_MEM_RADDR_10_inst : DFN1C0
      port map(D => RBINNXTSHIFT_10_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_10_net);
    XOR2_WBINNXTSHIFT_11_inst : XOR2
      port map(A => XOR2_49_Y, B => AO1_29_Y, Y => 
        WBINNXTSHIFT_11_net);
    AND3_4 : AND3
      port map(A => XNOR2_15_Y, B => XNOR2_8_Y, C => XNOR2_2_Y, 
        Y => AND3_4_Y);
    DFN1C0_RGRY_0_inst : DFN1C0
      port map(D => XOR2_13_Y, CLK => CLK, CLR => RESET, Q => 
        RGRY_0_net);
    XOR2_WBINNXTSHIFT_1_inst : XOR2
      port map(A => XOR2_48_Y, B => AND2_27_Y, Y => 
        WBINNXTSHIFT_1_net);
    AND2_21 : AND2
      port map(A => AND2_40_Y, B => AND2_43_Y, Y => AND2_21_Y);
    AO1_37 : AO1
      port map(A => XOR2_4_Y, B => AND2_1_Y, C => AND2_30_Y, Y => 
        AO1_37_Y);
    DFN1C0_WGRY_4_inst : DFN1C0
      port map(D => XOR2_46_Y, CLK => CLK, CLR => RESET, Q => 
        WGRY_4_net);
    XOR2_0 : XOR2
      port map(A => MEM_WADDR_6_net, B => GND_1_net, Y => 
        XOR2_0_Y);
    XOR2_70 : XOR2
      port map(A => RBINNXTSHIFT_5_net, B => RBINNXTSHIFT_6_net, 
        Y => XOR2_70_Y);
    NAND2_1 : NAND2
      port map(A => EMPTY_1_net, B => VCC_1_net, Y => NAND2_1_Y);
    AO1_4 : AO1
      port map(A => XOR2_47_Y, B => AND2_52_Y, C => AND2_13_Y, 
        Y => AO1_4_Y);
    XOR2_68 : XOR2
      port map(A => MEM_RADDR_6_net, B => GND_1_net, Y => 
        XOR2_68_Y);
    AND2_37 : AND2
      port map(A => AND2_29_Y, B => XOR2_62_Y, Y => AND2_37_Y);
    XNOR2_14 : XNOR2
      port map(A => RBINNXTSHIFT_3_net, B => MEM_WADDR_3_net, 
        Y => XNOR2_14_Y);
    XOR2_42 : XOR2
      port map(A => RBINNXTSHIFT_2_net, B => RBINNXTSHIFT_3_net, 
        Y => XOR2_42_Y);
    XOR2_RBINNXTSHIFT_2_inst : XOR2
      port map(A => XOR2_34_Y, B => AO1_14_Y, Y => 
        RBINNXTSHIFT_2_net);
    AO1_21 : AO1
      port map(A => XOR2_53_Y, B => AO1_2_Y, C => AND2_1_Y, Y => 
        AO1_21_Y);
    DFN1C0_MEM_RADDR_9_inst : DFN1C0
      port map(D => RBINNXTSHIFT_9_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_9_net);
    XOR2_36 : XOR2
      port map(A => MEM_RADDR_1_net, B => GND_1_net, Y => 
        XOR2_36_Y);
    XOR2_74 : XOR2
      port map(A => MEM_RADDR_12_net, B => GND_1_net, Y => 
        XOR2_74_Y);
    XNOR2_8 : XNOR2
      port map(A => MEM_RADDR_7_net, B => WBINNXTSHIFT_7_net, 
        Y => XNOR2_8_Y);
    XOR2_71 : XOR2
      port map(A => MEM_RADDR_12_net, B => GND_1_net, Y => 
        XOR2_71_Y);
    AND2_28 : AND2
      port map(A => AND2_36_Y, B => XOR2_53_Y, Y => AND2_28_Y);
    AND2_25 : AND2
      port map(A => AND2_59_Y, B => AND2_44_Y, Y => AND2_25_Y);
    DFN1C0_MEM_RADDR_11_inst : DFN1C0
      port map(D => RBINNXTSHIFT_11_net, CLK => CLK, CLR => RESET, 
        Q => MEM_RADDR_11_net);
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
-- DESDIR:E:/Actelprj/smart_top/smartgen\ByteData
-- GEN_BEHV_MODULE:T
-- SMARTGEN_DIE:M1IS8X8M2
-- SMARTGEN_PACKAGE:fg484
-- AGENIII_IS_SUBPROJECT_LIBERO:T
-- WWIDTH:8
-- WDEPTH:4096
-- RWIDTH:8
-- RDEPTH:4096
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
-- AFFLAG:NONE
-- AEFLAG:NONE
-- DATA_IN_PN:DATA
-- DATA_OUT_PN:Q
-- CASCADE:0

-- _End_Comments_

