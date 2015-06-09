
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Rnd_Enable : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
           X_cursor : in  STD_LOGIC_VECTOR (4 downto 0);
           Y_cursor : in  STD_LOGIC_VECTOR (4 downto 0);
			  Confirm :  in  STD_LOGIC;
			  
           Data_out : out  STD_LOGIC_VECTOR (4 downto 0);
           X_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
          -- Player_out : out  STD_LOGIC;
			  Score_out: out  STD_LOGIC_VECTOR (11 downto 0);
           Last_hit_P1 : out  STD_LOGIC_VECTOR (9 downto 0);
           Last_hit_P2 : out  STD_LOGIC_VECTOR (9 downto 0);
           Ini_Done : out  STD_LOGIC;
			  Winner : out  STD_LOGIC_VECTOR (1 downto 0);
           Play_Done : out  STD_LOGIC;
			  OpenRest_Done : out  STD_LOGIC;
			  Who : out STD_LOGIC;
			  --debug
			  Donesig : out STD_LOGIC;
			  Request_Set:out STD_LOGIC
			  );
end Control;

architecture Behavioral of Control is

--------- Random Signals ---------------
signal Request_Set_rnd : Std_Logic;
signal X_out_rnd: STD_LOGIC_VECTOR (4 downto 0);
signal Y_out_rnd: STD_LOGIC_VECTOR (4 downto 0);
signal Data_out_rnd : STD_LOGIC_VECTOR (4 downto 0);
signal Rnd_Done_sig: Std_Logic;


--------- Initialize Signals --------------
signal Request_Set_ini : Std_Logic;
signal X_out_ini: STD_LOGIC_VECTOR (4 downto 0);
signal Y_out_ini: STD_LOGIC_VECTOR (4 downto 0);
signal Data_out_ini : STD_LOGIC_VECTOR (4 downto 0);
signal Ini_Done_sig: Std_Logic;

---------PlayMode Signals ------------------
signal Request_Set_play : Std_Logic;
signal X_out_play: STD_LOGIC_VECTOR (4 downto 0);
signal Y_out_play: STD_LOGIC_VECTOR (4 downto 0);
signal Data_out_play : STD_LOGIC_VECTOR (4 downto 0);
signal Play_Done_sig: Std_Logic;
signal Winner_sig: Std_Logic_VECTOR (1 downto 0);
signal Who_sig:Std_Logic;

--------- Reset Signals --------------------
signal Request_Set_rst : Std_Logic;
signal X_out_rst: STD_LOGIC_VECTOR (4 downto 0);
signal Y_out_rst: STD_LOGIC_VECTOR (4 downto 0);
signal Data_out_rst : STD_LOGIC_VECTOR (4 downto 0);

--------- OpenRest Signals ---------------------
signal Request_Set_oprst : Std_Logic;
signal X_out_oprst: STD_LOGIC_VECTOR (4 downto 0);
signal Y_out_oprst: STD_LOGIC_VECTOR (4 downto 0);
signal Data_out_oprst : STD_LOGIC_VECTOR (4 downto 0);
signal OpenRest_Done_sig: Std_Logic;


Component Reset_Module
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  Request_Set : out  STD_LOGIC;
			  X_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
		     Data_out : out  STD_LOGIC_VECTOR (4 downto 0));
end Component;


Component Randomize 
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  Enable : in Std_Logic;
           Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
			  
           Request_Set : out  STD_LOGIC;
			  X_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  Data_out : out  STD_LOGIC_VECTOR (4 downto 0); 
			  Done:out STD_LOGIC);
end Component;


Component Initialize
	port( Clk : in  STD_LOGIC;
		  Reset : in  STD_LOGIC;
		  Random_Done : in Std_Logic;
		  Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
		  
		  Request_Set : out  STD_LOGIC;
		  X_out : out  STD_LOGIC_VECTOR (4 downto 0);
        Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
		  Data_out : out  STD_LOGIC_VECTOR (4 downto 0); 
		  Done : out STD_LOGIC);
end Component;

