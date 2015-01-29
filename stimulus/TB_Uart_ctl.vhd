-- TB_Uart_ctl.vhd
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

entity TB_Uart_ctl is
end entity;

ARCHITECTURE behavior OF TB_Uart_ctl IS 
    
	component Uart_ctl 
	port(
            SysRst_n	:in		std_logic;
			SysClk		:in		std_logic;
			--FrameSync	:in	std_logic;		--Width:0.1ms
			--BaudCLk		:in		std_logic;		--Width:1 SysClk pulse;16xUartRxClkEn = 1/115200
			RxRdy		:in 	std_logic;
			--TxRdy		:in		std_logic;
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
	end	component; 

signal          SysRst_n	:	std_logic;
signal			SysClk		:	std_logic;
signal			RxRdy		:	std_logic;
signal			RxData		:	std_logic_vector(7 downto 0);
signal			TxData		: 	std_logic_vector(7 downto 0);
signal			OEn			:	std_logic;
signal			WEn			:	std_logic;
signal			BaudValue	:	std_logic_vector(12 downto 0);
signal			P_AddrA		:	std_logic_vector(2 downto 0);
signal			P_DataA		:	std_logic_vector(7 downto 0);
signal			P_CLkA		:	std_logic;
signal			P_WEA		:	std_logic;
signal			Rdy1		:	std_logic;
signal			Rdy2		:	std_logic;
signal			ParaLoad	:	std_logic;

begin
UUT: Uart_ctl port map (
		SysRst_n	=>    SysRst_n,
		SysClk		=>    SysClk,
		RxRdy		=>    RxRdy,
		--TxRdy		=>    TxRdy,
		RxData		=>    RxData,
		TxData		=>    TxData,
		OEn			=>    OEn,
		WEn			=>    WEn,
		BaudValue	=>    BaudValue,
		P_AddrA		=>    P_AddrA,
		P_DataA		=>    P_DataA,
		P_CLkA		=>    P_CLkA,
		P_WEA		=>    P_WEA,
		Rdy1		=>    Rdy1,
		Rdy2		=>    Rdy2,
		ParaLoad	=>    ParaLoad
		);
   
process
begin
	SysClk <= '0';
	wait for  15.15 ns /2;
	SysClk <= '1';
	wait for 15.15 ns /2;
end process;		

   process
   begin
		SysRst_n <= '0';
		wait for 0.6 us;
		SysRst_n <= '1';
		wait;
   end process;


   process
   begin
		RxRdy <= '0';
		RxData <= X"00";
		paraload <= '0';
			
		wait for 1 us;
		rx <= '0';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68 us;
		rx <= '1';
		wait for 8.68*6 us;
		rx <= '0';
		wait for 8.68 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68*7 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68 us;
		rx <= '1';
		wait for 8.68*2 us;
		rx <= '0';
		wait for 8.68*6 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68*9 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '1';
		wait for 8.68*9 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68*9 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68*2 us;
		rx <= '1';
		wait for 8.68 us;
		rx <= '0';
		wait for 8.68*6 us;
		rx <= '1';
		wait for 10 ms;
	   end process; 
end behavior;	
	
	
	
	