-- ParaUpdata.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ParaUpdata is
	port(
			SysRst_n	:in		std_logic;
			SysClk		:in		std_logic;
			P_AddrB		:out	std_logic_vector(2 downto 0);
			P_DataB		:in		std_logic_vector(7 downto 0);
			P_CLkB		:out	std_logic;
			P_RdB		:out	std_logic;
			Rdy1		:in		std_logic;
			Rdy2		:in		std_logic;
			ParaLoad	:out	std_logic;
			SPI_Set		:out	std_logic_vector(31 downto 0);
			ExposureT	:out	std_logic_vector(5 downto 0);
			MotorPos	:out	std_logic_vector(5 downto 0);
			BandNum		:out	std_logic_vector(3 downto 0);
			Mode		:out	std_logic_vector(1 downto 0);
			Accnum		:out	std_logic_vector(5 downto 0)
		);	
end ParaUpdata;

architecture Behavioral of ParaUpdata is
signal	AddrB		:	std_logic_vector(2 downto 0);
signal	sel			:	std_logic_vector(1 downto 0);
signal	Data_reg	:	std_logic_vector(31 downto 0);
signal		BaudCnt			:std_logic_vector(9 downto 0);
constant	BaudCntSet		:std_logic_vector(9 downto 0) := "1000111100"; --572
signal 	BaudPulse	:	std_logic;
signal	CtlCnt		:	std_logic_vector(1 downto 0);
signal	load_sig	:	std_logic;
signal	DataCtl		:	std_logic;
--constant	BaudCntSet		:std_logic_vector(5 downto 0) := "100011"; --36
begin
P_CLkB <= BaudPulse;
------------------------------------------------------------------
process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			BaudCnt <= (others => '0');
			BaudPulse <= '0';
		elsif rising_edge(SysClk) then
			if BaudCnt = BaudCntSet then
				BaudCnt <= (others => '0');
				BaudPulse <= '1';
			else
				BaudCnt <= BaudCnt + 1;
				BaudPulse <= '0';
			end if;
		end if;
end process;
------------------------------------------------------------------
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			CtlCnt <= (others => '0');
			Load_sig <= '0';
		elsif rising_edge(SysClk) then
			if BaudPulse ='1' then
				if Rdy1 = '1' or Rdy2 = '1' then
					if CtlCnt = "11" then
						Load_sig <= '1';
					else	
						CtlCnt <= CtlCnt + 1;
					end if;
				else
					CtlCnt <= (others => '0');
					Load_sig <= '0';
				end if;	
			end if;
		end if;
	end process;


	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			DataCtl <= '0';
		elsif rising_edge(SysClk) then
			if BaudPulse ='1' then
				if Rdy1 = '1' then
					DataCtl <= '1';
				elsif Rdy2 = '1' then
					DataCtl <= '1';
				end if;
				if Load_sig ='1' then
					DataCtl <= '0';
				end if;	
			end if;
		end if;
	end process;	

	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then	
			sel <= "10";	
			P_RdB <=  '0';
			AddrB <= "000";
			P_AddrB <= "000";
		elsif rising_edge(SysClk) then
			if BaudPulse ='1' then
				if  DataCtl = '1' then
					P_RdB <=  '1';
					P_AddrB <= AddrB;
					AddrB <= AddrB + 1;
					sel <= sel + 1;		
				else
					P_RdB <=  '0';
					sel <= "10";
					AddrB <= "000";					
				end if;
			end if;	
		end if;	
	end process;
	
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then	
			Data_reg <= (others => '0');
		elsif rising_edge(SysClk) then
			if BaudPulse ='1' then
				case sel is
					when "00" => 
						Data_reg(7 downto 0) <= P_DataB;
					when "01" => 	
						Data_reg(15 downto 8) <= P_DataB;
					when "10" => 	
						Data_reg(23 downto 16) <= P_DataB;
					when "11" => 
						Data_reg(31 downto 24) <= P_DataB;
					when others => 
						Data_reg <= (others => '0');
				end case;
			end if;
		end if;
	end process;
	
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then	
			MotorPos <= (others => '0');
			BandNum <= (others => '0');
			ExposureT <= (others => '0');
			accnum <= (others => '0');
			Paraload <= '0';
			SPI_Set <= "00101110000000000000000000000001";
			Mode <= (others => '0');
		elsif rising_edge(SysClk) then
			if BaudPulse ='1' then	
				if Rdy1 = '1' then
					MotorPos <= Data_reg(5 downto 0);
					Mode <= Data_reg(7 downto 6);
					BandNum(3 downto 0) <= Data_reg(15 downto 12);
					ExposureT(5 downto 2) <= Data_reg(11 downto 8);
					ExposureT(1 downto 0) <= Data_reg(23 downto 22);
					accnum(5 downto 0) <= Data_reg(21 downto 16);
				end if;	
				if Rdy2 = '1' then
					SPI_Set(31 downto 24) <= Data_reg(7 downto 0);
					SPI_Set(23 downto 16) <= Data_reg(15 downto 8);
					SPI_Set(15 downto 8) <= Data_reg(23 downto 16);
					SPI_Set(7 downto 0) <= Data_reg(31 downto 24);
				end if;	
				if load_sig = '1' and Datactl = '0' then
					Paraload <= '1';
				else 
					Paraload <= '0';
				end if;	
			end if;
		end if;
	end process;
	
				
end Behavioral;				
			