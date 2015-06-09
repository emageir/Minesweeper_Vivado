----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:07 12/19/2014 
-- Design Name: 
-- Module Name:    Imgur - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.math_real.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Imgur is

	port ( --General I/O
			 ENA 		: OUT STD_LOGIC;
			 DOUT		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 frame_valid :out std_logic;
			 calib_done :in std_logic;
			 CLK		: IN STD_LOGIC;
			 RST		: IN STD_LOGIC;
			 Face_enable	: IN STD_LOGIC;
			 --Connection with BlockRamGrid
			 G_X		: OUT STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 G_Y		: OUT STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 GridData: IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 --Connection with Playmode
			 LastHitP1	: IN STD_LOGIC_VECTOR( 9 DOWNTO 0);
			 LastHitP2	: IN STD_LOGIC_VECTOR( 9 DOWNTO 0);
			 P1Digit1	: IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 P1Digit2	: IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 P2Digit1	: IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 P2Digit2	: IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
			 Cursor_X	: IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 Cursor_Y	: IN STD_LOGIC_VECTOR( 4 DOWNTO 0);
			 IniDone		: IN STD_LOGIC;
			 Who			: IN STD_LOGIC;
			 --Debugging
			 ConfirmTest: IN STD_LOGIC;
			 RndTest		: IN STD_LOGIC;
			 RightTest	: IN STD_LOGIC;
			 Winner		: IN STD_LOGIC_VECTOR( 1 DOWNTO 0)
);

end Imgur;

architecture Behavioral of Imgur is


--Δήλωση σημάτων
SIGNAL DATA, roach_color, F_Pixel : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL EN, RESET, WSpixel, S_Pixel, W_Pixel :   STD_LOGIC;
SIGNAL row ,column, pix_Y, pix_X, grid_Y, grid_X, score_Y, score_X, winner_Y, winner_X, face_X, face_Y, n_Y, blink_counter, f_counter: NATURAL := 0;
signal X, Y: STD_LOGIC_VECTOR (9 DOWNTO 0):= (others => '0');
signal T_Row, T_Column, S_Row, S_Column, Gri_X, Gri_Y, LastP1_X, LastP1_Y, LastP2_X, LastP2_Y, W_Row : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal F_Row, F_Column : STD_LOGIC_VECTOR (5 DOWNTO 0);
signal W_Column : STD_LOGIC_VECTOR (6 DOWNTO 0);
signal T_Texture, S_Texture, T_Pixel: STD_LOGIC_VECTOR (3 DOWNTO 0);
signal F_Texture : STD_LOGIC_VECTOR (2 DOWNTO 0);
signal color, WScolor : STD_LOGIC_VECTOR (15 DOWNTO 0):= (others => '0');
signal WSdata : STD_LOGIC_VECTOR (31 DOWNTO 0);
TYPE STATE_TYPE IS (IDLE,DISPLAYING);
SIGNAL STATE : STATE_TYPE;
TYPE gun_ammunition IS (WSRED, BLACK, WHITE, RED, BLUE, BACKGROUND, GRASS, SOIL, ONE,
								TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, ROACH, FACE);
SIGNAL gun : gun_ammunition;

begin

--Σύνδεση με μνήμη οθόνης καλωσορίσματος
WSMem: entity work.memoire PORT MAP(
		Clk => Clk,
		X => X,
		Y => Y,
		pixel => WSpixel);

--Σύνδεση με μνήμη textures των γραφικών (0-8, κατσαρίδα)
Inst_BlockRamTextures: entity work.BlockRamTextures PORT MAP(
		Clock => Clk,
		Texture => T_Texture,
		Row => T_Row,
		Column => T_Column,
		DataOut => T_Pixel);

--Σύνδεση με μνήμη textures των σκορ
Inst_BlockRamScore: entity work.BlockRamScore PORT MAP( 
		Clock => Clk,
      Texture => '0' & S_Texture,
      Row => S_Row,
		Column => S_Column,
      DataOutPixel => S_Pixel);
		
