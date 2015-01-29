-- Sdram_ctl.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity Sdram_ctl is     
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
			LVDS_En		:in		std_logic;
			SDRAM_En	:in		std_logic;
			SD_iniEn	:out	std_logic;
			SD_RefEn	:out	std_logic;
			SD_wrEn		:out	std_logic;
			SD_rdEn		:out	std_logic;
			SD_rdEN_noact	:out	std_logic;
			ClkEN		:out		std_logic
		--	RFifo_we	:out	std_logic;
		--	WFifo_re	:out	std_logic
			-- dataRfifo	:out	std_logic_vector(71 downto 0);
			-- dataWfifo	:in		std_logic_vector(71 downto 0)

    );
end entity;

architecture ARCH of Sdram_ctl is
signal	temp	:		std_logic_vector(11 downto 0);	
signal	PowerOK	:		std_logic;
type state is (SD_ini, SD_PreRd,SD_rd, SD_wr, SD_ref, SD_idle,SD_wait,SD_wait_wr,SD_wait_rd);
signal pr_state, nx_state	 :	state;

begin
ClkEN <= powerOk;
process(SysRst_n,SysClk) 
begin
	if SysRst_n = '0' then
		Pr_State <= SD_idle;
	elsif rising_edge(SysClk) then
		Pr_State <= Nx_State;
	end if;
end process;

process(Pr_State,PowerOK,SDRAM_En,Fifo_Wafull,SD_iniOK,SD_WrOK,SD_RdOK,SD_refOK,Fifo_RAfull,LVDS_en) 
begin
	case pr_state is
		when SD_idle =>
			if PowerOK = '1' then
				nx_state <= SD_ini;
			else 
				nx_state <= SD_idle;
			end if;
		when SD_ini =>
			if (SD_iniOK = '1') then
				nx_state <= SD_wait;
			else
				nx_state <= SD_ini;
			end if;
		when SD_wait =>		
			if ( SDRAM_En = '1' and Fifo_RAfull = '0') then
				nx_state <= SD_PreRd;
			else	
				nx_state <= SD_wait;
			end if;		
		when SD_PreRd =>
			if ( SDRAM_En = '1' and SD_rdOk = '1') then
				nx_state <= SD_wait_rd;
			elsif(LVDS_en ='1' and sd_rdok ='1')then
				nx_state  <= sd_ref;
			else
				nx_state <= SD_PreRd;
			end if;		
		when SD_wait_rd =>
			nx_state <= sd_rd;
		when SD_rd =>
			if (SDRAM_En = '1' and SD_rdOk = '1') then
				nx_state <= SD_ref;					
			else	
				nx_state <= SD_rd;
			end if;
		when SD_ref =>
			if (SDRAM_En = '1' and SD_refOK = '1') then
				nx_state <= SD_wait_wr;
			elsif(LVDS_en ='1' and SD_refOK = '1')then
				nx_state <= sd_prerd;
			else	
				nx_state <= SD_ref;
			end if;
		when SD_wait_wr =>
			if (SDRAM_En = '1' and Fifo_WAfull ='1') then
				nx_state <= SD_wr;
			elsif(LVDS_en ='1') then 
				nx_state <= sd_prerd;
			else
				nx_state <= SD_wait_wr;
			end if;
		when SD_wr =>
			if (SDRAM_En = '1' and SD_wrOk = '1') then
				nx_state <= SD_rd;
			else 
				nx_state <= SD_wr;
			end if;
	end case;
end process;

process(SysRst_n,SysClk) 
begin
	 if SysRst_n = '0' then
		SD_iniEn <= '0';
		SD_RefEn <= '0';			
		SD_wrEn	<= '0';	
		SD_rdEn	<= '0';	
		SD_rdEN_noact <= '0';
	--	WFifo_re	<= '0';
	
	 elsif rising_edge(SysClk) then			
		SD_iniEn <= '0';
		SD_RefEn <= '0';			
		SD_wrEn	<= '0';	
		SD_rdEn	<= '0';
		SD_rdEN_noact <= '0';		
		 case Pr_State is
			 when sd_idle =>
				null;
			 when SD_ini =>
				SD_iniEN <= '1';
			 when SD_PreRd =>
				SD_rdEN <= '1';
			 when SD_wait =>
				null;
			when SD_wait_rd =>
				null;
			 when SD_ref =>
				SD_refEN <= '1';
			 when SD_rd =>
				SD_rdEN_noact <= '1';
				SD_rdEN <= '1';
			 when SD_wait_wr =>
				null;
			 when SD_wr =>
				SD_wrEn <= '1';
		 end case;					
	 end if;
 end process;
	
counter1: process(Sysclk,Sysrst_n) begin
         if	(SysRst_n	=	'0') then
            temp	<=	(others => '0');	---Sysclk delay part below
            PowerOK	<=	'0';
        elsif rising_edge(Sysclk) then
            temp <= temp + 1;  
			if (temp >= "110011100100") then --3300 clocks*15ns=50us
				PowerOK	<=	'1';	
			end if;
		end if; 
		end process;	
end Arch;	