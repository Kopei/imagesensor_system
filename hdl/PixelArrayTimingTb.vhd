--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:20:15 11/06/2013
-- Design Name:   
-- Module Name:   E:/FQ/VHDL/XilinxTest/PixelArrayTimingTb.vhd
-- Project Name:  XilinxTest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PixelArrayTiming
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
 
ENTITY PixelArrayTimingTb IS
END PixelArrayTimingTb;
 
ARCHITECTURE behavior OF PixelArrayTimingTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PixelArrayTiming
    PORT(
         DivCntO : OUT  std_logic_vector(6 downto 0);
         ClkEnO : OUT  std_logic;
         InitCntO : OUT  std_logic_vector(17 downto 0);
         SysRst_n : IN  std_logic;
         SysClk : IN  std_logic;
         InitTime : IN  std_logic_vector(17 downto 0);
         PAT_En : IN  std_logic;
         mem_HL : OUT  std_logic;
         precharge : OUT  std_logic;
         sample : OUT  std_logic;
         reset : OUT  std_logic;
         reset_ds : OUT  std_logic;
         PAT_Ok : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SysRst_n : std_logic := '0';
   signal SysClk : std_logic := '0';
   signal InitTime : std_logic_vector(17 downto 0) := "000000000000011011";
   signal PAT_En : std_logic := '0';

 	--Outputs
   signal DivCntO : std_logic_vector(6 downto 0);
   signal ClkEnO : std_logic;
   signal InitCntO : std_logic_vector(17 downto 0);
   signal mem_HL : std_logic;
   signal precharge : std_logic;
   signal sample : std_logic;
   signal reset : std_logic;
   signal reset_ds : std_logic;
   signal PAT_Ok : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PixelArrayTiming PORT MAP (
          DivCntO => DivCntO,
          ClkEnO => ClkEnO,
          InitCntO => InitCntO,
          SysRst_n => SysRst_n,
          SysClk => SysClk,
          InitTime => InitTime,
          PAT_En => PAT_En,
          mem_HL => mem_HL,
          precharge => precharge,
          sample => sample,
          reset => reset,
          reset_ds => reset_ds,
          PAT_Ok => PAT_Ok
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
	
	--PAT_En
	process
	begin
		PAT_En <= '0';
		wait for 1 us;
		PAT_En <= '1';
		wait for 1 ms;
		PAT_En <= '0';
		wait;
	end process;

END;
