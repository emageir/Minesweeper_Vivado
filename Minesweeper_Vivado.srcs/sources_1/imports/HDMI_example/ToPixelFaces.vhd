
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ToPixelFaces is
	Port (
			DataIn : in  STD_LOGIC_VECTOR (799 downto 0);
         Column : in  STD_LOGIC_VECTOR (5 downto 0);
         PixelOut : out  STD_LOGIC_VECTOR (15 downto 0)
			);
end ToPixelFaces;

architecture Behavioral of ToPixelFaces is

begin

process(DataIn, Column)

begin

if Column = "000001" then
	PixelOut <= DataIn(799 downto 784);
elsif Column = "000010" then
	PixelOut <= DataIn(783 downto 768);
elsif Column = "000011" then
	PixelOut <= DataIn(767 downto 752);
elsif Column = "000100" then
	PixelOut <= DataIn(751 downto 736);
elsif Column = "000101" then
	PixelOut <= DataIn(735 downto 720);
elsif Column = "000110" then
	PixelOut <= DataIn(719 downto 704);
elsif Column = "000111" then
	PixelOut <= DataIn(703 downto 688);
elsif Column = "001000" then
	PixelOut <= DataIn(687 downto 672);
elsif Column = "001001" then
	PixelOut <= DataIn(671 downto 656);
elsif Column = "001010" then--10
	PixelOut <= DataIn(655 downto 640);
elsif Column = "001011" then
	PixelOut <= DataIn(639 downto 624);
elsif Column = "001100" then
	PixelOut <= DataIn(623 downto 608);
elsif Column = "001101" then
	PixelOut <= DataIn(607 downto 592);
elsif Column = "001110" then
	PixelOut <= DataIn(591 downto 576);
elsif Column = "001111" then
	PixelOut <= DataIn(575 downto 560);
elsif Column = "010000" then
	PixelOut <= DataIn(559 downto 544);
elsif Column = "010001" then
	PixelOut <= DataIn(543 downto 528);
elsif Column = "010010" then
	PixelOut <= DataIn(527 downto 512);
elsif Column = "010011" then
	PixelOut <= DataIn(511 downto 496);
elsif Column = "010100" then--20
	PixelOut <= DataIn(495 downto 480);
elsif Column = "010101" then
	PixelOut <= DataIn(479 downto 464);
elsif Column = "010110" then
	PixelOut <= DataIn(463 downto 448);
elsif Column = "010111" then
	PixelOut <= DataIn(447 downto 432);
elsif Column = "011000" then
	PixelOut <= DataIn(431 downto 416);
elsif Column = "011001" then
	PixelOut <= DataIn(415 downto 400);
elsif Column = "011010" then
	PixelOut <= DataIn(399 downto 384);
elsif Column = "011011" then
	PixelOut <= DataIn(383 downto 368);
elsif Column = "011100" then
	PixelOut <= DataIn(367 downto 352);
elsif Column = "011101" then
	PixelOut <= DataIn(351 downto 336);
elsif Column = "011110" then--30
	PixelOut <= DataIn(335 downto 320);
elsif Column = "011111" then
	PixelOut <= DataIn(319 downto 304);
elsif Column = "100000" then
	PixelOut <= DataIn(303 downto 288);
elsif Column = "100001" then
	PixelOut <= DataIn(287 downto 272);
elsif Column = "100010" then
	PixelOut <= DataIn(271 downto 256);
elsif Column = "100011" then
	PixelOut <= DataIn(255 downto 240);
elsif Column = "100100" then
	PixelOut <= DataIn(239 downto 224);
elsif Column = "100101" then
	PixelOut <= DataIn(223 downto 208);
elsif Column = "100110" then
	PixelOut <= DataIn(207 downto 192);
elsif Column = "100111" then
	PixelOut <= DataIn(191 downto 176);
elsif Column = "101000" then--40
	PixelOut <= DataIn(175 downto 160);
elsif Column = "101001" then
	PixelOut <= DataIn(159 downto 144);
elsif Column = "101010" then
	PixelOut <= DataIn(143 downto 128);
elsif Column = "101011" then
	PixelOut <= DataIn(127 downto 112);
elsif Column = "101100" then
	PixelOut <= DataIn(111 downto 96);
elsif Column = "101101" then
	PixelOut <= DataIn(95 downto 80);
elsif Column = "101110" then
	PixelOut <= DataIn(79 downto 64);
elsif Column = "101111" then
	PixelOut <= DataIn(63 downto 48);
elsif Column = "110000" then
	PixelOut <= DataIn(47 downto 32);
elsif Column = "110001" then
	PixelOut <= DataIn(31 downto 16);
elsif Column = "110010" then
	PixelOut <= DataIn(15 downto 0);
else
	PixelOut <= (others => '0');
end if;

end process;

end Behavioral;