--Σύνδεση με μνήμη γραφικών της λέξης Winner
Inst_BlockRamWinner: entity work.BlockRamWinner PORT MAP(
		Clock => Clk,
		Row => W_Row,
		Column => W_Column,
		DataOutPixel => W_Pixel);

Inst_BlockRamFaces: entity work.BlockRamFaces PORT MAP(
		Clock => Clk,
		Texture => F_Texture,
		Row => F_Row,
		Column => F_Column,
		DataOutPixel => F_Pixel
	);

--Αυτό το process ελέγχει την επικοινωνία με το HDMI.
--Σε περίπτωση που δεν έχει ολοκληρωθεί η ρύθμιση ή 
--έχει πατηθεί το Reset (Idle state), απενεργοποιείται προσωρινά
--η μετάδοση εικόνας. Σε άλλη περίπτωση (Displaying state),
--η εικόνα μεταδίδεται κανονικά.
show:process (CLK)
begin
	if rising_edge (CLK) then
		if RST = '1' THEN
			DATA <= (OTHERS => '0');
			RESET <= '1';
			frame_valid <= '0';
			EN <= '0';
		ELSE
			IF STATE = IDLE then
				RESET <= '0' ;
				frame_valid <= '0';
				EN <= '0';
			ELSIF STATE = DISPLAYING then 
				RESET <= '0';
				DATA <= color;
				frame_valid <= '1';
				EN <= '1';
			END IF;
		END IF;
	end if;
end process;


--Εδώ επιλέγεται αν το σύστημα θα είναι σε κατάσταση
--Idle ή Displaying
STATE_PROCESS: PROCESS(CLK)
BEGIN
	IF RISING_EDGE (CLK) THEN
		IF RST = '1' OR CALIB_DONE = '0' THEN
			STATE <=IDLE;
		ELSE
			STATE <= DISPLAYING;
		END IF;
	END IF;
END PROCESS;

--Μετρητής που αυξάνει την τιμή του column ανά κύκλο ρολογιού
--και την μηδενίζει όταν γίνει 1280-1
column_process : process
begin
wait until Clk'event and Clk = '1';

if RST = '1' or calib_done = '0'  then
	column <= 0 ;
ELSif column = 1280-1  then
	column <= 0;
else
	column <= column + 1;
	END IF;
end process;

--Μετρητής που αυξάνει την τιμή του row όταν το column πάρει τιμή 1280-1
--και τη μηδενίζει όταν το row γίνει 721-1
row_process:   process

begin

wait until Clk'event and Clk = '1';

if RST = '1' or calib_done = '0' then
	row <= 0;
elsif column = 1280 - 1 and row /= 721 - 1 then
	row <= row + 1;
elsif row = 721 - 1 then
	row<= 0;
else
	row <=row;
end if;

end process;

--Μετρητής που ελέγχει ποια τιμή θα ζητηθεί για τη συντεταγμένη
--column της μνήμης οθόνης καλωσορίσματος. Φροντίζει να μην υπερβεί
--την τιμή 799, καθώς είναι η μέγιστη που υποστηρίζει η μνήμη
Y_proc: process
begin		

wait until Clk'event and Clk = '1';

if RST = '1' OR CALIB_DONE = '0' then
	Y <= (others => '0');
else
	if Y = "1100011111" and column = 1280 - 1 then
		Y <= (others => '0');
	elsif Y = "1100011111" and column < 1280 - 1 then
		Y <= Y;
	elsif Y /= "1100011111" and column < 1280 - 1 then
		Y <= Y + '1';
	end if;
end if;

end process;

--Μετρητής που ελέγχει ποια τιμή θα ζητηθεί για τη συντεταγμένη
--row της μνήμης της οθόνης καλωσορίσματος. Αντίστοιχα με πριν, δεν υπερβαίνει
--την τιμή 599, που είναι η μέγιστη δυνατή.
--Για διευκόλυνση εδώ, έγινε χρήση της συνάρτησης conv_std_logic_vector(x, padding)
X_proc: process(row)

begin

if row < 600 then
	X <= conv_std_logic_vector(row, 10);
else
	X <= conv_std_logic_vector(599, 10);
