-- adc_muxtmp_test.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------
entity adc_muxtmp_test is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			dataIn		:in		std_logic_vector(13 downto 0);
			ADC_en		:in		std_logic;
            DataOut		:out	std_logic_vector(55 downto 0)
           
		);
end entity;

architecture behavioral of adc_muxtmp_test is 
	signal ChSel	:std_logic_vector(1 downto 0);
	--signal	data_test	:std_logic_vector(3 downto 0);
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
			--data_test <= (others => '0');
		elsif rising_edge(sysclk) then
			-- if data_test = "1011" then
			-- data_test <= data_test + 1;
				
			case ChSel is
	
				when "00" =>
                    DataOut(12 downto 0) <= not dataIn(12 downto 0);
                    DataOut(13) <= dataIn(13);--"0000000000"&data_test;--(others => '0');------
                    --dataIn(13 downto 0);--(others => '0');--
                when "01" =>
                    -- data_test <= data_test + 1;
                    DataOut(26 downto 14) <= not dataIn(12 downto 0);
                    DataOut(27) <= dataIn(13);--"0000000000"&data_test;--"00000000000001";--------dataIn(13 downto 0);--"00000000000001";
                when "10" =>
                    -- data_test <= data_test + 1;
                    DataOut(40 downto 28) <= not dataIn(12 downto 0);
                    DataOut(41) <= dataIn(13);--"0000000000"&data_test;--"00000000000010";------
                    --dataIn(13 downto 0);--"00000000000010";--
                when "11" =>
                    --data_test <= data_test + 1;
                    DataOut(54 downto 42) <= not dataIn(12 downto 0);
                    DataOut(55) <= dataIn(13);--"0000000000"&data_test;--"00000000000011";--------dataIn(13
                when others =>
                    DataOut <= (others => '0');
			-- if data_test = "1011" then
				-- data_test <= "0000";
			-- else 
				-- data_test <= data_test + 1;
			end case;	
			-- end if;--	data_test <= data_test + 1;
		end if;
	end process;	
	
end behavioral;