-- SDRAM_Ref.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SDRAM_Ref is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_refEN	:in		std_logic;
			sd_pdEN		:in		std_logic;
			SD_iniOK	:in		std_logic;
			RefEn	 	:in		std_logic;
			SD_refOK	:out	std_logic;
			Ref_state	:out	std_logic_vector(2 downto 0)
		);
end entity;

architecture behavioral of SDRAM_Ref is 
type state is (Ref_idle, ref_judge,ref_pre, ref_ref, ref_wait,ref_process);
signal pr_state, nx_state		:		state;
signal temp						:		std_logic_vector(1 downto 0);
signal ref_ok_1, ref_ok_2		:		std_logic;
signal SD_refEN_cnt				:		std_logic_vector(3 downto 0);
constant ref_time				:		std_logic_vector(3 downto 0):= "0110";--@12/18 reducerefcycle@12/30reduceagain   
signal ref_str					:		std_logic;

begin
process(Sysclk, rst_n) begin
    if(rst_n = '0') then
        pr_state <= Ref_idle;
    elsif(Sysclk'event and Sysclk='1') then		
		if  SD_refEN = '1' and SD_iniOK ='1' then
			pr_state <= nx_state;
		elsif  RefEn = '1' then
			pr_state <= nx_state;
		else	
			pr_state <= Ref_idle;
		end if;	
	end if;
end process;


process(pr_state,ref_str,sd_pdEN) 
begin
    case pr_state is
        when Ref_idle =>
			nx_state <= ref_judge;	
		when ref_judge =>
			if ref_str = '1' then
				nx_state <= ref_pre;
			else 
				nx_state <= ref_judge;
			end if;		
		when ref_pre =>
			nx_state <= ref_wait;
		when ref_wait =>
			nx_state <= ref_ref;
		when ref_ref =>
			nx_state <= Ref_process;
		when ref_process =>
			if sd_pdEN = '1' then
				nx_state <= ref_judge;
			else
				nx_state <= ref_process;
			end if;	
	end case;
end process;

process(Sysclk,rst_n) begin
	if  rst_n = '0' then
		Ref_state <= "000"; 				
		temp <= "00";	
		ref_ok_2 <= '0';	
		ref_str <= '0';	
		ref_ok_1 <= '0';
		SD_refEN_cnt <= (others => '0');		
	elsif rising_edge(SysClk) then	
		temp <= "00";	
		ref_ok_2 <= '0';	
		ref_ok_1 <= '0';
		case Pr_State is
			when Ref_idle =>
				Ref_state <= "000";					
			when ref_judge =>
				if (SD_refEN_cnt = ref_time)then  --when 16 cycles reaching begin ref, else output ref_ok
					ref_str <= '1';					
				else 
					SD_refEN_cnt <= SD_refEN_cnt + 1;
					ref_ok_1 <= '1';
				end if;	
			when ref_pre =>
				SD_refEN_cnt <= (others => '0');
				ref_str <= '0';	
				Ref_state <= "001";
			when ref_wait =>
				Ref_state <= "010"; --
			when ref_ref =>
				Ref_state <= "011";	
			when ref_process =>
				ref_state <= "100";
				if (temp >= "10") then
					ref_ok_2 <= '1';			
				else temp <= temp + 1;	
				end if;
		end case;					
	end if;
end process;
SD_refOK <= ref_ok_2 or ref_ok_1;
end behavioral;