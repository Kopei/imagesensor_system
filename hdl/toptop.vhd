-- toptop.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity toptop is     
            port
			(
			sysclk		:in 	std_logic;
            Sysrst_n	:in 	std_logic;
			GLB			:in		std_logic;
			lvds_en		:in		std_logic;
			Sdram_en	:in		std_logic;
			ADC_en		:in		std_logic;
			frame_req	:in		std_logic;
			Adc_din		:in		std_logic_vector(13 downto 0);
            DQ			:inout 	std_logic_vector(71 downto 0);
			LVDS_data	:out	std_logic_vector(71 downto 0);
            ras_n,cas_n,we_n:out std_logic;
            cke,cs_n	:out 	std_logic_vector(1 downto 0);
            dqm			:out 	std_logic_vector(7 downto 0);
			SD_clk		:out	std_logic_vector(1 downto 0);
            addr		:out 	std_logic_vector(12 downto 0);
            ba 			:out 	std_logic_vector(1 downto 0)
			);
end entity;

architecture behavioral of toptop is 
component ADC_Muxtmp is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			dataIn		:in		std_logic_vector(13 downto 0);
			ADC_en		:in		std_logic;
            DataOut		:out	std_logic_vector(71 downto 0)   
		);
end component;

component My_Adder0 is 
    port( DataA : in std_logic_vector(17 downto 0); DataB : in 
        std_logic_vector(17 downto 0); Sum : out 
        std_logic_vector(17 downto 0)) ;
end component;

component My_Adder1 is 
    port( DataA : in std_logic_vector(17 downto 0); DataB : in 
        std_logic_vector(17 downto 0); Sum : out 
        std_logic_vector(17 downto 0)) ;
end component;

component My_Adder2 is 
    port( DataA : in std_logic_vector(17 downto 0); DataB : in 
        std_logic_vector(17 downto 0); Sum : out 
        std_logic_vector(17 downto 0)) ;
end component;

component My_Adder3 is 
    port( DataA : in std_logic_vector(17 downto 0); DataB : in 
        std_logic_vector(17 downto 0); Sum : out 
        std_logic_vector(17 downto 0)) ;
end component;

component Main_ctl4SD is     
		port
		(
			Sysclk 		:in 	std_logic;
            sysrst_n	:in 	std_logic;
			SDram_en	:in		std_logic; 
			LVDS_en		:in		std_logic;
			Adc_en		:in		std_logic;
			frame_req	:in		std_logic;
			Data_fifoIN	:in		std_logic_vector(71 downto 0);
			Data_AccIn	:in		std_logic_vector(71 downto 0);
			Data2ACC	:out	std_logic_vector(71 downto 0);
			Data2Fifo	:out	std_logic_vector(71 downto 0);
			LVDS_data	:out	std_logic_vector(71 downto 0);
			fifo_rd		:out	std_logic;
			fifo_rst_n	:out	std_logic;	
			Fifo_wr		:out	std_logic
		);
end component;

component FIFO_rd is 
    port( DATA : in std_logic_vector(71 downto 0); Q : out 
        std_logic_vector(71 downto 0);WE, RE, CLK : in std_logic
        ;  FULL, EMPTY : out std_logic;  RESET : in std_logic;  
        AEMPTY, AFULL : out std_logic) ;
end component;

component FIFO_wr is 
    port( DATA : in std_logic_vector(71 downto 0); Q : out 
        std_logic_vector(71 downto 0);WE, RE, CLK : in std_logic
        ;  FULL, EMPTY : out std_logic;  RESET : in std_logic;  
        AEMPTY, AFULL : out std_logic) ;
end component;

component Sdram_top is     
            port
			(
			sysclk		:in 	std_logic;
            Sysrst_n	:in 	std_logic;
			GLB			:in		std_logic;
			lvds_en		:in		std_logic;
			Sys_dataIn	:in		std_logic_vector(71 downto 0);
			Fifo_RAfull	:in		std_logic;
			Fifo_WAfull	:in		std_Logic;
			Sdram_en	:in		std_logic;
			RFifo_we	:out	std_logic;
			WFifo_re	:out	std_logic;
            SD_clk		:out 	std_logic_vector(1 downto 0);
            DQ			:inout 	std_logic_vector(71 downto 0);
			Sys_dataOut	:out	std_logic_vector(71 downto 0);
            ras_n,cas_n,we_n:out std_logic;
            cke,cs_n	:out 	std_logic_vector(1 downto 0);
            dqm			:out 	std_logic_vector(7 downto 0);
            addr		:out 	std_logic_vector(12 downto 0);
            ba 			:out 	std_logic_vector(1 downto 0)
			);
end component;

