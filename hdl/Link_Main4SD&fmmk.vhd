-- Link_Main4SD&fmmk.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Link_Main4SD_fmmk is     
            port
			(
			Sysclk 			:in 	std_logic;
            sysrst_n		:in 	std_logic;
			SDramEn			:in		std_logic;  --有此信号产生对FIFO预读到adder的使能信号
			LVDS_en			:in		std_logic;
			Adc_en			:in		std_logic; --对应cmos_ctl的adc_rdEN
		--	frame_req		:in		std_logic;
			Data_fifoIN		:in		std_logic_vector(71 downto 0);
			Data_AccIn		:in		std_logic_vector(71 downto 0);
			Data2ACC		:out	std_logic_vector(71 downto 0);
			Data2Fifo		:out	std_logic_vector(71 downto 0);
			fifo_rd			:out	std_logic;
			fifo_rst_n		:out	std_logic;	
			--LVDSRdOk		:out	std_logic;
			Fifo_wr			:out	std_logic;
			PKGType			:in		std_logic_vector(2 downto 0);
			PKGCnt			:in		std_logic_vector(15 downto 0);
			FrameCnt		:in		std_logic_vector(8 downto 0);
			SubFrameMode	:in		std_logic_vector(1 downto 0);
			SubFrameMotor	:in		std_logic_vector(5 downto 0);
			FrequencyNum	:in		std_logic_vector(3 downto 0);
			IntTime			:in		std_logic_vector(5 downto 0);
			AccNum			:in		std_logic_vector(5 downto 0);
			RowCnt			:in		std_logic_vector(11 downto 0);
			PKGDataLength	:in		std_logic_vector(15 downto 0);
			LVDS_O			:out	std_logic
			--LVDS_ok			:out	std_logic
			
    );
end entity;

architecture ARCH of Link_Main4SD_fmmk is
component Main_ctl4SD port
		(
			Sysclk 		:in 	std_logic;
            sysrst_n	:in 	std_logic;
			SDramEn		:in		std_logic;  --有此信号产生对FIFO预读到adder的使能信号
			LVDS_en		:in		std_logic;
			Adc_en		:in		std_logic; --对应cmos_ctl的adc_rdEN
			LVDSRdOk	:in		std_logic;
			Data_fifoIN	:in		std_logic_vector(71 downto 0);
			Data_AccIn	:in		std_logic_vector(71 downto 0);
			Data2ACC	:out	std_logic_vector(71 downto 0);
			Data2Fifo	:out	std_logic_vector(71 downto 0);
			LVDS_data	:out	std_logic_vector(71 downto 0);
			fifo_rd		:out	std_logic;
			fifo_rst_n	:out	std_logic;	
			
			ByteRdEn	:out	std_logic;
			Fifo_wr		:out	std_logic
		);
end component;
component fk_test is port
	(
				SysClk			:in		std_logic;
		SysRst_n        :in		std_logic;
		LVDS_en			:in		std_logic; --active high, enable FK_Test module
		ByteRdEn		:in		std_logic; --active high, dly one sysclk used as signal for fifo control WE 
		SDram2FK		:in		std_logic_vector(71 downto 0);
		PKGType			:in		std_logic_vector(2 downto 0);
		PKGCnt			:in		std_logic_vector(15 downto 0);
		FrameCnt		:in		std_logic_vector(8 downto 0);
		SubFrameMode	:in		std_logic_vector(1 downto 0);
		SubFrameMotor	:in		std_logic_vector(5 downto 0);
		BandNum			:in		std_logic_vector(3 downto 0);
		IntTime			:in		std_logic_vector(5 downto 0);
		AccNum			:in		std_logic_vector(5 downto 0);
		RowCnt			:in		std_logic_vector(11 downto 0);
		PKGDataLength	:in		std_logic_vector(15 downto 0);
		LVDS_O			:out	std_logic;
	--	tok				:out	std_logic;
		LVDS_ok			:out	std_logic  --answer LVDS_en
		
	);
end component;
signal	ByteRdEn	: 	std_logic;
signal	DataFrame	:	std_logic_vector(71 downto 0);
signal	lvds_ok		:	std_logic;
begin 
U1:component FK_test port map
	(
		SysClk		=> 	SysClk,
		SysRst_n    =>  SysRst_n,   
		LVDS_en		=> 	LVDS_en,
		ByteRdEn	=> 	ByteRdEn,
		SDram2FK	=> 	DataFrame,
		PKGType		=> 	PKGType,
		PKGCnt		=> 	PKGCnt,
		FrameCnt	=> 	FrameCnt,
		SubFrameMode	=> SubFrameMode,
		SubFrameMotor	=> SubFrameMotor,
		BandNum	=> FrequencyNum,
		IntTime		=> 	IntTime,
		AccNum		=> 	AccNum,
		RowCnt		=> 	RowCnt,
		PKGDataLength	=> PKGDataLength,
		LVDS_O			=> LVDS_O,
		LVDS_ok			=> LVDS_ok
	);
	
U2: component Main_ctl4SD port map
	(
		Sysclk 		=> Sysclk,
		sysrst_n	=> sysrst_n,
		SDramEn		=> SDramEn,
		LVDS_en		=> LVDS_en,
		Adc_en		=> Adc_en,
		--frame_req	=> frame_req,
		Data_fifoIN	=> Data_fifoIN,
		Data_AccIn	=> Data_AccIn,
		Data2ACC	=> Data2ACC,
		Data2Fifo	=> Data2Fifo,
		LVDS_data	=> DataFrame,
		fifo_rd		=> fifo_rd,
		fifo_rst_n	=> fifo_rst_n,
		LVDSRdOk	=> LVDS_Ok,
		ByteRdEn	=> ByteRdEn,
		Fifo_wr		=> Fifo_wr
	);


end Arch;