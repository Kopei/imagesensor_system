-- Sram_ctl.vhd
-- SRAM_Ctl.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SRAM_Ctl is
    port(
            SysRst_n        :in     std_logic;
            SysClk          :in     std_logic;
            SRAM_CtlEn      :in     std_logic;  --SRAM_Ctl Module Enable
            SRAM_CtlOk      :out    std_logic;  --SRAM_Ctl Module Answer
            SRAM_WrEn       :in     std_logic;  --Equals to CMOS Read out period
            SRAM_RdEn       :in     std_logic;  --Start SRAM reading after SRAM writing
            ADC_RdEn        :in     std_logic;  --ADC Data Read Enable
            ADC_Din         :in     std_logic_vector(13 downto 0);
            SRAM_Addr       :out        std_logic_vector(18 downto 0);
            SRAM_CE_n       :out        std_logic_vector(2 downto 0);
            SRAM_WE_n       :out        std_logic;
            SRAM_OE_n       :out        std_logic;
            SRAM_B_n        :out        std_logic_vector(3 downto 0);   --Bd:Bit3;Bc:Bit2;Bb:Bit1;Ba:Bit0
            SRAM_Data       :inout      std_logic_vector(31 downto 0);
            Tok             :out        std_logic;
            Sclk            :out        std_logic;
            Sdat            :out        std_logic
			--CycNum			:in			std_logic_vector(10 downto 0)
        );
end SRAM_Ctl;

architecture Behavioral of SRAM_Ctl is
    component SClk_dly is 
    port(GL : out std_logic;  CLK : in std_logic) ;
	end component;
	
    component WaveGenSingle is
        --Len => X (in fact X+1);
        --CntWidth => Y (Y-1 downto 0)  
        --CycNum => Z (in fact Z+1)
        generic(
                Polarity            :std_logic  := '0';
                DelayLen            :integer    := 15;
                DelayCntWidth   :integer    := 4;
                Phase1Len       :integer    := 0;
                Phase1CntWidth  :integer    := 1;
                Phase2Len       :integer    := 0;
                Phase2CntWidth  :integer    := 1;
                CycNum          :integer    := 10;
                CycCntWidth     :integer    := 4
                );  
        port(
                SysRst_n        :in  std_logic;
                SysClk          :in  std_logic;
                ClkEn           :in  std_logic;
                WaveGenEn       :in  std_logic;
                WFO             :out std_logic; --WaveForm Output
                WaveRdy         :out std_logic
            );
    end component;
    signal  PrState,NxState     :std_logic_vector(2 downto 0);      
    constant    Sram_Idle       :std_logic_vector(2 downto 0) := "000";
    constant    Sram_DataIn     :std_logic_vector(2 downto 0) := "101";
    constant    Sram_Wr         :std_logic_vector(2 downto 0) := "001";
    constant    Sram_Wait       :std_logic_vector(2 downto 0) := "010";
    constant    Sram_Rd         :std_logic_vector(2 downto 0) := "011";
    constant    Sram_Ok         :std_logic_vector(2 downto 0) := "100"; 
	constant	Sram_judge		 :std_logic_vector(2 downto 0) := "110"; 
    signal      RdOk     		 :std_logic;
    signal      Wd_Addr         :std_logic_vector(18 downto 0);
    signal      Rd_reg          :std_logic_vector(31 downto 0);
    signal      Sdat_reg        :std_logic_vector(31 downto 0);
    signal      tok_inter       :std_logic;
	signal		 CycCnt,RowNum			 :std_logic_vector(10 downto 0);
	signal		 sclk_inter		:std_logic;
