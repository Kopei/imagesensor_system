-- Sdram_data.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity Sdram_data is     
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
end entity;

architecture behavioral of Sdram_data is 
-- signal	test_data	:	std_logic_vector(71 downto 0);
-- signal	cnt			:	std_logic_vector(2 downto 0);
begin
	
	Sdram_data <= Sys_dataIn when ( wr_state = "100") else (others =>'Z');
----------------------------------------------------------------------------
--consider large fanout, limit to 18
----------------------------------------------------------------------------	
	process(Sysclk,Sysrst_n)
		begin
			if (SysRst_n = '0')then
				Sys_dataOut <= (others => '0');
				--test_data <= (others => '0');
			elsif rising_edge(Sysclk)then
				case rd_state is 
					when "101" => Sys_dataOut <= Sdram_data;--test_data;--Sdram_data;--;
					-- when "100" => test_data <= test_data + 1;
								 -- test_data <= test_data + 1;	--Sdram_data;---- -- 
					when others => null;
					
				end case;
				-- if rd_state = "101" then
					-- test_data <= test_data + 1;
				-- end if;	
			end if;
	end process;	
	-- process(sysclk,sysrst_n)
		-- begin
			-- if (SysRst_n = '0')then
				-- test_data <= (others => '0');
				-- cnt <= (others => '0');
			-- elsif rising_edge(sysclk)then
				-- if (cnt = "111")then
					-- cnt <= "000";
					-- test_data <= (others => '0');
				-- else
					-- cnt <= cnt + 1;
					-- test_data <= test_data + 1;
				-- end if;
			-- end if;
	-- end process;			
	-- process(Sysclk,Sysrst_n)
		-- begin
			-- if (SysRst_n = '0')then
				-- Sys_dataOut(35 downto 18) <= (others => '0');
			-- elsif rising_edge(Sysclk)then
				-- case rd_state is 
					-- when "101" => Sys_dataOut(35 downto 18) <= Sdram_data(35 downto 18);
					-- when others => null;
				-- end case;
				-- case wr_state is
					-- when "100" => Sdram_data(35 downto 18) <= Sys_dataIn(35 downto 18);
					-- when others => Sdram_data(35 downto 18) <= (others =>'Z');
				-- end case;
			-- end if;
	-- end process;	
	-- process(Sysclk,Sysrst_n)
		-- begin
			-- if (SysRst_n = '0')then
				-- Sys_dataOut(53 downto 36) <= (others => '0');
			-- elsif rising_edge(Sysclk)then
				-- case rd_state is 
					-- when "101" => Sys_dataOut(53 downto 36) <= Sdram_data(53 downto 36); 
					-- when others => null;
				-- end case;
				-- case wr_state is
					-- when "100" => Sdram_data(53 downto 36) <= Sys_dataIn(53 downto 36);
					-- when others => Sdram_data(53 downto 36) <= (others =>'Z');
				-- end case;
			-- end if;
	-- end process;	
	-- process(Sysclk,Sysrst_n)
		-- begin
			-- if (SysRst_n = '0')then
				-- Sys_dataOut(71 downto 54) <= (others => '0');
			-- elsif rising_edge(Sysclk)then
				-- case rd_state is 
					-- when "101" => Sys_dataOut(71 downto 54) <= Sdram_data(71 downto 54); 
					-- when others => null;
				-- end case;
				-- case wr_state is
					-- when "100" => Sdram_data(71 downto 54) <= Sys_dataIn(71 downto 54);
					-- when others => Sdram_data(71 downto 54) <= (others =>'Z');
				-- end case;
			-- end if;
	-- end process;	
end behavioral;