end if;

end process;

--Η κύρια διεργασία της μονάδας. Αναλόγως με την κατάσταση του παιχνιδιού, καθώς και με
--την τρέχουσα θέση των row και column, επιλέγει με βάση ποιά δεδομένα θα αποφασίσει το χρώμα
--που θα στείλει στο τρέχον pixel
pixel_mapping: process

begin

wait until Clk'event and Clk = '1';

--Welcome Screen
if IniDone = '0' and WSpixel = '1' then
	gun <= WSRED;
elsif IniDone = '0' and WSpixel = '0' then
	gun <= BACKGROUND;
--Red player borderline
elsif (row = 50 and column >= 34 and column <= 234) or
	(column = 234 and row >= 50 and row <= 150) or
	(row = 150 and column >= 34 and column <= 234) or
	(column = 34 and row >= 50 and row <= 150) then
	gun <= BLACK;
--P1: score
elsif ((row >= 110 and row <= 126) and ((column >= 55 and column <= 66) or 
	(column >= 82  and column <= 94) or (column >= 99  and column <= 111) or (column >=  116 and column <= 128)
	or (column >= 133  and column <= 145))) then
	if S_Pixel = '0' then
		if who = '0' and Winner = "00" then
			gun <= WHITE;
		else
			gun <= BLACK;
		end if;
	else
		gun <= RED;
	end if;
--Red player is winner
elsif ((row >= 79 and row <= 95) and (column >= 55 and column <= 163) and Winner = "01") then
	if W_Pixel = '1' then
		gun <= WHITE;
	else
		gun <= RED;
	end if;

elsif ((row >= 67 and row <= 126) and (column >= 174 and column <= 223) and Face_enable = '1') then
	if F_Pixel = x"07e9" then
		gun <= RED;
	else
		gun <= FACE;
	end if;
--Red player background
elsif (row > 50 and row < 150 and column > 34 and column < 234) then
	gun <= RED;
--Blue player borderline
elsif (row = 191 and column >= 34 and column <= 234) or
	(column = 234 and row >= 191 and row <= 291) or
	(row = 291 and column >= 34 and column <= 234) or
	(column = 34 and row >= 191 and row <= 291) then
	gun <= BLACK;
--P2: score
elsif ((row >= 251 and row <= 267) and ((column >= 55 and column <= 66) or 
(column >= 82  and column <= 94) or (column >= 99  and column <= 111) or (column >=  116 and column <= 128)
or (column >= 133  and column <= 145))) then
	if S_Pixel = '0' then
		if who = '1' and Winner = "00" then
			gun <= WHITE;
		else
			gun <= BLACK;
		end if;
	else
		gun <= BLUE;
	end if;
--Blue player is winner
elsif ((row >= 220 and row <= 236) and (column >= 55 and column <= 163) and Winner = "10") then
	if W_Pixel = '1' then
		gun <= WHITE;
	else
		gun <= BLUE;
	end if;

elsif ((row >= 208 and row <= 267) and (column >= 174 and column <= 223) and Face_enable = '1') then
	if F_Pixel = x"07e9" then
		gun <= BLUE;
	else
		gun <= FACE;
	end if;
--Blue player background
elsif (row > 191 and row < 291 and column > 34 and column < 234) then
	gun <= BLUE;
--Test
--elsif (row >= 52 and row <= 529 and column >= 268 and column <= 747 and (pix_Y = 1 or pix_X = 0)) then
--	gun <= WSRED;
--The grid outline
elsif ((row = 50 or row = 51 or row = 530 or row = 531) and column >= 267 and column <= 749) or 
	((column = 267 or column = 268 or column = 748 or column = 749) and row >= 50 and row <= 531) then
	gun <= BLACK;
--The grid itself
elsif (row > 50 and row < 531 and column > 267 and column < 749) and
	(column = 292 or column = 316 or column = 340 or column = 364 or column = 388 or column = 412 
	or column = 436 or column = 460 or column = 484 or column = 508 or column = 532 or column = 556
	or column = 580 or column = 604 or column = 628 or column = 652 or column = 676 or column = 700 or column = 724
	or row = 75 or row = 99 or row = 123 or row = 147 or row = 171 or row = 195 or row = 219 or row = 243 
	or row = 267 or row = 291 or row = 315 or row = 339 or row = 363 or row = 387 or row = 411 or row = 435 
	or row = 459 or row = 483 or row = 507) then
	gun <= BLACK;
