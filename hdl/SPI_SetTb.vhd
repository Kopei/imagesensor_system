--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:18:29 11/06/2013
-- Design Name:   
-- Module Name:   E:/FQ/VHDL/CMOS_DrvX/CMOS_DrvX/SPI_SetTb.vhd
-- Project Name:  CMOS_DrvX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SPI_Set
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
 
ENTITY SPI_SetTb IS
END SPI_SetTb;
 
ARCHITECTURE behavior OF SPI_SetTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPI_Set
    PORT(
         DivCntO : OUT  std_logic_vector(6 downto 0);
         NumCntO : OUT  std_logic_vector(5 downto 0);
         CntEnO : OUT  std_logic;
         ClkEnO : OUT  std_logic;
         SPI_ShifterO : OUT  std_logic_vector(31 downto 0);
         EofO : OUT  std_logic;
         PrStateO : OUT  std_logic_vector(1 downto 0);
         SysRst_n : IN  std_logic;
         SysClk : IN  std_logic;
         SPI_En : IN  std_logic;
         SPI_Din : IN  std_logic_vector(31 downto 0);
         SPI_Data : OUT  std_logic;
         SPI_Load : OUT  std_logic;
         SPI_Clock : OUT  std_logic;
         SPI_Ok : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SysRst_n : std_logic := '0';
   signal SysClk : std_logic := '0';
   signal SPI_En : std_logic := '0';
   signal SPI_Din : std_logic_vector(31 downto 0) := "01110000010010000011111100001111";

 	--Outputs
   signal DivCntO : std_logic_vector(6 downto 0);
   signal NumCntO : std_logic_vector(5 downto 0);
   signal CntEnO : std_logic;
   signal ClkEnO : std_logic;
   signal SPI_ShifterO : std_logic_vector(31 downto 0);
   signal EofO : std_logic;
   signal PrStateO : std_logic_vector(1 downto 0);
   signal SPI_Data : std_logic;
   signal SPI_Load : std_logic;
   signal SPI_Clock : std_logic;
   signal SPI_Ok : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPI_Set PORT MAP (
          DivCntO => DivCntO,
          NumCntO => NumCntO,
          CntEnO => CntEnO,
          ClkEnO => ClkEnO,
          SPI_ShifterO => SPI_ShifterO,
          EofO => EofO,
          PrStateO => PrStateO,
          SysRst_n => SysRst_n,
          SysClk => SysClk,
          SPI_En => SPI_En,
          SPI_Din => SPI_Din,
          SPI_Data => SPI_Data,
          SPI_Load => SPI_Load,
          SPI_Clock => SPI_Clock,
          SPI_Ok => SPI_Ok
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
	
	--SPI_En
	process
	begin
		SPI_En <= '0';
		wait for 1 us;
		SPI_En <= '1';
		wait for 1 ms;
		SPI_En <= '0';
		wait;
	end process;

END;