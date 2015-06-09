----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:27 12/02/2012 
-- Design Name: 
-- Module Name:    connect_Hdmi - Behavioral 
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

entity connect_Hdmi is
--Generic (
--		C3_NUM_DQ_PINS          : integer := 16; 
--		C3_MEM_ADDR_WIDTH       : integer := 13; 
--		C3_MEM_BANKADDR_WIDTH   : integer := 3
--	);
   Port (	
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
	-- START SENDING PIXELS
		
		CLK_I : in  STD_LOGIC;
		RESET_I : in  STD_LOGIC;
----------------------------------------------------------------------------------
	  
----------------------------------------------------------------------------------
-- DDR2 Interface
----------------------------------------------------------------------------------
--		mcb3_dram_dq            	: inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
--		mcb3_dram_a                : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
--		mcb3_dram_ba               : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
--Yo
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
		mcb3_dram_ck_n             : out std_logic;
		--Game info!
		Last_hit_P1_sig				: in STD_LOGIC_VECTOR (9 downto 0);
		Last_hit_P2_sig				: in STD_LOGIC_VECTOR (9 downto 0);
		Ini_Done_sig 					: in STD_LOGIC;
		Winner_sig						: in STD_LOGIC_VECTOR (1 downto 0);
		Score_sig						: in STD_LOGIC_VECTOR (11 downto 0);
		P1Digit1_sig 					: in std_logic_vector (3 downto 0);
		P1Digit2_sig 					: in std_logic_vector (3 downto 0);
		P2Digit1_sig 					: in std_logic_vector (3 downto 0);
		P2Digit2_sig 					: in std_logic_vector (3 downto 0);
		Data_Grid_toGraphics 		: in std_logic_vector (4 downto 0);
		X_Graphics_toGrid 			: out std_logic_vector (4 downto 0);
		Y_Graphics_toGrid 			: out std_logic_vector (4 downto 0);
		X_cursor							: in std_logic_vector (4 downto 0);
		Y_cursor							: in std_logic_vector (4 downto 0);
		Who								: in std_logic;
		ConfirmTest						: in std_logic;
		RndTest							: in std_logic;
		RightTest						: in std_logic;
		Face_Enable						: in std_logic;
		PICLK								: out std_logic
	);
end connect_Hdmi;

architecture Behavioral of connect_Hdmi is
signal pixel_en : std_logic;
signal pixel_data : std_logic_vector(15 downto 0);
signal start_streaming : std_logic;
signal frame_valid :std_logic;
signal led_out : std_logic_vector ( 7 downto 0);
SIGNAL PIXEL_CLK : STD_LOGIC ;
signal RESET,CLK : std_logic;
signal IniDone, Bls : STD_LOGIC;
signal WInner : STD_LOGIC_VECTOR (1 DOWNTO 0);
signal P1Digit1, P1Digit2, P2Digit1, P2Digit2 : STD_LOGIC_VECTOR (3 downto 0);
signal LastHitP1, LastHitP2 : STD_LOGIC_VECTOR (9 downto 0);
signal G_X, G_Y, GridData, Cursor_X, Cursor_Y : STD_LOGIC_VECTOR (4 downto 0);
signal M1, M2, M4, M8 : STD_LOGIC_VECTOR (0 DOWNTO 0);

