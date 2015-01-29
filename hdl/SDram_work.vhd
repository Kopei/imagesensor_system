-- SDram_work.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity Sdram_work is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_rdEN		:in		std_logic;
			SD_wrEN		:in		std_logic;
			SD_refEN	:in		std_logic;
			
			work_state	:out	std_logic_vector(3 downto 0)
		);
end entity;

architecture behavioral of Sdram_work is 
type state is (work_idle, work_Rd, work_wr, work_ref);
signal pr_state, nx_state	 :	state;

begin
process(Sysclk, rst_n) begin
    if(rst_n='0') then
        pr_state <= work_idle;
    elsif(Sysclk'event and Sysclk='1') then		
		pr_state <= nx_state;
	end if;
end process;


process(pr_state,SD_rdEn,SD_wrEN,SD_refEn) begin
    case pr_state is
        when work_idle =>
            if(SD_rdEn = '1') then
                nx_state <= work_rd;	
			elsif (SD_refEn = '1') then
				nx_state <= work_ref;
			elsif(SD_wrEN = '1') then 
				nx_state <= work_wr;
			else
				nx_state <= work_idle;
			end if;			
		when work_rd =>
			if(SD_rdEn = '0') then
                nx_state <= work_idle;
			else
				nx_state <= work_rd;	
			end if;	
		when work_ref =>
			if(SD_refEn = '0') then
                nx_state <= work_idle;
			else
				nx_state <= work_ref;
            end if;		
		when work_wr =>
			if(SD_wrEn = '0') then
                nx_state <= work_idle;
			else
				nx_state <= work_wr;
            end if;		
	end case;
end process;

process(Sysclk,rst_n) begin
	if  rst_n = '0' then
		work_state <= "0000"; 				
					
	elsif rising_edge(SysClk) then	
		work_state <= "0000"; 
		case Pr_State is
			when work_idle =>
				work_state <= "0000"; --cs_n ='1' when idle
			when work_rd =>
				work_state <= "0001"; -- sdram rd cmd
			when work_ref =>
				work_state <= "0010"; --
			when work_wr =>
				work_state <= "0011";
		

		end case;					
	end if;
end process;






end behavioral;