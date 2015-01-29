-- tb_acc_top.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity tb_acc_top is
end entity;

architecture ARCH of  tb_acc_top is
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
			LVDSRdOk	:out	std_logic;
			data2frame	:out	std_logic_vector(71 downto 0)
			);
end component;

signal 		sysclk		: 	std_logic;
signal		Sysrst_n	:	std_logic;
signal		adc_en		:	std_logic;
signal		lvds_en		:	std_logic;
signal		frame_req	:	std_logic;
signal		adc_din		:	std_logic_vector(13 downto 0);
signal		sdramen		:	std_logic;
signal		rfifo_dataIn:	std_logic_vector(71 downto 0);
signal		wfifo_dataout:	std_logic_vector(71 downto 0);
signal		fifo_rst_n	:	std_logic;
signal		rfifo_re	:	std_logic;
signal		wfifo_we	:	std_logic;
signal		data2frame	:	std_logic_vector(71 downto 0);
signal		LVDSRdOk	:	std_logic;
begin
UUt: acc_top port map
	(
	sysclk	 => sysclk,	
	Sysrst_n => Sysrst_n,	
	adc_en	 => adc_en,	
	lvds_en	 => lvds_en,	
	frame_req	 => frame_req,
	adc_din		 => adc_din,
	sdramen 	=> 	sdramen,
	rfifo_dataIn => rfifo_dataIn,
	wfifo_dataout => wfifo_dataout,
	fifo_rst_n	 => fifo_rst_n,
	rfifo_re	 => rfifo_re,
	wfifo_we	 => wfifo_we,
	LVDSRdOk	 => LVDSRdOk,
	data2frame	 => data2frame
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
		rfifo_dataIn <= (others => '0');
		SDramEn <= '0';
		lvds_en <= '0';
		adc_en <= '0';
		frame_req <= '0';
		wait for 1 us;
		wait for 5 ns;
		SDramEn <= '1';
		wait for 360 ns;
		adc_en <= '1';
		wait for 2048*15.15 ns;
		adc_en <= '0';
		wait for 25*15.15 ns;
		adc_en <= '1';
		rfifo_dataIn <= (0 => '0',30 => '0',others => '1');
		wait for 15.15 ns;
		rfifo_dataIn <= rfifo_dataIn+1;
		wait for 15.15 ns;
		rfifo_dataIn <= rfifo_dataIn+1;
		wait for 30996.9 ns;
		adc_en <= '0';
		--SDramEn <= '0';
		wait for 20 ns;
		--lvds_en <= '1';
		--frame_req <= '1';
		wait for 1 ms;
		--lvds_en <= '0';
		--frame_req <= '0';
end process;
process
	begin
		adc_din <= (others => '0');
		wait for 1332 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
		adc_din <= adc_din + 1;
		wait for 15.15 ns;
end process;
-- process
	-- begin
		-- rfifo_dataIn <= (others => '0');
		-- wait for 1 ms;
		-- rfifo_dataIn <= (others => '1');
		-- wait for 500 ns;
		-- rfifo_dataIn <= rfifo_dataIN+1;
		-- wait for 500 ns;
		-- rfifo_dataIn <= rfifo_dataIN+1;
		-- wait for 500 ns;
		-- rfifo_dataIn <= rfifo_dataIN+1;
		-- wait for 500 ns;
		-- rfifo_dataIn <= rfifo_dataIN+1;
		-- wait for 500 ns;
		-- rfifo_dataIn <= rfifo_dataIN+1;
		-- wait for 500 ns;
		-- rfifo_dataIn <= rfifo_dataIN+1;
		-- wait for 500 ns;
-- end process;		
end arch;	

