-- toptop_v2.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity toptop_v2 is     
            port
			(
			sysclk		:in 	std_logic;
            Sysrst_n	:in 	std_logic;
			GLB			:in		std_logic; --PLL dly clk for SD_clk, dly 2 ns after sysclk
			lvds_en		:in		std_logic;
			Sdram_en	:in		std_logic;--equals to rowreadoutEN
			ADC_en		:in		std_logic;--equals to Y_X_addressing adc_rden
			frame_req	:in		std_logic;
			Adc_din		:in		std_logic_vector(13 downto 0);
            DQ			:inout 	std_logic_vector(71 downto 0);
			LVDS_data	:out	std_logic_vector(71 downto 0);
            ras_n,cas_n,we_n:out std_logic;
			LVDSRdOk	:out	std_logic;
			SDOneframeOk:out	std_logic;	
            cke,cs_n	:out 	std_logic_vector(1 downto 0);
            dqm			:out 	std_logic_vector(7 downto 0);
			SD_clk		:out	std_logic_vector(1 downto 0);
            addr		:out 	std_logic_vector(12 downto 0);
            ba 			:out 	std_logic_vector(1 downto 0)
			);
end entity;

architecture behavioral of toptop_v2 is 
component FIFO_rd is 
    port( DATA : in std_logic_vector(71 downto 0); Q : out 
        std_logic_vector(71 downto 0);WE, RE, CLK : in std_logic
        ;  FULL, EMPTY : out std_logic;  RESET : in std_logic;  
        AEMPTY, AFULL : out std_logic) ;
end component;


component acc_top is     
            port
			(
			sysclk		:in 	std_logic;
            Sysrst_n	:in 	std_logic;
			adc_en		:in		std_logic;
			lvds_en		:in		std_logic;
			frame_req	:in		std_logic;
			adc_din		:in		std_logic_vector(13 downto 0);
			sdramen		:in		std_logic;
			rfifo_dataIn:in		std_logic_vector(71 downto 0);
			wfifo_dataout:out	std_logic_vector(71 downto 0);
			fifo_rst_n	:out	std_logic;
			rfifo_re	:out	std_logic;
			wfifo_we	:out	std_logic;
			LvdsRdOK	:out	std_logic;
		--	sdoneframeOk:out	std_logic;
			data2frame	:out	std_logic_vector(71 downto 0)
			);
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
			sdoneframeOk:out	std_logic;
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
signal Wfifo_dataout	:	std_logic_vector(71 downto 0); --主语是fifo
signal Wfifo_datain		:	std_logic_vector(71 downto 0);
signal rfifo_dataOut	:	std_logic_vector(71 downto 0);
signal Rfifo_dataIN		:	std_logic_vector(71 downto 0);
signal Fifo_RAfull		:	std_logic;
signal Fifo_WAfull		:	std_logic;
signal RFifo_we,rfifo_re			:	std_logic;	
signal WFifo_re,wfifo_we			:	std_logic;
signal fifo_rst_n		:	std_logic;	
begin
U1: Sdram_top port map
	(
		sysclk	=> sysclk,	
		Sysrst_n=> sysrst_n,
		GLB	=> GLB,		
		lvds_en	=> LVDS_en,	
		Sys_dataIn => Wfifo_dataout,	
		Fifo_RAfull	=> Fifo_RAfull,
		Fifo_WAfull	=> Fifo_WAfull,
		Sdram_en	=> Sdram_en,
		RFifo_we => RFifo_we,
		WFifo_re => WFifo_re,
		SD_clk	=> 	sd_clk,
		DQ	=> 	DQ,	
		Sys_dataOut => Rfifo_dataIN,	
		ras_n => ras_n,
		cas_n => cas_n,
		we_n => we_n,
		cke => cke,
		sdoneframeOk => SDoneframeOk,
		cs_n => cs_n,	
		dqm	=> 	dqm,	
		addr => addr,		
        ba => ba
	);
U2: acc_top port map
	(
		sysclk		=>	sysclk,
		Sysrst_n	=>	Sysrst_n,
		adc_en		=>	adc_en,
		lvds_en		=>	lvds_en,
		frame_req	=>	frame_req,
		adc_din		=>	adc_din,
		sdramEn	=>	sdram_en,
		rfifo_dataIn=>	rfifo_dataOut,
		wfifo_dataout=>	wfifo_datain,
		fifo_rst_n	=>	fifo_rst_n,
		rfifo_re	=>	rfifo_re,
		wfifo_we	=>	wfifo_we,
		LvdsrdOK	 => LvdsRdOk,
		data2frame	=>	LVDS_data
	);
U3: FIFO_rd port map
	(
		DATA => rfifo_datain,
		Q  => rfifo_dataout,
        WE => RFifo_we,
	    RE => Rfifo_re,
	    CLK  => sysclk,
        FULL => open,
		EMPTY => open,
		RESET => fifo_rst_n,
        AEMPTY => open,
		AFULL => Fifo_RAfull
	);	
U4: FIFO_rd port map
	(
		DATA => wfifo_datain,
		Q  => wfifo_dataout,
        WE => wFifo_we,
	    RE => wfifo_re,
	    CLK  => sysclk,
        FULL => open,
		EMPTY => open,
		RESET => fifo_rst_n,
        AEMPTY => open,
		AFULL => Fifo_WAfull
	);
	
end behavioral; 	