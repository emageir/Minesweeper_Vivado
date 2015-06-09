----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:40:15 12/02/2014 
-- Design Name: 
-- Module Name:    Top_Level - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Level is
Port (   CLK_I : in  STD_LOGIC;
         RESET_I : in  STD_LOGIC;
			Up : in  STD_LOGIC;
         Down : in  STD_LOGIC;
         Left : in  STD_LOGIC;
         Right : in  STD_LOGIC;
         Confirm : in  STD_LOGIC;
         Move1 : in  STD_LOGIC_VECTOR(0 downto 0);
         Move2 : in  STD_LOGIC_VECTOR(0 downto 0);
         Move4 : in  STD_LOGIC_VECTOR(0 downto 0);
         Move8 : in  STD_LOGIC_VECTOR(0 downto 0);
			Face_enable : in STD_LOGIC;
			Rnd_Enable : in  STD_LOGIC;
			--Debugging
			IniDone : out STD_LOGIC;
			RndPressed : out STD_LOGIC;
			
			--HDMI connections
			TMDS_TX_2_P : out  STD_LOGIC;
			TMDS_TX_2_N : out  STD_LOGIC;
			TMDS_TX_1_P : out  STD_LOGIC;
			TMDS_TX_1_N : out  STD_LOGIC;
			TMDS_TX_0_P : out  STD_LOGIC;
			TMDS_TX_0_N : out  STD_LOGIC;
			TMDS_TX_CLK_P : out  STD_LOGIC;
			TMDS_TX_CLK_N : out  STD_LOGIC;
			TMDS_TX_SCL : inout  STD_LOGIC;
			TMDS_TX_SDA : inout  STD_LOGIC;	  
----------------------------------------------------------------------------------
-- DDR2 Interface
----------------------------------------------------------------------------------
			mcb3_dram_dq            	: inout  std_logic_vector(15 downto 0);
			mcb3_dram_a                : out std_logic_vector(12 downto 0);
			mcb3_dram_ba               : out std_logic_vector(2 downto 0);
			mcb3_dram_ras_n            : out std_logic;
			mcb3_dram_cas_n            : out std_logic;
			mcb3_dram_we_n             : out std_logic;
			mcb3_dram_odt              : out std_logic;
			mcb3_dram_cke              : out std_logic;
			mcb3_dram_dm               : out std_logic;
			mcb3_dram_udqs             : inout  std_logic;
			mcb3_dram_udqs_n           : inout  std_logic;
			mcb3_rzq                   : inout  std_logic;
			mcb3_zio                   : inout  std_logic;
			mcb3_dram_udm              : out std_logic;
			mcb3_dram_dqs              : inout  std_logic;
			mcb3_dram_dqs_n            : inout  std_logic;
			mcb3_dram_ck               : out std_logic;
			mcb3_dram_ck_n             : out std_logic
 
);
end Top_Level;

architecture Behavioral of Top_Level is

Component BlockRamGrid
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
end Component;

Component Control
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
           --Player_out : out  STD_LOGIC;
			  Score_out: out  STD_LOGIC_VECTOR (11 downto 0);
           Last_hit_P1 : out  STD_LOGIC_VECTOR (9 downto 0);
           Last_hit_P2 : out  STD_LOGIC_VECTOR (9 downto 0);
           Ini_Done : out  STD_LOGIC;
			  Winner : out  STD_LOGIC_VECTOR (1 downto 0);
           Play_Done : out  STD_LOGIC;
			  Who : out STD_LOGIC;
			  Donesig : out STD_LOGIC;
			  Request_Set:out STD_LOGIC);
end Component;

Component Cursor
    Port ( Clk : in  STD_LOGIC;
			  Reset :in STD_LOGIC;
			  Up : in  STD_LOGIC;
           Down : in  STD_LOGIC;
           Left : in  STD_LOGIC;
           Right : in  STD_LOGIC;
           Move1 : in  STD_LOGIC_vector(0 downto 0);
           Move2 : in  STD_LOGIC_vector(0 downto 0);
           Move4 : in  STD_LOGIC_vector(0 downto 0);
           Move8 : in  STD_LOGIC_vector(0 downto 0);
			  
           X_co : out  std_logic_vector (4 downto 0);
           Y_co : out  std_logic_vector (4 downto 0));