--Cells
elsif (row > 50 and row < 531 and column > 267 and column < 749) then
	--Cursor
	if (Gri_X = Cursor_X and Gri_Y = Cursor_Y and T_Pixel = "1111" and blink_counter < 30000000) then
		gun <= WHITE;
	--Red Player Last Hit
	elsif (Gri_X = LastP1_X and Gri_Y = LastP1_Y and T_Pixel = "1111") then
		gun <= RED;
	--Blud Player Last Hit
	elsif (Gri_X = LastP2_X and Gri_Y = LastP2_Y and T_Pixel = "1111") then
		gun <= BLUE;
	--Roaches
	elsif (GridData = "11110" or GridData = "11111" or GridData = "11010") then
		gun <= ROACH;
	--Numbers
	elsif GridData(4) = '1' then
		if T_Pixel = "0001" then
			case GridData is
				when "10001" =>
					gun <= ONE;
				when "10010" =>
					gun <= TWO;
				when "10011" =>
					gun <= THREE;
				when "10100" =>
					gun <= FOUR;
				when "10101" =>
					gun <= FIVE;
				when "10110" =>
					gun <= SIX;
				when "10111" =>
					gun <= SEVEN;
				when "11000" =>
					gun <= EIGHT;
				when others =>
					gun <= SOIL;
			end case;
		else
			gun <= SOIL;
		end if;
	--Grass
	else
		gun <= GRASS;
	end if;
--Game background
else
--	if ConfirmTest = '1' then
--		gun <= RED;
--	elsif RndTest = '1' then
--		gun <= BLUE;
--	elsif RightTest = '1' then
--		gun <= WHITE;
--	else
	gun <= BACKGROUND;
--	end if;
end if;

end process;

--Εδώ αποδίδονται δεκαεξαδικές τιμές στα χρώματα που χρησιμοποιεί
--η προηγούμενη διεργασία
pistol: process(gun)

begin

CASE gun IS
	WHEN WSRED =>
		color <= x"F903";
	WHEN BLACK =>
		color <= x"0000";
	WHEN WHITE =>
		color <= x"FFFF";
	WHEN RED =>
		color <= x"D9A5";
	WHEN BLUE =>
		color <= x"12B6";
	WHEN BACKGROUND =>
		color <= x"673F";
	WHEN GRASS =>
		color <= x"5DC8";
	WHEN SOIL =>
		color <= x"AC20";
	WHEN ONE =>
		color <= x"001F";
	WHEN TWO =>
		color <= x"0400";
	WHEN THREE =>
		color <= x"F800";
	WHEN FOUR =>
		color <= x"0010";
	WHEN FIVE =>
		color <= x"8000";
	WHEN SIX =>
		color <= x"0410";
	WHEN SEVEN =>
		color <= x"5315";
	WHEN EIGHT =>
		color <= x"0000";
	WHEN ROACH =>
		color <= roach_color;
	WHEN FACE =>
		color <= F_Pixel;
	WHEN  OTHERS =>
		color <= x"9AF4";
	END CASE;

end process;

--Καθώς τα χρώματα της κάθε κατσαρίδας είναι παραπάνω του ενός,
--η απόδοσή τους έγινε εδώ
roach_coloring: process

begin

wait until Clk'event and Clk = '1';

if T_Pixel = "0001" then
	if GridData = "11110" then
		roach_color <= x"DAE5";
	elsif GridData = "11111" then
		roach_color <= x"3A6E";
	else
		roach_color <= x"6203";
	end if;
elsif T_Pixel = "0011" then
	if GridData = "11111" then
		roach_color <= x"93C1";
	elsif GridData = "11110" then
		roach_color <= x"B3C0";
	else
		roach_color <= x"A400";
	end if;
