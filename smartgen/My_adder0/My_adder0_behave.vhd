-- ****************************************************
-- Created by: ACTgen 9.1.0.18
-- Date : Fri Jan 31 13:25:02 2014 
-- Parameters:
--   WIDTH:18
--   REPRESENTATION:UNSIGNED
--   CI_POLARITY:2
--   CO_POLARITY:2
-- ****************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity My_adder0_behave is

  port(DataA, DataB : in STD_LOGIC_VECTOR(17 downto 0);
       Sum : out STD_LOGIC_VECTOR(17 downto 0));

end My_adder0_behave ; 

architecture behavioral of My_adder0_behave is
    signal DataA_in, DataB_in : UNSIGNED(17 downto 0);
    signal sumAux : UNSIGNED(17 downto 0);
begin
   DataA_in <= UNSIGNED(DataA);
   DataB_in <= UNSIGNED(DataB);
  process (DataA_in, DataB_in)
  begin

    sumAux <= DataA_in + DataB_in;

  end process;

    Sum <= STD_LOGIC_VECTOR(sumAux(17 downto 0));

end behavioral;
