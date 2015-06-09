----------------------------------------------------------------------------------
-- Company: 
-- EngOUTeer: 
-- 
-- Create Date:    11:11:32 12/27/2014 
-- Design Name: 
-- Module Name:    dummy_game - Behavioral 
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

-- Uncomment the following library declaration if usOUTg
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if OUTstantiatOUTg
-- any XilOUTx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dummy_game is

	port ( 
			 CLK		: IN STD_LOGIC;
			 RST		: IN STD_LOGIC;
			 --Connection with BlockRamGrid
			 G_X		: IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 G_Y		: IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 GridData: OUT STD_LOGIC_VECTOR( 4 DOWNTO 0);
--			 --Connection with Playmode
			 LastHitP1	: OUT STD_LOGIC_VECTOR( 9 DOWNTO 0);
			 LastHitP2	: OUT STD_LOGIC_VECTOR( 9 DOWNTO 0);
			 P1Digit1	: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 P1Digit2	: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 P2Digit1	: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 P2Digit2	: OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 Cursor_X	: OUT STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 Cursor_Y	: OUT STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 IniDone		: OUT STD_LOGIC;
			 Winner		: OUT STD_LOGIC_VECTOR( 1 DOWNTO 0)
);
end dummy_game;

architecture Behavioral of dummy_game is

SIGNAL counter, ccounter : NATURAL := 0;

begin

Init: process

begin

wait until Clk'event and Clk = '1';

if RST = '1' then
	counter <= 0;
	IniDone <= '0';
else
	if counter < 150000000 then
		counter <= counter +1;
		IniDone <= '0';
	else
		counter <= 150000000;
		IniDone <= '1';
	end if;
end if;

end process;

Grid: process

begin

wait until Clk'event and Clk = '1';

--(1,2)
if (G_X = "00001" and G_Y = "00010") then
	GridData <= "10000";
elsif (G_X = "00011") then
	--(3,5) to (3,7), (3,11)
	if((G_Y >= "00101" and G_Y <= "00111") or G_Y = "01011") then
		GridData <= "10000";
	--(3,8)
	elsif (G_Y = "01000") then
		GridData <= "10100";
	--(3,9)
	elsif (G_Y = "01001") then
		GridData <= "10101";
	--(3,10)
	elsif (G_Y = "01010") then
		GridData <= "10110";
	else
		GridData <= "00000";
	end if;
elsif (G_X = "00100") then
	--(4,5)
	if G_Y = "00101" then
		GridData <= "10001";
	--(4,6)
	elsif G_Y = "00110" then
		GridData <= "10010";
	--(4,7)
	elsif G_Y = "00111" then
		GridData <= "10011";
	--(4,8)
	elsif G_Y = "01000" then
		GridData <= "11111";
	--(4,9)
	elsif G_Y = "01001" then
		GridData <= "11110";
	--(4,10)
	elsif G_Y = "01010" then
		GridData <= "11010";
	--(4,11)
	elsif G_Y = "01011" then
		GridData <= "10111";
	else
		GridData <= "00000";
	end if;
--(5,12)
elsif (G_X = "00101" and G_Y = "01100") then
	GridData <= "11000";
else
	GridData <= "00000";
end if;
		
end process;

cursor_control: process

begin

wait until Clk'event and Clk = '1';

--(3,5)
if ccounter < 50000000 then
	Cursor_X <= "00011";
	Cursor_Y <= "00101"; 
--(4,5)
elsif ccounter < 100000000 then
	Cursor_X <= "00100";
	Cursor_Y <= "00101";
--(4,6)
elsif ccounter < 150000000 then
	Cursor_X <= "00100";
	Cursor_Y <= "00110";
--(4,7)
elsif ccounter < 200000000 then
	Cursor_X <= "00100";
	Cursor_Y <= "00111";
--(3,8)
elsif ccounter < 250000000 then
	Cursor_X <= "00011";
	Cursor_Y <= "01000";
--(3,9)
elsif ccounter < 300000000 then
	Cursor_X <= "00011";
	Cursor_Y <= "01001";
--(3,10)
elsif ccounter < 350000000 then
	Cursor_X <= "00011";
	Cursor_Y <= "01010";
--(4,11)
elsif ccounter < 400000000 then
	Cursor_X <= "00100";
	Cursor_Y <= "01011";
--(5,12)
elsif ccounter < 450000000 then
	Cursor_X <= "00101";
	Cursor_Y <= "01100";
--(1,1)
else
	Cursor_X <= "00001";
	Cursor_Y <= "00001";
end if;

end process;

ccounter_control: process

begin

wait until Clk'event and Clk = '1';

if ccounter = 500000000 then
	ccounter <= 0;
else
	ccounter <= ccounter + 1;
end if;

end process;

--Red player is at (3,9)
LastHitP1 <= "0001101001";
--Blue player is at (5,12)
LastHitP2 <= "0010101100";

--Red player scores 10 points
P1Digit1 <= "0001";
P1Digit2 <= "0000";

--Blue player scores 90 points
P2Digit1 <= "1001";
P2Digit2 <= "0000";

winner_determine: process

begin

wait until Clk'event and Clk = '1';

if ccounter < 200000000 then
	Winner <= "01";
elsif ccounter < 400000000 then
	Winner <= "10";
else
	Winner <= "00";
end if;

end process;

end Behavioral;

