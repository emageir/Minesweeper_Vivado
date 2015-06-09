
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity BlockRamIniScreen is
	Port (  Clock : in  STD_LOGIC;
           Row : in  STD_LOGIC_VECTOR (4 downto 0);
			  Column : in  STD_LOGIC_VECTOR (6 downto 0);
           DataOutPixel : out  STD_LOGIC
			  );
end BlockRamIniScreen;
--
--architecture Behavioral of BlockRamIniScreen is
--
--
--
--end Behavioral;