begin

	PICLK <= PIXEL_CLK;
	
	Inst_HDMI_ref: entity work.HDMI_ref PORT MAP(
		TMDS_TX_2_P =>TMDS_TX_2_P ,
		TMDS_TX_2_N => TMDS_TX_2_N,
		TMDS_TX_1_P =>TMDS_TX_1_P ,
		TMDS_TX_1_N => TMDS_TX_1_N,
		TMDS_TX_0_P =>TMDS_TX_0_P ,
		TMDS_TX_0_N =>TMDS_TX_0_N ,
		TMDS_TX_CLK_P => TMDS_TX_CLK_P,
		TMDS_TX_CLK_N =>TMDS_TX_CLK_N ,
		TMDS_TX_SCL =>TMDS_TX_SCL ,
		TMDS_TX_SDA =>TMDS_TX_SDA ,
		START_STREAMING => START_STREAMING,
		PIXEL_DATA =>PIXEL_DATA ,
		PIXEL_EN =>PIXEL_EN ,
		FRAME_VALID => FRAME_VALID,
		write_CLK 	 => PIXEL_CLK,
		CLK_O => CLK,
		RESET_O => RESET,
		CLK_I =>CLK_I ,
		RESET_I => RESET_I,
		
		mcb3_dram_dq => mcb3_dram_dq,
		mcb3_dram_a => mcb3_dram_a,
		mcb3_dram_ba => mcb3_dram_ba,
		mcb3_dram_ras_n => mcb3_dram_ras_n,
		mcb3_dram_cas_n =>mcb3_dram_cas_n ,
		mcb3_dram_we_n => mcb3_dram_we_n,
		mcb3_dram_odt =>mcb3_dram_odt ,
		mcb3_dram_cke =>mcb3_dram_cke ,
		mcb3_dram_dm =>mcb3_dram_dm,
		mcb3_dram_udqs => mcb3_dram_udqs,
		mcb3_dram_udqs_n =>mcb3_dram_udqs_n ,
		mcb3_rzq => mcb3_rzq,
		mcb3_zio =>mcb3_zio ,
		mcb3_dram_udm => mcb3_dram_udm,
		mcb3_dram_dqs => mcb3_dram_dqs,
		mcb3_dram_dqs_n => mcb3_dram_dqs_n,
		mcb3_dram_ck =>mcb3_dram_ck ,
		mcb3_dram_ck_n =>mcb3_dram_ck_n
	);
--Inst_image_generator: entity  work.image_generator PORT MAP(
--		ENA =>PIXEL_EN ,
--		DOUT =>PIXEL_DATA ,
--		frame_valid =>FRAME_VALID ,
--		--bedug =>bedugger,
--		calib_done =>START_STREAMING,
--		CLK =>PIXEL_CLK ,
--		RST => RESET
--	);

--Picture: entity work.Imgur PORT MAP(
--		ENA => PIXEL_EN ,
--		DOUT => PIXEL_DATA ,
--		frame_valid => FRAME_VALID ,
--		calib_done => START_STREAMING,
--		CLK => PIXEL_CLK ,
--		RST => RESET,
--		G_X => G_X,
--		G_Y => G_Y,
--		GridData => GridData,
--		LastHitP1 => LastHitP1,
--		LastHitP2 => LastHitP2,
--		P1Digit1 => P1Digit1,
--		P1Digit2 => P1Digit2,
--		P2Digit1 => P2Digit1,
--		P2Digit2 => P2Digit2,
--		Cursor_X => Cursor_X,
--		Cursor_Y => Cursor_Y,
--		IniDone => IniDone,
--		Winner => Winner
--	);

--Dummy: entity work.dummy_game PORT MAP(
--		CLK => PIXEL_CLK,
--		RST => RESET,
--		G_X => G_X,
--		G_Y => G_Y,
--		GridData => GridData,
--		LastHitP1 => LastHitP1,
--		LastHitP2 => LastHitP2,
--		P1Digit1 => P1Digit1,
--		P1Digit2 => P1Digit2,
--		P2Digit1 => P2Digit1,
--		P2Digit2 => P2Digit2,
--		Cursor_X => Cursor_X,
--		Cursor_Y => Cursor_Y,
--		IniDone => IniDone,
--		Winner => Winner
--	);

Picture: entity work.Imgur port map(
		ENA => PIXEL_EN ,
		DOUT => PIXEL_DATA ,
		frame_valid => FRAME_VALID ,
		calib_done => START_STREAMING,
		CLK => PIXEL_CLK ,
		RST => RESET,
		Face_enable => Face_enable,
		G_X => X_Graphics_toGrid,
		G_Y => Y_Graphics_toGrid,
		GridData => Data_Grid_toGraphics,
		LastHitP1 => Last_hit_P1_sig,
		LastHitP2 => Last_hit_P2_sig,
		P1Digit1 => P1Digit1_sig,
		P1Digit2 => P1Digit2_sig,
		P2Digit1 => P2Digit1_sig,
		P2Digit2 => P2Digit2_sig,
		Cursor_X => X_cursor,
		Cursor_Y => Y_cursor,
		IniDone => Ini_Done_sig,
		Who => Who,
		ConfirmTest => ConfirmTest,
		RndTest => RndTest,
		RightTest => RightTest,
		Winner => Winner_sig
	);

end Behavioral;