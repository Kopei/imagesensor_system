-- SDram_rd.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SDram_rd is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_rdEN		:in		std_logic;
			SD_rdEN_noact:in	std_logic;
			row_end		:in		std_logic;
			SD_RdOK		:out	std_logic;
			rd_state	:out	std_logic_vector(2 downto 0)
		);
end entity;

architecture behavioral of SDram_rd is 
type state is (rd_idle, rd_act, rd_rd, rd_wait,rd_process,rd_judge,rd_pre,rd_wait_act);
signal 		pr_state, nx_state	 	:		state;
signal 		temp					:		std_logic_vector(2 downto 0);
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


process(pr_state,SD_rdEN_noact,row_end) 
begin
    case pr_state is
        when rd_idle =>
			if SD_rdEN_noact = '1' and row_end = '1'then --deal with different row addr with rd and wr
				nx_state <= rd_pre;
			elsif ( row_end = '1')then
				nx_state <= rd_pre;			
			elsif(SD_rdEN_noact = '1')then
				nx_state <= rd_judge;
			else 
				nx_state <= rd_act; 
			end if;	
		when rd_pre => 
			nx_state <= rd_wait_act;
		when rd_wait_act =>
			nx_state <= rd_act;
		when rd_act =>
			nx_state <= rd_wait;
		when rd_judge =>
			nx_state <= rd_rd;
		when rd_wait =>
			nx_state <= rd_rd;
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
			when rd_judge => 
				rd_state <= "001";	
			when rd_pre => 
				rd_state <= "110";
			when rd_wait_act => 
				rd_state <= "111";
			when rd_act =>
				rd_state <= "010";
			when rd_wait =>
				rd_state <= "011"; --
			when rd_rd =>
				rd_state <= "100"; 	
			when rd_process =>
				rd_state <= "101";				
				if (temp = "110") then
					rd_ok <= '1';			
				else temp <= temp + 1;	
				end if;
			when others => null;	
		end case;					
	end if;
end process;
	SD_RdOK <= rd_ok;
end behavioral;