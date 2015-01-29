-- TB_SDram_ctl.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_SDram_ctl is
end entity;
     
architecture ARCH of  TB_SDram_ctl is
		component SDram_ctl
			port
			(
			Sysclk		:in 	std_logic;
            SysRst_n	:in 	std_logic;
			Fifo_RAfull	:in		std_logic;
			--Fifo_empty	:in		std_logic;
			--Fifo_aempty	:in		std_logic;
			Fifo_Wafull	:in		std_logic;
			SD_iniOK	:in		std_logic;
			SD_WrOK		:in		std_logic;
			SD_RdOK		:in		std_logic;
			SD_refOK	:in		std_logic;
			--SD_PreRdOK	:in		std_logic;
			Lvds_en		:in		std_logic;
			SDRAM_En	:in		std_logic;
            -- sdclk		:out 	std_logic_vector(1 downto 0);
            -- din			:inout 	std_logic_vector(71 downto 0);
            -- dout		:out 	std_logic;
            -- stok		:out 	std_logic;
			SD_iniEn	:out	std_logic;
			SD_RefEn	:out	std_logic;
			SD_wrEn		:out	std_logic;
			SD_rdEn		:out	std_logic;
			SD_pdEN		:out	std_logic
			--WFifo_re		:out	std_logic
			-- dataRfifo	:out	std_logic_vector(71 downto 0);
			-- dataWfifo	:in		std_logic_vector(71 downto 0)
            -- dqm			:out 	std_logic_vector(7 downto 0);
            -- addr		:out 	std_logic_vector(12 downto 0);
            -- ba 			:out 	std_logic_vector(1 downto 0)

			);
end component;
signal 			Sysclk		: 		std_logic;
signal		    SysRst_n	: 		std_logic;
signal			Fifo_RAfull	:		std_logic;
signal			Lvds_en		:		std_logic;
			--Fifo_aempty	:in		std_logic;
signal			Fifo_Wafull	:		std_logic;
signal			SD_iniOK	:		std_logic;
signal			SD_WrOK		:		std_logic;
signal			SD_RdOK		:		std_logic;
signal			SD_refOK	:		std_logic;
signal			SD_pdEN		:		std_logic;
			-- PowerOK		:in		std_logic;
signal			SDRAM_En	:		std_logic;
-- signal 			dataRfifo	:		std_logic_vector(71 downto 0);
-- signal			dataWfifo	:		std_logic_vector(71 downto 0);
signal			SD_iniEn	:		std_logic;
signal			SD_RefEn	:		std_logic;
signal			SD_wrEn		:		std_logic;
signal			SD_rdEn		:		std_logic;
--signal			RFifo_we		:		std_logic;
--signal			WFifo_re		:		std_logic;

begin
uut:sdram_ctl port map (Sysclk => Sysclk, SysRst_n=> SysRst_n,  Fifo_RAfull => Fifo_RAfull,
					Fifo_Wafull => Fifo_Wafull, SD_iniOK => SD_iniOK, SD_WrOK => SD_WrOK,
					LVDS_en => lvds_en,SD_pdEN  => SD_pdEN,
					SD_RdOK => SD_RdOK, SD_refOK => SD_refOK, SDRAM_En => SDRAM_En,
					SD_iniEn => SD_iniEn, SD_RefEn => SD_RefEn, SD_wrEn => SD_wrEn,
					SD_rdEn => SD_rdEn);
process
   begin
		Sysclk <= '0';
		wait for  15.15 ns /2;
		Sysclk <= '1';
		wait for 15.15 ns /2;
   end process;					
process
   begin
		SysRst_n <= '0';
		wait for 0.6 us;
		SysRst_n <= '1';
		wait;
end process;

process
	begin
		SD_iniOK	<= '0';
		wait for 300 us;
		SD_iniOK <= '1';		
	wait;
end process;

 process
	 begin
		 Fifo_RAfull <= '0';
		 wait for 302 us;
		 Fifo_RAfull <= '1';
		 wait for 30 ns ;
		 Fifo_RAfull <= '0';
	 wait;
end process;		
process
	begin
		SDRAM_En <= '0';
		LVDS_en  <= '0';
		wait for 303 us;
		SDRAM_En <= '1';
		wait for 64 ms;
		lvds_en <= '1';
		SDRAM_En <= '0';
		wait for 500 us;
end process;

process(SD_rdEn)
    begin
        case SD_rdEn is
            when '1' => SD_rdOK <= '1'after 150 ns;
            when others => SD_rdOK <= '0';
        end case;
end process;

process(SD_refEn)
    begin
        case SD_refEn is
            when '1' => SD_refOK <= '1'after 120 ns; 
						
            when others => SD_refOK <= '0';
							
        end case;
end process;	

process(SD_wrEn)
    begin
        case SD_wrEn is
            when '1' => SD_wrOK <= '1'after 150 ns;
            when others => SD_wrOK <= '0';
        end case;
end process;		

process
	begin
	Fifo_Wafull <= '0';	
	wait for 303 us;	
	wait for 15 ns *32;
	Fifo_Wafull <= '1';
	wait for 30 ns;
	Fifo_Wafull <= '0';
	wait for 15 ns *32;
	Fifo_Wafull <= '1';
	wait for 30 ns;
	Fifo_Wafull <= '0';
	wait for 15 ns *32;
	Fifo_Wafull <= '1';
	wait for 30 ns;
	Fifo_Wafull <= '0';
	
end process;

end arch;
		