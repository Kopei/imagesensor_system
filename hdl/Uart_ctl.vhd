-- Uart_ctl.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Uart_ctl is
	port(
			SysRst_n	:in		std_logic;
			SysClk		:in		std_logic;
			--FrameSync	:in	std_logic;		--Width:0.1ms
			--BaudCLk		:in		std_logic;		--Width:1 SysClk pulse;16xUartRxClkEn = 1/115200
			RxRdy		:in 	std_logic;
			TxRdy		:in		std_logic;
			RxData		:in		std_logic_vector(7 downto 0);
			TxData		:out 	std_logic_vector(7 downto 0);
			OEn			:out	std_logic;
			WEn			:out	std_logic;
			BaudValue	:out	std_logic_vector(12 downto 0);
			P_AddrA		:out	std_logic_vector(2 downto 0);
			P_DataA		:out	std_logic_vector(7 downto 0);
			P_CLkA		:out	std_logic;
			P_WEA		:out	std_logic;
			Rdy1		:out	std_logic;
			Rdy2		:out	std_logic;
			ParaLoad	:in		std_logic
		);	
end Uart_ctl;

architecture Behavioral of Uart_ctl is
signal		OvertimeCnt		:std_logic_vector(9 downto 0);			--used to reset RX state machine
constant	SynHead			:std_logic_vector(7 downto 0) := X"7E";		
signal		CheckSum		:std_logic_vector(7 downto 0);		
signal 		BaudPulse		:std_logic;
signal		BaudCnt			:std_logic_vector(9 downto 0);
constant	BaudCntSet		:std_logic_vector(9 downto 0) := "1000111100"; --572
signal		ParaLen			:std_logic_vector(7 downto 0);
Signal		ParaCnt			:std_logic_vector(7 downto 0);
constant	Len1			:std_logic_vector(3 downto 0):= "1010";
constant    Len2			:std_logic_vector(3 downto 0):= "1100";
constant	CmdWord1		:std_logic_vector(7 downto 0) := X"01";
constant	CmdWord2		:std_logic_vector(7 downto 0) := X"02";
signal		CmdWord			:std_logic_vector(7 downto 0);
signal		P_AddrA_sig		:std_logic_vector(2 downto 0);
signal		Answer_ok		:std_logic;
signal		Err				:std_logic;
signal		Wen_cnt		:std_logic_vector(3 downto 0);
constant	Answer_right		:std_logic_vector(39 downto 0):=X"7E91010090";			
constant	Answer_err			:std_logic_vector(39 downto 0):=X"7E9101FF6F";
signal		Answer_start		:std_logic;
signal		Tx_cnt			:std_logic_vector(3 downto 0);
signal		Tx_ten			:std_logic;
type Rx_state is (Rx_Idle, Rx_Start, Rx_Len1, Rx_Len2, Rx_ChPar, Rx_Check);
signal	PrState,NxState	: Rx_state;
type Tx_state is (Tx_Idle, Tx_Start, Tx_word0,Tx_word1,Tx_word2,Tx_word3,Tx_ok);
signal	Pr_State,Nx_State	: Tx_state;
begin
BaudValue <= "0000000100011";
-------------------------------------------------------------
	--BaudPulse
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
	P_CLkA <= BaudPulse;
-------------------------------------------------------------------	
	--Overtime Counter latency wait for 0ne Byte data recieve
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			OvertimeCnt <= (others => '0');	
		elsif rising_edge(SysClk) then
			if BaudPulse = '1' then
				if (RxRdy = '0' and PrState /= RX_idle) then
					OvertimeCnt <= OvertimeCnt + 1;
				else
					OvertimeCnt <= (others => '0');
				end if;
			end if;
		end if;
	end process;
-------------------------------------------------------------