elsif T_Pixel = "0100" then
	if GridData = "11111" then
		roach_color <= x"9BE0";
	elsif GridData = "11110" then
		roach_color <= x"C341";
	else
		roach_color <= x"9BC0";
	end if;
elsif T_Pixel = "0101" then
	if GridData = "11111" then
		roach_color <= x"8362";
	elsif GridData = "11110" then
		roach_color <= x"CAC1";
	else
		roach_color <= x"9BA1";
	end if;
elsif T_Pixel = "0110" then
	if GridData = "11111" then
		roach_color <= x"52A6";
	elsif GridData = "11110" then
		roach_color <= x"DA62";
	else
		roach_color <= x"9061";
	end if;
elsif T_Pixel = "0111" then
	if GridData = "11111" then
		roach_color <= x"3228";
	elsif GridData = "11110" then
		roach_color <= x"E1E2";
	else
		roach_color <= x"8B41";
	end if;
elsif T_Pixel = "1000" then
	if GridData = "11111" then
		roach_color <= x"19AB";
	elsif GridData = "11110" then
		roach_color <= x"F183";
	else
		roach_color <= x"8B22";
	end if;
elsif T_Pixel = "1001" then
	if GridData = "11111" then
		roach_color <= x"118B";
	elsif GridData = "11110" then
		roach_color <= x"F903";
	else
		roach_color <= x"82E2";
	end if;
elsif T_Pixel = "1010" then
	if GridData = "11111" then
		roach_color <= x"29EC";
	elsif GridData = "11110" then
		roach_color <= x"C544";
	else
		roach_color <= x"7AC2";
	end if;
elsif T_Pixel = "1011" then
	if GridData = "11111" then
		roach_color <= x"322D";
	elsif GridData = "11110" then
		roach_color <= x"C244";
	else
		roach_color <= x"BAA2";
	end if;
elsif T_Pixel = "1101" then
	if GridData = "11111" then
		roach_color <= x"4AD0";
	elsif GridData = "11110" then
		roach_color <= x"CA85";
	else
		roach_color <= x"7263";
	end if;
elsif T_Pixel = "1110" then
	if GridData = "11111" then
		roach_color <= x"428E";
	elsif GridData = "11110" then
		roach_color <= x"D2C5";
	else
		roach_color <= x"6A43";
	end if;
else
--Generic Soil Background
	roach_color <= x"AC20";
end if;

end process;

--Εδώ γίνεται η επεξεργασία της τιμής του μετρητή που χρησιμοποιείται ως column
--στη μνήμη με τα textures των γραφικών
Pixel_Y_proc: process

begin

wait until Clk'event and Clk = '1';

--Όταν βρισκόμαστε πάνω στο πλέγμα όσο αφορά το column, μας δίνεται η ευκαιρία να αρχικοποιήσουμε το μετρητή
if (column = 267 or column = 291 or column = 315 or column = 339 or column = 363 or column = 387 or column = 411 
	or column = 435 or column = 459 or column = 483 or column = 507 or column = 531 or column = 555
	or column = 579 or column = 603 or column = 627 or column = 651 or column = 675 or column = 699 or column = 723) then
	pix_Y <= 1;
--Σε περίπτωση που βρισκόμαστε μέσα στο πλέγμα αλλά όχι σε κάποιο column του, ο μετρητής αυξάνει
elsif (column >=267 and column <=748) then
	pix_Y <= pix_Y + 1;
--Όταν βρισκόμαστε εκτός πλέγματος, η τιμή του μετρητή γίνεται ενδεικτικά 1
else
	pix_Y <= 1;
end if;

end process;

--Εδώ γίνεται η επεξεργασία της τιμής του μετρητή που χρησιμοποιείται ως row
--στη μνήμη με τα textures των γραφικών
Pixel_X_proc: process

begin

wait until Clk'event and Clk = '1';

