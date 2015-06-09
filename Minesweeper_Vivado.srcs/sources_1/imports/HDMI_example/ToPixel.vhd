library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.all;
use Ieee.std_logic_unsigned.all;

entity ToPixel is
	Port ( 
			  DataIn : in  STD_LOGIC_VECTOR (91 downto 0);
           Column : in  STD_LOGIC_VECTOR (4 downto 0);
           PixelOut : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
end ToPixel;

architecture Behavioral of ToPixel is

begin
---- ENAS POLY MEGALOS POLYPLEKTHS POU EPILEGEI 4 BIT APO TA 92 TOU DATA IN SYMFWNA ME TO COLUMN
process(DataIn,Column)
begin

		if Column = "00001" then
			PixelOut <= DataIn(91)&DataIn(90)&DataIn(89)&DataIn(88);
		elsif Column = "00010" then
			PixelOut <= DataIn(87)&DataIn(86)&DataIn(85)&DataIn(84);
		elsif Column = "00011" then
			PixelOut <= DataIn(83)&DataIn(82)&DataIn(81)&DataIn(80);
		elsif Column = "00100" then
			PixelOut <= DataIn(79)&DataIn(78)&DataIn(77)&DataIn(76);
		elsif Column = "00101" then --5
			PixelOut <= DataIn(75)&DataIn(74)&DataIn(73)&DataIn(72);
		elsif Column = "00110" then
			PixelOut <= DataIn(71)&DataIn(70)&DataIn(69)&DataIn(68);
		elsif Column = "00111" then
			PixelOut <= DataIn(67)&DataIn(66)&DataIn(65)&DataIn(64);
		elsif Column = "01000" then
			PixelOut <= DataIn(63)&DataIn(62)&DataIn(61)&DataIn(60);
		elsif Column = "01001" then
			PixelOut <= DataIn(59)&DataIn(58)&DataIn(57)&DataIn(56);
		elsif Column = "01010" then --10
			PixelOut <= DataIn(55)&DataIn(54)&DataIn(53)&DataIn(52);
		elsif Column = "01011" then
			PixelOut <= DataIn(51)&DataIn(50)&DataIn(49)&DataIn(48);
		elsif Column = "01100" then
			PixelOut <= DataIn(47)&DataIn(46)&DataIn(45)&DataIn(44);
		elsif Column = "01101" then
			PixelOut <= DataIn(43)&DataIn(42)&DataIn(41)&DataIn(40);
		elsif Column = "01110" then
			PixelOut <= DataIn(39)&DataIn(38)&DataIn(37)&DataIn(36);
		elsif Column = "01111" then --15
			PixelOut <= DataIn(35)&DataIn(34)&DataIn(33)&DataIn(32);
		elsif Column = "10000" then
			PixelOut <= DataIn(31)&DataIn(30)&DataIn(29)&DataIn(28);
		elsif Column = "10001" then
			PixelOut <= DataIn(27)&DataIn(26)&DataIn(25)&DataIn(24);
		elsif Column = "10010" then
			PixelOut <= DataIn(23)&DataIn(22)&DataIn(21)&DataIn(20);
		elsif Column = "10011" then
			PixelOut <= DataIn(19)&DataIn(18)&DataIn(17)&DataIn(16);
		elsif Column = "10100" then --20
			PixelOut <= DataIn(15)&DataIn(14)&DataIn(13)&DataIn(12);
		elsif Column = "10101" then
			PixelOut <= DataIn(11)&DataIn(10)&DataIn(9)&DataIn(8);
		elsif Column = "10110" then
			PixelOut <= DataIn(7)&DataIn(6)&DataIn(5)&DataIn(4);
		elsif Column = "10111" then
			PixelOut <= DataIn(3)&DataIn(2)&DataIn(1)&DataIn(0);
		end if;
end process;

end Behavioral;

