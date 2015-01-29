-- *********************************************************************/ 
-- Copyright 1998 Actel Corporation.  All rights reserved.
--  
-- File:  TBPACK.VHD
--
-- Description: Package used by the Testbench for the UART
--
-- Rev: 1.0 08Apr98 IPB  Development 1.0   
--
-- Notes:
--
-- *********************************************************************/ 


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library std;
use std.textio.all;

use work.textio.all;


package tbpack is
    
    ------------------------------------------------------------------
    -- Usefull Types 
    --       
    
    subtype byte is std_logic_vector(7 downto 0); 
    type INTEGER_ARRAY is array ( INTEGER range <>) of INTEGER;
    
    ------------------------------------------------------------------
    -- Record Structures used by the testbench 
    --       
    
    type oddeven is ( ODD,EVEN);
    
    type PASSCHECK is
    record
        n : integer;
        result  : integer_array ( 0 to 255) ;
    end record;  

    type TUARTconfig is
    record
        bit8               : std_logic;
        parity_en          : std_logic;
        odd_n_even         : std_logic;
        baud_val           : std_logic_vector(12 downto 0);
        baud_val_fraction  : std_logic_vector(2 downto 0);
    end record;  
    
    type TUARTstatus is
    record
        framing_err   : std_logic;
        parity_err    : std_logic;
        overflow      : std_logic;
        txrdy         : std_logic;
        rxrdy  : std_logic;
        UART_data_out : std_logic_vector(7 downto 0);
    end record;
    
    type Tcpucontrol is
    record
        sel1  : std_logic; 
        sel2  : std_logic; 
        WEn   : std_logic; 
        OEn   : std_logic; 
        data  : std_logic_vector(7 downto 0);
    end record;
    
    
    ------------------------------------------------------------------
    -- package declarations
    --       
    

    procedure printpass(
        passc  : in  passcheck
        );
    
    procedure printnewtest( str : STRING);
            
    procedure printerror(
        ERR  : inout BOOLEAN;
        str  : STRING);
        
    procedure waitclocks( N   : in INTEGER;
        signal clk : in std_logic);
    
    
    procedure cpu_write(
        N       : in  INTEGER range 1 to 2;
        data    : in  std_logic_vector;
        signal  clk     : in  std_logic;
        signal  control : out Tcpucontrol ); 
    
    procedure cpu_read( 
        N       : in  INTEGER range 1 to 2;
        data    : out std_logic_vector;
        signal  clk     : in  std_logic;
        signal  control : out Tcpucontrol;
        signal  status  : in  TUARTstatus ); 

    procedure txrxtest( 
        count              : in    INTEGER range 1 to 256;
        signal clk         : in    std_logic;
        signal cpucontrol  : out   Tcpucontrol;
        signal UARTstatus1 : in    TUARTstatus;
        signal UARTstatus2 : in    TUARTstatus;
        err               : inout BOOLEAN; 
        signal passc               : inout passcheck ); 

     procedure paritytest( 
        count              : in    INTEGER range 1 to 256;
        RX_FIFO            : in    INTEGER;
        signal clk         : in    std_logic;
        signal cpucontrol  : out   Tcpucontrol;
        signal UARTstatus1 : in    TUARTstatus;
        signal UARTstatus2 : in    TUARTstatus;
        signal UARTconfig1 : out   TUARTconfig;
        signal UARTconfig2 : out   TUARTconfig;
        constant config1     : in    std_logic_vector(2 downto 0);
        constant config2     : in    std_logic_vector(2 downto 0);
        err                : inout BOOLEAN ;
        signal passc               : inout passcheck ); 

     procedure testoverflow(
        signal clk          : in      std_logic;
        signal cpucontrol   : out     Tcpucontrol;
        signal UARTstatus1  : in      TUARTstatus;
        signal UARTstatus2  : in      TUARTstatus;
        err                 : inout   BOOLEAN ;
        signal passc               : inout passcheck ); 
    
    procedure testoverflowfifo( 
        count              : in    INTEGER range 1 to 257;
        signal clk         : in    std_logic;
        signal cpucontrol  : out   Tcpucontrol;
        signal UARTstatus1 : in    TUARTstatus;
        signal UARTstatus2 : in    TUARTstatus;
        err               : inout BOOLEAN; 
        signal passc               : inout passcheck ); 
    
    
