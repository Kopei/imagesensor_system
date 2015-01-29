--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:19:56 11/21/2013
-- Design Name:   
-- Module Name:   E:/FQ/VHDL/CMOS_DrvX/CMOS_DrvX/SRAM_CtlTb.vhd
-- Project Name:  CMOS_DrvX
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SRAM_Ctl
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
 
ENTITY SRAM_CtlTb IS
END SRAM_CtlTb;
 
ARCHITECTURE behavior OF SRAM_CtlTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SRAM_Ctl
    PORT(
         SysRst_n : IN  std_logic;
         SysClk : IN  std_logic;
         SRAM_WrEn : IN  std_logic;
         SRAM_RdEn : IN  std_logic;
         ADC_RdEn : IN  std_logic;
         ADC_Din : IN  std_logic_vector(13 downto 0);
         SRAM_CtlOk : OUT  std_logic;
         SRAM_Addr : OUT  std_logic_vector(18 downto 0);
         SRAM_CE_n : OUT  std_logic_vector(2 downto 0);
         SRAM_WE_n : OUT  std_logic;
         SRAM_OE_n : OUT  std_logic;
         SRAM_B_n : OUT  std_logic_vector(3 downto 0);
         SRAM_Data : INOUT  std_logic_vector(31 downto 0);
         Tok : OUT  std_logic;
         Sclk : OUT  std_logic;
         Sdat : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SysRst_n : std_logic := '0';
   signal SysClk : std_logic := '0';
   signal SRAM_WrEn : std_logic := '0';
   signal SRAM_RdEn : std_logic := '0';
   signal ADC_RdEn : std_logic := '0';
   signal ADC_Din : std_logic_vector(13 downto 0) := (others => '0');

	--BiDirs
   signal SRAM_Data : std_logic_vector(31 downto 0);

 	--Outputs
   signal SRAM_CtlOk : std_logic;
   signal SRAM_Addr : std_logic_vector(18 downto 0);
   signal SRAM_CE_n : std_logic_vector(2 downto 0);
   signal SRAM_WE_n : std_logic;
   signal SRAM_OE_n : std_logic;
   signal SRAM_B_n : std_logic_vector(3 downto 0);
   signal Tok : std_logic;
   signal Sclk : std_logic;
   signal Sdat : std_logic;

   -- Clock period definitions
   constant Sclk_period : time := 1us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SRAM_Ctl PORT MAP (
          SysRst_n => SysRst_n,
          SysClk => SysClk,
          SRAM_WrEn => SRAM_WrEn,
          SRAM_RdEn => SRAM_RdEn,
          ADC_RdEn => ADC_RdEn,
          ADC_Din => ADC_Din,
          SRAM_CtlOk => SRAM_CtlOk,
          SRAM_Addr => SRAM_Addr,
          SRAM_CE_n => SRAM_CE_n,
          SRAM_WE_n => SRAM_WE_n,
          SRAM_OE_n => SRAM_OE_n,
          SRAM_B_n => SRAM_B_n,
          SRAM_Data => SRAM_Data,
          Tok => Tok,
          Sclk => Sclk,
          Sdat => Sdat
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
	
	--SRAM_WrEn SRAM_RdEn
	process
	begin
		SRAM_WrEn <= '0';
		ADC_RdEn <= '0';
		SRAM_RdEn <= '0';
		ADC_Din <= (others => '0');
		wait for 1 us;
		SRAM_WrEn <= '1';
		ADC_RdEn <= '0';
		SRAM_RdEn <= '0';
		wait for 1 us;
		SRAM_WrEn <= '1';
		ADC_RdEn <= '1';
		SRAM_RdEn <= '0';
		ADC_Din <= "10001010000010";
		wait for 20 us;
		SRAM_WrEn <= '1';
		ADC_RdEn <= '0';
		SRAM_RdEn <= '0';
		wait for 1 us;
		SRAM_WrEn <= '1';
		ADC_RdEn <= '1';
		SRAM_RdEn <= '0';
		ADC_Din <= "01001010001010";
		wait for 20 us;
		SRAM_WrEn <= '1';
		ADC_RdEn <= '0';
		SRAM_RdEn <= '0';
		wait for 1 us;
		SRAM_WrEn <= '1';
		ADC_RdEn <= '1';
		SRAM_RdEn <= '0';
		ADC_Din <= "00010000001001";
		wait for 20 us;
		SRAM_WrEn <= '0';
		ADC_RdEn <= '0';
		SRAM_RdEn <= '1';
		wait for 80 us;
		SRAM_WrEn <= '0';
		ADC_RdEn <= '0';
		SRAM_RdEn <= '0';
		ADC_Din <= (others => '0');
		wait;		
	end process;
	
	--SRAM_Data
	SRAM_Data <= "10100000100011111010100000001010" when SRAM_RdEn = '1' else (others => 'Z');
END;