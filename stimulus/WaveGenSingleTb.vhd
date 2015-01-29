--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:54:06 11/09/2012
-- Design Name:   
-- Module Name:   E:/TiaoShi/KBD_XXCL/WaveGenSingleTb.vhd
-- Project Name:  KBD_XXCL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WaveGenSingle
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
 
ENTITY WaveGenSingleTb IS
END WaveGenSingleTb;
 
ARCHITECTURE behavior OF WaveGenSingleTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WaveGenSingle
    PORT(
         SysRst_n : IN  std_logic;
         SysClk : IN  std_logic;
         ClkEn	:in std_logic;
			WaveGenEn : IN  std_logic;
         WFO : OUT  std_logic;
         WaveRdy : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SysRst_n : std_logic := '0';
   signal SysClk : std_logic := '0';
   signal ClkEn :std_logic := '1';
   signal WaveGenEn : std_logic := '1';
  
 	--Outputs
   signal WFO : std_logic;
   signal WaveRdy : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WaveGenSingle PORT MAP (
          SysRst_n => SysRst_n,
          SysClk => SysClk,
          ClkEn => ClkEn,
			 WaveGenEn => WaveGenEn,
          WFO => WFO,
          WaveRdy => WaveRdy
        );
 
   --SysClk
   process
   begin
		SysClk <= '0';
		wait for  12.5 ns /2;
		SysClk <= '1';
		wait for 12.5 ns /2;
   end process;

   --SysRst_n
   process
   begin
		SysRst_n <= '0';
		wait for 0.6 us;
		SysRst_n <= '1';
		wait;
   end process;

END;
