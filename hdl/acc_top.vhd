-- acc_top.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity acc_top is     
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
			LVDSRdOk	:out	std_logic;
		--	SDOneframeOk:out	std_logic;	
			data2frame	:out	std_logic_vector(71 downto 0)
			);
end entity;

architecture behavioral of acc_top is 
component ADC_Muxtmp is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			dataIn		:in		std_logic_vector(13 downto 0);
			ADC_en		:in		std_logic;
            DataOut		:out	std_logic_vector(55 downto 0)   
		);
end component;
component Main_ctl4SD is     
	port
		(
			Sysclk 		:in 	std_logic;
            sysrst_n	:in 	std_logic;
			SDramEn		:in		std_logic;  --有此信号产生对FIFO预读到adder的使能信号
			LVDS_en		:in		std_logic;
			Adc_en		:in		std_logic; --对应cmos_ctl的adc_rdEN
			frame_req	:in		std_logic;
			Data_fifoIN	:in		std_logic_vector(71 downto 0);
			Data_AccIn	:in		std_logic_vector(71 downto 0);
			Data2ACC	:out	std_logic_vector(71 downto 0);
			Data2Fifo	:out	std_logic_vector(71 downto 0);
			LVDS_data	:out	std_logic_vector(71 downto 0);
			fifo_rd		:out	std_logic;
			fifo_rst_n	:out	std_logic;	
			LVDSRdOk	:out	std_logic;
		--	SDOneframeOk:out	std_logic;
			Fifo_wr		:out	std_logic
		);
end component;
component My_Adder0 is 
    port( DataA : in std_logic_vector(17 downto 0); DataB : in 
        std_logic_vector(17 downto 0); Sum : out 
        std_logic_vector(17 downto 0)) ;
end component;


signal dataA_adder0	: std_logic_vector(13 downto 0);
signal dataA_adder1	: std_logic_vector(13 downto 0);
signal dataA_adder2	: std_logic_vector(13 downto 0);
signal dataA_adder3	: std_logic_vector(13 downto 0);
signal dataB_adder0	: std_logic_vector(17 downto 0);
signal dataB_adder1	: std_logic_vector(17 downto 0);
signal dataB_adder2	: std_logic_vector(17 downto 0);
signal dataB_adder3	: std_logic_vector(17 downto 0);
signal sum0			: std_logic_vector(17 downto 0);
signal sum1			: std_logic_vector(17 downto 0);
signal sum2			: std_logic_vector(17 downto 0);
signal sum3			: std_logic_vector(17 downto 0);

begin
U1: ADC_Muxtmp port map
	(
		Sysclk 	=> sysclk,
		rst_n	=> sysrst_n,
		dataIn	=> Adc_din,
		ADC_en	=> adc_en, 
		DataOut(13 downto 0) => dataA_adder0,
		DataOut(27 downto 14) => dataA_adder1,
		DataOut(41 downto 28) => dataA_adder2,
		DataOut(55 downto 42) => dataA_adder3
	);
U2:	My_Adder0 port map
	(
		DataA(13 downto 0) => dataA_adder0,
		DataA(17 downto 14) => "0000",
		--DataA => "0000" & dataA_adder0;
		DataB => dataB_adder0,		   
		Sum  => sum0
	);
U3:	My_Adder0 port map
	(
		DataA(13 downto 0) => dataA_adder1,
		DataA(17 downto 14) => "0000",
		DataB => dataB_adder1,		   
		Sum  => sum1
	);
U4:	My_Adder0 port map
	(
		DataA(13 downto 0) => dataA_adder2,
		DataA(17 downto 14) => "0000",
		DataB => dataB_adder2,		   
		Sum  => sum2
	); 
U5:	My_Adder0 port map
	(
		DataA(13 downto 0) => dataA_adder3,
		DataA(17 downto 14) => "0000",
		DataB => dataB_adder3,		   
		Sum  => sum3
	);	
U6: Main_ctl4SD port map
	(
		Sysclk  => sysclk,
		sysrst_n  => sysrst_n,	
		SDramen => SDramen,	
		LVDS_en	 => LVDS_en,
		Adc_en	 => Adc_en,	
		frame_req => frame_req, 	
		Data_fifoIN	 => rfifo_dataIn,
		Data_AccIn(17 downto 0)	=> sum0,
		Data_AccIn(35 downto 18)=> sum1,
		Data_AccIn(53 downto 36)=> sum2,
		Data_AccIn(71 downto 54)=> sum3,
		Data2ACC(17 downto 0) => dataB_adder0,
		Data2ACC(35 downto 18) => dataB_adder1,
		Data2ACC(53 downto 36) => dataB_adder2,
		Data2ACC(71 downto 54) => dataB_adder3,		
		Data2Fifo => wfifo_dataout,
		LVDS_data => data2frame,	
		fifo_rd	=> rfifo_re,
		LVDSRdOk => LVDSRdOk,
	--	sdoneframeOk  => SDOneframeOk,
		fifo_rst_n	=> fifo_rst_n,
		Fifo_wr	 => wfifo_we	
	);	
end behavioral;	