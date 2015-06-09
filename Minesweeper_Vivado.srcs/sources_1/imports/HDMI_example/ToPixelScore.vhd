
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ToPixelScore is
	Port (
			DataIn : in  STD_LOGIC_VECTOR (11 downto 0);
         Column : in  STD_LOGIC_VECTOR (4 downto 0);
         PixelOut : out  STD_LOGIC
			);
end ToPixelScore;

architecture Behavioral of ToPixelScore is

begin
---- ENAS POLY MEGALOS POLYPLEKTHS POU EPILEGEI ENA BIT APO TA 12 TOU DATA IN SYMFWNA ME TO COLUMN
process(DataIn,Column)
begin
		if Column = "00001" then
			PixelOut <= DataIn(11);
		elsif
			Column = "00010" then
			PixelOut <= DataIn(10);
		elsif
			Column = "00011" then
			PixelOut <= DataIn(9);
		elsif
			Column = "00100" then
			PixelOut <= DataIn(8);
		elsif
			Column = "00101" then
			PixelOut <= DataIn(7);
		elsif
			Column = "00110" then
			PixelOut <= DataIn(6);
		elsif
			Column = "00111" then
			PixelOut <= DataIn(5);
		elsif
			Column = "01000" then
			PixelOut <= DataIn(4);
		elsif
			Column = "01001" then
			PixelOut <= DataIn(3);
		elsif
			Column = "01010" then
			PixelOut <= DataIn(2);
		elsif
			Column = "01011" then
			PixelOut <= DataIn(1);
		elsif
			Column = "01100" then
			PixelOut <= DataIn(0);
		end if;
		

end process;

end Behavioral;

