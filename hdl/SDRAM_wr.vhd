-- SDRAM_wr.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SDRAM_wr is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_wrEn		:in		std_logic;
			SD_WrOK		:out	std_logic;
			WrRow_end	:in		std_logic;
			wr_state	:out	std_logic_vector(2 downto 0)
		);
end entity;

architecture behavioral of SDRAM_wr is 
type state is (wr_idle, wr_act, wr_wr, wr_wait,wr_process,wr_pre,wr_wait_act);
signal pr_state, nx_state	 :	state;
signal 	temp					:		std_logic_vector(2 downto 0);
signal	wr_ok					:		std_logic;

begin
process(Sysclk, rst_n) begin
    if(rst_n='0') then
        pr_state <= wr_idle;
    elsif(Sysclk'event and Sysclk='1') then		
		if SD_wrEn = '1' then
			pr_state <= nx_state;
		else 
			pr_state <= wr_idle;
		end if;	
	end if;
end process;


process(pr_state,WrRow_end) 
begin
    case pr_state is
        when wr_idle =>
			if WrRow_end = '1' then
				nx_state <= wr_pre;
			else	
				nx_state <= wr_act;	
			end if;
		when wr_pre  => 
			nx_state <= wr_wait_act;
		when wr_wait_act => 
			nx_state <= wr_act;
		when wr_act =>
			nx_state <= wr_wait;
		when wr_wait =>
			nx_state <= wr_wr;
		when wr_wr =>
			nx_state <= wr_process;
		when wr_process =>
			nx_state <= wr_process;
			
	end case;
end process;

process(Sysclk,rst_n) begin
	if  rst_n = '0' then
		wr_state <= "000"; 				
		temp <= "000";	
		wr_ok <= '0';		
	elsif rising_edge(SysClk) then	
		temp <= "000";
		wr_ok <= '0';	
		case Pr_State is
			when wr_idle =>
				wr_state <= "000"; 
			when wr_pre => 
				wr_state <= "101";
			when wr_wait_act => 
				wr_state <= "110";
			when wr_act =>
				wr_state <= "001";
			when wr_wait =>
				wr_state <= "010"; --
			when wr_wr =>
				wr_state <= "011";				
			when wr_process =>
				wr_state <= "100";
				if (temp >= "100") then
					wr_ok <= '1';			
				else temp <= temp + 1;	
				end if;
			when others => null;
				
		end case;					
	end if;
end process;
SD_WrOK <= wr_ok;
-- counter: process (sysclk,rst_n)
			-- if  rst_n = '0' then
				-- temp <= "0000";
				-- wr_ok <= '0';
			-- elsif rising_edge(Sysclk) then
				 -- temp <= temp+1;  
			-- if (temp >= "0111") then --
				-- wr_ok <= '1';	
			-- end if;
		-- end if; 
		-- end process;	
end behavioral;