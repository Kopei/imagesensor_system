-- SDram_cmd.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-------------------------------------------------
entity Sdram_cmd is     
		port
		(
			Sysclk 		:in 	std_logic;
            rst_n		:in 	std_logic;
			ini_state	:in		std_logic_vector(2 downto 0);
			rd_state	:in		std_logic_vector(2 downto 0);
			wr_state	:in		std_logic_vector(2 downto 0);
			ref_state	:in		std_logic_vector(2 downto 0);
			ClkEN		:in		std_logic;
			GLB			:in		std_logic;
			rdrow_end	:out	std_logic;
			wrrow_end	:out	std_logic;
			lvds_en		:in		std_logic;
			Sdram_en	:in		std_logic;
            ras_n,cas_n,we_n:out std_logic;
			SDoneFrameOk:	out	std_logic;
            cke,cs_n	:	out std_logic_vector(1 downto 0);
			SD_Clk		:	out std_logic_vector(1 downto 0);
            dqm			:	out std_logic_vector(7 downto 0);
            addr		:	out std_logic_vector(12 downto 0);
            ba 			: 	out std_logic_vector(1 downto 0);
            RFifo_we	:	out	std_logic;
			WFifo_re	:	out	std_logic
		);
end entity;

architecture behavioral of Sdram_cmd is 
signal	SD_WrAddr_col		:std_Logic_vector(10 downto 0);
signal	SD_wrAddr_row		:std_logic_vector(12 downto 0);
signal	SD_rdAddr_col		:std_Logic_vector(10 downto 0);
signal	SD_rdAddr_row		:std_logic_vector(12 downto 0);
signal	SD_BA				:std_logic_vector(1 downto 0);
signal  temp_w				:std_logic_vector(3 downto 0); 
signal  Rfifo_weEN			:std_logic;
signal	LVDS_enReg			:std_logic; 
signal  sdram_enReg			:std_logic;	
signal 	dly1_SDoneFrameOk	:std_logic;
signal 	dly2_SDoneFrameOk	:std_logic;
signal 	dly3_SDoneFrameOk	:std_logic;
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

cke <= "11" when ClkEN = '1' else "00";
SD_clk(0) <= GLB and ClkEn;
SD_clk(1) <= GLB and ClkEn; 

