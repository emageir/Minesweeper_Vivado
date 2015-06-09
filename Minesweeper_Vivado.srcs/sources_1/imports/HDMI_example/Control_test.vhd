--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:29:14 01/07/2015
-- Design Name:   
-- Module Name:   C:/xprojects/playground/HDMI_example/Control_test.vhd
-- Project Name:  HDMI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control
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
 
ENTITY Control_test IS
END Control_test;
 
ARCHITECTURE behavior OF Control_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Rnd_Enable : IN  std_logic;
         Data_in : IN  std_logic_vector(4 downto 0);
         X_cursor : IN  std_logic_vector(4 downto 0);
         Y_cursor : IN  std_logic_vector(4 downto 0);
         Confirm : IN  std_logic;
         Data_out : OUT  std_logic_vector(4 downto 0);
         X_out : OUT  std_logic_vector(4 downto 0);
         Y_out : OUT  std_logic_vector(4 downto 0);
         Score_out : OUT  std_logic_vector(11 downto 0);
         Last_hit_P1 : OUT  std_logic_vector(9 downto 0);
         Last_hit_P2 : OUT  std_logic_vector(9 downto 0);
         Ini_Done : OUT  std_logic;
         Winner : OUT  std_logic_vector(1 downto 0);
         Play_Done : OUT  std_logic;
         OpenRest_Done : OUT  std_logic;
         Request_Set : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Rnd_Enable : std_logic := '0';
   signal Data_in : std_logic_vector(4 downto 0) := (others => '0');
   signal X_cursor : std_logic_vector(4 downto 0) := (others => '0');
   signal Y_cursor : std_logic_vector(4 downto 0) := (others => '0');
   signal Confirm : std_logic := '0';

 	--Outputs
   signal Data_out : std_logic_vector(4 downto 0);
   signal X_out : std_logic_vector(4 downto 0);
   signal Y_out : std_logic_vector(4 downto 0);
   signal Score_out : std_logic_vector(11 downto 0);
   signal Last_hit_P1 : std_logic_vector(9 downto 0);
   signal Last_hit_P2 : std_logic_vector(9 downto 0);
   signal Ini_Done : std_logic;
   signal Winner : std_logic_vector(1 downto 0);
   signal Play_Done : std_logic;
   signal OpenRest_Done : std_logic;
   signal Request_Set : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Rnd_Enable => Rnd_Enable,
          Data_in => Data_in,
          X_cursor => X_cursor,
          Y_cursor => Y_cursor,
          Confirm => Confirm,
          Data_out => Data_out,
          X_out => X_out,
          Y_out => Y_out,
          Score_out => Score_out,
          Last_hit_P1 => Last_hit_P1,
          Last_hit_P2 => Last_hit_P2,
          Ini_Done => Ini_Done,
          Winner => Winner,
          Play_Done => Play_Done,
          OpenRest_Done => OpenRest_Done,
          Request_Set => Request_Set
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100000 ns;
		Rnd_Enable <= '1';

      wait;
   end process;

END;
