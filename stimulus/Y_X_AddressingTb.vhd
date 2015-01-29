--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:14:14 11/05/2013
-- Design Name:   
-- Module Name:   E:/FQ/VHDL/XilinxTest/Y_X_AddressingTb.vhd
-- Project Name:  XilinxTest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Y_X_Addressing
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY Y_X_AddressingTb IS
END Y_X_AddressingTb;
 
ARCHITECTURE behavior OF Y_X_AddressingTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Y_X_Addressing
    PORT(
        -- RowCntO : OUT  std_logic_vector(10 downto 0);
       --  LineReadOutOkO : OUT  std_logic;
        -- RowReadOutEnO : OUT  std_logic;
        -- PrStateO : OUT  std_logic_vector(2 downto 0);
        	--**************************
			SysRst_n	:in	    std_logic;
			SysClk		:in	    std_logic;
            ADC_66M_Clk :in     std_logic;
			Y_X_WaveEn	:in	    std_logic;
			ImageOrQL	:in		std_logic;	--'0':Image; '1':QuitLatch
			--dry			:in		std_logic;
			Sync_Y		:out	std_logic;
			Clock_Y		:out	std_logic;
			NoRowSel	:out	std_logic;
			Pre_co		:out	std_logic;
			Sh_co		:out	std_logic;
			VoltAvg		:out	std_logic;
			Sync_X		:out	std_logic;
			Clock_X		:out	std_logic;
			Prebus1		:out	std_logic;
			Prebus2		:out	std_logic;
            AdcClk      :out    std_logic;
			--DryforTest	:out	std_logic;
			ADC_RdEN	:out	std_logic;
			Y_X_WaveOk	:out	std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SysRst_n : std_logic := '0';
   signal SysClk : std_logic := '0';
   signal Y_X_WaveEn : std_logic := '0';
	signal imageorql : std_logic;
 	--Outputs
   --signal RowCntO : std_logic_vector(10 downto 0);
  -- signal LineReadOutOkO : std_logic;
   --signal RowReadOutEnO : std_logic;
  -- signal PrStateO : std_logic_vector(2 downto 0);
   signal Sync_Y : std_logic;
   signal Clock_Y : std_logic;
   signal NoRowSel : std_logic;
   signal Pre_co : std_logic;
   signal Sh_co : std_logic;
   signal VoltAvg : std_logic;
   signal Sync_X : std_logic;
   signal Clock_X : std_logic;
   signal Prebus1 : std_logic;
   signal Prebus2 : std_logic;
   signal Y_X_WaveOk : std_logic;
   signal AdcClk      :	    std_logic;
	--signal		--DryforTest	:out	std_logic;
	signal	ADC_RdEN		:		std_logic;
	signal	ADC_66M_Clk 	:     std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Y_X_Addressing PORT MAP (
          --RowCntO => RowCntO,
          --LineReadOutOkO => LineReadOutOkO,
          --RowReadOutEnO => RowReadOutEnO,
         -- PrStateO => PrStateO,
          SysRst_n => SysRst_n,
          SysClk => SysClk,
          Y_X_WaveEn => Y_X_WaveEn,
          Sync_Y => Sync_Y,
          Clock_Y => Clock_Y,
          NoRowSel => NoRowSel,
          Pre_co => Pre_co,
          Sh_co => Sh_co,
          VoltAvg => VoltAvg,
          Sync_X => Sync_X,
          Clock_X => Clock_X,
          Prebus1 => Prebus1,
          Prebus2 => Prebus2,
		  ImageOrQL	=> imageorql,
          ADC_66M_Clk => ADC_66M_Clk,
		  AdcClk	=> AdcClk,
		  ADC_RdEN => ADC_RDEN,
		  Y_X_WaveOk => Y_X_WaveOk
        );
 
   --SysClk
   process
   begin
		SysClk <= '0';
		wait for  15.15 ns /2;
		SysClk <= '1';
		wait for 15.15 ns /2;
   end process;

   --SysRst_n
   process
   begin
		SysRst_n <= '0';
		wait for 0.6 us;
		SysRst_n <= '1';
		wait;
   end process;
	
	--Y_X_WaveEn
	process
	begin
		Y_X_WaveEn <= '0';
		wait for 1 us;
		Y_X_WaveEn <= '1';
		wait for 1 ms;
		Y_X_WaveEn <= '0';
		wait;
	end process;
		process
	begin
		ImageOrQL <= '1';
		wait for 64 ms;
		ImageOrQL <= '0';
		wait for 1 ms;		
		wait;
	end process;
	
	ADC_66M_Clk <= SysClk 'Delayed(13 ns);
END;