signal dataA_adder0	: std_logic_vector(17 downto 0);
signal dataA_adder1	: std_logic_vector(17 downto 0);
signal dataA_adder2	: std_logic_vector(17 downto 0);
signal dataA_adder3	: std_logic_vector(17 downto 0);
signal dataB_adder0	: std_logic_vector(17 downto 0);
signal dataB_adder1	: std_logic_vector(17 downto 0);
signal dataB_adder2	: std_logic_vector(17 downto 0);
signal dataB_adder3	: std_logic_vector(17 downto 0);
signal sum0			: std_logic_vector(17 downto 0);
signal sum1			: std_logic_vector(17 downto 0);
signal sum2			: std_logic_vector(17 downto 0);
signal sum3			: std_logic_vector(17 downto 0);
signal fifo_rst_n	: std_logic;
signal Rfifo_rd		: std_logic;
signal WFifo_wr		: std_logic;
signal Data_fifoIN  : std_logic_vector(71 downto 0);
signal Data2Fifo	: std_logic_vector(71 downto 0);
signal Fifo_RAfull	: std_logic;
signal Fifo_WAfull	: std_logic;
signal RFifo_we		: std_logic;
signal WFifo_re		: std_logic;
signal Sys_dataIn	: std_logic_vector(71 downto 0);
signal Sys_dataOut  : std_logic_vector(71 downto 0);
begin
U1: adc_muxtmp port map
	(
		Sysclk 	=> sysclk,
		rst_n	=> sysrst_n,
		dataIn	=> Adc_din,
		ADC_en	=> adc_en, 
		DataOut(17 downto 0) => dataA_adder0,
		DataOut(35 downto 18) => dataA_adder1,
		DataOut(53 downto 36) => dataA_adder2,
		DataOut(71 downto 54) => dataA_adder3
	);
U2:	My_Adder0 port map
	(
		DataA => dataA_adder0,
		DataB => dataB_adder0,		   
		Sum  => sum0
	);
U3: My_Adder1 port map
	(
		DataA => dataA_adder1,
		DataB => dataB_adder1,		   
		Sum  => sum1
	);	
U4: My_Adder2 port map
	(
		DataA => dataA_adder2,
		DataB => dataB_adder2,		   
		Sum  => sum2
	);	
U5: My_Adder3 port map
	(
		DataA => dataA_adder3,
		DataB => dataB_adder3,		   
		Sum  => sum3
	);		
U6: Main_ctl4SD port map
	(
		Sysclk  => sysclk,
		sysrst_n  => sysrst_n,	
		SDram_en => SDram_en,	
		LVDS_en	 => LVDS_en,
		Adc_en	 => Adc_en,	
		frame_req => frame_req, 	
		Data_fifoIN	 => Data_fifoIN,
		Data_AccIn(17 downto 0)	=> sum0,
		Data_AccIn(35 downto 18)=> sum1,
		Data_AccIn(53 downto 36)=> sum2,
		Data_AccIn(71 downto 54)=> sum3,
		Data2ACC(17 downto 0) => dataB_adder0,
		Data2ACC(35 downto 18) => dataB_adder1,
		Data2ACC(53 downto 36) => dataB_adder2,
		Data2ACC(71 downto 54) => dataB_adder3,		
		Data2Fifo => Data2Fifo,
		LVDS_data => LVDS_data,	
		fifo_rd	=> Rfifo_rd,
		fifo_rst_n	=> fifo_rst_n,
		Fifo_wr	 => WFifo_wr	
	);
U7: FIFO_rd port map
	(
		DATA => Sys_dataOut,
		Q  => Data_fifoIN,
        WE => RFifo_we,
	    RE => Rfifo_rd,
	    CLK  => sysclk,
        FULL => open,
		EMPTY => open,
		RESET => fifo_rst_n,
        AEMPTY => open,
		AFULL => Fifo_RAfull
	);
U8: FIFO_wr port map
	(
		DATA => Data2Fifo,
		Q  => Sys_dataIn,
        WE => WFifo_wr,
	    RE => WFifo_re,
	    CLK  => sysclk,
        FULL => open,
		EMPTY => open,
		RESET => fifo_rst_n,
        AEMPTY => open,
		AFULL => Fifo_WAfull
	);
U9: Sdram_top port map
	(
		sysclk	=> sysclk,	
		Sysrst_n=> sysrst_n,
		GLB	=> GLB,		
		lvds_en	=> LVDS_en,	
		Sys_dataIn => Sys_dataIn,	
		Fifo_RAfull	=> Fifo_RAfull,
		Fifo_WAfull	=> Fifo_WAfull,
		Sdram_en	=> Sdram_en,
		RFifo_we => RFifo_we,
		WFifo_re => WFifo_re,
		SD_clk	=> 	sd_clk,
		DQ	=> 	DQ,	
		Sys_dataOut => Sys_dataOut,	
		ras_n => ras_n,
		cas_n => cas_n,
		we_n => we_n,
		cke => cke,
		cs_n => cs_n,	
		dqm	=> 	dqm,	
		addr => addr,		
        ba => ba
	);
end behavioral;	