end Component;

Component DigitsForScore
	Port ( Score : in  STD_LOGIC_Vector(5 downto 0);
           Digit1 : out  STD_LOGIC_VECTOR (3 downto 0);
           Digit2 : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end Component;


signal X_cursor :  std_logic_vector (4 downto 0);
signal Y_cursor :  std_logic_vector (4 downto 0);
signal Data_to_Control: std_logic_vector (4 downto 0);
signal Data_to_Grid: std_logic_vector (4 downto 0);
signal X_control_toGrid :  std_logic_vector (4 downto 0);
signal Y_control_toGrid :  std_logic_vector (4 downto 0);

signal Request_Set :STD_LOGIC;

------- signals for image
--signal Player_out :  STD_LOGIC;
signal Last_hit_P1_sig :   STD_LOGIC_VECTOR (9 downto 0);
signal Last_hit_P2_sig :   STD_LOGIC_VECTOR (9 downto 0);
signal Ini_Done_sig :   STD_LOGIC;
signal Winner_sig:  STD_LOGIC_VECTOR (1 downto 0);
signal Play_Done_sig :  STD_LOGIC;
signal Score_sig:  STD_LOGIC_VECTOR (11 downto 0);
signal P1Digit1_sig : std_logic_vector (3 downto 0);
signal P1Digit2_sig : std_logic_vector (3 downto 0);
signal P2Digit1_sig : std_logic_vector (3 downto 0);
signal P2Digit2_sig : std_logic_vector (3 downto 0);

--signals for vaggelis

signal Data_Grid_toGraphics : std_logic_vector (4 downto 0);
signal X_Graphics_toGrid : std_logic_vector (4 downto 0);
signal Y_Graphics_toGrid : std_logic_vector (4 downto 0);
signal PICLK : STD_LOGIC;
signal Who : STD_LOGIC;
--normalization
signal Up_nrm, Down_nrm, Right_nrm, Left_nrm, Confirm_nrm : STD_LOGIC;

begin

RndPressed <= Who;

up_norm: entity work.Normalizer PORT MAP(
		clk => PICLK,
		reset => not RESET_I,
		button_in => Up,
		button_out => Up_nrm
	);
	
down_norm: entity work.Normalizer PORT MAP(
		clk => PICLK,
		reset => not RESET_I,
		button_in => Down,
		button_out => Down_nrm
	);

left_norm: entity work.Normalizer PORT MAP(
		clk => PICLK,
		reset => not RESET_I,
		button_in => Left,
		button_out => Left_nrm
	);

right_norm: entity work.Normalizer PORT MAP(
		clk => PICLK,
		reset => not RESET_I,
		button_in => Right,
		button_out => Right_nrm
	);
	
confirm_norm: entity work.Normalizer PORT MAP(
		clk => PICLK,
		reset => not RESET_I,
		button_in => Confirm,
		button_out => Confirm_nrm
	);

BlockRam_Grid_p: BlockRamGrid port map(Clock =>PICLK,

			  Set =>Request_Set,
           X_Control=>X_control_toGrid,
           Y_Control=>Y_control_toGrid,
           DataIn =>Data_to_Grid,
           X_Graphics =>X_Graphics_toGrid,
           Y_Graphics =>Y_Graphics_toGrid,
           DataOutControl =>Data_to_Control,
           DataOutGraphics =>Data_Grid_toGraphics);

Cursor_p : Cursor port map(Clk=>PICLK,Reset=>not RESET_I,Up=>Up_nrm,Down=>Down_nrm,Left=>Left_nrm,Right=>Right_nrm,
									Move1=>Move1,Move2=>Move2,Move4=>Move4,Move8=>Move8,X_co=>X_cursor,Y_co=>Y_cursor);

Control_p: Control port map(Clk =>PICLK,
           Reset =>not RESET_I,
           Rnd_Enable=>Rnd_Enable,
           Data_in =>Data_to_Control,
           X_cursor =>X_cursor,
           Y_cursor =>Y_cursor,
			  Confirm => Confirm_nrm,
			  
           Data_out => Data_to_Grid,
           X_out =>X_control_toGrid,
           Y_out =>Y_control_toGrid,
          -- Player_out =>Player_out,
			  Score_out=>Score_sig,
           Last_hit_P1 =>Last_hit_P1_sig,
           Last_hit_P2 =>Last_hit_P2_sig,
           Ini_Done =>Ini_Done_sig,
			  Winner => Winner_sig,
           Play_Done =>Play_Done_sig,
			  Who => Who,
			  Donesig => Inidone,
			  Request_Set =>Request_Set
			  );

ScoreP1: DigitsForScore port map(
				Score => Score_sig(11 downto 6),
				Digit1 => P1Digit1_sig,
				Digit2 => P1Digit2_sig
			);
			
ScoreP2: DigitsForScore port map(
				Score => Score_sig(5 downto 0),
				Digit1 => P2Digit1_sig,
				Digit2 => P2Digit2_sig
			);
			
Inst_HDMI: entity work.connect_HDMI port map(
				TMDS_TX_2_P => TMDS_TX_2_P,
				TMDS_TX_2_N => TMDS_TX_2_N,
				TMDS_TX_1_P => TMDS_TX_1_P,
				TMDS_TX_1_N =>TMDS_TX_1_N,
				TMDS_TX_0_P =>TMDS_TX_0_P,
				TMDS_TX_0_N =>TMDS_TX_0_N,
				TMDS_TX_CLK_P =>TMDS_TX_CLK_P,
				TMDS_TX_CLK_N =>TMDS_TX_CLK_N,
				TMDS_TX_SCL =>TMDS_TX_SCL,
				TMDS_TX_SDA =>TMDS_TX_SDA,
				CLK_I => CLK_I,
				RESET_I => not RESET_I,
				mcb3_dram_dq    =>  mcb3_dram_dq,
				mcb3_dram_a      => mcb3_dram_a,
				mcb3_dram_ba     => mcb3_dram_ba,
				mcb3_dram_ras_n  => mcb3_dram_ras_n,
				mcb3_dram_cas_n  => mcb3_dram_cas_n,
				mcb3_dram_we_n   => mcb3_dram_we_n,
				mcb3_dram_odt    => mcb3_dram_odt,
				mcb3_dram_cke    => mcb3_dram_cke,
				mcb3_dram_dm     => mcb3_dram_dm,
				mcb3_dram_udqs   => mcb3_dram_udqs,
				mcb3_dram_udqs_n => mcb3_dram_udqs_n,
				mcb3_rzq         => mcb3_rzq,
				mcb3_zio         => mcb3_zio,
				mcb3_dram_udm    => mcb3_dram_udm,
				mcb3_dram_dqs    => mcb3_dram_dqs,
				mcb3_dram_dqs_n  => mcb3_dram_dqs_n,
				mcb3_dram_ck     => mcb3_dram_ck,
				mcb3_dram_ck_n   => mcb3_dram_ck_n,
				Last_hit_P1_sig  => Last_hit_P1_sig,
				Last_hit_P2_sig  =>	Last_hit_P2_sig,
				Ini_Done_sig => Ini_Done_sig,
				Winner_sig => Winner_sig,
				Score_sig => Score_sig,
				P1Digit1_sig => P1Digit1_sig,
				P1Digit2_sig => P1Digit2_sig,
				P2Digit1_sig => P2Digit1_sig,
				P2Digit2_sig => P2Digit2_sig,
				Data_Grid_toGraphics => Data_Grid_toGraphics,
				X_Graphics_toGrid => X_Graphics_toGrid,
				Y_Graphics_toGrid => Y_Graphics_toGrid,
				X_cursor => X_cursor,
				Y_cursor => Y_cursor,
				Who => Who,
				Face_enable => Face_enable,
				--debugging
				ConfirmTest => Confirm,
				RndTest => Rnd_Enable,
				RightTest => Right,
				PICLK => PICLK
				);
				
end Behavioral;

