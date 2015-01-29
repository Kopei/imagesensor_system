-- Sdram_top.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity Sdram_top is     
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
			SDoneFrameOk:out	std_logic;
            ras_n,cas_n,we_n:out std_logic;
            cke,cs_n	:out 	std_logic_vector(1 downto 0);
            dqm			:out 	std_logic_vector(7 downto 0);
            addr		:out 	std_logic_vector(12 downto 0);
            ba 			:out 	std_logic_vector(1 downto 0)
			);
end entity;

architecture behavioral of Sdram_top is 
-- component Pll4SDram is 
    -- port(
		-- POWERDOWN, CLKA : in std_logic; 
		-- LOCK, GLA, GLB : out 
        -- std_logic
		-- ) ;
-- end component;

component Sdram_ctl_v2 is 
		  port
			(
			Sysclk		:in 	std_logic;
            SysRst_n	:in 	std_logic;
			Fifo_RAfull	:in		std_logic;
			--Fifo_aempty	:in		std_logic;
			Fifo_Wafull	:in		std_logic;
			SD_iniOK	:in		std_logic;
			SD_WrOK		:in		std_logic;
			SD_RdOK		:in		std_logic;
			SD_refOK	:in		std_logic;
			LVDS_En		:in		std_logic;
			SDRAM_En	:in		std_logic;
			SD_pdEN		:out	std_logic;
			SD_iniEn	:out	std_logic;
			SD_RefEn	:out	std_logic;
			SD_wrEn		:out	std_logic;
			SD_rdEn		:out	std_logic;
			SD_rdEN_noact	:out	std_logic;
			ClkEN		:out		std_logic
    );
end component;

component Sdram_ini is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_iniEN	:in		std_logic;
			Sd_iniOK	:out	std_logic;
            ini_state	:out	std_logic_vector(2 downto 0)       
		);
end component;		

component SDRAM_Ref is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_refEN	:in		std_logic;
			SD_pdEN		:in		std_logic;
			SD_iniOK	:in		std_logic;
			SD_refOK	:out	std_logic;
			Ref_state	:out	std_logic_vector(2 downto 0)
		);
end component;

component sdram_wr is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_wrEn		:in		std_logic;
			SD_WrOK		:out	std_logic;
			wr_state	:out	std_logic_vector(2 downto 0)
		);
end component;

component SDram_rd is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_rdEN		:in		std_logic;
			SD_RdOK		:out	std_logic;
			SD_rdEN_noact:in	std_logic;
			row_end		:in		std_logic;
			rd_state	:out	std_logic_vector(2 downto 0)
		);
end component;

component Sdram_cmd is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			ini_state	:in		std_logic_vector(2 downto 0);
			rd_state	:in		std_logic_vector(2 downto 0);
			wr_state	:in		std_logic_vector(2 downto 0);
			ref_state	:in		std_logic_vector(2 downto 0);
			ClkEN		:in		std_logic;
			GLB			:in		std_logic;
			row_end		:out	std_logic;
            SDoneFrameOk:out 	std_logic;
			Lvds_en		:in		std_logic;
			Sdram_en	:in		std_logic;
            ras_n,cas_n,we_n:out std_logic;
            cke,cs_n	:	out std_logic_vector(1 downto 0);
			SD_Clk		:	out std_logic_vector(1 downto 0);
            dqm			:	out std_logic_vector(7 downto 0);
            addr		:	out std_logic_vector(12 downto 0);
            ba 			: 	out std_logic_vector(1 downto 0);
			RFifo_we	:	out	std_logic;
			WFifo_re	:	out	std_logic
           
		);
end component;

component Sdram_data is     
		port
		(
			Sysclk 		:in 	std_logic;
            Sysrst_n	:in 	std_logic;
			rd_state	:in		std_logic_vector(2 downto 0);
			wr_state	:in		std_logic_vector(2 downto 0);
			Sys_dataIn	:in		std_logic_vector(71 downto 0);
			Sdram_data	:inout	std_logic_vector(71 downto 0);
			--dqm			:out 	std_logic_vector(7 downto 0);
			Sys_dataOut	:out	std_logic_vector(71 downto 0)
		);
end component;