Component Play_module
    Port ( Ini_Done : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
           X_cursor : in  STD_LOGIC_VECTOR (4 downto 0);
           Y_cursor : in  STD_LOGIC_VECTOR (4 downto 0);
			  Confirm: in STD_LOGIC;
			  
           Request_set : out  STD_LOGIC;
           X_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
           Data_out : out  STD_LOGIC_VECTOR (4 downto 0);
			  Winner : out  STD_LOGIC_VECTOR (1 downto 0);
           Done : out  STD_LOGIC;
           --Player : out  STD_LOGIC;
			  Score: out  STD_LOGIC_VECTOR (11 downto 0);
           Last_hit_P1 : out  STD_LOGIC_VECTOR (9 downto 0);
           Last_hit_P2 : out  STD_LOGIC_VECTOR (9 downto 0);
			  Who : out STD_LOGIC);
end Component;


component OpenRest_module
	port( Play_Done : in  STD_LOGIC;
		  Clk : in  STD_LOGIC;
		  Reset : in  STD_LOGIC;
		  Data_in : in  STD_LOGIC_VECTOR (4 downto 0);
		  
		  Request_Set : out  STD_LOGIC;
		  X_out : out  STD_LOGIC_VECTOR (4 downto 0);
		  Y_out : out  STD_LOGIC_VECTOR (4 downto 0);
		  Data_out : out  STD_LOGIC_VECTOR (4 downto 0);
		  Done : out  STD_LOGIC
		  );
end component;


begin

process
begin
	WAIT UNTIL Clk'Event AND Clk='1';
	If (Reset='1') then
	
		Data_out <= Data_out_rst;
		X_out <=  X_out_rst;
		Y_out <= Y_out_rst;
		Request_Set <=Request_Set_rst;
		
	
	else
	
		if(Rnd_Done_sig='1') then
			if (Ini_Done_sig='1') then
				if (Play_Done_sig = '1') then
					Data_out <= Data_out_oprst;
					X_out <=  X_out_oprst;
					Y_out <= Y_out_oprst;
					Request_Set <=Request_Set_oprst;
				else	
			
					Data_out <= Data_out_play;
					X_out <=  X_out_play;
					Y_out <= Y_out_play;
					Request_Set <=Request_Set_play;
				end if;
			else
				Data_out <= Data_out_ini;
				X_out <=  X_out_ini;
				Y_out <= Y_out_ini;
				Request_Set <=Request_Set_ini;
			end if;
		else
	      Data_out <= Data_out_rnd;
         X_out <=  X_out_rnd;
         Y_out <= Y_out_rnd;
			Request_Set <=Request_Set_rnd;
		end if;
	end if;
end process;
	

Ini_Done<=Ini_Done_sig;
Play_Done<=Play_Done_sig;
OpenRest_Done <= OpenRest_Done_sig;
Winner <= Winner_sig;
Who<=Who_sig;

Random_mode : Randomize 
port map(Clk, 
			Reset, 
			Rnd_Enable, 
			Data_in, 
			Request_Set_rnd, 
			X_out_rnd,
			Y_out_rnd,
			Data_out_rnd,
			Rnd_Done_sig);

Initialize_mode: Initialize 
port map(Clk, 
			Reset, 
			Rnd_Done_sig, 
			Data_In, 
			Request_Set_ini,
			X_out_ini,
			Y_out_ini,
			Data_out_ini,
			Ini_Done_sig);

Play_mode: Play_module 
port map (Ini_Done_sig,
			Clk, 
			Reset, 
			Data_in, 
			X_cursor, 
			Y_cursor, 
			Confirm, 
			Request_Set_play,
			X_out_play, 
			Y_out_play, 
			Data_out_play, 
			Winner_sig,
			Play_Done_sig, 
			Score_out, 
			Last_hit_P1, 
			Last_hit_P2,
			Who_sig);--Player_out,

Reset_mode : Reset_module 
port map(Clk,
			Reset,
			Request_Set_rst,
			X_out_rst,											  
			Y_out_rst,
			Data_out_rst);

OpenRest_mode : OpenRest_module 
port map(Play_Done_sig,
			Clk,
			Reset,
			Data_in,
			Request_Set_oprst,
			X_out_oprst,											  
			Y_out_oprst,
			Data_out_oprst,
			OpenRest_Done_Sig);
			
Donesig <= Rnd_Done_sig;

end Behavioral;

