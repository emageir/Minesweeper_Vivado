library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg7 is
	Port ( Clock : in  STD_LOGIC;
           ColumnIn : in  STD_LOGIC_VECTOR (6 downto 0);
           ColumnOut : out  STD_LOGIC_VECTOR (6 downto 0)
			 );
end Reg7;

architecture Behavioral of Reg7 is

begin

process

begin

	wait until Clock'event and Clock = '1';
	ColumnOut <= ColumnIn;

end process;

end Behavioral;

