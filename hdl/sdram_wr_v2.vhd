-- sdram_wr_v2.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sdram_wr_v2 is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_wrEn		:in		std_logic;
			SD_WrOK		:out	std_logic;
			wr_state	:out	std_logic_vector(2 downto 0)
		);
end entity;

architecture behavioral of sdram_wr_v2 is 
signal 	temp					:		std_logic_vector(1 downto 0);
signal  wr_state_cnt			:		std_logic_vector(2 downto 0);
signal	tempEN					:		std_logic;
begin
wr_state <= wr_state_cnt;
process(Sysclk, rst_n) begin
    if(rst_n='0') then
		wr_state_cnt <= "000";
		tempEN <= '0';
    elsif(Sysclk'event and Sysclk='1') then		
		if SD_wrEn = '1' then
			wr_state_cnt <= wr_state_cnt + 1;
				if (wr_state_cnt = "100") then 
					tempEN <= '1';
					wr_state_cnt <= "100";
				end if;
		else wr_state_cnt <= "000";
		end if;
	end if;
end process;

counter : process (Sysclk, rst_n) begin
	if(rst_n='0') then
		temp <= "00";
		SD_WrOK <= '0';
	elsif rising_edge(sysclk)then
		if tempEN = '1' then		
			if (temp >= "10") then
				SD_WrOK <= '1';
			else 
				temp <= temp + 1;
			end if;	
		else
			temp <= "00";	
			SD_WrOK <= '0';	
		end if;
	end if;
end process;	
end behavioral;