-------------------------------------------------------------
	--Rx(UART) state machine
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			PrState <= RX_idle;
			OEn <= '1';
		elsif rising_edge(SysClk) then
			if BaudPulse = '1' then
				if RxRdy = '1' then
					PrState <= NxState;
					OEn <= '0';
				elsif OvertimeCnt = 511 then		
					PrState <= RX_idle;	
					OEn <= '1';		
				elsif ParaLoad = '1' then
					PrState <= Rx_idle;
				elsif answer_ok = '1' then
					PrState <= Rx_idle;
				else
					OEn <= '1';
				end if;
			end if;
		end if;
	end process;

	--State Transition
	process (PrState,RxData,ParaCnt,ParaLen) 
	begin
		case PrState is
			when RX_idle =>			
				if RxData = SynHead then
					NxState <= Rx_Start;
				else
					NxState <= RX_idle;
				end if;
			when Rx_Start =>
				if RxData = CmdWord1 then
					NxState <= Rx_Len1;
				elsif
					RxData = CmdWord2 then
					NxState <= Rx_Len2;
				else
					Nxstate <= RX_idle;
				end if;
			when Rx_Len1 =>			
				NxState <= Rx_ChPar;
			when Rx_Len2 =>			
				NxState <= Rx_ChPar;			
			when Rx_ChPar =>
				if ParaCnt = ParaLen then
					NxState <= Rx_Check;
				else
					NxState <= Rx_ChPar;
				end if;				
			when Rx_Check =>
					NxState <= Rx_Check;
				
			when others =>				
				NxState <= RX_idle;
		end case;
	end process;

	--State Output
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			--ChParValid <= '0';
			ParaLen <= (others => '0');
			ParaCnt <= X"00";
			CheckSum <= (others => '0');
			Rdy2 <= '0';
			Rdy1 <= '0';
			P_WEA <= '0';
			CmdWord <= (others => '0');
			P_DataA <= (others => '0');
			P_AddrA <= (others => '0');
			P_AddrA_sig <= (others => '0');
			Err <= '0';
			Answer_start <= '0';
			-- TxData <= (others => '0');
			-- Wen <= '1';
			-- answer_cnt <= (others => '0');
			-- Answer_ok <= '0';
		elsif rising_edge(SysClk) then
			if BaudPulse = '1' then
				P_WEA <= '0';
				-- TxData <= (others => '0');
				-- Wen <= '1';
				case PrState is
					when RX_idle =>
						ParaLen <= (others => '0');
						ParaCnt <= X"00";
						CheckSum <= (others => '0');
						Rdy2 <= '0';
						Rdy1 <= '0';
						P_WEA <= '0';
						Err <= '0';
						Answer_start <= '0';
						-- TxData <= (others => '0');
						-- Wen <= '1';
						-- Answer_ok <= '0';
						-- answer_cnt <= (others => '0');
					when Rx_Start =>
						if RxRdy = '1' then
							CheckSum <= RxData;
							CmdWord <= RxData;	
							P_AddrA <= (others => '0');
							P_AddrA_sig <=  "001";
						end if;	
					when Rx_Len1 =>
						if RxRdy = '1' then
							ParaLen(7 downto 0) <= RxData;
							P_WEA <= '1';--ChParValid <= '1';
							CheckSum <= CheckSum xor RxData;
							P_DataA <= RxData;
						end if;				
					when Rx_Len2 =>
						if RxRdy = '1' then
							ParaLen(7 downto 0) <= RxData;
							P_WEA <= '1';--ChParValid <= '1';
							CheckSum <= CheckSum xor RxData;
							P_DataA <= RxData;
						end if;
					when Rx_ChPar =>
						if RxRdy = '1' then	
							ParaCnt <= ParaCnt + 1;
							CheckSum <= CheckSum xor RxData;
							P_WEA <= '1';
							P_DataA <= RxData;
							P_AddrA_sig <= P_AddrA_sig + 1;
							P_AddrA <= P_AddrA_sig;
						end if;
					when Rx_Check =>
						Answer_start <= '1';
						if CheckSum = X"00" then
							if CmdWord = CmdWord1 then
								Rdy1 <= '1';
								Err <= '0';
							elsif CmdWord = CmdWord2 then
								Rdy2 <= '1';
								Err <= '0';
							end if;	
						else 
							Err <= '1';
						end if;	
					
					when others =>
						--ChParValid <= '0';
						ParaLen <= (others => '0');
						ParaCnt <= X"00";
						CheckSum <= (others => '0');
						CmdWord <= 	(others => '0');
						--OEn <= '1';						
				end case;
			end if;		
		end if;
	end process;
			

