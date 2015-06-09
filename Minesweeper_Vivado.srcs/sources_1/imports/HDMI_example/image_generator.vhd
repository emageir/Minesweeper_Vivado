----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:01:02 11/25/2012 
-- Design Name: 
-- Module Name:    image_generator - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity image_generator is
	port ( ENA 		: OUT STD_LOGIC;
			 DOUT		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 frame_valid :out std_logic;
			 --bedug	: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
			 calib_done :in std_logic;
			 CLK		: IN STD_LOGIC;
			 RST		: IN STD_LOGIC);
			 
			 
end image_generator;

architecture Behavioral of image_generator is
SIGNAL DATA : STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL EN :   STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
SIGNAL row ,column: NATURAL := 0;
signal frame_cnt,row_count,debug : std_logic := '0' ;
signal frame_count : natural := 0;
signal time_delay : std_logic_vector (31 downto 0):= (others => '0');
SIGNAL DISPLAY_COUNT : NATURAL :=0;
SIGNAL IMAGE_SELECTION : STD_LOGIC ; 
TYPE STATE_TYPE IS (IDLE,DISPLAYING, NOTDISPLAYING);
SIGNAL STATE,NEXT_STATE : STATE_TYPE;
signal yoyo : STD_LOGIC_VECTOR (15 DOWNTO 0):= (others => '0');
signal X, Y: STD_LOGIC_VECTOR (9 DOWNTO 0):= (others => '0');
signal A, B: STD_LOGIC_VECTOR (4 DOWNTO 0):= (others => '0');
signal pdata : STD_LOGIC;
signal texture_request: STD_LOGIC_VECTOR (3 downto 0);
signal pdatav: STD_LOGIC_VECTOR (3 downto 0);

--component memoire
--    Port ( Clk : in STD_LOGIC;
--			  X : in  STD_LOGIC_VECTOR(9 DOWNTO 0);
--           Y : in  STD_LOGIC_VECTOR(9 DOWNTO 0);
--           pixel : out  STD_LOGIC);
--end component;
--

