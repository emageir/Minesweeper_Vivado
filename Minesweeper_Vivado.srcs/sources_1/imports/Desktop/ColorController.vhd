----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:55:09 03/26/2014 
-- Design Name: 
-- Module Name:    ColorController - Behavioral 
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

entity ColorController is
    Port ( LRControl : in  STD_LOGIC;
           RRControl : in  STD_LOGIC;
           BControl : in  STD_LOGIC;
           RED : out  STD_LOGIC_VECTOR (2 downto 0);
           GREEN : out  STD_LOGIC_VECTOR (2 downto 0);
           BLUE : out  STD_LOGIC_VECTOR (1 downto 0));
end ColorController;

architecture Behavioral of ColorController is

begin

process(LRControl,RRControl,BControl)
begin

if ( (LRControl='1') or (RRControl='1') or (BControl='1') ) then
	RED<="111";
	GREEN<="111";
	BLUE<="11";--ASPRO
elsif ( (LRControl='0') and (RRControl='0') and (BControl='0') ) then
	RED<="000";
	GREEN<="000";
	BLUE<="00";--MAYRO
end if;
	
end process;

end Behavioral;

