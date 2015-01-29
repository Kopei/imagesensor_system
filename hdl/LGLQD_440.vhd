-- LGLQD_440.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity LGLQD_440 is port
	(
		Sysclk		:in		std_logic;
		Sysrst		:in		std_logic;
		CP			:out	std_logic
	);
end entity;

architecture behavioral of LGLQD_440 is 	
type state is (drv_idle,drv_5s, drv_phase1,drv_phase2,drv_phase3,drv_judge,drv_wait);
signal Prstate, Nxstate : 		state;
signal phase1En			:		std_logic;
signal phase2En			:		std_logic;
signal phase3En			:		std_logic;
signal CP1				:		std_logic;
signal CP3				:		std_logic;
signal cnt				:		std_logic_vector(27 downto 0);
signal cycle			:		std_logic_vector(2 downto 0);
signal Sysrst_n			:		std_logic;
signal phase1_ok,phase2_ok,phase3_ok,judge_ok,FiveMin_ok:		std_logic;
component WaveGenSingle is
	generic(
			Polarity			:std_logic	:= '0';
			DelayLen			:integer	:= 15;
			DelayCntWidth	:integer	:= 4;
			Phase1Len		:integer	:= 0;
			Phase1CntWidth	:integer	:= 1;
			Phase2Len		:integer	:= 0;
			Phase2CntWidth	:integer	:= 1;
			CycNum			:integer	:= 10;
			CycCntWidth		:integer	:= 4
			);	
	port(
			SysRst_n		:in  std_logic;
			SysClk			:in  std_logic;
			ClkEn			:in  std_logic;
			WaveGenEn		:in  std_logic;
			WFO				:out std_logic;	--WaveForm Output
			WaveRdy			:out std_logic
		);
end component;

begin
	process(prstate,phase1_ok,phase2_ok,phase3_ok,judge_ok,FiveMin_ok)
		begin
			case prstate is
			when drv_idle => 
				nxstate <= drv_5s;
			when drv_5s => 
				if FiveMin_ok ='1' then
					nxstate <= drv_phase1;
				else 
					nxstate <= drv_5s;
				end if;	
			when drv_phase1 => 
				if (phase1_ok = '1')then
					nxstate <= drv_phase2;
				else
					nxstate <= drv_phase1;
				end if;
			when drv_phase2 => 
				if (phase2_ok = '1')then
					nxstate <= drv_judge;
				else
					nxstate <= drv_phase2;
				end if;
			when drv_judge => 
				nxstate <= drv_wait;
			when drv_wait  => 
				if judge_ok ='1' then
					nxstate <= drv_phase3;
				else
					nxstate <= drv_phase1;
				end if;				
			when drv_phase3 => 
				if (phase3_ok = '1')then
					nxstate <= drv_idle;
				else
					nxstate <= drv_phase3;
				end if;
			end case;
	end process;		
	process(Sysclk, sysrst)
		begin
			if(sysrst = '1')then
				prstate <= drv_idle;
			elsif rising_edge(sysclk)then
				prstate <= nxstate;
			end if;
	end process;
	process(Sysclk, sysrst)
		begin
			if(sysrst = '1')then
				phase1En <= '0';
				phase2En <= '0';
				phase3En <= '0';
				cycle <= (others  =>  '0');
				judge_ok <= '0';
				phase2_ok <= '0';
				FiveMin_ok <= '0';
				cnt <= (others => '0');
			elsif rising_edge(sysclk)then
				phase1En <= '0';
				phase2En <= '0';
				phase3En <= '0';
				judge_ok <= '0';
				phase2_ok <= '0';
				FiveMin_ok <= '0';
				case prstate is
				when drv_idle => 
					cycle <= (others  =>  '0');
				when drv_5s => 
					if cnt = 250000000 then
						FiveMin_ok <= '1';
						cnt <= (others => '0');
					else	
						cnt <= cnt + 1;
					end if;	
				when drv_phase1 => 
					phase1En <= '1';
				when drv_phase2 => 
					if cnt = 50000000 then
						phase2_ok <= '1';
						cnt <= (others => '0');
					else	
						cnt <= cnt + 1;
					end if;
				when drv_judge => 
					if cycle = 7 then
						judge_ok <= '1';
					else 
						cycle <= cycle + 1;
					end if;
				when drv_wait => 
					null;
				when drv_phase3 => 
					phase3En <= '1';	
				end case;
			end if;	
	end process;
U1: wavegensingle generic map(
				Polarity	 =>  '1',
				DelayLen	 =>  0,
				DelayCntWidth	 => 1,
				Phase1Len		 => 100000,
				Phase1CntWidth	 => 17,
				Phase2Len		 => 100000,
				Phase2CntWidth	 => 17,
				CycNum			 => 43,
				CycCntWidth		 => 6
				)
		port map(
				SysRst_n	 => Sysrst_n,
				SysClk		 => SysClk,
				ClkEn		 => '1',
				WaveGenEn	 => phase1En,
				WFO			 => CP1,
				WaveRdy		 => phase1_ok
				);	
U2:	 wavegensingle generic map(
				Polarity	 =>  '1',
				DelayLen	 =>  0,
				DelayCntWidth	 => 1,
				Phase1Len		 => 100000,
				Phase1CntWidth	 => 17,
				Phase2Len		 => 100000,
				Phase2CntWidth	 => 17,
				CycNum			 => 47,
				CycCntWidth		 => 6
				)
		port map(
				SysRst_n	 => Sysrst_n,
				SysClk		 => SysClk,
				ClkEn		 => '1',
				WaveGenEn	 => phase3En,
				WFO			 => CP3,
				WaveRdy		 => phase3_ok
				);		
	CP  <= CP1 and CP3;	
	Sysrst_n <= not Sysrst;	
end behavioral;	