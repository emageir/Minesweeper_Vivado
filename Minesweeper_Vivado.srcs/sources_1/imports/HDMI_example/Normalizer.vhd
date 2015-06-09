----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:16:19 01/07/2015 
-- Design Name: 
-- Module Name:    Normalizer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Normalizer is

	port(
		clk        : in std_logic;
		reset      : in std_logic;
		button_in  : in std_logic;
		button_out : out std_logic
	);

end Normalizer;

architecture Behavioral of Normalizer is

signal button_debounced : STD_LOGIC;

begin

debouncer: entity work.debounce PORT MAP(
		clk => clk,
		reset => reset,
		button_in => button_in,
		button_out => button_debounced
	);
	
tester: entity work.test_button PORT MAP(
		clk => clk,
		rst => reset,
		in_bit => button_debounced,
		out_bit => button_out
	);

end Behavioral;

