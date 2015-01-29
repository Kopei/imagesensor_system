-- test.vhd
library ieee;
use ieee.std_logic_1164.all;
entity dfm_sync_preset is
PORT (d0, d1: in std_logic;
clk, preset, sel: in std_logic;
q: out std_logic);
end dfm_sync_preset;
architecture behav of dfm_sync_preset is

begin
process (clk,preset) begin
	if preset = '1' then 
		q <= '1';
	elsif (clk'event and clk ='1') then
		if sel = '1' then
			q <= d0;
		else
			q <= d1;
		end if;
	end if;	
end process;

end behav;