-------TX_answer
	process(SysRst_n,SysClk)
	begin
		if SysRst_n = '0' then
			Pr_State <= TX_idle;
			TX_cnt <= (others  =>  '0');
		elsif rising_edge(SysClk) then
			if BaudPulse = '1'  then
				Pr_State <= Nx_State;
				TX_cnt <= Tx_cnt + 1;
				Tx_ten <= '0';
				if Tx_cnt = 10 then
					TX_cnt <= (others  =>  '0');
					Tx_ten <= '1';
				end if;	
			end if;
		end if;
	end process;

	--State Transition
	process (Pr_State,Answer_start,Tx_ten) 
	begin
		case Pr_State is
			when TX_idle =>	
				if Answer_start = '1' then
					Nx_State <= Tx_Start;
				else
					Nx_State <= TX_idle;
				end if;
			when Tx_Start =>
				if Tx_TEN = '1' then 
					Nx_State <= Tx_Word0;	
				else
					Nx_State <= Tx_Start;
				end if;	
			when Tx_Word0 => 
				if Tx_TEN = '1' then 
					Nx_State <= Tx_Word1;	
				else
					Nx_State <= Tx_Word0;
				end if;
				
			when Tx_Word1 => 
				if Tx_TEN = '1' then 
					Nx_State <= Tx_Word2;
				else
					Nx_State <= Tx_Word1;
				end if;	
			when Tx_Word2 => 
				if Tx_TEN = '1' then 	
					Nx_State <= Tx_Word3;
				else
					Nx_State <= Tx_Word2;
				end if;		
			when Tx_Word3 => 
				if Tx_TEN = '1' then 
					Nx_State <= Tx_ok;
				else
					Nx_State <= Tx_Word3;
				end if;	
			when Tx_ok => 
				if Tx_TEN = '1' then 
					Nx_State <= Tx_idle;
				else
					Nx_State <= Tx_ok;
				end if;	
			when others =>				
				Nx_State <= TX_idle;
		end case;
	end process;
	
	process(SysRst_n,SysClk)
		begin
			if SysRst_n = '0' then
				TxData <= (others => '0');
				Wen <= '1';
				Answer_ok <= '0';
				Wen_cnt <= (others => '0');
			elsif rising_edge(SysClk) then
				if BaudPulse = '1' then
			
						
					case Pr_State is
					when Tx_Idle => 
						TxData <= (others => '0');
						Wen <= '1';
						Answer_ok <= '0';
					when Tx_Start => 
						wen <= '1';
						if Txrdy = '1'then
							if err = '1' then
								TxData <= answer_err(39 downto 32);
								wen <= '0';
							else
								TxData <= answer_right(39 downto 32);
								wen <= '0';
							end if;	
						end if;
					when Tx_word0 => 
						wen <= '1';
						if Wen_cnt = 3 then
							Wen_cnt <= Wen_cnt + 1;
							if err = '1' then
								TxData <= answer_err(31 downto 24);
								wen <= '0';
							else
								TxData <= answer_right(31 downto 24);
								wen <= '0';
							end if;	
						else
							Wen_cnt <= Wen_cnt + 1;
						end if;	
						-- end if;	
					when Tx_word1 => 
						wen <= '1';
					
						if Wen_cnt = 13 then
							Wen_cnt <= Wen_cnt + 1;
							if err = '1' then
								TxData <= answer_err(23 downto 16);
								wen <= '0';
							else
								TxData <= answer_right(23 downto 16);
								wen <= '0';
							end if;	
						else
							Wen_cnt <= Wen_cnt + 1;
						end if;		
					when Tx_word2 => 
						wen <= '1';
						if Wen_cnt = 8 then
							Wen_cnt <= Wen_cnt + 1;
							if err = '1' then
								TxData <= answer_err(15 downto 8);
								wen <= '0';
							else
								TxData <= answer_right(15 downto 8);
								wen <= '0';
							end if;	
						else
							Wen_cnt <= Wen_cnt + 1;
						end if;		
					when Tx_word3 => 
						wen <= '1';
						if Wen_cnt = 2 then
							Wen_cnt <= Wen_cnt + 1;
							if err = '1' then
								TxData <= answer_err(7 downto 0);
								wen <= '0';
							else
								TxData <= answer_right(7 downto 0);
								wen <= '0';
							end if;	
						else
							Wen_cnt <= Wen_cnt + 1;
						end if;		
					when Tx_ok => 	
						wen <= '1';
						Answer_ok <= '1';
						wen_cnt <= (others => '0');
							-- if err = '1' then
								-- TxData <= answer_err(7 downto 0);
								-- wen <= '0';
							-- else
								-- TxData <= answer_right(7 downto 0);
								-- wen <= '0';
							--end if;	
						-- end if;	
					end case;
				end if;		
			end if;
	end process;	
		-- process(SysRst_n,SysClk)
		-- begin
			-- if SysRst_n = '0' then
				-- wen_cnt <= '0';
			-- elsif rising_edge(SysClk) then
				-- if BaudPulse = '1' then
					
end Behavioral;					
					
					
					
					