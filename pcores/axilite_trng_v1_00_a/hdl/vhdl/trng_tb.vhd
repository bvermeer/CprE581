--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:17:16 11/14/2014
-- Design Name:   
-- Module Name:   /home/ajmills/zedboard-trng/pcores/axilite_trng_v1_00_a/devl/projnav/trng_tb.vhd
-- Project Name:  axilite_trng
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: user_logic
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

--library axilite_trng_v1_00_a;
--use  axilite_trng_v1_00_a.user_logic;
 
library work;

 
ENTITY trng_tb IS
END trng_tb;
 
ARCHITECTURE behavior OF trng_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT user_logic
    PORT(
         Bus2IP_Clk : IN  std_logic;
         Bus2IP_Resetn : IN  std_logic;
         Bus2IP_Data : IN  std_logic_vector(31 downto 0);
         Bus2IP_BE : IN  std_logic_vector(3 downto 0);
         Bus2IP_RdCE : IN  std_logic_vector(31 downto 0);
         Bus2IP_WrCE : IN  std_logic_vector(31 downto 0);
         IP2Bus_Data : OUT  std_logic_vector(31 downto 0);
         IP2Bus_RdAck : OUT  std_logic;
         IP2Bus_WrAck : OUT  std_logic;
         IP2Bus_Error : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Bus2IP_Clk : std_logic := '0';
   signal Bus2IP_Resetn : std_logic := '0';
   signal Bus2IP_Data : std_logic_vector(31 downto 0) := (others => '0');
   signal Bus2IP_BE : std_logic_vector(3 downto 0) := (others => '0');
   signal Bus2IP_RdCE : std_logic_vector(31 downto 0) := (others => '0');
   signal Bus2IP_WrCE : std_logic_vector(31 downto 0) := (others => '0');
 	--Outputs
   signal IP2Bus_Data : std_logic_vector(31 downto 0);
   signal IP2Bus_RdAck : std_logic;
   signal IP2Bus_WrAck : std_logic;
   signal IP2Bus_Error : std_logic;

   -- Clock period definitions
   constant Bus2IP_Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: user_logic PORT MAP (
          Bus2IP_Clk => Bus2IP_Clk,
          Bus2IP_Resetn => Bus2IP_Resetn,
          Bus2IP_Data => Bus2IP_Data,
          Bus2IP_BE => Bus2IP_BE,
          Bus2IP_RdCE => Bus2IP_RdCE,
          Bus2IP_WrCE => Bus2IP_WrCE,
          IP2Bus_Data => IP2Bus_Data,
          IP2Bus_RdAck => IP2Bus_RdAck,
          IP2Bus_WrAck => IP2Bus_WrAck,
          IP2Bus_Error => IP2Bus_Error
        );

   -- Clock process definitions
   Bus2IP_Clk_process :process
   begin
		Bus2IP_Clk <= '0';
		wait for Bus2IP_Clk_period/2;
		Bus2IP_Clk <= '1';
		wait for Bus2IP_Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Bus2IP_Resetn <= '1';
		Bus2IP_RdCE<="00000000000000000000000000000001";

      wait for Bus2IP_Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