--Τα παρακάτω συμβαίνουν όταν βρισκόμαστε μέσα στο πλέγμα, όσο αφορά
--τα rows
if (row >= 51 and row <= 529) then
	--Αν βρισκόμαστε πάνω σε γραμμή πλέγματος, αρχικοποιούμε το μετρητή
	if (row = 51 or row = 75 or row = 99 or row = 123 or row = 147 or row = 171 or row = 195 or row = 219 or row = 243 
	or row = 267 or row = 291 or row = 315 or row = 339 or row = 363 or row = 387 or row = 411 or row = 435 
	or row = 459 or row = 483 or row = 507) and column = 267 then
		pix_X <= 1;
	--Διαφορετικά, αν το column είναι 267, τον αυξάνουμε
	--Αυτό το κάνουμε για να αποφύγουμε την αύξηση της τιμής του row
	--σε κάθε κύκλο ρολογιού
	elsif column = 267 then
		pix_X <= pix_X + 1;
	else
		pix_X <= pix_X;
	end if;
--Όταν είμαστε εκτός πλέγματος, η τιμή τίθεται 1 ενδεικτικά.
else
	pix_X <= 1;
end if;

end process;

--BlockRamTextures Coordinates handlers.
--T_Column, T_Row
T_Column <= conv_std_logic_vector(pix_Y, 5);
T_Row <= conv_std_logic_vector(pix_X, 5);

--Εδώ γίνεται επιλογή του texture που θα χρησιμοποιηθεί για το τρέχον τετράγωνο,
--με βάση το τι αναφέρει η μνήμη του πλέγματος ότι περιέχει
BRT_Selector: process

begin

wait until Clk'event and Clk = '1';

if (GridData = "11110" or GridData = "11111" or GridData = "11010") then
	T_Texture <= "1001";
elsif (GridData(4) = '0' or GridData = "10000") then
	T_Texture <= "1000";
else
	T_Texture <= GridData(3 DOWNTO 0);
end if;

end process;

--Εδώ δίνεται τιμή στη μεταβλητή που χρησιμοποιείται ως συντεταγμένη column
--στη μνήμη του πλέγματος
Grid_Y_proc: process

begin

wait until Clk'event and Clk = '1';

--Ανάλογα με το column στο οποίο βρισκόμαστε, η μεταβλητή γίνεται 1, αυξάνεται
--κατά 1 ή διατηρεί την τιμή της
if (column = 267) then
	grid_Y <= 1;
elsif (column = 291 or column = 315 or column = 339 or column = 363 or column = 387 or column = 411 
	or column = 435 or column = 459 or column = 483 or column = 507 or column = 531 or column = 555
	or column = 579 or column = 603 or column = 627 or column = 651 or column = 675 or column = 699 or column = 723) then
	grid_Y <= grid_Y + 1;
else
	grid_Y <= grid_Y;
end if;

end process;

Gri_Y <= conv_std_logic_vector(grid_Y, 5);
G_Y <= Gri_Y;

--Εδώ δίνεται τιμή στη μεταβλητή που χρησιμοποιείται ως συντεταγμένη row
--στη μνήμη του πλέγματος. Η διεργασία λειτουργεί με την ίδια λογική
--με την προηγούμενη
Grid_X_proc: process

begin

wait until Clk'event and Clk = '1';

if (row >= 50 and row <= 531) then
	if column = 267 and (row = 51 or row = 75 or row = 99 or row = 123 or row = 147 or row = 171 or row = 195 or row = 219 or row = 243 
	or row = 267 or row = 291 or row = 315 or row = 339 or row = 363 or row = 387 or row = 411 or row = 435 
	or row = 459 or row = 483 or row = 507) then
		grid_X <= grid_X + 1;
	else
		grid_X <= grid_X;
	end if;
else
	grid_X <= 0;
end if;

end process;

Gri_X <= conv_std_logic_vector(grid_X, 5);
G_X <= Gri_X;

--Αυτός ο μετρητής μετράει μέχρι τα 0,6 δευτερόλεπτα και 
--χρησιμοποιείται για το αναβόσβημα του κέρσορα
cursor_blink: process

begin

wait until Clk'event and Clk = '1';

if blink_counter = 60000000 then
	blink_counter <= 0;
else
	blink_counter <= blink_counter + 1;
end if;

