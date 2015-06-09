library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity BlockRamScore is
		Port ( 
			  Clock : in  STD_LOGIC;
           Texture : in  STD_LOGIC_VECTOR (4 downto 0);
           Row : in  STD_LOGIC_VECTOR (4 downto 0);
			  Column : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOutPixel : out  STD_LOGIC
			  );
end BlockRamScore;

architecture Behavioral of BlockRamScore is

component ScoreAndRowToAddr 
    Port ( 
			  Texture : in  STD_LOGIC_VECTOR (4 downto 0);
           Row : in  STD_LOGIC_VECTOR (4 downto 0);
           AddressOut : out STD_LOGIC_VECTOR (7 downto 0)
			  );
end component;

component MemScore 
	PORT (
			 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			 clk : IN STD_LOGIC;
			 spo : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
end component;

component Reg5
	Port	( 
			Clock : in  STD_LOGIC;
         ColumnIn : in  STD_LOGIC_VECTOR (4 downto 0);
         ColumnOut : out  STD_LOGIC_VECTOR (4 downto 0)
			 );
end component;

component ToPixelScore
	Port ( 
			DataIn : in  STD_LOGIC_VECTOR (11 downto 0);
         Column : in  STD_LOGIC_VECTOR (4 downto 0);
         PixelOut : out  STD_LOGIC
			 );
end component;

signal AddressOut_signal : std_logic_vector(7 downto 0);
signal MemOut_signal : std_logic_vector(11 downto 0);
signal ColumnOut_signal : std_logic_vector(4 downto 0);

begin

ScoreToAddr:ScoreAndRowToAddr
port map(Texture => Texture,
			Row => Row,
			AddressOut => AddressOut_signal);

CoreScore:MemScore
port map(a => AddressOut_signal,
			clk => Clock,
			spo => MemOut_signal);
			
Register5:Reg5
port map(Clock => Clock,
			ColumnIn => Column,
			ColumnOut => ColumnOut_signal);
			
ToPixel:ToPixelScore
port map(DataIn => MemOut_signal,
			Column => ColumnOut_signal,
			PixelOut => DataOutPixel);

end Behavioral;

