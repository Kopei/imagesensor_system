-- Sdram_ctl_v2.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity Sdram_ctl_v2 is     
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
end entity;

architecture ARCH of Sdram_ctl_v2 is
signal	temp	:		std_logic_vector(11 downto 0);	
signal	PowerOK	:		std_logic;
type state is (SD_PreRd,SD_rd, SD_wr, SD_ref, SD_idle,SD_wait_wr,SD_wait_rd,sd_wait,sd_powerdown,SD_wait_1,SD_wait_2,SD_wait_3);
signal pr_state, nx_state	 :	state;

begin
ClkEN <= powerOk;
ini:process(SysRst_n,SysClk)
begin	
	if(SysRst_n ='0') then
		SD_iniEN <= '0';
    elsif rising_edge(Sysclk) then
		if PowerOK = '1' then
			SD_iniEN <= '1';
		end if;
		if SD_iniOK = '1' then
			SD_iniEN <= '0';
		end if;
	end if;	
end process;	
	
process(SysRst_n,SysClk) 
begin
	if SysRst_n = '0' then
		Pr_State <= SD_idle;
	elsif rising_edge(SysClk) then
		if(sdram_en ='1' )then
			Pr_State <= Nx_State;
		elsif(lvds_en ='0') then
			pr_state <= sd_powerdown;
		else	
			Pr_State <= Nx_State;
	end if;
end if;	
end process;

process(Pr_State,Fifo_Wafull,SD_iniOK,SD_WrOK,SD_RdOK,SD_refOK,Fifo_RAfull,LVDS_en) 
begin
	case pr_state is
		when sd_powerdown => 
			nx_state  <= sd_idle;
		when SD_idle =>
			if SD_iniOK = '1' then
				nx_state <= SD_wait;
			else 
				nx_state <= SD_idle;
			end if;
		when SD_wait =>		
			if ( Fifo_RAfull = '0') then
				nx_state <= SD_wait_1;
			--elsif 	
			else	
				nx_state <= SD_wait;
			end if;	
		when SD_wait_1 => 
			nx_state <= SD_wait_2;
		when SD_wait_2 => 
			nx_state <= SD_wait_3;
		when SD_wait_3 => 
			nx_state <= SD_PreRd;
		when SD_PreRd =>
			if(LVDS_en ='1' and sd_rdok ='1')then
				nx_state  <= sd_ref;
			elsif (SD_rdOk = '1') then
				nx_state <= SD_wait_rd;
			else
				nx_state <= SD_PreRd;
			end if;		
		when SD_wait_rd =>
			nx_state <= sd_rd;
		when SD_rd =>
			if (SD_rdOk = '1') then
				nx_state <= SD_ref;					
			else	
				nx_state <= SD_rd;
			end if;
		when SD_ref =>
			if(LVDS_en ='1' and SD_refOK = '1')then
				nx_state <= sd_wait;
			elsif ( SD_refOK = '1') then
				nx_state <= SD_wait_wr;
			else	
				nx_state <= SD_ref;
			end if;
		when SD_wait_wr =>
			if (Fifo_WAfull ='1') then
				nx_state <= SD_wr;
			elsif(LVDS_en ='1') then 
				nx_state <= sd_prerd;
			else
				nx_state <= SD_wait_wr;
			end if;
		when SD_wr =>
			if (SD_wrOk = '1') then
				nx_state <= SD_rd;
			else 
				nx_state <= SD_wr;
			end if;
	end case;
end process;

process(SysRst_n,SysClk) 
begin
	 if SysRst_n = '0' then
		SD_RefEn <= '0';			
		SD_wrEn	<= '0';	
		SD_rdEn	<= '0';	
		SD_rdEN_noact <= '0';
		sd_pdEN <= '0';
	 elsif rising_edge(SysClk) then			
		SD_RefEn <= '0';			
		SD_wrEn	<= '0';	
		SD_rdEn	<= '0';
		SD_rdEN_noact <= '0';	
		SD_pdEN <= '0';
		 case Pr_State is
			when sd_powerdown => 
				sd_refEN <= '1';
				SD_pdEN <= '1';
			 when sd_idle =>
				sd_refEN <= '0';
				SD_pdEN <= '0';
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
			when others => 
				null;
		 end case;					
	 end if;
 end process;
	
counter1: process(Sysclk,Sysrst_n) begin
         if	(SysRst_n	=	'0') then
            temp	<=	(others => '0');	---Sysclk delay part below
            PowerOK	<=	'0';
        elsif rising_edge(Sysclk) then 
			if (temp <= "110011100100") then--3300 clocks*15ns=50us
				temp <= temp + 1; 
			else	
				PowerOK	<=	'1';	
			end if;
		end if; 
		end process;	
end Arch;	