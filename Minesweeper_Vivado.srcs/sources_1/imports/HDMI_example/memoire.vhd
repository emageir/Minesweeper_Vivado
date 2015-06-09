----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:40:40 11/28/2014 
-- Design Name: 
-- Module Name:    memoire - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoire is
    Port ( Clk : in STD_LOGIC;
			  X : in  STD_LOGIC_VECTOR(9 DOWNTO 0);
           Y : in  STD_LOGIC_VECTOR(9 DOWNTO 0);
           pixel : out  STD_LOGIC);
end memoire;

architecture Behavioral of memoire is

component WelcomeScreen
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(799 DOWNTO 0)
  );
END component;

signal trimmed: STD_LOGIC_VECTOR(0 to 799);

begin

Conn: WelcomeScreen PORT MAP(
		clka => Clk,
		addra => X,
		douta => trimmed);
		
pixel <= trimmed(to_integer(unsigned(Y)));

end Behavioral;

