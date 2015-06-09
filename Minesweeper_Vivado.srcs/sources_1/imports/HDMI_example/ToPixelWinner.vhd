library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ToPixelWinner is
	Port (
			DataIn : in  STD_LOGIC_VECTOR (107 downto 0);
         Column : in  STD_LOGIC_VECTOR (6 downto 0);
         PixelOut : out  STD_LOGIC
			);
end ToPixelWinner;

architecture Behavioral of ToPixelWinner is

begin
---- ENAS POLY MEGALOS POLYPLEKTHS POU EPILEGEI ENA BIT APO TA 108 TOU DATA IN SYMFWNA ME TO COLUMN
process(DataIn,Column)

begin
		if Column = "0000001" then
			PixelOut <= DataIn(107);
		elsif
			Column = "0000010" then
			PixelOut <= DataIn(106);
		elsif
			Column = "0000011" then
			PixelOut <= DataIn(105);
		elsif
			Column = "0000100" then
			PixelOut <= DataIn(104);
		elsif
			Column = "0000101" then
			PixelOut <= DataIn(103);
		elsif
			Column = "0000110" then
			PixelOut <= DataIn(102);
		elsif
			Column = "0000111" then
			PixelOut <= DataIn(101);
		elsif
			Column = "0001000" then
			PixelOut <= DataIn(100);
		elsif
			Column = "0001001" then
			PixelOut <= DataIn(99);
		elsif
			Column = "0001010" then
			PixelOut <= DataIn(98);
		elsif
			Column = "0001011" then
			PixelOut <= DataIn(97);
		elsif
			Column = "0001100" then
			PixelOut <= DataIn(96);
		elsif
			Column = "0001101" then
			PixelOut <= DataIn(95);
		elsif
			Column = "0001110" then
			PixelOut <= DataIn(94);
		elsif
			Column = "0001111" then
			PixelOut <= DataIn(93);
		elsif
			Column = "0010000" then
			PixelOut <= DataIn(92);
		elsif
			Column = "0010001" then
			PixelOut <= DataIn(91);
		elsif
			Column = "0010010" then
			PixelOut <= DataIn(90);
		elsif
			Column = "0010011" then
			PixelOut <= DataIn(89);
		elsif
			Column = "0010100" then
			PixelOut <= DataIn(88);
		elsif
			Column = "0010101" then
			PixelOut <= DataIn(87);
		elsif
			Column = "0010110" then
			PixelOut <= DataIn(86);
		elsif
			Column = "0010111" then
			PixelOut <= DataIn(85);
		elsif
			Column = "0011000" then
			PixelOut <= DataIn(84);
		elsif
			Column = "0011001" then
			PixelOut <= DataIn(83);
		elsif
			Column = "0011010" then
			PixelOut <= DataIn(82);
		elsif
			Column = "0011011" then
			PixelOut <= DataIn(81);
		elsif
			Column = "0011100" then
			PixelOut <= DataIn(80);
		elsif
			Column = "0011101" then
			PixelOut <= DataIn(79);
		elsif
			Column = "0011110" then
			PixelOut <= DataIn(78);
		elsif
			Column = "0011111" then
			PixelOut <= DataIn(77);
		elsif
			Column = "0100000" then
			PixelOut <= DataIn(76);
		elsif
			Column = "0100001" then
			PixelOut <= DataIn(75);
		elsif
			Column = "0100010" then
			PixelOut <= DataIn(74);
		elsif
			Column = "0100011" then
			PixelOut <= DataIn(73);
		elsif
			Column = "0100100" then
			PixelOut <= DataIn(72);
		elsif
			Column = "0100101" then
			PixelOut <= DataIn(71);
		elsif
			Column = "0100110" then
			PixelOut <= DataIn(70);
		elsif
			Column = "0100111" then
			PixelOut <= DataIn(69);
		elsif
			Column = "0101000" then
			PixelOut <= DataIn(68);
		elsif
			Column = "0101001" then
			PixelOut <= DataIn(67);
		elsif
			Column = "0101010" then
			PixelOut <= DataIn(66);
		elsif
			Column = "0101011" then
			PixelOut <= DataIn(65);
		elsif
			Column = "0101100" then
			PixelOut <= DataIn(64);
		elsif
			Column = "0101101" then
			PixelOut <= DataIn(63);
		elsif
			Column = "0101110" then
			PixelOut <= DataIn(62);
		elsif
			Column = "0101111" then
			PixelOut <= DataIn(61);
		elsif
			Column = "0110000" then
			PixelOut <= DataIn(60);
		elsif
			Column = "0110001" then
			PixelOut <= DataIn(59);
		elsif
			Column = "0110010" then
			PixelOut <= DataIn(58);
		elsif
			Column = "0110011" then
			PixelOut <= DataIn(57);
		elsif
			Column = "0110100" then
			PixelOut <= DataIn(56);
		elsif
			Column = "0110101" then
			PixelOut <= DataIn(55);
		elsif
			Column = "0110110" then
			PixelOut <= DataIn(54);
		elsif
			Column = "0110111" then
			PixelOut <= DataIn(53);
		elsif
			Column = "0111000" then
			PixelOut <= DataIn(52);
		elsif
			Column = "0111001" then
			PixelOut <= DataIn(51);
		elsif
			Column = "0111010" then
			PixelOut <= DataIn(50);
		elsif
			Column = "0111011" then
			PixelOut <= DataIn(49);
		elsif
			Column = "0111100" then
			PixelOut <= DataIn(48);
		elsif
			Column = "0111101" then
			PixelOut <= DataIn(47);
		elsif
			Column = "0111110" then
			PixelOut <= DataIn(46);
		elsif
			Column = "0111111" then
			PixelOut <= DataIn(45);
		elsif
			Column = "1000000" then
			PixelOut <= DataIn(44);
		elsif
			Column = "1000001" then
			PixelOut <= DataIn(43);
		elsif
			Column = "1000010" then
			PixelOut <= DataIn(42);
		elsif
			Column = "1000011" then
			PixelOut <= DataIn(41);
		elsif
			Column = "1000100" then
			PixelOut <= DataIn(40);
		elsif
			Column = "1000101" then
			PixelOut <= DataIn(39);
		elsif
			Column = "1000110" then
			PixelOut <= DataIn(38);
		elsif
			Column = "1000111" then
			PixelOut <= DataIn(37);
		elsif
			Column = "1001000" then
			PixelOut <= DataIn(36);
		elsif
			Column = "1001001" then
			PixelOut <= DataIn(35);
		elsif
			Column = "1001010" then
			PixelOut <= DataIn(34);
		elsif
			Column = "1001011" then
			PixelOut <= DataIn(33);
		elsif
			Column = "1001100" then
			PixelOut <= DataIn(32);
		elsif
			Column = "1001101" then
			PixelOut <= DataIn(31);
		elsif
			Column = "1001110" then
			PixelOut <= DataIn(30);
		elsif
			Column = "1001111" then
			PixelOut <= DataIn(29);
		elsif
			Column = "1010000" then
			PixelOut <= DataIn(28);
		elsif
			Column = "1010001" then
			PixelOut <= DataIn(27);
		elsif
			Column = "1010010" then
			PixelOut <= DataIn(26);
		elsif
			Column = "1010011" then
			PixelOut <= DataIn(25);
		elsif
			Column = "1010100" then
			PixelOut <= DataIn(24);
		elsif
			Column = "1010101" then
			PixelOut <= DataIn(23);
		elsif
			Column = "1010110" then
			PixelOut <= DataIn(22);
		elsif
			Column = "1010111" then
			PixelOut <= DataIn(21);
		elsif
			Column = "1011000" then
			PixelOut <= DataIn(20);
		elsif
			Column = "1011001" then
			PixelOut <= DataIn(19);
		elsif
			Column = "1011010" then
			PixelOut <= DataIn(18);
		elsif
			Column = "1011011" then
			PixelOut <= DataIn(17);
		elsif
			Column = "1011100" then
			PixelOut <= DataIn(16);
		elsif
			Column = "1011101" then
			PixelOut <= DataIn(15);
		elsif
			Column = "1011110" then
			PixelOut <= DataIn(14);
		elsif
			Column = "1011111" then
			PixelOut <= DataIn(13);
		elsif
			Column = "1100000" then
			PixelOut <= DataIn(12);
		elsif
			Column = "1100001" then
			PixelOut <= DataIn(11);
		elsif
			Column = "1100010" then
			PixelOut <= DataIn(10);
		elsif
			Column = "1100011" then
			PixelOut <= DataIn(9);
		elsif
			Column = "1100100" then
			PixelOut <= DataIn(8);
		elsif
			Column = "1100101" then
			PixelOut <= DataIn(7);
		elsif
			Column = "1100110" then
			PixelOut <= DataIn(6);
		elsif
			Column = "1100111" then
			PixelOut <= DataIn(5);
		elsif
			Column = "1101000" then
			PixelOut <= DataIn(4);
		elsif
			Column = "1101001" then
			PixelOut <= DataIn(3);
		elsif
			Column = "1101010" then
			PixelOut <= DataIn(2);
		elsif
			Column = "1101011" then
			PixelOut <= DataIn(1);
		else
			PixelOut <= DataIn(0);	
		end if;
		

end process;




end Behavioral;