end process;

--Γίνεται ανάθεση των τιμών συντεταγμένων τελευταίας
--κίνησης του κάθε παίκτη σε ξεχωριστές μεταβλητές
--για πιο εύκολη επεξεργασία
LastP1_X <= LastHitP1(9 downto 5);
LastP1_Y <= LastHitP1(4 downto 0);

LastP2_X <= LastHitP2(9 downto 5);
LastP2_Y <= LastHitP2(4 downto 0);

--Αυτή η διεργασία επιλέγει από τη μνήμη του score ποιο
--texture θα φορτωθεί, με βάση τις συντεταγμένες της 
--τρέχουσας θέσης, καθώς και το σκορ του κάθε παίκτη
select_score_texture: process

begin

wait until Clk'event and Clk = '1';

--Επιλέγουμε το γράμμα P
if (column >= 53 and column <= 64) then
	S_Texture <= "1010";
--Επιλέγουμε τον αριθμό του παίκτη (1, 2),
--ανάλογα με το πού βρισκόμαστε
elsif (column >= 80 and column <= 92) then
	if (row >= 110 and row<= 127) then
		S_Texture <= "0001";
	else
		S_Texture <= "0010";
	end if;
--Επιλέγουμε την άνω-κάτω τελεία:
elsif (column >= 97 and column <= 109) then
	S_Texture <= "1011";
--Επιλέγουμε την τιμή των δεκάδων με βάση
--το τρέχον σκορ του κάθε παίκτη
elsif (column >= 114 and column <= 126) then
	if (row >= 110 and row <= 127) then
		S_Texture <= P1Digit1;
	else
		S_Texture <= P2Digit1;
	end if;
--Επιλέγουμε την τιμή των μονάδων με βάση
--το τρέχουν σκορ του κάθε παίκτη
elsif (column >= 131 and column <= 143) then
	if (row >= 110 and row <= 127) then
		S_Texture <= P1Digit2;
	else
		S_Texture <= P2Digit2;
	end if;
--Όταν βρισκόμαστε εκτός ορίων σκορ,
--επιλέγουμε το 0 ενδεικτικά
else
	S_Texture <= "0000";
end if;

end process;

--Αυτή η διεργασία χειρίζεται τη συντεταγμένη column για τη
--μνήμη με τα textures του score
score_Y_proc: process

begin

wait until Clk'event and Clk = '1';

if ((column >= 53 and column <= 64) or (column >= 80  and column <= 92) or 
(column >= 97  and column <= 109) or (column >=  114 and column <= 126) or 
(column >= 131  and column <= 143)) then
	if (column = 53 or column = 80 or column = 97 or column = 114 or column = 131) then
		score_Y <= 1;
	else
		score_Y <= score_Y + 1;
	end if;
else
	score_Y <= 1;
end if;

end process;

S_column <= conv_std_logic_vector(score_Y, 5);

--Αυτή η διεργασία χειρίζεται τη συντεταγμένη row για τη
--μνήμη με τα textures του score
score_X_proc: process

begin

wait until Clk'event and Clk = '1';

if ((row >= 110 and row <= 126) or (row >= 251 and row <= 267)) then
	if (row = 110 or row = 251) then
		score_X <= 1;
	elsif column = 53 then
		score_X <= score_X + 1;
	end if;
else
	score_X <= 1;
end if;

end process;

S_row <= conv_std_logic_vector(score_X, 5);

--Όμοια με πριν, οι παρακάτω διαδικασίες χειρίζονται τις
--τιμές των μεταβλητών row και column για τη μνήμη Winner
winner_Y_proc: process

begin

wait until Clk'event and Clk = '1';

if (column >=54 and column <= 161) then
	winner_Y <= winner_Y + 1;
else
	winner_Y <= 1;
end if;

end process;

W_column <= conv_std_logic_vector(winner_Y, 7);

winner_X_proc: process

begin

wait until Clk'event and Clk = '1';

if (row >= 79 and row <= 95) then
	winner_X <= row - 78;
elsif (row >= 220 and row <= 236) then
	winner_X <= row - 219;
