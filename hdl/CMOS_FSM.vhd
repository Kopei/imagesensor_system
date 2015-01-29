library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CMOS_FSM is

end CMOS_FSM;

architecture Behavioral of CMOS_FSM is
	signal	PrState,NxState	:std_logic_vector(2 downto 0);		
	constant	CMOS_Idle				:std_logic_vector(2 downto 0) := "000";
	constant	YXA_RowReadOut		:std_logic_vector(2 downto 0) := "001";
	constant	YXA_Wait				:std_logic_vector(2 downto 0) := "010";
	constant	YXA_Judge			:std_logic_vector(2 downto 0) := "011";
	constant	YXA_Ok				:std_logic_vector(2 downto 0) := "100";
begin


end Behavioral;