component BlockRamTextures
    Port ( Clock : in  STD_LOGIC;
           Texture : in  STD_LOGIC_VECTOR (3 downto 0);
           Row : in  STD_LOGIC_VECTOR (4 downto 0);
			  Column : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

begin
--
--memm: memoire port map(
--		Clk => CLK,
--		X => X,
--		Y => Y,
--		pixel => pdata);

brt: BlockRamTextures port map(
		Clock => CLK,
		Texture => texture_request,
		Row => A,
		Column => B,
		DataOut => pdatav);

process (CLK)
begin
	if rising_edge (CLK) then
		if RST = '1' THEN
			DATA <= (OTHERS => '0');
			RESET <= '1';
			EN <= '0';
		ELSE
			if STATE = IDLE then
				RESET <= '0' ;
				frame_valid <= '0';
				EN <= '0';
			elsif STATE = DISPLAYING then 
				IF frame_count < 2500  THEN
				
				RESET <= '0';
				DATA <= yoyo;
				frame_valid <= '1';
				EN <= '1'; 
			  ELSE
				
				RESET <= '0';
				DATA <= yoyo;
				frame_valid <= '1';
				EN <= '1';
				debug <= '0';
				END IF;
			ELSIF STATE = NOTDISPLAYING THEN
				RESET <= '0';
				DATA <= yoyo;
				frame_valid <= '1';
				EN <= '0'; 
			END IF;
			  
			
		END IF;
	end if;
end process;
STATE_PROCESS: PROCESS(CLK)
BEGIN
	IF RISING_EDGE (CLK) THEN
		IF RST = '1' OR CALIB_DONE = '0' THEN
			STATE <=IDLE;
		ELSE
			STATE <= NEXT_STATE;
		END IF;
	END IF;
END PROCESS;


frame_valid_process: process (STATE,CALIB_DONE,ROW,COLUMN) 

begin
	NEXT_STATE <= STATE;
	CASE STATE IS 
		WHEN IDLE =>
			if calib_done = '1' then
				NEXT_STATE <= DISPLAYING;
			END IF;		 
		WHEN DISPLAYING =>
			IF frame_count =4500  then
				
				NEXT_STATE <= NOTDISPLAYING;
			END IF;
		WHEN NOTDISPLAYING =>
				if frame_count = 5000 then
					NEXT_STATE <= DISPLAYING;
				end if;
	END CASE;
end process;




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

X_proc: process(row)

begin

if row < 600 then
	X <= conv_std_logic_vector(row, 10);
else
	X <= conv_std_logic_vector(599, 10);
end if;

end process;

--yoproc: process
--
--begin
--
--wait until CLK'event and CLK = '1';
--
--if RST = '1' OR CALIB_DONE = '0' then
--	yoyo <= "0000000000000000";
--else
--	if pdata = '1' then
--		yoyo <= "0000011111100000";
--	else
--		yoyo <= "0000000000000000";
--	end if;
--end if;
--
--end process;

--debugproc: process
--
--begin
--
--wait until Clk'event and Clk = '1';
--
--if X = "0000000000" or X = "1001010111" then
--	yoyo <= "0000011111100000";
--elsif Y = "0000000000" or Y = "1100011111" then
--	yoyo <= "0000011000000000";
--else
--	yoyo <= "0000000000000000";
--end if;
--
--
--end process;

pistol: process

begin

wait until Clk'event and Clk = '1';

if column < 253 and row < 23 then

if texture_request <= "0001" and pdatav = "0001" then
	yoyo <= x"001F";
elsif texture_request <= "0010" and pdatav = "0001" then
	yoyo <= x"0400";
elsif texture_request <= "0011" and pdatav = "0001" then
	yoyo <= x"F800";
elsif texture_request <= "0100" and pdatav = "0001" then
	yoyo <= x"0010";
elsif texture_request <= "0101" and pdatav = "0001" then
	yoyo <= x"8000";
elsif texture_request <= "0110" and pdatav = "0001" then
	yoyo <= x"0410";
elsif texture_request <= "0111" and pdatav = "0001" then
	yoyo <= x"5315";
elsif texture_request <= "1000" and pdatav = "0001" then
	yoyo <= x"0000";
elsif texture_request <= "1001" and pdatav = "0001" then
	yoyo <= x"ca75";
elsif texture_request <= "1001" and pdatav = "0001" then
	yoyo <= x"ba75";
elsif texture_request <= "1001" and pdatav = "0011" then
	yoyo <= x"aa75";
elsif texture_request <= "1001" and pdatav = "0100" then
	yoyo <= x"ab70";
elsif texture_request <= "1001" and pdatav = "0101" then
	yoyo <= x"2345";
elsif texture_request <= "1001" and pdatav = "0110" then
	yoyo <= x"9999";
elsif texture_request <= "1001" and pdatav = "0111" then
	yoyo <= x"23ff";
elsif texture_request <= "1001" and pdatav = "1000" then
	yoyo <= x"bcbc";
elsif texture_request <= "1001" and pdatav = "1001" then
	yoyo <= x"fafa";
elsif texture_request <= "1001" and pdatav = "1010" then
	yoyo <= x"3333";
elsif texture_request <= "1001" and pdatav = "1011" then
	yoyo <= x"1111";
elsif texture_request <= "1001" and pdatav = "1111" then
	yoyo <= x"ffff";
elsif texture_request <= "1001" and pdatav = "1110" then
	yoyo <= x"eeee";
elsif texture_request <= "1001" and pdatav = "1101" then
	yoyo <= x"8765";
else
	yoyo <= x"AC20";
end if;	

else
	yoyo <= x"673F";
end if;

end process;


selectprocess: process(column)

begin

if column < 253 and row < 23 then

	A <= conv_std_logic_vector(row, 5);
	if column < 23 then
		texture_request <= "0001";
		B <= conv_std_logic_vector(column, 5);
	elsif column < 46 then
		texture_request <= "0010";
		B <= conv_std_logic_vector(column - 23, 5);
	elsif column < 69 then
		texture_request <= "0011";
		B <= conv_std_logic_vector(column - 46, 5);
	elsif column < 92 then
		texture_request <= "0100";
		B <= conv_std_logic_vector(column - 69, 5);
	elsif column < 115 then
		texture_request <= "0101";
		B <= conv_std_logic_vector(column - 92, 5);
	elsif column < 138 then
		texture_request <= "0110";
		B <= conv_std_logic_vector(column - 115, 5);
	elsif column < 161 then
		texture_request <= "0111";
		B <= conv_std_logic_vector(column - 138, 5);
	elsif column < 184 then
		texture_request <= "1000";
		B <= conv_std_logic_vector(column - 161, 5);
	elsif column < 207 then
		texture_request <= "1001";
		B <= conv_std_logic_vector(column - 184, 5);
	elsif column < 230 then
		texture_request <= "1001";
		B <= conv_std_logic_vector(column - 207, 5);
	elsif column < 253 then
		texture_request <= "1001";
		B <= conv_std_logic_vector(column - 230, 5);
	
	end if;
	
else
	A <= (others => '0');
	B <= (others => '0');
	
end if;

end process;

--selectprocess: process(column)
--
--begin
--
--if column < 253 and row < 23 then
--
--	A <= conv_std_logic_vector(row, 5);
--	if column < 23 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column, 5);
--	elsif column < 46 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 23, 5);
--	elsif column < 69 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 46, 5);
--	elsif column < 92 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 69, 5);
--	elsif column < 115 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 92, 5);
--	elsif column < 138 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 115, 5);
--	elsif column < 161 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 138, 5);
--	elsif column < 184 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 161, 5);
--	elsif column < 207 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 184, 5);
--	elsif column < 230 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 207, 5);
--	elsif column < 253 then
--		texture_request <= "1001";
--		B <= conv_std_logic_vector(column - 130, 5);
--	
--	end if;
--	
--else
--	A <= (others => '0');
--	B <= (others => '0');
--	
--end if;
--
--end process;

--bedug(4 downto 2) <= "111";
DOUT <= DATA;
ENA <= EN;

column_process : process
begin
wait until Clk'event and Clk = '1';

--if RST = '1' or 
--if calib_done = '0'  then
--	column <= 0 ;
if column = 1280-1  then
	column <= 0;
else
	column <= column + 1;
	END IF;
end process;

row_proces :   process

begin

wait until Clk'event and Clk = '1';

--if RST = '1' or 
--if calib_done = '0' then
--	row <= 0;
if column = 1280 - 1 and row /= 721 - 1 then
	row <= row + 1;
elsif row = 721 - 1 then
	row<= 0;
else
	row <=row;
end if;

end process;
  
  
frame_proces :  process(frame_cnt)
begin
if rising_edge(frame_cnt) then
   if frame_count = 5000  then
			frame_count <= 0;
      else
			frame_count<= frame_count + 1;
      end if;
	end if;
end process;


frame_cnt <= '1' when column= 1280 - 1 and row = 721 - 1 else '0';
row_count <= '1' when column= 1280 - 1 else '0';
--bedug(0) <= '1' when Y = "1100011111" else '0';
--bedug(1) <= '1' when X = "1001010111" else '0';

end Behavioral;


