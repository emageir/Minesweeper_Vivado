
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity BlockRamWinner is
	Port (  Clock : in  STD_LOGIC;
           Row : in  STD_LOGIC_VECTOR (4 downto 0);
			  Column : in  STD_LOGIC_VECTOR (6 downto 0);
           DataOutPixel : out  STD_LOGIC
			  );
end BlockRamWinner;

architecture Behavioral of BlockRamWinner is

component RowToAddr 
    Port ( 
			  Row : in  STD_LOGIC_VECTOR (4 downto 0);
           AddressOut : out STD_LOGIC_VECTOR (4 downto 0)
			  );
end component;

component MemWinner
	PORT (
			 a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			 clk : IN STD_LOGIC;
			 spo : OUT STD_LOGIC_VECTOR(107 DOWNTO 0)
			);
end component;

component Reg7
	Port	( 
			Clock : in  STD_LOGIC;
         ColumnIn : in  STD_LOGIC_VECTOR (6 downto 0);
         ColumnOut : out  STD_LOGIC_VECTOR (6 downto 0)
			 );
end component;

component ToPixelWinner
	Port ( 
			DataIn : in  STD_LOGIC_VECTOR (107 downto 0);
         Column : in  STD_LOGIC_VECTOR (6 downto 0);
         PixelOut : out  STD_LOGIC
			 );
end component;

--------SIGNALS
signal AddressOut_signal : std_logic_vector(4 downto 0);
signal MemOut_signal : std_logic_vector(107 downto 0);
signal ColumnOut_signal : std_logic_vector(6 downto 0);


begin

--------PORT MAPS
RowToAddres:RowToAddr
port map(Row => Row,
			AddressOut => AddressOut_signal);
			
CoreWinner:MemWinner
port map(a => AddressOut_signal,
			clk => Clock,
			spo => MemOut_signal);
			
Register7:Reg7
port map(Clock => Clock,
			ColumnIn => Column,
			ColumnOut => ColumnOut_signal);

ToPixel:ToPixelWinner
port map(DataIn => MemOut_signal,
			Column => ColumnOut_signal,
			PixelOut => DataOutPixel);

end Behavioral;

