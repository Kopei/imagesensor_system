-- TB_my_add3.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY TB_my_add3 IS
END entity;
 
ARCHITECTURE behavior OF TB_my_add3 IS 
component My_Adder3 is 
    port( DataA : in std_logic_vector(17 downto 0); DataB : in 
        std_logic_vector(17 downto 0); Sum : out 
        std_logic_vector(17 downto 0)) ;
end component;

signal dataA	:	std_logic_vector(17 downto 0);
signal dataB	:	std_logic_vector(17 downto 0);
signal	sum		:	std_logic_vector(17 downto 0);

begin
uut: My_Adder3 port map (
						dataA => dataA,
						dataB => dataB,
						sum	  => sum
						);
process
begin
dataA <= (others => '1');
wait for 15 ns;
DataB <= (8 => '0',others => '1');
wait;
end process;
end behavior;
						