--	signal		DlyCnt 			:integer;
--	signal		Adc_RdEn	:std_logic;	
begin
-- --ADC_rdEN delay for 3 sysclk
	-- process(Sysclk,SysRst_n)	
	-- begin
		-- if SysRst_n = '0' then
			-- Adc_RdEn <= '0';
		-- elsif rising_edge(SysClk) then
			-- if(Adc_RDEn='1')then
				-- if DlyCnt =3 then
					-- Adc_RdEn <= '1';
				-- else DlyCnt <=DlyCnt +1;
					-- Adc_RdEn <= '0';
				-- end if;
			-- else DlyCnt <=0;
			-- end if;	
		-- end if;
	-- end process;
	
	RowNum <= "01111111111";
    process(SysRst_n,SysClk) 
    begin
        if SysRst_n = '0' then
            PrState <= Sram_Idle;
        elsif rising_edge(SysClk) then
            if Sram_CtlEn = '0' then
                PrState <= Sram_Idle;
            else
                PrState <= NxState;
            end if;
        end if;
    end process;
    
    --State Jumping
    process(PrState,RdOk,Adc_RdEn,RowNum,CycCnt,Sram_RdEN) 
    begin
        case PrState is
            when Sram_Idle =>
                if Adc_RdEn ='1' then
                    NxState <= Sram_DataIn;
                else NxState <= Sram_Idle;
                end if;
            when Sram_DataIn =>
                NxState <= Sram_wr;
            when Sram_Wr => 
                if Adc_RdEn = '0' then
                    NxState <= Sram_Judge;
                else
                    NxState <= Sram_DataIn;
                end if;        
			when Sram_judge =>
				if CycCnt = RowNum then
					NxState <= Sram_wait;
				else 
					NxState <= Sram_idle;
			    end if;
			when Sram_Wait =>
				if Sram_RdEN = '1' then
                    NxState <= Sram_rd;
                else 
                    NxState <= Sram_wait;
                end if;	
            when Sram_rd =>
                if RdOk ='1' then
                    NxState <= Sram_OK;                 
                else NxState <= Sram_rd;
                end if;
            when Sram_OK =>
                NxState <= Sram_OK;
            when others =>
                NxState <= Sram_Idle;
        end case;
    end process;

    --State Output
    process(SysRst_n,SysClk) 
    begin
        if SysRst_n = '0' then
            Wd_Addr <= (others => '0');
            SRAM_We_n <= '1';    
            SRAM_OE_n <= '1';
            SRAM_CtlOk <= '0';
			CycCnt <= (others => '0');
            SRAM_B_n <= "1111";
			SRAM_CE_n <= "111";
			Sram_addr  <= (others => '0');
			Sram_Data(31 downto 0) <= (others => 'Z');
			Rd_reg <= (others => '0');
        elsif rising_edge(SysClk) then          
           -- Wd_Addr <= (others => '0');
            Sram_Data(31 downto 28) <= (others => 'Z');
			Sram_we_n <= '1';
            case PrState is
                when Sram_Idle =>
                    Sram_Data(27 downto 0) <= (others => 'Z');
					Sram_we_n <= '1';
                when Sram_DataIn =>
                    SRAM_CE_n <= "000";
                    Sram_Data(13 downto 0) <= ADC_Din;
                    SRAM_B_n <= "0000";
					Sram_addr <= Wd_Addr;	
                when Sram_Wr => 
                    Sram_Data(27 downto 14) <= ADC_Din;
                    Wd_Addr <= Wd_Addr+1;
					Sram_we_n <= '0';
				when Sram_judge =>
					CycCnt <= CycCnt+1;
                when Sram_Wait =>
                    Sram_Data(27 downto 0) <= (others => 'Z');
                when Sram_rd =>
                     SRAM_OE_n <= '0';
                     Sram_addr <= "1010101010101010101";  --random readout by tok
                     Rd_reg <= Sram_Data; 
                when Sram_OK =>
                    Sram_CtlOk <= '1';
                    SRAM_CE_n <= "111";
                    SRAM_B_n <= "1111";
                when others =>
					null;
            end case;                   
        end if;
    end process;

 -- Sram_we_nGen: WaveGensingle generic map
         -- (
     
             -- Polarity        => '1',
             -- DelayLen        => 0,
             -- DelayCntWidth   => 1,
             -- Phase1Len       => 0,
             -- Phase1CntWidth  => 1,
             -- Phase2Len       => 0,
             -- Phase2CntWidth  => 1,
             -- CycNum          => 511, --1024*1024
             -- CycCntWidth     => 10       --   
         -- )
         -- port map
             -- (
                 -- SysRst_n    => SysRst_n,
                 -- SysClk      => SysClk,
                 -- ClkEn       => '1',
                 -- WaveGenEn   => ADC_RdEn,
                 -- WFO         => Sram_we_n,
                 -- WaveRdy     => WrOk
             -- );
tokGen: WaveGensingle generic map
        (
     
            Polarity        => '0',
            DelayLen        => 0,
            DelayCntWidth   => 1,
            Phase1Len       => 63,
            Phase1CntWidth  => 6,
            Phase2Len       => 0,
            Phase2CntWidth  => 1,
            CycNum          => 0, 
            CycCntWidth     => 1       
        )
        port map
            (
                SysRst_n    => SysRst_n,
                SysClk      => SysClk,
                ClkEn       => '1',
                WaveGenEn   => SRAM_RdEn,
                WFO         => tok_inter,
                WaveRdy     => RdOk
            );
sclkGen: WaveGensingle generic map
        (
     
            Polarity        => '0',
            DelayLen        => 0,
            DelayCntWidth   => 1,
            Phase1Len       => 0,
            Phase1CntWidth  => 1,
            Phase2Len       => 0,
            Phase2CntWidth  => 1,
            CycNum          => 31, 
            CycCntWidth     => 6       --   
        )
        port map
            (
                SysRst_n    => SysRst_n,
                SysClk      => SysClk,
                ClkEn       => '1',
                WaveGenEn   => SRAM_RdEn,
                WFO         => sclk_inter,
                WaveRdy     => open
            );          
        
    process(sysclk,SysRst_n) begin
            if SysRst_n = '0' then
                Sdat_reg <= (others => '0');
            elsif rising_edge(SysClk) then          
                if(tok_inter ='0') then
					sdat_reg <= rd_reg;
				else 
                    Sdat_reg <= Sdat_reg(30 downto 0) & '0';
                end if;             
            end if;
         
    end process;
	SCLK_DLYGEN: SCLK_DLY
		port map (
					Clk => sclk_inter,
					GL =>	sclk
					);
				
            Sdat<= sdat_reg(31);
            tok <= tok_inter;
    
    
    
    
    

end Behavioral;