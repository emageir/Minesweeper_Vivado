library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg5 is
    Port ( Clock : in  STD_LOGIC;
           ColumnIn : in  STD_LOGIC_VECTOR (4 downto 0);
           ColumnOut : out  STD_LOGIC_VECTOR (4 downto 0));
end Reg5;

architecture Behavioral of Reg5 is

begin
process

begin

	wait until Clock'event and Clock = '1';
	ColumnOut <= ColumnIn;

	
end process;
end Behavioral;

