-- Counter_ref.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Counter_ref is

    port( 	
			Sysclk 		: in    std_logic;
			SD_RefEn  	: in    std_logic;
			sysrst_n	: in	std_logic;	
			Lvds_en		: in    std_logic;
			ByterdEn	: in	std_logic;
			RefEn	 	: out   std_logic
        );

end Counter_ref;

architecture DEF_ARCH of Counter_ref is 
component Cnt4Ref is

    port( Aclr   : in    std_logic;
          Clock  : in    std_logic;
          Q      : out   std_logic_vector(5 downto 0);
          Enable : in    std_logic
        );

end component;
signal CntEn	:	std_logic;	
signal CntNum	:	std_logic_vector(5 downto 0);
constant RefTime_78125	:	std_logic_vector(5 downto 0) := "111000";

begin
process(sysclk, sysrst_n)
	begin
		if sysrst_n = '0'then
			CntEn <= '0';
		elsif rising_edge(sysclk)then
			if( lvds_en = '1' and byterdEn = '0')then 
				CntEn  <= '1';
			else 
				CntEn  <= '0';	
			end if;
		end if;
end process;		
CntMap: Cnt4Ref port map
		(
		Aclr   =>	SD_refEn,
        Clock  =>	Sysclk,
        Q      =>	CntNum,
        Enable =>	CntEn
		);
	refEn <= '1' when CntNum >= RefTime_78125 else '0';
end DEF_ARCH;	