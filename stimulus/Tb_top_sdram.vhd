-- Tb_top_sdram.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;
-------------------------------------------------
entity TB_top_sdram is
end entity;
     
architecture ARCH of  TB_top_sdram is


component top_sdram is

    port( Sysclk       : in    std_logic;
          rst_n        : in    std_logic;
          ras_n        : out   std_logic;
          cas_n        : out   std_logic;
          we_n         : out   std_logic;
          Fifo_RAfull  : in    std_logic;
          Fifo_Wafull  : in    std_logic;
          LVDS_En      : in    std_logic;
          GLB          : in    std_logic;
          SDRAM_En     : in    std_logic;
          DQ           : inout std_logic_vector(71 downto 0) := (others => 'Z');
          Sys_dataIn   : in    std_logic_vector(71 downto 0);
          Sys_dataOut  : out   std_logic_vector(71 downto 0);
          SDoneFrameOk : out   std_logic;
          cke          : out   std_logic_vector(1 downto 0);
          cs_n         : out   std_logic_vector(1 downto 0);
          SD_Clk       : out   std_logic_vector(1 downto 0);
          dqm          : out   std_logic_vector(7 downto 0);
          addr         : out   std_logic_vector(12 downto 0);
          ba           : out   std_logic_vector(1 downto 0);
          RFifo_we     : out   std_logic;
          WFifo_re     : out   std_logic;
          RefEn        : in    std_logic
        );

end component ;

signal			Sysclk       :  std_logic;
signal         rst_n        :  std_logic;
signal         ras_n        : std_logic;
signal         cas_n        :  std_logic;
signal        we_n         :  std_logic;
signal         Fifo_RAfull  :  std_logic;
signal        Fifo_Wafull  :  std_logic;
signal        LVDS_En      :  std_logic;
signal      GLB          :  std_logic;
signal        SDRAM_En     :  std_logic;
signal       DQ           :  std_logic_vector(71 downto 0) := (others => 'Z');
signal        Sys_dataIn   :  std_logic_vector(71 downto 0);
signal         Sys_dataOut  :  std_logic_vector(71 downto 0);
signal        SDoneFrameOk :  std_logic;
signal       cke          :  std_logic_vector(1 downto 0);
signal        cs_n         :  std_logic_vector(1 downto 0);
signal       SD_Clk       :  std_logic_vector(1 downto 0);
signal         dqm          :  std_logic_vector(7 downto 0);
signal       addr         :  std_logic_vector(12 downto 0);
signal       ba           :  std_logic_vector(1 downto 0);
signal        RFifo_we     :  std_logic;
signal       WFifo_re     :  std_logic;
signal        RefEn        :  std_logic;

begin
uut: 	top_SDRAM port map
		(
		sysclk => sysclk, rst_n  => rst_n,glb => glb,lvds_en => lvds_en,Sys_dataIn => Sys_dataIn, Fifo_RAfull => Fifo_RAfull,Fifo_WAfull => Fifo_WAfull,
		Sdram_en => Sdram_en, RFifo_we => RFifo_we, WFifo_re => WFifo_re, SD_clk => SD_clk, DQ => DQ, Sys_dataOut => Sys_dataOut,RefEn => RefEn,
		ras_n => ras_n,cas_n => cas_n, we_n => we_n, cke => cke, cs_n => cs_n, dqm => dqm, addr => addr, ba => ba	,SDoneFrameOk => SDoneFrameOk	
		);
process

	begin
		sysclk <= '0';
		wait for  15.15 ns /2;
		sysclk <= '1';
		wait for 15.15 ns /2;
end process;		
   	
process
	begin
		rst_n <= '0';
		wait for  0.6 us;
		rst_n <= '1';
		wait;
end process;
	
   	

process
	begin
		SDram_EN <= '0';
		lvds_en <= '0';
		wait for 306 us;
		SDram_EN <= '1';
		wait for 60 ms;	
		SDram_EN <= '0';
		wait for 30 ns;
		lvds_en <= '1';
		wait for 60 ms;
		
end process;
process
	begin
		Fifo_RAfull <= '1';
		Fifo_WAfull <='0';
		wait for 306 us;
		Fifo_RAfull <= '0';
		wait for 300 ns ;
		Fifo_RAfull <= '1';
		wait for 15 ns * 20;
		Fifo_WAfull <='1';
		wait for 15 ns;
		Fifo_WAfull <='0';
		wait for 15*31 ns;
		Fifo_WAfull <='1';
		wait for 15 ns;
		Fifo_WAfull <='0';
		wait for 15.15 ns * 31;
		Fifo_WAfull <='1';
		wait for 15 ns;
		Fifo_WAfull <='0';
		wait for 15.15 ns * 31;
		Fifo_WAfull <='1';
		wait for 15 ns;
end process;
process
	begin
		Sys_dataIn <= (others => '0');
		wait for 306 us;
		Sys_dataIn <= (others => '1');
		wait for 306 us;
		Sys_dataIn <= (others => '0');		
end process;		
dqgen: process
begin
		dq <= (others => 'Z');
		wait for 306 us;
		wait for 100 ns;
		dq <= (0 => '1',2 => '1',others => '0');
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 20 ns ;
		dq <= dq + 8 ;
		wait for 150 ns;
		-- dq <= (others => 'Z');
		-- wait 430 ns;
		-- da <= (0 => '1',2 => '1',others => '1');
		-- wait for 150 ns;
	end process;	
end arch;		