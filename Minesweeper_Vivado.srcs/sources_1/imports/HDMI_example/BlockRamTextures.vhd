library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.NUMERIC_STD.all;
use Ieee.std_logic_unsigned.all;

entity BlockRamTextures is
    Port ( Clock : in  STD_LOGIC;
           Texture : in  STD_LOGIC_VECTOR (3 downto 0);
           Row : in  STD_LOGIC_VECTOR (4 downto 0);
			  Column : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (3 downto 0));
end BlockRamTextures;

architecture Behavioral of BlockRamTextures is

component TextAndRowToAddr
	Port ( 
          Texture : in  STD_LOGIC_VECTOR (3 downto 0);
          Row : in  STD_LOGIC_VECTOR (4 downto 0);
          AddressOut : out  STD_LOGIC_VECTOR (7 downto 0)
			);
end component;

component MemTextures 
  PORT (
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 clk : IN STD_LOGIC;
		 spo : OUT STD_LOGIC_VECTOR(91 DOWNTO 0)
	  );
end component;

component Reg5
	Port	( 
			Clock : in  STD_LOGIC;
         ColumnIn : in  STD_LOGIC_VECTOR (4 downto 0);
         ColumnOut : out  STD_LOGIC_VECTOR (4 downto 0)
			 );
end component;


			
component ToPixel
	Port ( 
			  DataIn : in  STD_LOGIC_VECTOR (91 downto 0);
           Column : in  STD_LOGIC_VECTOR (4 downto 0);
           PixelOut : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
end component;


signal AddressOut_signal : std_logic_vector(7 downto 0);
signal MemOut_signal : std_logic_vector(91 downto 0);
signal ColumnOut_signal : std_logic_vector(4 downto 0);


--signal temp : natural:=0;
--signal c0, c1, c2, c3: STD_LOGIC_VECTOR(4 DOWNTO 0);

begin

TextAndRow:TextAndRowToAddr
port map(Texture => Texture, Row => Row, AddressOut => AddressOut_signal);

CoreTextures:MemTextures
port map(a => AddressOut_signal, clk => Clock, spo => MemOut_signal); 

Register5:Reg5
port map(Clock => Clock,
			ColumnIn => Column,
			ColumnOut => ColumnOut_signal
);

Pixel:ToPixel
port map(DataIn => MemOut_signal, Column => ColumnOut_signal, PixelOut => DataOut);
			
----temp <= to_integer(unsigned(Column))*4;
--temp<= 3;
--
--c3 <= Column + '1' + '1' + '1';
--c2 <= Column + '1' + '1';
--c1 <= Column + '1';
--c0 <= Column - '1';
--
--DataOut(3) <= MemOut_signal(to_integer(unsigned(c3))*4);
--DataOut(2) <= MemOut_signal(to_integer(unsigned(c2))*4);
--DataOut(1) <= MemOut_signal(to_integer(unsigned(c1))*4);
--DataOut(0) <= MemOut_signal(to_integer(unsigned(c0))*4);

end Behavioral;