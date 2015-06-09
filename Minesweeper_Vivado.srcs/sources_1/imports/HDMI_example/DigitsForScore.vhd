library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DigitsForScore is
    Port ( Score : in  STD_LOGIC_Vector(5 downto 0);
           Digit1 : out  STD_LOGIC_VECTOR (3 downto 0);
           Digit2 : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end DigitsForScore;

architecture Behavioral of DigitsForScore is

begin
---- ENAS POLY MEGALOS POLYPLEKTHS POU DINEI TIMES STA SHMATA DIGIT 1 KAI DIGIT 2 ANALOGA ME TO SCORE
---- PX AN TO SCORE EINAI ISO ME 15 = 001111 TOTE THA EXOUME DIGIT1 = 0001 = 1 KAI DIGIT2 = 0101 = 5
process(Score)
begin

	if Score = "000000" then
		Digit1 <= "0000";
		Digit2 <= "0000";
	elsif Score = "000001" then
		Digit1 <= "0000";
		Digit2 <= "0001";
	elsif Score = "000010" then
		Digit1 <= "0000";
		Digit2 <= "0010";
	elsif Score = "000011" then
		Digit1 <= "0000";
		Digit2 <= "0011";
	elsif Score = "000100" then
		Digit1 <= "0000";
		Digit2 <= "0100";
	elsif Score = "000101" then
		Digit1 <= "0000";
		Digit2 <= "0101";
	elsif Score = "000110" then
		Digit1 <= "0000";
		Digit2 <= "0110";
	elsif Score = "000111" then
		Digit1 <= "0000";
		Digit2 <= "0111";
	elsif Score = "001000" then
		Digit1 <= "0000";
		Digit2 <= "1000";
	elsif Score = "001001" then
		Digit1 <= "0000";
		Digit2 <= "1001";
		-- 0 9
		------------------------
	elsif Score = "001010" then
		Digit1 <= "0001";
		Digit2 <= "0000";
	elsif Score = "001011" then
		Digit1 <= "0001";
		Digit2 <= "0001";
	elsif Score = "001100" then
		Digit1 <= "0001";
		Digit2 <= "0010";
	elsif Score = "001101" then
		Digit1 <= "0001";
		Digit2 <= "0011";
	elsif Score = "001110" then
		Digit1 <= "0001";
		Digit2 <= "0100";
	elsif Score = "001111" then
		Digit1 <= "0001";
		Digit2 <= "0101";
	elsif Score = "010000" then
		Digit1 <= "0001";
		Digit2 <= "0110";
	elsif Score = "010001" then
		Digit1 <= "0001";
		Digit2 <= "0111";
	elsif Score = "010010" then
		Digit1 <= "0001";
		Digit2 <= "1000";
	elsif Score = "010011" then
		Digit1 <= "0001";
		Digit2 <= "1001";
		-- 1 9
		-----------------
	elsif Score = "010100" then
		Digit1 <= "0010";
		Digit2 <= "0000";
	elsif Score = "010101" then
		Digit1 <= "0010";
		Digit2 <= "0001";
	elsif Score = "010110" then
		Digit1 <= "0010";
		Digit2 <= "0010";
	elsif Score = "010111" then
		Digit1 <= "0010";
		Digit2 <= "0011";
	elsif Score = "011000" then
		Digit1 <= "0010";
		Digit2 <= "0100";
	elsif Score = "011001" then
		Digit1 <= "0010";
		Digit2 <= "0101";
	elsif Score = "011010" then
		Digit1 <= "0010";
		Digit2 <= "0110";
	elsif Score = "011011" then
		Digit1 <= "0010";
		Digit2 <= "0111";
	elsif Score = "011100" then
		Digit1 <= "0010";
		Digit2 <= "1000";
	elsif Score = "011101" then
		Digit1 <= "0010";
		Digit2 <= "1001";
		-- 2 9
		-----------------
	elsif Score = "011110" then
		Digit1 <= "0011";
		Digit2 <= "0000";
	elsif Score = "011111" then
		Digit1 <= "0011";
		Digit2 <= "0001";
	elsif Score = "100000" then
		Digit1 <= "0011";
		Digit2 <= "0010";
	elsif Score = "100001" then
		Digit1 <= "0011";
		Digit2 <= "0011";
	elsif Score = "100010" then
		Digit1 <= "0011";
		Digit2 <= "0100";
	elsif Score = "100011" then
		Digit1 <= "0011";
		Digit2 <= "0101";
	elsif Score = "100100" then
		Digit1 <= "0011";
		Digit2 <= "0110";
	elsif Score = "100101" then
		Digit1 <= "0011";
		Digit2 <= "0111";
	elsif Score = "100110" then
		Digit1 <= "0011";
		Digit2 <= "1000";
	elsif Score = "100111" then
		Digit1 <= "0011";
		Digit2 <= "1001";	
		-- 3 9
	elsif Score = "101000" then
		Digit1 <= "0100";
		Digit2 <= "0000";	
	elsif Score = "101001" then
		Digit1 <= "0100";
		Digit2 <= "0001";
		-- 4 1
	end if;
	
end process;

end Behavioral;

