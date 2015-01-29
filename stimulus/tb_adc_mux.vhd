-- tb_adc_mux.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity tb_adc_mux is
end entity;

architecture ARCH of  tb_adc_mux is
component adc_mux is port
		(

			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			dataIn		:in		std_logic_vector(13 downto 0);
			ADC_en		:in		std_logic;
            DataOut		:out	std_logic_vector(71 downto 0)

		);
end component;
signal	Sysclk		: 		std_logic;
signal	rst_n		:		std_logic;
signal 	dataIn		:		std_logic_vector(13 downto 0);
signal	ADC_en		:		std_logic;
signal	DataOut		:		std_logic_vector(71 downto 0);
constant clk_period :		time	:=	15150 ps;
begin
uut: adc_mux port map
	(
	Sysclk  =>  Sysclk,
	rst_n   =>  rst_n,
	dataIn  =>  dataIn,
	ADC_en  =>  ADC_en,
	DataOut =>  DataOut
	);
clk_gen:process
	begin
		Sysclk <='1';
		wait for clk_period/2;
		Sysclk <='0';
		wait for clk_period/2;
end process;
process
   begin
		rst_n <= '0';
		wait for 0.6 us;
		rst_n <= '1';
		wait;
end process;
process
	begin
	adc_en <= '0';
	dataIn <= (others => '0');
	wait for 1 us ;
	adc_en <= '1';
	dataIn <= (0  => '1',1  => '0',2 => '1',3 => '0',others => '0');
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for clk_period;
	dataIN <= dataIn + 1;
	wait for 20 us;
end process;
end arch;	