else
	winner_X <= 1;
end if;

end process;

W_row <= conv_std_logic_vector(winner_X, 5);

--Happy times!
-----------------------------------------------
face_counter: process

begin

wait until Clk'event and Clk = '1';

if Face_enable = '0' then
	if f_counter = 280 then
		f_counter <= 0;
	else
		f_counter <= f_counter + 1;
	end if;
else
	f_counter <= f_counter;
end if;

end process;
-----------------------------------------------

select_Face_texture: process

begin

wait until Clk'event and Clk = '1';

if f_counter <= 9 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "000";
	else
		F_Texture <= "001";
	end if;
elsif f_counter <= 19 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "000";
	else
		F_Texture <= "010";
	end if;
elsif f_counter <= 29 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "000";
	else
		F_Texture <= "011";
	end if;
elsif f_counter <= 39 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "000";
	else
		F_Texture <= "100";
	end if;
elsif f_counter <= 49 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "000";
	else
		F_Texture <= "101";
	end if;
elsif f_counter <= 59 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "000";
	else
		F_Texture <= "110";
	end if;
elsif f_counter <= 69 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "000";
	else
		F_Texture <= "111";
	end if;
-----------------------------
elsif f_counter <= 79 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "001";
	else
		F_Texture <= "010";
	end if;
elsif f_counter <= 89 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "001";
	else
		F_Texture <= "011";
	end if;
elsif f_counter <= 99 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "001";
	else
		F_Texture <= "100";
	end if;
elsif f_counter <= 109 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "001";
	else
		F_Texture <= "101";
	end if;
elsif f_counter <= 119 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "001";
	else
		F_Texture <= "110";
	end if;
elsif f_counter <= 129 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "001";
	else
		F_Texture <= "111";
	end if;
	---------------------
elsif f_counter <= 139 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "010";
	else
		F_Texture <= "011";
	end if;
elsif f_counter <= 149 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "010";
	else
		F_Texture <= "100";
	end if;
elsif f_counter <= 159 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "010";
	else
		F_Texture <= "101";
	end if;
elsif f_counter <= 169 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "010";
	else
		F_Texture <= "110";
	end if;
elsif f_counter <= 179 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "010";
	else
		F_Texture <= "111";
	end if;
	----------------------
elsif f_counter <= 189 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "011";
	else
		F_Texture <= "100";
	end if;
elsif f_counter <= 199 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "011";
	else
		F_Texture <= "101";
	end if;
elsif f_counter <= 209 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "011";
	else
		F_Texture <= "110";
	end if;
elsif f_counter <= 219 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "011";
	else
		F_Texture <= "111";
	end if;
	----------------------------
elsif f_counter <= 229 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "100";
	else
		F_Texture <= "101";
	end if;
elsif f_counter <= 239 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "100";
	else
		F_Texture <= "110";
	end if;
elsif f_counter <= 249 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "100";
	else
		F_Texture <= "111";
	end if;
	-----------------------------
elsif f_counter <= 259 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "101";
	else
		F_Texture <= "110";
	end if;
elsif f_counter <= 269 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "101";
	else
		F_Texture <= "111";
	end if;
	------------------------------
elsif f_counter <= 279 then
	if (row >= 67 and row <= 126) then
		F_Texture <= "110";
	else
		F_Texture <= "111";
	end if;
else
	F_Texture <= "000";
end if;

end process;


-------------------------------------------------------------------------
Face_Y_proc: process

begin

wait until Clk'event and Clk = '1';

if (column >= 173 and column <= 222) then
	face_Y <= face_Y + 1;
else
	face_Y <= 1;
end if;

end process;

F_column <=conv_std_logic_vector(face_Y, 6);

Face_X_proc: process

begin

wait until Clk'event and Clk = '1';

if (row >= 67 and row <= 126) then
	face_X <= row - 66;
elsif (row >= 208 and row <= 267) then
	face_X <= row - 207;
else
	face_X <= 1;
end if;

end process;

F_row <=conv_std_logic_vector(face_X, 6);

DOUT <= DATA;
ENA <= EN;

end Behavioral;

