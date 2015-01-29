-- TB_Sram_ctl.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY Tb_sram_ctl IS
END entity;
 
ARCHITECTURE behavior OF Tb_sram_ctl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sram_Ctl
     port(
            SysRst_n        :in     std_logic;
            SysClk          :in     std_logic;
           -- SRAM_CtlEn      :in     std_logic;  --SRAM_Ctl Module Enable
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
			--RowNum			:in			std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SysRst_n : std_logic := '0';
   signal SysClk : std_logic := '0';
   --signal SRAM_CtlEn : std_logic ;
	signal SRAM_CtlOk : std_logic;
 	--Outputs
   --signal RowCntO : std_logic_vector(10 downto 0);
  -- signal LineReadOutOkO : std_logic;
   --signal RowReadOutEnO : std_logic;
  -- signal PrStateO : std_logic_vector(2 downto 0);
   signal SRAM_WrEn : std_logic;
   signal SRAM_RdEn : std_logic;
   signal ADC_RdEn : std_logic;
   signal ADC_Din	:   std_logic_vector(13 downto 0);
   signal SRAM_Addr :        std_logic_vector(18 downto 0);
   signal SRAM_CE_n  :       std_logic_vector(2 downto 0);
   signal SRAM_WE_n   :        std_logic;
   signal SRAM_OE_n    	:        std_logic;
   signal SRAM_B_n      :      std_logic_vector(3 downto 0);   --Bd:Bit3;Bc:Bit2;Bb:Bit1;Ba:Bit0
   signal SRAM_Data       :    std_logic_vector(31 downto 0);
   signal Tok             :      std_logic;
   signal Sclk            :        std_logic;
   signal Sdat            :        std_logic ; 
   --signal RowNum		:		std_logic_vector(10 downto 0):="01111111111";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sram_Ctl PORT MAP (
          --RowCntO => RowCntO,
          --LineReadOutOkO => LineReadOutOkO,
          --RowReadOutEnO => RowReadOutEnO,
         -- PrStateO => PrStateO,
        SysRst_n => SysRst_n,
        SysClk => SysClk,
		--SRAM_CtlEn => SRAM_CtlEn,
		SRAM_CtlOk => SRAM_CtlOk,
		SRAM_WrEn => SRAM_WrEn,
		SRAM_RdEn => SRAM_RdEn,
		ADC_RdEn => ADC_RdEn,
		ADC_Din	=> ADC_Din,
		SRAM_Addr => SRAM_Addr,
		SRAM_CE_n => SRAM_CE_n,
		SRAM_WE_n => SRAM_WE_n,
		SRAM_OE_n => SRAM_OE_n,
		SRAM_B_n => SRAM_B_n,
		SRAM_Data => SRAM_Data,
		tok =>	tok,
		sclk => sclk,
		sdat => sdat
		--Rownum => rownum
	);



 
   --SysClk
   process
   begin
		SysClk <= '0';
		wait for  15.15 ns /2;
		SysClk <= '1';
		wait for 15.15 ns /2;
   end process;

   --SysRst_n
   process
   begin
		SysRst_n <= '0';
		wait for 0.6 us;
		SysRst_n <= '1';
		wait;
   end process;
	
	
	--Y_X_WaveEn
	process
	begin
	--	Sram_ctlEn <= '0';
		
		Sram_rdEN <= '0';
		Sram_wrEN <= '0';
		wait for 1 us;
	--	Sram_ctlEn <= '1';
		wait for 1 us;
		Sram_wrEN <= '1';
		wait for 64 ms;
		SRAM_RdEn <= '1';
		
	end process;
	
	process
	begin
		Adc_din <= (0 => '1',others => '0');
		wait for 30 ns;
		Adc_din <= (others => '1');
		wait for 30 ns;
	end process;	
	
	process
	begin
		Adc_rdEN <= '0';
		wait for 1200 ns;
		Adc_rdEN <= '1';
		wait for 14400 ns;
		Adc_rdEN <= '0';
		wait for 200 ns;
		Adc_rdEN <= '1';
		wait;
	end process;
END;
