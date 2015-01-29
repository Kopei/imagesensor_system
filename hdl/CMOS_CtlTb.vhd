LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY CMOS_CtlTb IS
END CMOS_CtlTb;
 
ARCHITECTURE behavior OF CMOS_CtlTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CMOS_Ctl
    PORT(
         SysRst_n : IN  std_logic;
         SysClk : IN  std_logic;
         Y_X_WaveOk : IN  std_logic;
         SPI_Ok : IN  std_logic;
         PAT_Ok : IN  std_logic;
         Y_X_WaveEn : OUT  std_logic;
         SPI_En : OUT  std_logic;
         SPI_Din : OUT  std_logic_vector(31 downto 0);
         InitTime : OUT  std_logic_vector(17 downto 0);
         PAT_En : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SysRst_n : std_logic := '0';
   signal SysClk : std_logic := '0';
   signal Y_X_WaveOk : std_logic := '0';
   signal SPI_Ok : std_logic := '0';
   signal PAT_Ok : std_logic := '0';

 	--Outputs
   signal Y_X_WaveEn : std_logic;
   signal SPI_En : std_logic;
   signal SPI_Din : std_logic_vector(31 downto 0);
   signal InitTime : std_logic_vector(17 downto 0);
   signal PAT_En : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CMOS_Ctl PORT MAP (
          SysRst_n => SysRst_n,
          SysClk => SysClk,
          Y_X_WaveOk => Y_X_WaveOk,
          SPI_Ok => SPI_Ok,
          PAT_Ok => PAT_Ok,
          Y_X_WaveEn => Y_X_WaveEn,
          SPI_En => SPI_En,
          SPI_Din => SPI_Din,
          InitTime => InitTime,
          PAT_En => PAT_En
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
	
	--Y_X_WaveOk
	process
	begin
		Y_X_WaveOk <= '0';
		wait for 10 us;
		Y_X_WaveOk <= '1';
		wait for 100 ns;		
	end process;
	
	--SPI_Ok
	process
	begin
		SPI_Ok <= '0';
		wait for 11 us;
		SPI_Ok <= '1';
		wait for 100 ns;		
	end process;	

	--PAT_Ok
	process
	begin
		PAT_Ok <= '0';
		wait for 12 us;
		PAT_Ok <= '1';
		wait for 100 ns;		
	end process;
	
END;