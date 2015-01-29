-- ACC_ctl.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity ACC_ctl is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			Data_fifoIN	:in		std_logic_vector(71 downto 0);
			Data_AccIn	:in		std_logic_vector(71 downto 0);
			Data2ACC	:out	std_logic_vector(71 downto 0);
			Data2Fifo	:out	std_logic_vector(71 downto 0);
			fifo_rd		:out	std_logic;	
			Fifo_wr		:out	std_logic
		);
end entity;

architecture behavioral of ACC_ctl is 

begin






end behavioral;