process (Sysclk, rst_n)		
begin
	if (rst_n = '0')then
		cs_n <= "11"; -- null
		ras_n <= '1'; 
		cas_n <= '1';
		we_n <=	'1';
		SD_WrAddr_col <= (others => '0');
		SD_WrAddr_row <= (others => '0');
		SD_rdAddr_col <= (others => '0');
		SD_rdAddr_row <= (others => '0');
		addr <= (others => '0');
		BA <= "00";
		SD_BA <= "00";
		WFifo_re <= '0';
		LVDS_enReg <= '0';
		sdram_enreg <= '0';
		temp_w <= (others => '0');
		dqm <= (others => '1');
		rdrow_end <= '0';
		SDoneFrameOk <= '0';
		wrrow_end <= '0';
		dly1_SDoneFrameOk <= '0';
		dly3_SDoneFrameOk <= '0';
		dly2_SDoneFrameOk <= '0';
	elsif rising_edge(Sysclk)then	
		dqm <= (others => '1');
		cs_n <= "11"; -- null
		ras_n <= '1'; 
		cas_n <= '1';
		we_n <=	'1';
		temp_w <= temp_w + 1;
		dly1_SDoneFrameOk <= '0';
		dly2_SDoneFrameOk <= dly1_SDoneFrameOk;
		dly3_SDoneFrameOk <= dly2_SDoneFrameOk;
		SDoneFrameOk <= dly3_SDoneFrameOk;
		case ini_state is 
			when "000" => 	null;
			when "001" => 	ras_n <= '0'; --pall
							cas_n <= '1';
							we_n <=	'0';
							addr(10) <= '1';
							cs_n <= "00";
			when "010" =>	cs_n <= "11";				
			when "011" =>	cs_n <= "00"; -- 8 refresh
							ras_n <= '0'; 
							cas_n <= '0';
							we_n <=	'1';
			when "100" =>	cs_n <= "11";
			when "101" =>	cs_n <= "00";
							ras_n<='0';
							cas_n<='0';
							we_n<='0';
							addr<="0000000100011";-- set burst type:8 bl, #33
							ba<="00";
			when others =>  null;				
		end case;
		-- if (sdram_en = '1' or lvds_en = '1' )then 
			case rd_state is
				when "000" =>	Rfifo_weEN <= '0'; --rd_idle
				when "001" =>	Rfifo_weEN <= '1'; --judge
				when "010" =>	cs_n <= "00"; --act
								ras_n <= '0'; 
								cas_n <= '1';
								we_n <=	'1';
								addr <= SD_rdAddr_row;
								ba <= SD_BA;
								--temp_r <= (others => '0');
				when "011" =>	cs_n <= "11";	--rd_wait
								Rfifo_weEN <= '1';
				when "100" =>	cs_n <= "00"; --rd
								ras_n <= '1'; 
								cas_n <= '0';
								we_n <=	'1';
								addr(10 downto 0) <= SD_rdAddr_col;
								SD_rdAddr_col <= SD_rdAddr_col + 8;
								ba <= SD_Ba;
								dqm <= (others => '0');
				when "101" =>	cs_n <= "11";  --rd_process
								dqm <= (others => '0');
								-- if (temp_r = "0011")then	
									-- RFifo_we <= '1';
									-- temp_r <= temp_r + 1;
								-- elsif (temp_r = "1011")then
									-- RFifo_we <= '0';
								-- else 
									-- temp_r <= temp_r + 1;
								-- end if;	
				when "110" => 	cs_n <= "00"; --precharge
								ras_n <= '0'; 
								cas_n <= '1';
								we_n <=	'0';
								addr(10) <= '0';
								ba <= SD_BA;
				when "111" => 	cs_n <= "11"; -- null rd_wait_act
								ras_n <= '1'; 
								cas_n <= '1';
								we_n <=	'1';					
				when others =>  		
								dqm <= (others => '1');
								cs_n <= "11"; -- null
								ras_n <= '1'; 
								cas_n <= '1';
								we_n <=	'1';				
			end case;
		-- else 
			-- dqm <= (others => '1');
			-- cs_n <= "11"; -- null
			-- ras_n <= '1'; 
			-- cas_n <= '1';
			-- we_n <=	'1';		
		-- end if;	
		case wr_state is
			when "000" =>	null;
			when "001" =>	cs_n <= "00"; --act
							ras_n <= '0'; 
							cas_n <= '1';
							we_n <=	'1';
							addr <= SD_WrAddr_row;
							ba <= SD_BA;
							WFifo_re <= '1';
							temp_w <= "0000";
			when "010" =>	cs_n <= "11";
			when "011" =>	cs_n <= "00"; --wr
							ras_n <= '1'; 
							cas_n <= '0';
							we_n <=	'0';
							addr(10 downto 0)<= SD_WrAddr_col;
							SD_WrAddr_col <= SD_WrAddr_col + 8;
							ba <= SD_Ba;
							dqm <= (others => '0');
			when "100" =>	cs_n <= "11";
							dqm <= (others => '0');
							if(temp_w = "0111")then
								WFifo_re <= '0';
								temp_w <= temp_w + 1;	
							end if;	
			when "101" => 	cs_n <= "00"; --precharge
							ras_n <= '0'; 
							cas_n <= '1';
							we_n <=	'0';
							addr(10) <= '0';
							ba <= SD_BA;					
			when "110" => 	cs_n <= "11"; -- null
							ras_n <= '1'; 
							cas_n <= '1';
							we_n <=	'1';
			when others =>  						
							dqm <= (others => '1');
							cs_n <= "11"; -- null
							ras_n <= '1'; 
							cas_n <= '1';
							we_n <=	'1';						
		end case;	
		
		case ref_state is
			when "000" =>	null;
			when "001" =>	cs_n <= "00"; --precharge
							ras_n <= '0'; 
							cas_n <= '1';
							we_n <=	'0';
							addr(10) <= '0';
							ba <= SD_BA;
			when "010" =>	cs_n <= "11";
			when "011" =>	cs_n <= "00"; --ref
							ras_n <= '0'; 
							cas_n <= '0';
							we_n <=	'1';
			when "100" =>	cs_n <= "11"; --trc
			when others =>  null;	
		end case;		
		-- if (sdram_en = '1' or lvds_en = '1') then
			if ( SD_rdAddr_col >= 1024) then 
				SD_rdAddr_row <= SD_rdAddr_row + 1;	
				SD_rdAddr_col <= (others => '0');
				rdrow_end <= '1';
			elsif(SD_rdAddr_col >8) then
				rdrow_end <= '0';
			end if;
		-- else
			-- rdrow_end <= '0';
		-- end if;
		if (SD_WrAddr_col = 1016 )then
			wrrow_end <= '1';
		end if;
		if (SD_WrAddr_col = 1024)then
			SD_WrAddr_row <= SD_WrAddr_row + 1;
			SD_WrAddr_col <= (others => '0');		
		elsif (SD_wrAddr_col = 0) then
			wrrow_end <= '0';
		end if;			
			
		if (SD_wrAddr_row = 8192) then
			SD_BA <= SD_ba + 1;
			SD_WrAddr_row <= (others => '0');
			SD_rdAddr_row <= (others => '0');
		end if;	
		-- if	(LVDS_en ='1') then	
			-- LVDS_enReg <= LVDS_en; 
		-- end if;	
		if SD_wrAddr_row = 1024 then
			SD_WrAddr_row <= SD_WrAddr_row-1024;
		 	dly1_SDoneFrameOk <= '1';

		end if;
		-- if  dly1_SDoneFrameOk = '1' then
			-- dly2_SDoneFrameOk <= dly1_SDoneFrameOk;
			-- dly3_SDoneFrameOk <= dly2_SDoneFrameOk;
			-- SDoneFrameOk <= dly3_SDoneFrameOk;
		-- else 
			-- dly2_SDoneFrameOk <= '0';
			-- dly3_SDoneFrameOk <= '0';
			-- SDoneFrameOk <= '0';		
		-- end if;	
		if SD_rdAddr_row = 1024 then
			SD_rdAddr_row <= SD_rdAddr_row-1024;	
		end if;	
		if	(sdram_en ='1') then	   -- sdram_en to lvds_en model need addr reset
			LVDS_enReg <= sdram_en; 
		end if;	
		if (Lvds_EnReg ='1' and sdram_en ='0') then
			SD_rdAddr_row <= (others => '0');
			SD_rdAddr_col <= (others => '0');
			LVDS_enReg <= '0';
		end if;	
		if	(lvds_en ='1') then	
			sdram_enReg <= lvds_en; 
		end if;	
		if (sdram_enReg ='1' and lvds_en ='0') then
			SD_rdAddr_row <= (others => '0');
			SD_rdAddr_col <= (others => '0');
			SD_wrAddr_row <= (others => '0');
			SD_wrAddr_col <= (others => '0');
			sdram_enReg <= '0';
		end if;	
	-- if (Lvds_EnReg ='1' and lvds_en ='0') then
			-- SD_WrAddr_row <= SD_WrAddr_row + 2048;
	-- end if;	
	-- if SD_rdAddr_row = 2048 then
		-- SD_rdAddr_row <= SD_rdAddr_row-2048;
	-- end if;
	-- if (Lvds_EnReg ='1' and lvds_en ='0') then
			-- SD_rdAddr_row <= SD_rdAddr_row + 2048;
	-- end if;
	-- if (Lvds_EnReg ='1' and lvds_en ='0') then
			-- SD_rdAddr_row <= SD_rdAddr_row + 1;	
		-- end if;	
	--if	(LVDS_en ='1') then	
		
end if;

end process; 
		
UU : WaveGenSingle generic map
	 	(
			Polarity => '0',
			DelayLen => 1,  --3 dly
			DelayCntWidth => 1, 
			Phase1Len	  => 7,		
			Phase1CntWidth	=> 3,
			Phase2Len		=> 0,
			Phase2CntWidth	=> 1,
			CycNum			=> 0,
			CycCntWidth		=> 1
			)
	port map(
			SysRst_n =>	rst_n,		
			SysClk	=>	Sysclk,
			ClkEn	=>	'1',
			WaveGenEn => Rfifo_weEN,
			WFO		=>	RFifo_we,					--WaveForm Output
			WaveRdy	=> open		
		);	
end behavioral;