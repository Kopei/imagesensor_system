-- Sdram_ini.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity Sdram_ini is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			SD_iniEN	:in		std_logic;
			Sd_iniOK	:out	std_logic;
            ini_state	:out	std_logic_vector(2 downto 0)
			
           
		);
end entity;

architecture behavioral of Sdram_ini is 
--初始化的常数与信号
constant initialization_timer 	:	 	std_logic_vector(14 downto 0) := "100111000100000"; --300us 等待 20000*15ns
signal counter_200				:		std_logic_vector(14 downto 0);
--初始化刷新的常数与信号
signal trc_num					:		std_logic_vector(3 downto 0);
constant trc_ini_constant		:		std_logic_vector(3 downto 0):= "1000";
signal refresh_timer			:		std_logic_vector(3 downto 0);
constant refresh_trc			:		std_logic_vector(3 downto 0):="0100";   
	
--初始化状态定义
type state_initialization is (idle,ref,mrs,pall_wait,pall,trc);
signal pr_state, nx_state: state_initialization;

begin


initial: process(Sysclk, rst_n) begin
            if(rst_n='0') then
                pr_state <= idle;
            elsif(Sysclk'event and Sysclk='1') then
				if SD_iniEN = '1' then
					pr_state <= nx_state;
				else pr_state <= idle;
				end if;
			end if;
        end process;


Initialization: process(pr_state,counter_200,trc_num,refresh_timer) begin
                    case pr_state is
                        when idle =>
                            if(counter_200 >= initialization_timer) then
                                nx_state <= pall;
                            else 
								nx_state <= idle;
                            end if;
                        when pall =>
                            nx_state <= pall_wait;
                        when pall_wait =>
                            nx_state <= ref;
                        when ref =>
                            nx_state <= trc;
                        when trc =>                
                            if (refresh_timer=refresh_trc) then
                                if trc_num=trc_ini_constant then
                                    nx_state <= mrs;
                                else 
									nx_state <= ref;
                                end if;
                            else nx_state <= trc;
                            end if;
                        when mrs =>
                            nx_state<= idle;         
                    end case;
                end process;

InitialOutput: process(Sysclk,rst_n) begin
                    if rst_n = '0' then
                        ini_state <= "000";   
						counter_200 <= (others => '0');	
						trc_num <= "0000";
						refresh_timer <="0000";	
						Sd_iniOK <= '0';						
                    elsif (Sysclk'event and Sysclk = '1')then
							refresh_timer <="0000";
							counter_200 <= (others => '0');	
                        if ( pr_state = idle ) then
                            ini_state <= "000";   
							counter_200 <= counter_200+1;
                        elsif ( pr_state = pall ) then
                            ini_state <= "001";  
                        elsif ( pr_state = pall_wait ) then
                            ini_state <= "010";   
                        elsif ( pr_state = ref )  then
                            ini_state <= "011";   
							trc_num <= trc_num + 1;
                        elsif ( pr_state = trc ) then  
                            ini_state <= "100";   
							refresh_timer <= refresh_timer +1;
                        elsif ( pr_state = mrs ) then
                            ini_state <= "101";  
							Sd_iniOK <= '1';
                        end if;
                    end if;
                  end process;

end behavioral;