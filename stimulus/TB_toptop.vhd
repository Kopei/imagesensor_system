-- TB_toptop.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_toptop is
end entity;
     
architecture ARCH of  TB_toptop is
component toptop is     
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
end component;
signal sysclk		:	std_logic;
signal Sysrst_n		:	std_logic;
signal GLB			:	std_logic;
signal lvds_en		:	std_logic;
signal Sdram_en		:	std_logic;
signal ADC_en		:	std_logic;
signal frame_req	:	std_logic;
signal Adc_din		:	std_logic_vector(13 downto 0);
signal DQ			: 	std_logic_vector(71 downto 0);
signal LVDS_data	:	std_logic_vector(71 downto 0);
signal ras_n,cas_n,we_n: std_logic;
signal cke,cs_n		: 	std_logic_vector(1 downto 0);
signal dqm			: 	std_logic_vector(7 downto 0);
signal SD_clk		:	std_logic_vector(1 downto 0);
signal addr			: 	std_logic_vector(12 downto 0);
signal ba 			: 	std_logic_vector(1 downto 0);
begin
uut: toptop port map
	(
		sysclk	 => sysclk,
		Sysrst_n => Sysrst_n,	
		GLB		 => GLB,
		lvds_en	 => lvds_en	,
		Sdram_en => Sdram_en,	
		ADC_en	 => ADC_en,
		frame_req => frame_req,
		Adc_din	 => Adc_din,	
		DQ		 => DQ,
		LVDS_data => LVDS_data,	
		ras_n => ras_n,
		cas_n => cas_n,
		we_n => we_n,
		cke => cke,
		cs_n => cs_n,	
		dqm	 => dqm	,	
		SD_clk => SD_clk,		
		addr => addr,		
		ba 	 => ba		
	);
process
	begin
		sysclk <= '0';
		wait for  15.15 ns /2;
		sysclk <= '1';
		wait for 15.15 ns /2;
end process;		
   	
process
	begin
		Sysrst_n <= '0';
		wait for  0.6 us;
		Sysrst_n <= '1';
		wait;
end process;
		
process
	begin
		SDram_EN <= '0';
		adc_en	 <= '0';
		lvds_en <= '0';	
		frame_req <= '0';
		adc_din <= (others => '0');
		wait for 306 us;
		SDram_EN <= '1';
		Adc_en <= '1';
		wait for 15 * 4 ns;
		adc_din <= (others => '0');
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 15.15 ns;
		adc_din  <= adc_din + 1;
		wait for 6 ms;	
		SDram_EN <= '0';
		adc_en	 <= '0';
		lvds_en <= '1';	
		frame_req <= '1';
		wait for 2 ms;
end process;


		
dqgen: process
begin
		dq <= (others => 'Z');
		wait for 306 us;
		wait for 100 ns;
		dq <= (0 => '1',2 => '1',others => '0');
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 150 ns;
		-- dq <= (others => 'Z');
		-- wait 430 ns;
		-- da <= (0 => '1',2 => '1',others => '1');
		-- wait for 150 ns;
	end process;	
end arch;		
	