end tbpack;

------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------


package body tbpack is
    
    
    ------------------------------------------------------------------
    -- Misc Print Routines
    --       
    
--    procedure printf( str  : STRING) is
--    file FSTR : TEXT is out"STD_OUTPUT";
--    variable ll   : LINE;
--    begin
--        write( ll , str );
--        writeline(FSTR, ll);
--    end printf;
--
    procedure printnewtest( str : STRING) is
    begin
        printf("-----------------------------------------------------");
        printf(str);
    end printnewtest;

    procedure printpass ( passc : passcheck ) is
	variable passflag : integer;
    begin
	passflag := 1;
	for i in 0 to passc.n loop
		if passc.result(i) = 0 then
			passflag := 0;
		end if;
	end loop;
        printf("-----------------------------------------------------");
        printf("-----------------------------------------------------");
	if passflag = 1 then
		printf("ALL TESTS ARE PASSED");
	else
		printf("ONE OR MORE TESTS ARE FAILED");
	end if;
        printf("-----------------------------------------------------");
        printf("-----------------------------------------------------");
    end printpass;

    procedure printerror(ERR  : inout BOOLEAN;
                         str  : STRING) is
    variable str1 : STRING ( 1 to 40);
    file FSTR : TEXT is out "STD_OUTPUT";
    variable ll   : LINE;
    begin
       ERR  := TRUE;
       str1(1 to 7) := "ERROR: ";
       for i in str'range loop
           str1(i+7) := str(i);
       end loop;
       write( ll , str1 );
       writeline(FSTR, ll);
       assert FALSE
         report "ERROR OCCURED"
         severity ERROR;  
    end printerror;


    ------------------------------------------------------------------
    -- Misc Type conversions   
    --       


    function to_logic( x : boolean) return std_logic is
    begin
       if x then 
       return('1');
       else
       return('0');
       end if;
    end to_logic;

    function to_boolean( x : std_logic) return boolean is
    begin
       if to_X01(x)='1' then 
          return(TRUE);
       else
          return(FALSE);
       end if;
    end to_boolean;

    procedure waitclocks( N   : in INTEGER;
                         signal clk : in std_logic) is
    begin
      for i in 1 to N loop
         wait until clk'event and clk='1';
      end loop;
    end waitclocks;

    ------------------------------------------------------------------
    -- basic CPU read and write cycles 
    --       


    procedure cpu_write(N       : in  INTEGER range 1 to 2;
                        data    : in  std_logic_vector;
                        signal  clk     : in  std_logic;
                        signal  control : out Tcpucontrol ) is 
    begin
         case N is 
           when 1 =>  control.sel1  <= '0';
           when 2 =>  control.sel2  <= '0';
         end case;
       control.OEn <= '1';
       control.data  <= data;
       control.WEn   <= '0';
       waitclocks(1,clk);
       control.WEn   <= '1';
       waitclocks(1,clk);
       control.sel1  <= '1';
       control.sel2  <= '1';
       control.data  <= (others => 'Z');
       waitclocks(1,clk);
    end cpu_write;  


    procedure cpu_read( N       : in  INTEGER range 1 to 2;
                        data    : out std_logic_vector;
                        signal  clk     : in  std_logic;
                        signal  control : out Tcpucontrol;
                        signal  status  : in  TUARTstatus ) is 
    begin         
       case N is 
         when 1 =>  control.sel1 <= '0';
         when 2 =>  control.sel2 <= '0';
       end case;
       control.OEn  <= '0';
       control.WEn  <= '1';
       control.data  <= (others => 'Z');
       waitclocks(1,clk);
       control.sel1  <= '1';
       control.sel2  <= '1';
       control.OEn   <= '1';
       waitclocks(4,clk);
       data := status.UART_data_out;
    end cpu_read;  

    procedure txrxtest( count              : in    INTEGER range 1 to 256;
                        signal clk         : in    std_logic;
                        signal cpucontrol  : out   Tcpucontrol;
                        signal UARTstatus1 : in    TUARTstatus;
                        signal UARTstatus2 : in    TUARTstatus;
                        err                : inout BOOLEAN;
                        signal passc                : inout passcheck
	 ) is
    variable tdata       : integer_array (0 to 255);
    variable rdata       : integer_array (0 to 255);
    variable bdata       : BYTE;
    variable rc,tc       : INTEGER;
    variable passflag    : INTEGER;
    begin
        printf("Testing Continuous Data Stream UART1 to UART2");
        -- Initialiase test data
        tc := 0; rc :=0;
        for i in tdata'range loop
          tdata(i)   := i;
        end loop;
        while rc<count loop
          waitclocks(1,clk);
            -- Firstly See if the Transmitter is ready
            if tc<count then
              if UARTstatus1.txrdy = '1' then
                bdata := conv_std_logic_vector( tdata(tc),8);
                cpu_write(1,bdata,clk,cpucontrol); 
                tc := tc+1;
              end if; 
            end if;
            -- Now See if any received data
            if UARTstatus2.rxrdy = '1' then
              cpu_read(2,bdata,clk,cpucontrol,UARTstatus2); 
              rdata(rc)   := conv_integer(bdata);
              rc := rc + 1;
            end if;
        end loop;
        -- Verify that correct data received
	passflag := 1;
        for i in 0 to count-1 loop
           if rdata(i)/=tdata(i) then
              --printerror(ERR,"txrxtest data mismatch");
		passflag := 0;
           end if;
        end loop;

	if passflag = 0 then
        	printf("THIS TEST IS FAILED\n");
	else
        	printf("THIS TEST IS PASSED\n");
	end if;
	
	passc.result(passc.n) <= passflag;
	passc.n <= passc.n + 1;
    end txrxtest;     

    procedure paritytest( count              : in    INTEGER range 1 to 256;
                          RX_FIFO            : in    INTEGER ;
                          signal clk         : in    std_logic;
                          signal cpucontrol  : out   Tcpucontrol;
                          signal UARTstatus1 : in    TUARTstatus;
                          signal UARTstatus2 : in    TUARTstatus;
                          signal UARTconfig1 : out   TUARTconfig;
                          signal UARTconfig2 : out   TUARTconfig;
                          constant config1     : in    std_logic_vector(2 downto 0);
                          constant config2     : in    std_logic_vector(2 downto 0);
                          err                : inout BOOLEAN;
			  signal passc               : inout passcheck ) is
    variable tdata       : integer_array (0 to 255);
    variable rdata       : integer_array (0 to 255);
    variable par_err     : integer_array (0 to 255);
    variable bdata       : BYTE;
    variable rc,tc       : INTEGER;
    variable passflag       : INTEGER;
    begin
        printf("Testing parity error generation");
        UARTconfig1.bit8 <= config1(2);
        UARTconfig1.parity_en <= config1(1);
        UARTconfig1.odd_n_even <= config1(0);
        UARTconfig2.bit8 <= config2(2);
        UARTconfig2.parity_en <= config2(1);
        UARTconfig2.odd_n_even <= config2(0);
        waitclocks(10,clk);
        -- Initialiase test data
        tc := 0; rc :=0;
        for i in tdata'range loop
          tdata(i)   := i;
          par_err(i) := 0;
        end loop;
        while rc<count loop
          waitclocks(1,clk);
            -- Firstly See if the Transmitter is ready
            if tc<count then
              if UARTstatus1.txrdy = '1' then
                bdata := conv_std_logic_vector( tdata(tc),8);
                cpu_write(1,bdata,clk,cpucontrol); 
                tc := tc+1;
              end if; 
            end if;
            -- Now See if any received data
           if (RX_FIFO = 0) then
            if UARTstatus2.rxrdy = '1' then
              par_err(rc) := conv_integer(UARTstatus2.parity_err); 
              cpu_read(2,bdata,clk,cpucontrol,UARTstatus2); 
              rdata(rc)   := conv_integer(bdata);
              rc := rc + 1;
            end if;
           else
            if UARTstatus2.parity_err = '1' then
              par_err(rc) := conv_integer(UARTstatus2.parity_err); 
              cpu_read(2,bdata,clk,cpucontrol,UARTstatus2); 
              rdata(rc)   := conv_integer(bdata);
              rc := rc + 1;
            end if;
           end if;
        end loop;
	passflag := 1;
        for i in 0 to count-1 loop
           if par_err(i)/=1 then
		passflag := 0;
           end if;
        end loop;

	if passflag = 0 then
        	printf("THIS TEST IS FAILED\n");
	else
        	printf("THIS TEST IS PASSED\n");
	end if;
	passc.result(passc.n) <= passflag;
	passc.n <= passc.n + 1;

    end paritytest;     


    procedure testoverflow( signal clk         : in      std_logic;
                            signal cpucontrol  : out     Tcpucontrol;
                            signal UARTstatus1 : in      TUARTstatus;
                            signal UARTstatus2 : in      TUARTstatus;
                            err                : inout   BOOLEAN;
		  	    signal passc               : inout passcheck ) is
    variable data   : BYTE;
    begin
        
       printf("Testing for RX data overflow");
       cpu_write(1,"10100101",clk,cpucontrol);
       waitclocks(5,clk);
       if UARTstatus2.overflow = '1' then
         printerror(ERR,"Overflow set to early");
       end if;


       if UARTstatus1.txrdy = '1' then
         cpu_write(1,"01011010",clk,cpucontrol);
         wait until UARTstatus2.overflow = '1';
         waitclocks(10,clk);
       else
         wait until UARTstatus1.txrdy = '1';
         cpu_write(1,"01011010",clk,cpucontrol);
         waitclocks(10,clk);
         wait until UARTstatus2.overflow = '1';
         waitclocks(10,clk);
       end if;

       -- Get the byte, should be the first one
       if UARTstatus2.rxrdy = '1' then
         cpu_read(2,data,clk,cpucontrol,UARTstatus2);
       else
         wait until UARTstatus2.rxrdy = '1';
         cpu_read(2,data,clk,cpucontrol,UARTstatus2);
       end if;
       if data /= "10100101" then
		printf("THIS TEST IS FAILED\n");
		passc.result(passc.n) <= 0;
	else
        	printf("THIS TEST IS PASSED\n");
		passc.result(passc.n) <= 1;
       end if;
	passc.n <= passc.n + 1;

       waitclocks(5,clk);
       cpu_write(1,"01011010",clk,cpucontrol);
       
    end testoverflow;

    procedure testoverflowfifo( count              : in    INTEGER range 1 to 257;
                        signal clk         : in    std_logic;
                        signal cpucontrol  : out   Tcpucontrol;
                        signal UARTstatus1 : in    TUARTstatus;
                        signal UARTstatus2 : in    TUARTstatus;
                        err                : inout BOOLEAN;
                        signal passc                : inout passcheck
	 ) is
    variable tdata       : integer_array (0 to 256);
    variable rdata       : integer_array (0 to 256);
    variable bdata       : BYTE;
    variable rc,tc       : INTEGER;
    variable passflag    : INTEGER;
    begin
        printf("Testing for RX data overflow");
        -- Initialiase test data
        tc := 0; rc :=0;
        for i in tdata'range loop
          tdata(i)   := i;
        end loop;
          
           
            while (tc<count) loop
              WAIT UNTIL (clk'EVENT AND clk = '1');
              IF (tc < count) THEN
                  -- Firstly See if the Transmitter is read
              if UARTstatus1.txrdy = '1' then
                bdata := conv_std_logic_vector( tdata(tc),8);
                cpu_write(1,bdata,clk,cpucontrol); 
                tc := tc+1;
              end if; 
            end if;
           end loop;
            -- Now See if any received data
            WAIT UNTIL (UARTstatus2.overflow'EVENT AND UARTstatus2.overflow = '1');
              cpu_read(1,bdata,clk,cpucontrol,UARTstatus2); 
              rdata(0)   := conv_integer(bdata);
        
        -- Verify that correct data received
           if rdata(0)/=tdata(0) then
        	printf("THIS TEST IS FAILED\n");
	    else
        	printf("THIS TEST IS PASSED\n");
           end if;

    end testoverflowfifo;     

 end tbpack;
