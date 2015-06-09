library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BlockRamGrid is
    Port ( 
			  Clock : in  STD_LOGIC;
			  Set : in STD_LOGIC;
           X_Control : in  STD_LOGIC_VECTOR (4 downto 0);
           Y_Control : in  STD_LOGIC_VECTOR (4 downto 0);
           DataIn : in  STD_LOGIC_VECTOR (4 downto 0);
           X_Graphics : in  STD_LOGIC_VECTOR (4 downto 0);
           Y_Graphics : in  STD_LOGIC_VECTOR (4 downto 0);
           DataOutControl : out  STD_LOGIC_VECTOR (4 downto 0);
           DataOutGraphics : out  STD_LOGIC_VECTOR (4 downto 0)
			  );
end BlockRamGrid;

architecture Behavioral of BlockRamGrid is

component CoordToAddr
	Port ( 
			  X : in  STD_LOGIC_VECTOR (4 downto 0);
           Y : in  STD_LOGIC_VECTOR (4 downto 0);
           Output : out STD_LOGIC_VECTOR (8 downto 0)
			  );
end component;

component Mem 
  PORT (
    a : IN STD_LOGIC_VECTOR(8 DOWNTO 0); --Address from Control
    d : IN STD_LOGIC_VECTOR(4 DOWNTO 0); --DataIn
    dpra : IN STD_LOGIC_VECTOR(8 DOWNTO 0); --Address from Graphics
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC; --Set
    spo : OUT STD_LOGIC_VECTOR(4 DOWNTO 0); --DataOutControl
    dpo : OUT STD_LOGIC_VECTOR(4 DOWNTO 0) --DataOutGraphics
  );
END component;

signal OutputControl_signal : std_logic_vector(8 downto 0);
signal OutputGraphics_signal : std_logic_vector(8 downto 0);
signal RegOut_signal : std_logic_vector(4 downto 0);

begin

CoordToAddr_Control:CoordToAddr
port map(X => X_Control, Y => Y_Control, Output => OutputControl_signal);

CoordToAddr_Graphics:CoordToAddr
port map(X => X_Graphics, Y => Y_Graphics, Output => OutputGraphics_signal);

CORE:Mem
port map(a => OutputControl_signal, d => DataIn, dpra => OutputGraphics_signal, clk => Clock, we => Set,
			spo => DataOutControl, dpo => DataOutGraphics);
			
--BlockRamCtrl:BlockRamControl
--port map(Clock => Clock, Reset => Reset, Set => Set, AddressControl => OutputControl_signal,
--			DataIn => DataIn, DataOut => DataOutControl);
--			
--BlockRamGraph:BlockRamGraphics
--port map(Clock => Clock, Reset => Reset, Set => Set, AddressControl => OutputControl_signal,
--			AddressGraphics => OutputGraphics_signal, DataIn => DataIn, DataOut => DataOutGraphics,
--			Stall => Stall);

--REG5:Register5_NoEnable
--port map(rst => Reset, clk => Clock, din => DataIn, dout => RegOut_signal);

end Behavioral;