--signal	Dly4SD_Clk_Sig:	std_logic;
signal	SD_iniOK	:	std_logic;
signal	SD_WrOK		:	std_logic;
signal	SD_RdOK		:	std_logic;
signal	SD_refOK	:	std_logic;
signal	SD_iniEn	:	std_logic;
signal	SD_RefEn	:	std_logic;
signal	SD_wrEn		:	std_logic;
signal	SD_rdEN_noact:	std_logic;
signal	SD_rdEn		:	std_logic;
signal	ClkEN		:	std_logic;
signal	row_end		:	std_logic;
signal	SD_pdEn		:	std_logic;
signal	ini_state	:	std_logic_vector(2 downto 0);
signal	Ref_state	:	std_logic_vector(2 downto 0);
signal	wr_state	:	std_logic_vector(2 downto 0);
signal	rd_state	:	std_logic_vector(2 downto 0);
begin
u1: Sdram_ctl_v2 port map
		(
		Sysclk		=> 	Sysclk,	
		SysRst_n	=>	SysRst_n,
		Fifo_RAfull	=>	Fifo_RAfull,
		Fifo_Wafull	=>	Fifo_Wafull,
		SD_iniOK	=>	SD_iniOK,
		SD_WrOK		=>	SD_WrOK,
		SD_RdOK		=>	SD_RdOK,
		SD_refOK	=>	SD_refOK,
		SDRAM_En	=>	SDRAM_En,
		SD_iniEn	=>	SD_iniEn,
		SD_RefEn	=>	SD_RefEn,
		SD_wrEn		=>	SD_wrEn,
		SD_rdEn		=>	SD_rdEn,
		SD_rdEN_noact=>	SD_rdEN_noact,
		ClkEN		=>	ClkEN,
		SD_pdEN 	=>  SD_pdEN,
		lvds_en	 	=>	lvds_en
	--	RFifo_we	=>	RFifo_we,	
	--	WFifo_re	=>	WFifo_re
		);
u2: Sdram_ini port map
		(
		Sysclk		=>	Sysclk, 		
		rst_n		=>	Sysrst_n,
		SD_iniEN	=>	SD_iniEN,
		Sd_iniOK	=>	SD_iniOK,
		ini_state	=>	ini_state
		);
U3:	SDRAM_Ref port map
		(
		Sysclk		=>	Sysclk,		
        rst_n		=>	Sysrst_n,
		SD_refEN	=>	SD_refEN,
		SD_iniOK	=>  SD_iniOK,
		SD_pdEN  	=>  SD_pdEN,
		SD_refOK	=>	SD_refOK,
		Ref_state	=>	Ref_state
		);
U4:	sdram_wr port map
		(
		Sysclk		=>	Sysclk, 		
		rst_n		=>	Sysrst_n,
		SD_wrEn		=>	SD_wrEn,
		SD_WrOK		=>	SD_WrOK,
		wr_state	=>	wr_state
		);
U5:	SDram_rd port map
		(
		Sysclk		=>	Sysclk, 		
        rst_n		=>	Sysrst_n,
		SD_rdEN		=>	SD_rdEN,
		SD_RdOK		=>	SD_RdOK,
		row_end	 	=> 	row_end,
		SD_rdEN_noact=> SD_rdEN_noact,
		rd_state	=>	rd_state
		);
U6:	Sdram_cmd port map
		(
		Sysclk		=>	Sysclk, 		
		rst_n		=>	Sysrst_n,
		ini_state	=>	ini_state,
		rd_state	=>	rd_state,
		wr_state	=>	wr_state,
		ref_state	=>	ref_state,
		ClkEN		=>	ClkEN,
		ras_n		=>	ras_n,
		cas_n		=>	cas_n,
		we_n		=>	we_n,
		cke			=>	cke,
		cs_n		=>	cs_n,
		SD_clk		=> 	SD_clk,
		dqm			=>	dqm,
		GLB			=>  GLB,
		lvds_en		=> lvds_en,
		sdram_en    => sdram_en,
		row_end	 	=> 	row_end,
		addr		=>	addr,
		ba 			=>	ba,
		SDoneFrameOk => SDoneFrameOk,
		RFifo_we 	=> RFifo_we,
		WFifo_re	=> WFifo_re
		);
U7:	Sdram_data port map
		(	
		Sysclk		=>	Sysclk, 		
		Sysrst_n	=>	SYsrst_n,
		rd_state	=>	rd_state,
		wr_state	=>	wr_state,
		Sys_dataIn	=>	Sys_dataIn,
		Sdram_data	=> 	DQ,
		Sys_dataOut	=>	Sys_dataOut
		);
-- U8:	Pll4SDram port map 
		-- (
		-- POWERDOWN	=> '1',
		-- CLKA => ex_clk,
		-- LOCK =>	Sysrst_n,
		-- GLA =>	Sysclk,
		-- GLB =>	GLB
		-- );	
end behavioral;		