-- TB_link_main4sd_fmmk.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_link_main4sd_fmmk is
end entity;

architecture ARCH of  TB_link_main4sd_fmmk is
component link_main4sd_fmmk is port
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
			LVDS_O			:out	std_logic;
			LVDS_ok			:out	std_logic
		);
end component;

signal  	Sysclk 		: 	std_logic;
signal		sysrst_n	: 	std_logic;
signal		SDramEn		:	std_logic;
signal		LVDS_en		:	std_logic;
signal		Adc_en		:	std_logic;
--signal		frame_req	:	std_logic;
signal		Data_fifoIN	:	std_logic_vector(71 downto 0);
signal		Data_AccIn	:	std_logic_vector(71 downto 0);
signal		Data2ACC	:	std_logic_vector(71 downto 0);
signal		Data2Fifo	:	std_logic_vector(71 downto 0);
signal		fifo_rd		:	std_logic;
signal		fifo_rst_n	:	std_logic;
signal		Fifo_wr		:	std_logic;
--signal		LVDSRdOk	:	std_logic;
signal		SDram2FK		:		std_logic_vector(71 downto 0):=(0 => '0',14 => '0',others => '1');
signal		PKGType			:		std_logic_vector(2 downto 0):="001";
signal		PKGCnt			:		std_logic_vector(15 downto 0):=(others => '0');
signal		FrameCnt		:		std_logic_vector(8 downto 0):=(others => '0');
signal		SubFrameMode	:		std_logic_vector(1 downto 0):="00";
signal		SubFrameMotor	:		std_logic_vector(5 downto 0):=(others => '0');
signal		FrequencyNum			:		std_logic_vector(3 downto 0):=(others => '0');
signal		IntTime			:		std_logic_vector(5 downto 0):=(others => '0');
signal		AccNum			:		std_logic_vector(5 downto 0):=(0 => '1',1 => '1',others => '0');
signal		RowCnt			:		std_logic_vector(11 downto 0):=(11  => '0',others => '1');
signal		PKGDataLength	:		std_logic_vector(15 downto 0):="0000110111111111";--3583
signal		LVDS_O			:	std_logic;
signal		LVDS_ok			:	std_logic;
begin
uut: 	link_main4sd_fmmk port map
		(
		Sysclk => Sysclk,
		sysrst_n => sysrst_n,
		SDramEn => SDramEn,
		LVDS_en =>	LVDS_en,
		Adc_en =>	Adc_en,
		--frame_req => frame_req,
		Data_fifoIN => Data_fifoIN,
		Data_AccIn => Data_AccIn,
		Data2ACC => Data2ACC,
		Data2Fifo => Data2Fifo,
		fifo_rd => fifo_rd,
		--LVDSRdOk => LVDSRdOk,
		fifo_rst_n => fifo_rst_n,
		Fifo_wr	=> Fifo_wr,
		PKGType			=>	PKGType,
		PKGCnt			=>	PKGCnt,
		FrameCnt		=>	FrameCnt,
		SubFrameMode	=>	SubFrameMode,
		SubFrameMotor	=>	SubFrameMotor,
		FrequencyNum	=>	FrequencyNum,
		IntTime			=>	IntTime,
		AccNum			=>	AccNum,
		RowCnt			=>	RowCnt,
		PKGDataLength	=>	PKGDataLength,
		LVDS_O			=>	LVDS_O,
		LVDS_ok			=>	LVDS_ok
		);

process
	begin
		Sysclk <= '0';
		wait for  15.15 ns /2;
		Sysclk <= '1';
		wait for 15.15 ns /2;
end process;

process
   begin
		sysrst_n <= '0';
		wait for 0.6 us;
		sysrst_n <= '1';
		wait;
end process;

process
	begin
		Data_fifoIN <= (others => '1');
		Data_AccIn <= (0 =>'0', others => '1');
		SDramEn <= '0';
		--frame_req <= '0';
		lvds_en <= '0';
		adc_en <= '0';
		wait for 1.1 us;
		wait for 6 ns;
		SDramEn <= '1';
		wait for 360 ns;
		Data_accIN  <= Data_accIN + 8;	
		adc_en <= '1';
		wait for 2048*15.15 ns ;
		adc_en <= '0';
		wait for 15.15 * 25 ns;
		adc_en <= '1';
		Data_fifoIN <= Data_fifoIN + 8;
		wait for 15.15 ns;
		Data_fifoIN <= Data_fifoIN + 8;
		wait for 15.15 ns;
		Data_fifoIN <= Data_fifoIN + 8;
		wait for 15.15 ns;
		Data_fifoIN <= Data_fifoIN + 8;
		wait for 15.15 ns;
		Data_fifoIN <= Data_fifoIN + 8;
		wait for 30966.6 ns ;
		adc_en <= '0';
		wait for 0.5 ms;
		SDramEn <= '0';
		wait for 1 us;
		lvds_en <= '1';
		wait for 20 ns;
		--frame_req <= '1';
		Data_fifoIN <= (31 => '0',others => '1');
		wait for 15.15* 4 ns ;
		Data_fifoIN <= Data_fifoIN + 1;
		wait for 85 ns;
		Data_fifoIN <= Data_fifoIN + 1;
		wait for 15.15* 4 ns;
		Data_fifoIN <= Data_fifoIN + 1;
		wait for 15.15* 4 ns ;
		Data_fifoIN <= Data_fifoIN + 1;
		wait for 85 ns;
		Data_fifoIN <= Data_fifoIN + 1;
		wait for 15.15* 4 ns;
		Data_fifoIN <= Data_fifoIN + 1;
		wait for 1 ms;
		--frame_req <= '1';
		wait for 15 ns;
		lvds_en <= '0';
		wait for 200 ns;
		SDramEn <= '1';
		wait for 140 us;
end process;


end arch;