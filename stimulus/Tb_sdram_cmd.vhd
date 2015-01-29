-- Tb_sdram_cmd.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity Tb_sdram_cmd is
end entity;
     
architecture ARCH of  Tb_sdram_cmd is
component sdram_cmd is port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			ini_state	:in		std_logic_vector(2 downto 0);
			rd_state	:in		std_logic_vector(2 downto 0);
			wr_state	:in		std_logic_vector(2 downto 0);
			ref_state	:in		std_logic_vector(2 downto 0);
			ClkEN		:in		std_logic;
			GLB			:in		std_logic;
			rdrow_end	:out	std_logic;
			wrrow_end	:out	std_logic;
			lvds_en		:in		std_logic;
			Sdram_en	:in		std_logic;
            ras_n,cas_n,we_n:out std_logic;
			SDoneFrameOk:	out	std_logic;
            cke,cs_n	:	out std_logic_vector(1 downto 0);
			SD_Clk		:	out std_logic_vector(1 downto 0);
            dqm			:	out std_logic_vector(7 downto 0);
            addr		:	out std_logic_vector(12 downto 0);
            ba 			: 	out std_logic_vector(1 downto 0);
            RFifo_we	:	out	std_logic;
			WFifo_re	:	out	std_logic
           
		);
end component;

signal  	Sysclk 		: 	std_logic;
signal		rst_n		: 	std_logic;
signal		ini_state	:		std_logic_vector(2 downto 0);
signal		rd_state	:		std_logic_vector(2 downto 0);
signal		wr_state	:		std_logic_vector(2 downto 0);
signal		ref_state	:		std_logic_vector(2 downto 0);
signal		ClkEN		:		std_logic;
signal		GLB			:		std_logic;
signal		ras_n,cas_n,we_n:	std_logic;
signal		cke,cs_n	:	 std_logic_vector(1 downto 0);
signal		SD_Clk		:	 std_logic_vector(1 downto 0);
signal		dqm			:	 std_logic_vector(7 downto 0);
signal		addr		:	 std_logic_vector(12 downto 0);
signal		ba 			: 	 std_logic_vector(1 downto 0);
signal		WFifo_re,RFifo_we : std_logic;
signal		rdrow_end	:		std_logic;
signal		wrrow_end	:		std_logic;
signal		lvds_en		:		std_logic;
signal		Sdram_en	:		std_logic;
signal		SDoneFrameOk:		std_logic;
begin
uut: 	sdram_cmd port map
		(
		Sysclk => Sysclk,
		rst_n => rst_n,
		ini_state => ini_state,
		rd_state =>	rd_state,		
		wr_state =>	wr_state,	
		ref_state => ref_state,	
		ClkEN => ClkEN,		
		ras_n => ras_n,
		cas_n => cas_n,
		we_n => we_n,
		cke => cke,
		cs_n => cs_n,	
		SD_Clk => SD_Clk,
		GLB => Glb,		
		Lvds_en => lvds_en,
		sdram_en => sdram_en,
		SDoneFrameOk => SDoneFrameOk,
		rdrow_end => rdrow_end,
		wrrow_end => wrrow_end,
		dqm	=> dqm,		
		addr => addr,
		ba => ba,
		WFifo_re => WFifo_re,
		RFifo_we => RFifo_we
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
		rst_n <= '0';
		wait for 0.6 us;
		rst_n <= '1';
		wait;
end process;		

process
	begin
		ini_state <=  (others => '0');
		rd_state <=	 (others => '0');
		wr_state <=	 (others => '0');
		ref_state <=  (others => '0');
		ClkEN <= '0';
		wait for 10 us;
		ClkEN <= '1';
		wait for 100 ns;
		ini_state <= "001";
		wait for 15.15 ns;
		ini_state <= "010";
		wait for 15.15 ns ;
		ini_state <= "011";
		wait for 15.15 ns;
		ini_state <= "100";
		wait for 15.15 ns ;
		ini_state <= "101";
		wait for 15.15 ns;
		ini_state <= "000";
		wait for 500 ns;
		rd_state <=	"001";
		wait for 15.15 ns;
		rd_state <=	"010";
		wait for 15.15 ns;
		rd_state <=	"011";
		wait for 15.15 ns;
		rd_state <=	"100";
		wait for 15.15 ns;
		rd_state <= "000";
		wait for 500 ns;
		ref_state <= "001";
		wait for 15.15 ns;
		ref_state <= "010";
		wait for 15.15 ns;
		ref_state <= "011";
		wait for 15.15 ns;
		ref_state <= "100";
		wait for 200 ns;
		ref_state <= "000";
		wait for 500 ns;
		wr_state <= "001";
		wait for 15.15 ns;
		wr_state <= "010";
		wait for 15.15 ns;
		wr_state <= "011";
		wait for 15.15 ns;
		wr_state <= "100";
		wait for 200 ns;
		wr_state <= "000";
end process;
		
-- process 
	-- begin
		-- lvds_en  <=  '0';
		-- wait for 1623700428.5 ns;
		-- wait for 1623700428.5 ns;
		-- lvds_en  <=  '1';
		-- wait for 1 ms;
-- end process;		
end arch;		