-- tb_fk_test.vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_fk_test IS
END tb_fk_test;
 
ARCHITECTURE behavior OF tb_fk_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fk_test
    PORT(
        SysClk			:in		std_logic;
		SysRst_n        :in		std_logic;
		LVDS_en			:in		std_logic;
		ByteRdEn		:in		std_logic;
		SDram2FK		:in		std_logic_vector(71 downto 0);
		PKGType			:in		std_logic_vector(2 downto 0);
		PKGCnt			:in		std_logic_vector(15 downto 0);
		FrameCnt		:in		std_logic_vector(8 downto 0);
		SubFrameMode	:in		std_logic_vector(1 downto 0);
		SubFrameMotor	:in		std_logic_vector(5 downto 0);
		BandNum			:in		std_logic_vector(3 downto 0);
		IntTime			:in		std_logic_vector(5 downto 0);
		AccNum			:in		std_logic_vector(5 downto 0);
		RowCnt			:in		std_logic_vector(11 downto 0);
		PKGDataLength	:in		std_logic_vector(15 downto 0);
		LVDS_O			:out	std_logic;
		LVDS_ok			:out	std_logic
        );
    END COMPONENT;
    
signal		SysClk			:		std_logic;
signal		SysRst_n        :		std_logic;
signal		LVDS_en			:		std_logic;
signal		ByteRdEn		:		std_logic;
signal		SDram2FK		:		std_logic_vector(71 downto 0):=(0 => '0',14 => '0',others => '1');
signal		PKGType			:		std_logic_vector(2 downto 0):="001";
signal		PKGCnt			:		std_logic_vector(15 downto 0):=(others => '0');
signal		FrameCnt		:		std_logic_vector(8 downto 0):=(others => '0');
signal		SubFrameMode	:		std_logic_vector(1 downto 0):="00";
signal		SubFrameMotor	:		std_logic_vector(5 downto 0):=(others => '0');
signal		BandNum			:		std_logic_vector(3 downto 0):=(others => '0');
signal		IntTime			:		std_logic_vector(5 downto 0):=(others => '0');
signal		AccNum			:		std_logic_vector(5 downto 0):=(0 => '1',1 => '1',others => '0');
signal		RowCnt			:		std_logic_vector(11 downto 0):=(11  => '0',others => '1');
signal		PKGDataLength	:		std_logic_vector(15 downto 0):="0000110111111111";--3583
signal		LVDS_O			:		std_logic;
signal		LVDS_ok			:		std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fk_test PORT MAP (
		SysClk			=>   SysClk,
		SysRst_n        =>   SysRst_n,
		LVDS_en			=>   LVDS_en,
		ByteRdEn		=>   ByteRdEn,
		SDram2FK		=>   SDram2FK,
		PKGType			=>   PKGType,
		PKGCnt			=>   PKGCnt,
		FrameCnt		=>   FrameCnt,
		SubFrameMode	=>   SubFrameMode,
		SubFrameMotor	=>   SubFrameMotor,
		BandNum			=>   BandNum,
		IntTime			=>   IntTime,
		AccNum			=>   AccNum,
		RowCnt			=>   RowCnt,
		PKGDataLength	=>   PKGDataLength,
		LVDS_O			=>   LVDS_O,
		LVDS_ok			=>   LVDS_ok
        );
 
   --SysClk_80M Gen
   process
   begin
		Sysclk <= '0';
		wait for 15.15 ns/2;
		Sysclk <= '1';
		wait for 15.15 ns/2;
   end process;
 
   --SysRst_n Gen
   process
   begin
		SysRst_n <= '0';
		wait for 0.1 us;
		SysRst_n <= '1';
		wait;
   end process;
   
   --LVDS_n
   process
   begin
		LVDS_en <= '0';
		wait for 2 us;
		LVDS_en <= '1' ;
		wait for 1 ms;
		LVDS_en <= '0';
		wait for 200 us;
   end process;

	process
	begin
		ByteRdEn <= '0' ;
		wait until LVDS_en = '1';
		wait for 15.15 * 25 ns;
		ByteRdEn <= '1' ;
		wait for 3584 * 15.15 ns;
		ByteRdEn <= '0' ;
		wait for 32530 * 15.15 ns;
		ByteRdEn <= '1' ;
		wait until LVDS_en = '0';
	end process;	
END;
