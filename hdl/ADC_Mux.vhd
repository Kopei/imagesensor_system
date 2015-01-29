-- ADC_Mux.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity ADC_Mux is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			dataIn		:in		std_logic_vector(13 downto 0);
			ADC_en		:in		std_logic;
            DataOut		:out	std_logic_vector(71 downto 0)
           
		);
end entity;

architecture behavioral of ADC_Mux is 
signal msb, lsb		:	integer;
begin
process (sysclk,rst_n)
	begin
		if (rst_N = '0') then
			dataout <= (others => '0');
			msb <= 13;
			lsb <= 0;
		elsif rising_edge(sysclk) then
			msb <= 13;
			lsb <= 0;
			if (adc_en = '1')then
				dataout (msb downto lsb) <= datain;
				if (msb = 67) then
					msb <= 13;
					lsb <= 0;
				else	
					lsb <= lsb + 18 ;
					msb <= msb + 18 ;
				end if;
				
			end if;
		end if;	

end process;


end behavioral;