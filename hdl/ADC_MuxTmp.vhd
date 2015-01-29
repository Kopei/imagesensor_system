-- ADC_MuxTmp.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity ADC_MuxTmp is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			dataIn		:in		std_logic_vector(13 downto 0);
			ADC_en		:in		std_logic;
            DataOut		:out	std_logic_vector(55 downto 0)
           
		);
end entity;

architecture behavioral of ADC_MuxTmp is 
	signal ChSel	:std_logic_vector(1 downto 0);
begin
	--ChSel Gen
	process(Sysclk,rst_n)
	begin
		if(rst_n = '0') then
			ChSel <= "00";
		elsif rising_edge(sysclk) then
			if (ADC_en = '0') then
				ChSel <= "00";
			else
				ChSel <= ChSel + 1;
			end if;
		end if;
	end process;
	
	--Mux Gen 
	process(Sysclk,rst_n)
	begin
		if(rst_n = '0') then
			DataOut <= (others => '0');
		elsif rising_edge(sysclk) then
			case ChSel is
				when "00" =>
					DataOut(13 downto 0) <= dataIn;
				when "01" =>
					DataOut(27 downto 14) <= dataIn;
				when "10" =>
					DataOut(41 downto 28) <= dataIn;
				when "11" =>
					DataOut(55 downto 42) <= dataIn;
				when others =>
					DataOut <= (others => '1');
			end case;
		end if;
	end process;	
	
end behavioral;