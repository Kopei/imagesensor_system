-- Sdram_rd_noact.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Sdram_rd_noact is     
		port
		(
		Sysclk 		:in 	std_logic;
		rst_n		:in 	std_logic;
		SD_rdEN		:in		std_logic;
		SD_RdOK		:out	std_logic;
		rd_state	:out	std_logic_vector(1 downto 0)
		);
end entity;

architecture behavioral of Sdram_rd_noact is 
type state is (rd_idle, rd_rd, rd_process);
signal 		pr_state, nx_state	 	:		state;
signal 		temp					:		std_logic_vector(3 downto 0);
signal		rd_ok					:		std_logic;

begin
process(Sysclk, rst_n) begin
    if(rst_n='0') then
        pr_state <= rd_idle;
    elsif(Sysclk'event and Sysclk='1') then		
		if SD_rdEN = '1' then
			pr_state <= nx_state;
		else 
			pr_state <= rd_idle;
		end if;	
	end if;
end process;


process(pr_state) 
begin
    case pr_state is
        when rd_idle =>
			nx_state <= rd;	
		when rd_rd =>
			nx_state <= rd_process;
		when rd_process =>
			nx_state <= rd_process;
	end case;
end process;

process(Sysclk,rst_n) begin
	if  rst_n = '0' then
		rd_state <= "000"; 				
		temp <= (others => '0');	
		rd_ok <= '0';
		--SD_RdOK <= '0';
	elsif rising_edge(SysClk) then	
		temp <= (others => '0');	
		rd_ok <= '0';
		case Pr_State is
			when rd_idle =>
				rd_state <= "000"; 
			when rd_rd =>
				rd_state <= "011"; 	
			when rd_process =>
				rd_state <= "100";				
				if (temp = "0100") then
					rd_ok <= '1';			
				else temp <= temp + 1;	
				end if;
		end case;					
	end if;
end process;
	SD_RdOK <= rd_ok;
end behavioral;